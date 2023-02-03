##User Profile
read -p "Enter AWS_ACCESS_KEY_ID: " AWS_ACCESS_KEY_ID
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
echo "Successfully exported"

read -p "AWS_SECRET_ACCESS_KEY: " AWS_SECRET_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
echo "Successfully exported"

read -p "AWS_DEFAULT_REGION: " AWS_DEFAULT_REGION
export AWS_ACCESS_KEY_ID=$AWS_DEFAULT_REGION
echo "Successfully exported"

##Search VPC ID
VPC_ID=$( \
        aws ec2 describe-vpcs \
          --filters Name=tag:Name,Values=*dev*|*prod* \
          --query 'Vpcs[].VpcId' \
          --output text \
) \
        && echo ${VPC_ID}

##Delete VPC
aws ec2 delete-vpc \
        --vpc-id ${VPC_ID}

##Check VPC
aws ec2 describe-vpcs \
        --vpc-id ${VPC_ID}


##Serach Internet gateway ID
VPC_IGW_ID=$( \
        aws ec2 describe-internet-gateways \
          --filters Name=tag:Name,Values=*dev*|*prod* \
          --query 'InternetGateways[].InternetGatewayId' \
          --output text \
) \
        && echo ${VPC_IGW_ID}

##Delete Internet gateway
aws ec2 delete-internet-gateway \
        --internet-gateway-id ${VPC_IGW_ID}

##Check Internet gateway
aws ec2 describe-internet-gateways \
        --query 'InternetGateways[?Attachments == `[]`]'