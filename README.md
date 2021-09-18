### Deploy
To deploy for the first time, use 

```aws cloudformation create-stack --stack-name <stack name> --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND --template-body file://cfn.yaml```

To update an existing stack, replace `create-stack` with `update-stack`.

