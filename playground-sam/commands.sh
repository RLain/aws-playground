## Create an S3 bucket
aws s3 mb s3://playground-sam-20230928-becca --profile RebeccaPersonal

## Package the SAM template
aws cloudformation package \
    --template-file template.yaml \
    --output-template-file gen/packaged.yaml \
    --s3-bucket playground-sam-20230928-becca \
    --profile RebeccaPersonal

## Deploy the SAM template
aws cloudformation deploy \
    --template-file packaged.yaml \
    --stack-name playground-sam \
    --capabilities CAPABILITY_IAM \
    --profile RebeccaPersonal

## Invoke the Lambda function
aws lambda invoke \
    --function-name playground-sam-HelloWorldFunction-1Q8ZQXQZVZQ8 \
    --payload '{"name": "Bob"}' \ 
    --profile RebeccaPersonal \
    response.json
