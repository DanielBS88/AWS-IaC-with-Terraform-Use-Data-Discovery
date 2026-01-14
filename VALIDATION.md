# Terraform AWS Lab - Validation Proof

## EC2 Instance
- **Name**: cmtr-k5vl9gpq-instance
- **Instance ID**: i-088c7cb7f8a6f1310

## Security Group Attachment
- **Security Group Name**: cmtr-k5vl9gpq-sg
- **Security Group ID**: sg-02f38a832d9a667a9
- **Status**: ATTACHED

## Verification
The security group `cmtr-k5vl9gpq-sg` is successfully attached to instance `cmtr-k5vl9gpq-instance`.

### Terraform Output Proof
```
instance_security_groups = toset([
  "sg-02f38a832d9a667a9",
])
security_group_name = "cmtr-k5vl9gpq-sg"
```
