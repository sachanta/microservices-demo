#!/bin/bash
LOGREG=`date +LogReg%Y%m%d%H.log`
LOGACC=`date +LogAcc%Y%m%d%H.log`
LOGWEB=`date +LogWeb%Y%m%d%H.log`

#find AppServerAgent/logs -name "*.log" -exec rm {} \;
APP_AGENT_DIR=/Users/srikarachanta/Downloads/appagent
MACHINE_AGENT_DIR=
TARGET=./target/msapp-1.jar
APPNAME=-Dappdynamics.agent.applicationName=microService

java -javaagent:${APP_AGENT_DIR}/javaagent.jar $APPNAME -Dappdynamics.agent.tierName=registrationTier -Dappdynamics.agent.nodeName=msNode1 -jar $TARGET registration 1111 >> $LOGREG &

java -javaagent:${APP_AGENT_DIR}/javaagent.jar $APPNAME -Dappdynamics.agent.tierName=accountsTier -Dappdynamics.agent.nodeName=msNode2 -jar $TARGET accounts 2222 >> $LOGACC &

java -javaagent:${APP_AGENT_DIR}/javaagent.jar $APPNAME -Dappdynamics.agent.tierName=webTier -Dappdynamics.agent.nodeName=msNode3 -jar $TARGET web 3333 >> $LOGWEB &
