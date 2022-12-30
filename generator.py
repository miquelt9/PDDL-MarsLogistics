import argparse
from collections import deque
import queue
import random
import os

def valid_tipo(arg_tipo: str) -> int:
    """Custom argparse type for user shift time values given from the command line"""

    if (arg_tipo == "0" or arg_tipo == "base" or arg_tipo == "Base" or arg_tipo == "extionsion0" or arg_tipo == "Extension0"): return 0
    elif (arg_tipo == "1" or arg_tipo == "ext1" or arg_tipo == "Ext1" or arg_tipo == "extionsion1" or arg_tipo == "Extension1"): return 1
    elif (arg_tipo == "2" or arg_tipo == "ext2" or arg_tipo == "Ext2" or arg_tipo == "extionsion2" or arg_tipo == "Extension2"): return 2
    elif (arg_tipo == "3" or arg_tipo == "ext3" or arg_tipo == "Ext3" or arg_tipo == "extionsion3" or arg_tipo == "Extension3"): return 3
        
    msg = "El tipo dado ({}) no és valido! Formato esperado: 'base', 'ext1', 'ext2', 'ext3'!".format(arg_tipo)
    raise argparse.ArgumentTypeError(msg) 

def parsing():
    parser = argparse.ArgumentParser(description='Generator for the Mars Logistics problem in PDDL format')
    parser.add_argument('--n_personas', '-p', type=int, 
                        help='Numero de personas en el problema')
    parser.add_argument('--n_suministros', '-s', type=int, 
                        help='Numero de suministros en el problema')
    parser.add_argument('--n_rovers', '-r', type=int, 
                        help='Numero de rovers en el problema')
    parser.add_argument('--n_asentamientos', '-as', type=int, 
                        help='Numero de asentamientos en el problema')
    parser.add_argument('--n_almacenes', '-al', type=int, 
                        help='Numero de almacenes en el problema')
    parser.add_argument('--n_caminos', '-c', type=int, 
                        help='Numero de caminos extra en el problema')
    parser.add_argument('--n_peticiones', '--n_instancias', '-i', type=int, 
                        help='Numero de peticiones en el problema')
    parser.add_argument('--tipo', '-t', type=valid_tipo,
                        help='Tipo de problema a resolver\n(0 - Base, 1 - Ext1, 2 - Ext2, 3 - Ext3)')
    parser.add_argument('--problem_name', '--name', type=str,
                        help='Tipo de problema a resolver\n(0 - Base, 1 - Ext1, 2 - Ext2, 3 - Ext3)')
    
    return parser

def obtener_bases(n_al: int, n_as: int, rand=True):
    bases = []
    
    for i in range(n_al):
        bases.append("al" + str(i+1))
    for i in range(n_as):
        bases.append("as" + str(i+1))
        
    if (rand): random.shuffle(bases)
    
    return bases

# Return a random number between [0, lenght-1] avoiding n.
def rand_except(n, lenght):
    l = list(range(0, n)) + list(range(n+1, lenght))
    return random.choice(l)

def main():
    
    # Obtener argumentos de terminal
    parser = parsing()
    args = parser.parse_args()
    n_rovers = args.n_rovers
    n_personas = args.n_personas
    n_suministros = args.n_suministros
    n_asentamientos = args.n_asentamientos
    n_almacenes = args.n_almacenes
    n_peticiones = args.n_peticiones
    n_caminos = args.n_caminos
    tipo:int = args.tipo
    problem_name = args.problem_name
    
    # Excepciones que pueden lanzarse
    if (n_rovers == None or n_personas == None or n_suministros == None or n_asentamientos == None or n_almacenes == None or n_peticiones == None or tipo == None or problem_name == None):
        msg = "Falta alguno de los parámetros para crear el problema, revisa los argumentos."
        raise argparse.ArgumentTypeError(msg) 
    
    # Hay personas pero no asentamientos
    if (n_personas > 0 and n_asentamientos == 0):
        msg = "No hay asentamientos para distribuir a las personas."
        raise argparse.ArgumentTypeError(msg) 
    
    # hay suministros pero no almacenes
    if (n_suministros > 0 and n_almacenes == 0):
        msg = "No hay almacenes para distribuir los suministros."
        raise argparse.ArgumentTypeError(msg) 
    
    # No hay bases
    if (n_almacenes == 0 and n_asentamientos == 0):
        msg = "El problema no dispone de bases."
        raise argparse.ArgumentTypeError(msg) 
    
    # No hay peticiones
    if (n_peticiones == 0):
        msg = "Sin peticiones el problema es trivial, pues no hay objectivo."
        raise argparse.ArgumentTypeError(msg) 
    
    # Actualizar variables que pueden dar problemas
    edges = n_personas + n_suministros
    if (n_caminos == None): n_caminos = 0
    if (n_peticiones > edges): n_peticiones = edges
    
    # Printear datos base del problema como informacion para el usuario
    print("The following arguments will be used to create the problem:\n")
    print("--> La posición inicial de los rovers, personas y suministros sera randomizada, así como la final.")
    print("--> Habrà los caminos necesarios para conectar todas las bases, -c indica los extras.")
    print("--> Si hay más peticiones que personas y suministros se establecera el #peticiones a la suma de estos.\n")
    
    print("Se creara un problema de tipo " + str(tipo) + " con los argumentos:")
    print("# rovers           = " + str(n_rovers))
    print("# personas         = " + str(n_personas))
    print("# suministros      = " + str(n_suministros))
    print("# asentamientos    = " + str(n_asentamientos))
    print("# almacenes        = " + str(n_almacenes))
    print("# peticiones       = " + str(n_peticiones))
    print("# caminos extra    = " + str(n_caminos))
    
    bases = obtener_bases(n_almacenes, n_asentamientos)
    #print(bases)
    
    # Creamos un MST uniendo todas las bases.
    # Representaremos el grafo con connexiones entre nodos
    g = set([])
    for i in range(len(bases)-1):
        # Cogeremos cada uno de los elementos de la lista y los uniremos con otro 
        # que este por delante de el en la lista dado que aremos este proceso
        # len(bases) - 1 nos aseguraremos obtener un grafo conexo.
        node_ini = bases[i]
        node_fi = bases[random.randint(i+1, len(bases)-1)]
        g.add((node_ini, node_fi))
    
    # Añadimos tambien las aristas adicionales que se nos requieren
    for i in range(n_caminos):
        # Elegimos dos nodos aleatorios al insertar en un set no habra duplicados
        sel = random.randint(0, len(bases)-1)
        node_ini = bases[sel]
        node_fi = bases[rand_except(sel, len(bases))]
        g.add((node_ini, node_fi))
        
    #print(g)
    
    ##### Imprimimos en un fichero con el nombre deseado con el contenido del problema #####
    print("\nEl grafo ha sido creado, satisfactoriamente.")
    print("Creando el documento " + problem_name + ".pddl en el directorio " + str(os.getcwd()) + "\n")

    f = open(problem_name + ".pddl", "w")
    
    ### Write header
    domain = "Base"
    if (tipo == 1): domain = "Ext1"
    if (tipo == 2): domain = "Ext2"
    if (tipo == 3): domain = "Ext3"
    
    f.write("(define (problem " + problem_name + ") (:domain MarsLogistics" + domain + ")\n")
    
    ### Write objects of the problem
    f.write("(:objects\n\t")
    
    for i in range(n_rovers):
        f.write("r" + str(i+1) + " ")
    f.write("- rover\n\t")
    
    for i in range(n_almacenes):
        f.write("al" + str(i+1) + " ")
    f.write("- almacen\n\t")
    
    for i in range(n_asentamientos):
        f.write("as" + str(i+1) + " ")
    f.write("- asentamiento\n\t")
    
    for i in range(n_personas):
        f.write("p" + str(i+1) + " ")
    f.write("- persona\n\t")
    
    for i in range(n_suministros):
        f.write("s" + str(i+1) + " ")
    f.write("- suministro\n")
    f.write(")\n\n")
    
    ### Write initial state
    f.write("(:init\n")
    
    for i in range(n_personas):
        f.write("\t(esta_en p" + str(i+1) + " as" + str(random.randint(1, n_asentamientos)) + ")\n")

    for i in range(n_suministros):
            f.write("\t(esta_en s" + str(i+1) + " al" + str(random.randint(1, n_almacenes)) + ")\n")
            
    for i in range(n_rovers):
        f.write("\t(aparcado_en r" + str(i+1))
        base = random.randint(0,1) # 0 -> asentamiento, 1 -> almacen
        if (base == 0): f.write(" as" + str(random.randint(1, n_asentamientos)) + ")\n")
        else:           f.write(" al" + str(random.randint(1, n_almacenes)) + ")\n")
    
    for node1, node2 in g:
        f.write("\t(hay_camino " + str(node1) + " " + str(node2) + ")\n")
    
    f.write(")\n\n")
    
    ### Write goal
    f.write("(:goal (and\n")
    
    l_personas = list(range(0, n_personas))
    random.shuffle(l_personas)
    l_suministros = list(range(0, n_suministros))
    random.shuffle(l_suministros)
    
    personas = deque(l_personas)
    suministros = deque(l_suministros)
    
    for i in range(n_peticiones):
        f.write("\t(esta_en ")
        base = random.randint(0,1) # 0 -> asentamiento, 1 -> almacen
        if (base == 0 and len(personas) > 0): 
            f.write("p" + str(personas.pop() + 1) + " as" + str(random.randint(1, n_asentamientos)) + ")\n")
        else:
            f.write("s" + str(suministros.pop() + 1) + " al" + str(random.randint(1, n_almacenes)) + ")\n")
    
    f.write("))\n)\n")
    
    f.close()
    
    print("El documento ha sido creado satisfactoriamente.")

if __name__ == "__main__":
    main()
