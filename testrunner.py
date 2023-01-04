import os
import subprocess;
import time;
import psutil;

x = input("Escala tests? ")
y = input("Total tests? ")
z = input("Total Timeout? ")
y = int(y)
z = int(z)

def kill(proc_pid):
    process = psutil.Process(proc_pid)
    for proc in process.children(recursive=False):
        proc.kill()
    process.kill()

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

listdir = os.listdir(str(os.getcwd()))
listdir = [f.lower() for f in listdir]
sorted(listdir)

for files in listdir:
    if files.endswith('.pddl') and files.__contains__("test_"):
        ini = time.perf_counter()
        subp = subprocess.Popen('../Metric-FF/./ff -o domain_ext1.pddl -f ' + files, shell=True)
        valid = True
        try: 
            subp.wait(z)
        except subprocess.TimeoutExpired:
            kill(subp.pid)
            valid = False
        if valid:
            times.append(time.perf_counter() - ini)
        else:
            times.append("Overflow de més de " + str(z) + " segons")

        names.append(files)

for i in range(len(times)):
    print(str(times[i]) + ' ' + str(names[i]))
