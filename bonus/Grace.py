kid = 'Grace_kid.py'
x = "kid = 'Grace_kid.py'{:s}x = {:s}try:{:s}    f = open(kid, 'w');{:s}except IOError:{:s}    print 'eh'{:s}f.write(x.format(chr(10), chr(34)+x+chr(34)+chr(10), chr(10), chr(10), chr(10), chr(10), chr(10), chr(10))); f.close{:s}    #Superbe{:s}"
try:
    f = open(kid, 'w');
except IOError:
    print 'eh'
f.write(x.format(chr(10), chr(34)+x+chr(34)+chr(10), chr(10), chr(10), chr(10), chr(10), chr(10), chr(10))); f.close
    #Superbe
