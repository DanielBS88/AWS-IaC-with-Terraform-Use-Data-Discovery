#!/bin/bash

echo "=== Terraform Validation Report ==="
echo ""

INSTANCE_ID=$(terraform output -raw instance_id)
SG_ID=$(terraform output -raw discovered_security_group_id)
SG_NAME=$(terraform output -raw security_group_name)

echo "Instance ID: $INSTANCE_ID"
echo "Security Group ID: $SG_ID"
echo "Security Group Name: $SG_NAME"
echo ""

echo "=== Security Groups Attached to Instance ==="
terraform output instance_security_group_ids
echo ""

echo "=== Verification via AWS CLI ==="
if command -v aws &> /dev/null; then
    aws ec2 describe-instances \
        --instance-ids "$INSTANCE_ID" \
        --query 'Reservations[0].Instances[0].SecurityGroups[*].[GroupId,GroupName]' \
        --output text | grep "cmtr-k5vl9gpq-sg"
    
    if [ $? -eq 0 ]; then
        echo "✅ Security Group cmtr-k5vl9gpq-sg IS attached to instance"
    else
        echo "❌ Security Group cmtr-k5vl9gpq-sg NOT found"
    fi
else
    echo "AWS CLI not available"
fi
