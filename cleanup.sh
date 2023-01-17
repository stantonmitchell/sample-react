#!/bin/bash
echo "========================================"
echo "       RUNNING CONTAINER CLEANUP"
CONTAINERS=`docker ps -a -f NAME=myReactapp --format '{{.Names}}'`
CONTAINER_CHECK=`docker ps -a -f NAME=myReactapp --format '{{.Names}}' | wc -l`
if [[ "$CONTAINER_CHECK" -gt "0" ]]; then
   echo "Containers online..removing"
   docker rm -f $CONTAINERS
else
   echo "Found no containers..skipping removal"
fi
echo "========================================"
echo "         RUNNING IMAGE CLEANUP"
# Image Version Config
NGINX_BASE_IMAGE="nginx:1.21.3"
NGINX_CUSTOM_IMAGE="react-sample_nginx:latest"
NODE_BASE_IMAGE="node:12.19.1"
NODE_CUSTOM_IMAGE="react-sample:latest"
# Start NGINX Image 
echo "---> Removing NGINX images"
NGINX_BASE_CHECK=`docker images -f reference="$NGINX_BASE_IMAGE" --format '{{.Repository}}:{{.Tag}}' | wc -l | sed -e 's/^[[:space:]]*//'`
NGINX_CUSTOM_CHECK=`docker images -f reference="$NGINX_CUSTOM_IMAGE" --format '{{.Repository}}:{{.Tag}}' | wc -l | sed -e 's/^[[:space:]]*//'`
if [[ "$NGINX_BASE_CHECK" == "1" ]]; then
   echo "$NGINX_BASE_IMAGE image exist..removing"
   docker image remove "$NGINX_BASE_IMAGE"
else
   echo "$NGINX_BASE_IMAGE not found..skipping removal"
fi
if [[ "$NGINX_CUSTOM_CHECK" == "1" ]]; then
   echo "$NGINX_CUSTOM_IMAGE image exist..removing"
   docker image remove "$NGINX_CUSTOM_IMAGE"
else
   echo "$NGINX_CUSTOM_IMAGE not found..skipping removal"
fi
echo "---> Removing NODE images"
# Start NODE Image
NODE_BASE_CHECK=`docker images -f reference="$NODE_BASE_IMAGE" --format '{{.Repository}}:{{.Tag}}' | wc -l | sed -e 's/^[[:space:]]*//'`
NODE_CUSTOM_CHECK=`docker images -f reference="$NODE_CUSTOM_IMAGE" --format '{{.Repository}}:{{.Tag}}' | wc -l | sed -e 's/^[[:space:]]*//'`
if [[ "$NODE_BASE_CHECK" == "1" ]]; then
   echo "$NODE_BASE_IMAGE image exist..removing"
   docker image remove "$NODE_BASE_IMAGE"
else
   echo "$NODE_BASE_IMAGE not found..skipping removal"
fi
if [[ "$NODE_CUSTOM_CHECK" == "1" ]]; then
   echo "$NODE_CUSTOM_IMAGE image exist..removing"
   docker image remove "$NODE_CUSTOM_IMAGE"
else
   echo "$NODE_CUSTOM_IMAGE not found..skipping removal"
fi
echo "---> All images removed"
echo "========================================"
echo "Script completed"
