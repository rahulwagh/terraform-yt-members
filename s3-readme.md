# AWS CLI

## List Buckets
```bash
aws s3 ls
```

## Content inside the bucket

```bash
aws s3 ls s3://dev-proj-1-jenkins-remote-state-bucket-123456
```

## Move the content

```bash
aws s3 mv s3://dev-proj-1-jenkins-remote-state-bucket-123456/test_lambda.zip\
s3://dev-proj-1-remote-state-bucket-123456
```

## View all the child content inside the bucket

```bash
aws s3 s3://dev-proj-1-jenkins-remote-state-bucket-123456 --recursive
```