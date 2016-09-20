#!/usr/bin/env bash

echo "*** Building $IMAGE_NAME:$BUILD_NUMBER ..."
echo $http_proxy
echo $HTTP_PROXY
docker build -t $IMAGE_NAME:$BUILD_NUMBER . --build-arg WORKSPACE=$WORKSPACE --build-arg http_proxy=$http_proxy
#docker push $IMAGE_NAME:$BUILD_NUMBER

echo "*** Running compose ..."
docker-compose up -d
TEST_RESULT=`docker wait $APP_NAME-$BUILD_NUMBER`

echo "*** Copying logs ..."
LOG_DATE=$(date +%F_%R)
docker cp $APP_NAME-$BUILD_NUMBER:$WORKSPACE/test.log ./test.log-${LOG_DATE}
cat ./test.log-${LOG_DATE}

echo "*** Copying coverage files ..."
rm -r ./coverage
docker cp $APP_NAME-$BUILD_NUMBER:$WORKSPACE/coverage ./

echo "*** Killing and removing compose ..."
docker-compose kill && docker-compose rm -f

echo "*** Removing images ..."
docker rmi -f $IMAGE_NAME:$BUILD_NUMBER

echo "*** Exiting ..."
exit $TEST_RESULT
