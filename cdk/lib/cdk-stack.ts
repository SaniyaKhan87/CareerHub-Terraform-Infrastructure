import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as ec2 from 'aws-cdk-lib/aws-ec2';
import * as s3 from 'aws-cdk-lib/aws-s3';

export class CdkStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // VPC
    const vpc = new ec2.Vpc(this, 'CareerHubVPC', {
      ipAddresses: ec2.IpAddresses.cidr('10.30.0.0/16'),
      maxAzs: 1,
      natGateways: 0,
      subnetConfiguration: [
        {
          name: 'CareerHubPublicSubnet',
          subnetType: ec2.SubnetType.PUBLIC,
          cidrMask: 24,
        },
      ],
    });

    // Security Group
    const securityGroup = new ec2.SecurityGroup(this, 'CareerHubSecurityGroup', {
      vpc,
      description: 'Security group for CareerHub CDK infrastructure',
      allowAllOutbound: true,
    });

    securityGroup.addIngressRule(
      ec2.Peer.anyIpv4(),
      ec2.Port.tcp(22),
      'SSH'
    );

    securityGroup.addIngressRule(
      ec2.Peer.anyIpv4(),
      ec2.Port.tcp(80),
      'HTTP'
    );

    securityGroup.addIngressRule(
      ec2.Peer.anyIpv4(),
      ec2.Port.tcp(443),
      'HTTPS'
    );

    securityGroup.addIngressRule(
      ec2.Peer.anyIpv4(),
      ec2.Port.tcp(5173),
      'CareerHub'
    );

    // EC2 Instance
    const instance = new ec2.Instance(this, 'CareerHubEC2', {
      vpc,
      vpcSubnets: {
        subnetType: ec2.SubnetType.PUBLIC,
      },
      securityGroup,
      instanceType: new ec2.InstanceType('c7i-flex.large'),
      machineImage: ec2.MachineImage.genericLinux({
        'ap-southeast-2': 'ami-06259b63260eddc13',
      }),
      keyPair: ec2.KeyPair.fromKeyPairName(
        this,
        'CareerHubKeyPair',
        'CareerHub-Terraform'
      ),
      blockDevices: [
        {
          deviceName: '/dev/sda1',
          volume: ec2.BlockDeviceVolume.ebs(30, {
            volumeType: ec2.EbsDeviceVolumeType.GP3,
            encrypted: true,
            deleteOnTermination: true,
          }),
        },
      ],
    });

    // Elastic IP
    const elasticIp = new ec2.CfnEIP(this, 'CareerHubElasticIP', {
      domain: 'vpc',
    });

    new ec2.CfnEIPAssociation(this, 'CareerHubEIPAssociation', {
      allocationId: elasticIp.attrAllocationId,
      instanceId: instance.instanceId,
    });

    // S3 Bucket
    const bucket = new s3.Bucket(this, 'CareerHubS3Bucket', {
      encryption: s3.BucketEncryption.S3_MANAGED,
      removalPolicy: cdk.RemovalPolicy.RETAIN,
    });

    // Outputs
    new cdk.CfnOutput(this, 'VPCId', {
      value: vpc.vpcId,
      description: 'CareerHub CDK VPC ID',
    });

    new cdk.CfnOutput(this, 'SubnetId', {
      value: vpc.publicSubnets[0].subnetId,
      description: 'CareerHub CDK Subnet ID',
    });

    new cdk.CfnOutput(this, 'SecurityGroupId', {
      value: securityGroup.securityGroupId,
      description: 'CareerHub CDK Security Group ID',
    });

    new cdk.CfnOutput(this, 'EC2InstanceId', {
      value: instance.instanceId,
      description: 'CareerHub CDK EC2 Instance ID',
    });

    new cdk.CfnOutput(this, 'ElasticIP', {
      value: elasticIp.ref,
      description: 'CareerHub CDK Elastic IP',
    });

    new cdk.CfnOutput(this, 'S3BucketName', {
      value: bucket.bucketName,
      description: 'CareerHub CDK S3 Bucket Name',
    });
  }
}
