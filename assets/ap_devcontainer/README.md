## How to build and push

```sh
AWS_REGION=us-east-1 # public ECR region
PUBLIC_ECR_URI=public.ecr.aws/u8r4e6q1
IMAGE_PATH=ap_devcontainer/workspace
IMAGE_URI=${PUBLIC_ECR_URI}/${IMAGE_PATH}

cd assets/ap_devcontainer/build

# build
docker build -t ${IMAGE_URI} .

# Signin with SSO
export AWS_DEFAULT_PROFILE=ssdev1
aws configure sso --profile $AWS_DEFAULT_PROFILE
# sso_session   = ss
# sso_start_url = https://sharingseed.awsapps.com/start
# sso_region    = ap-northeast-1
# sso_registration_scopes = sso:account:access
# sso_account   =  ssdev1

# login
aws ecr-public get-login-password --region ${AWS_REGION} \
  | docker login --username AWS --password-stdin ${PUBLIC_ECR_URI}

# push
docker push ${IMAGE_URI}:latest
```
