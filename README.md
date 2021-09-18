### Deploy

Notice, that API GW is protected by Token Lambda authorizer.

Before deploying the Stack, generate a random string for the token:

```export API_GW_TOKEN=$( cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 )```

To deploy for the first time, use 

```aws cloudformation create-stack --stack-name <stack name> --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND --template-body file://cfn.yaml --parameters ParameterKey=ApiGwToken,ParameterValue=${API_GW_TOKEN}```

To update an existing stack, replace `create-stack` with `update-stack`.

