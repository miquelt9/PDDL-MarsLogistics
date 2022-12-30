# Mars Logistics

Tercera pràctica de l'assignatura [IA](https://www.fib.upc.edu/en/studies/bachelors-degrees/bachelor-degree-informatics-engineering/curriculum/syllabus/IA) de la [FIB](https://www.fib.upc.edu/).   

## El problema

L'enunciat de la pràctica es pot llegir a [PracticaPlanificacion.pdf](PracticaPlanificacion.pdf), però a nivell de resum tenim uns rovers a Mart i hem de fer un pla per tal de transportar persones d'una base a una altra i subministres d'un magatzem a un altre.

Hi ha diferents extensions del projecte:
#### Base
No hi ha limitació de capacitat de càrrega i es poden portar persones i subministres alhora.

#### Extensió 1
Un rover pot transportar màxim de dos persones o una càrrega de subministres (no es poden barrejar).

#### Extensió 2
Extensió 1 + Els rovers tenen una capacitat de combustible, cada moviment gasta 1 unitat de combustible.   
V.1: No importa quan combustible facin servir en total mentre es facin les peticions.   
V.2: Es minimitza el consum de combustible total.   

#### Extensió 3
Extensió 2 + Les peticions tenen prioritat 1, 2 o 3 (3 és la màxima), es vol màximitzar el nombre de peticions amb prioritat servides.   
V.1: No importa quan combustible facin servir en total.   
V.2: S'optimitza una combinació entre combustible total i prioritats (assignant pesos).   

## Com executar

Per tal d'executar una planifició caldrà tenir instal·lat MetricFF el qual es pot descarregar de la [pagina web](http://fai.cs.uni-saarland.de/hoffmann/ff.html) o bé [directament](./Metric-FF.zip).

Un cop descarregar serà necessari descomprimir la carpeta, accedir-hi i compilar-lo:
```
cd Metric-FF/
make -j
```

Es recomenable crear un alias a .bashrc (substitueix path_to_folder per el directori on has descomprimit i compilat):
```
echo "alias ff='path_to_folder/ff'" >> ~/.bashrc
```
Recorda que si ho fas caldrà reiniciar la terminal.

Ara ja podràs executar les teves planificacions:
```
ff -o domain_base.pddl -f problemaX.pddl
```
Nota que domain_base es pot substituir per *domain_ext1*, *domain_ext2* o *domain_ext3* depenent de l'extensió que vulguis utilitzar.   
Recorda que cada problema esta formulat segons el domini al que va destinat.

### Com generar jocs de proves

Per generar jocs de proves es recomana utilitzar [generator.py](./generator.py).
Per executar-lo cal ficar totes les *flags* necessaries:
```
python3 generator.py -r 5 -p 5 -s 10 -i 5 -as 3 -al 3 -c 0 -t base --problem_name problemaX
```
o analogament:
```
python3 generator.py -r 5 -p 5 -s 10 -i 5 -as 3 -al 3 -c 0 -t base --problem_name problemaX
```

Usage:
```
usage: generator.py [-h] [--n_personas N_PERSONAS] [--n_suministros N_SUMINISTROS] [--n_rovers N_ROVERS]
                    [--n_asentamientos N_ASENTAMIENTOS] [--n_almacenes N_ALMACENES] [--n_caminos N_CAMINOS]
                    [--n_peticiones N_PETICIONES] [--tipo TIPO] [--problem_name PROBLEM_NAME]
```

Pots demanar ajuda amb `python3 generator.py -h` si ho necessites (no obstant t'indicarà si algun dels paràmetres falla).
