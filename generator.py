import argparse
from enum import Enum

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
    parser.add_argument('--problem_name', '--name', type=valid_tipo,
                        help='Tipo de problema a resolver\n(0 - Base, 1 - Ext1, 2 - Ext2, 3 - Ext3)')
    
    return parser

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
    tipo = args.tipo
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
    if (n_caminos == None): n_caminos = 0
    if (n_peticiones > n_personas + n_suministros): n_peticiones = n_personas + n_suministros
    
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
    
    

if __name__ == "__main__":
    main()
