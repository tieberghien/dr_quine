import os
i=5
x = "import os{:s}i={:d}{:s}x = {:s}if __file__ != 'Sully.py':{:s}    i-=1{:s}try:{:s}    f=open('Sully_'+str(i)+'.py', 'w'){:s}except IOError:{:s}    print ('eh'){:s}f.write(x.format(chr(10), i, chr(10), chr(34)+x+chr(34)+chr(10), chr(10), chr(10), chr(10), chr(10), chr(10), chr(10), chr(10), chr(10), chr(10), chr(10), chr(10))); f.close{:s}f.flush(){:s}if i>0:{:s}    os.system('python3 Sully_'+str(i)+'.py'){:s}"
if __file__ != 'Sully.py':
    i-=1
try:
    f=open('Sully_'+str(i)+'.py', 'w')
except IOError:
    print ('eh')
f.write(x.format(chr(10), i, chr(10), chr(34)+x+chr(34)+chr(10), chr(10), chr(10), chr(10), chr(10), chr(10), chr(10), chr(10), chr(10), chr(10), chr(10), chr(10))); f.close
f.flush()
if i>0:
    os.system('python3 Sully_'+str(i)+'.py')
