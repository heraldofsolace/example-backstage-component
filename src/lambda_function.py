def lambda_handler(event, context):  
  password = event['queryStringParameters']['password']
  if password == 'password':
    print("Hello from Backstage!")
  else:
    print("Not allowed")
