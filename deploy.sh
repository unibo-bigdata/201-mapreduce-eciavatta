#!/bin/bash

gradle build

JARS=$(find . -name "*.jar")
PASS="sshpass -p cloudera"
CURDIR=$(basename "$PWD")

$PASS ssh cloudera "mkdir -p ~/bigdata/$CURDIR"

for jar in $JARS; do
  $PASS scp "$jar" "cloudera:~/bigdata/$CURDIR/"
  echo "Copying $jar to cloudera:~/bigdata/$CURDIR/"
done
