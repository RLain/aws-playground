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
    --template-file gen/packaged.yaml \
    --stack-name playground-sam-hello-world \
    --capabilities CAPABILITY_IAM \
    --profile RebeccaPersonal

## Invoke the Lambda function
aws lambda invoke \
    --function-name playground-sam-hello-world-HelloWorldFunction-iOB9Cu454dwr \
    --profile RebeccaPersonal \
    response.json


## Use SAM guided deployment

sam deploy --guided --profile RebeccaPersonal