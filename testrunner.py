import os;
import time;

x = input("Escala tests? ")
y = input("Total tests? ")
y = int(y)

for i in range(y):
    total = i + 1
    rovers = int(x) * int(total)
    os.system('python3 generator.py -r ' + str(rovers)
    + ' -p 10 -s 10 -i 20 -as 5 -al 5 -c 3 -t ext1 --problem_name test_rovers' + str(rovers))

for i in range(y):
    total = i + 1
    persones = int(x) * int(total)
    os.system('python3 generator.py -r 5 -p ' + str(persones) + ' -s 10 -i 20 -as 5 -al 5 -c 3 -t ext1 --problem_name test_persones' + str(persones))


times = []
names = []

for files in os.listdir(str(os.getcwd())):
    if files.endswith('.pddl') and files.__contains__("test_"):
        ini = time.perf_counter()
        os.system('../Metric-FF/./ff -o domain_ext1.pddl -f ' + files)
        times.append(time.perf_counter() - ini)
        names.append(files)

for i in range(len(times)):
    print(str(times[i]) + ' ' + str(names[i]))