def greet(name):
    print("Hello, %s" % name)

name = input("Please enter your name: ")
exec("greet('%s')" % name)
