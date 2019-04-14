#!/bin/bash
#appz
echo base_domain
if [ -e ${ORACLE_HOME}/user_projects/domains/base_domain/bin/stopWebLogic.sh ]
then
    echo "DOMAIN base_domain exisits"
else
    echo "Not Exists" 
fi
cp ${ORACLE_HOME}/*.war ${ORACLE_HOME}/user_projects/domains/base_domain/autodeploy/

for file in ${ORACLE_HOME}/user_projects/domains/base_domain/autodeploy/*.war
do
   name=$(echo $file | cut -f 1 -d '.')
   mkdir  $name
   echo "Newly created folder name $name JAVA_HOME is $JAVA_HOME"
   echo "war file to be extracted  $name.war file name $file"
   cd $name
   $JAVA_HOME/bin/jar -xvf $file
   echo "output of jar extration $?"
done
rm -fr  ${ORACLE_HOME}/user_projects/domains/base_domain/autodeploy/*.war


sed -i -e 's/^/-D/'  ${ORACLE_HOME}/*.properties
tmp=$(sed  -e :a -e "$!N; s/\n/ /; ta "  ${ORACLE_HOME}/*.properties)
echo "Current JAVA_OPTIONS"
echo "New added application properties $tmp"
str1="\"\${JAVA_OPTIONS} $tmp\""
echo "New Java Options are $str1"
sed -i -e "/START WEBLOGIC/a\ JAVA_OPTIONS\=$str1" ${ORACLE_HOME}/user_projects/domains/base_domain/bin/startWebLogic.sh
sed -i -e "/USE_JVM_SYSTEM_LOADER/i\ echo  ${JAVA_OPTIONS}" ${ORACLE_HOME}/user_projects/domains/base_domain/bin/startWebLogic.sh
${ORACLE_HOME}/user_projects/domains/base_domain/bin/startWebLogic.sh
