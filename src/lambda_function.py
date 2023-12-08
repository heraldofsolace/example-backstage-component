def greet(name):
    api_key = "hvs.jWoTNpN6X4X9ERfBxkPqzPgk"
    print("Hello, %s" % name)
    print("Your api key is: %s" % api_key)

name = input("Please enter your name: ")
exec("greet('%s')" % name)
