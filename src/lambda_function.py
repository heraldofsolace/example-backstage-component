def greet(name):
    print("Hello, %s" % name)

name = input("Enter your name: ")
exec("greet('%s')" % name)
