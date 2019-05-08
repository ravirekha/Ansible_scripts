#!/bin/bash
set -x
FOLDER='/jenkins/ws-jenkins-backup/'
ANOTHER='/home/ubuntu/filemgr-linux64/jenkins_backup'
find "$FOLDER" -type f -iname '*.zip' | while read FILE; do
sudo cp -r "$FILE" "$ANOTHER"/
done

if [ $? -eq 0 ] ; then

cd /home/ubuntu/filemgr-linux64/
touch script-test
cd /home/ubuntu/filemgr-linux64
filemgr --action sync --bucket oncam-backup --dir jenkins_backup
fi

if [ $? -ne 0 ] ; then
filemgr --action mput --bucket oncam-backup --dir jenkins_backup
echo "success"
fi
