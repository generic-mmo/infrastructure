# infrastructure
Repository with IaaC and deployment code

# terraform
Deployment to Azure cloud

## Tips & tricks
Some useful commands

**Reformat all files**
```shell script
terraform fmt -recursive
```

**Authenticate**
```shell script
az login
```

**Initialize**
```shell script
terraform init
```

**Dry-run**
```shell script
terraform plan
```

**Deploy**
```shell script
terraform apply
```

**Undeploy**
```shell script
terraform destroy
```

# local
Local environment setup

## Tips & tricks
Some useful commands

**Deploy**
```shell script
docker-compose up
```

**Undeploy**
```shell script
docker-compose down
```