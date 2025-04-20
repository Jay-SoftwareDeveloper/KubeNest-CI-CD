#!/bin/bash
CLUSTER_NAME="eks-jayanth-tracker"
REGION="us-west-2"
NODEGROUP_NAME="group-2"
aws eks create-cluster \
  --name $CLUSTER_NAME \
  --region $REGION \
  --kubernetes-version 1.21 \
  --role-arn arn:aws:iam::YOUR_ACCOUNT_ID:role/EKSClusterRole \
--resources-vpc-config subnetIds=$SUBNET_IDS,securityGroupIds=$SECURITY_GROUP_IDS
