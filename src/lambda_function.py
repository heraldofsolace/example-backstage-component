def lambda_handler(event, context):  
  if event['queryStringParameters']['password'] == 'myPassword':
    print("Hello from Backstage!")
  else:
    print("Not allowed")
