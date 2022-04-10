# CREATE AWS VPC  BY TERRFORM

## Requirements
- Create aws account for running terraform(Permissions policies are AdministratorAccess)
- Get terraform account's AWS ACCESS KEY
- Get terraform account's AWS SECRET ACCESS KEY

## USAGE
```
docker run \
    -e AWS_ACCESS_KEY_ID=<AWS ACCESS KEY> \
    -e AWS_SECRET_ACCESS_KEY=<AWS SECRET ACCESS KEY> \
    -v $(pwd):/templates \
    -w /templates \
    -it \
    --entrypoint=ash \
    hashicorp/terraform:0.12.31
```
- cd environment/prd
- terraform init
- terraform plan
- terraform apply
