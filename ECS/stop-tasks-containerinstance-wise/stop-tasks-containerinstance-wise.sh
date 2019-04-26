#!/bin/sh

# Copyright 2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may
# not use this file except in compliance with the License. A copy of the
# License is located at
#
#       http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is distributed
# on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied. See the License for the specific language governing
# permissions and limitations under the License.
#
# This script generates a file in go with the license contents as a constant

# Set language to C to make sorting consistent among different environments.

if [ ! -z $1 ]
then
	clusterName=$1
    clusterState=$(aws ecs describe-clusters --cluster $clusterName --query 'clusters[*].status' --output text)
    if [ "$clusterState" != "ACTIVE" ]
    then
    	aws ecs describe-clusters --cluster $clusterName
    	exit 1
    fi
else
	echo "Please provide ECS Cluster Name. For example stop-task-containerinstance-wise.sh default"
	exit 1
fi

containerInstanceArns=$(aws ecs list-container-instances --cluster $clusterName --query 'containerInstanceArns[*]' --output text)
taskArns=$(aws ecs list-tasks --cluster $clusterName --query 'taskArns[*]' --output text)

for i in $containerInstanceArns
do
	echo "Stopping tasks on $i container instance"
	for j in $taskArns
	do
		TaskInstanceARN=$(aws ecs describe-tasks --tasks $j --cluster $clusterName --query 'tasks[*].[containerInstanceArn]' --output text)
		if [[ $TaskInstanceARN == $i ]]
		then
			echo "Stopping task $j"
			aws ecs stop-task --task $j --cluster $clusterName > /dev/null

		fi
    done
    echo "-----------------------------------------------------------------------"
    sleep 60
done
echo "Done"