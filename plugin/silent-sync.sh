#!/bin/bash


function source_sync_file {
	while [ "$path" != "" ] 
	do
		if [ -f $path/.sync ]; then
			source $path/.sync
			return
		fi
		path=${path%/*}
	done
	exit 0 
}

path=`realpath $2`
source_sync_file

if  [ $1 = "please_sync_this_project" ]; then
	PROJECT_DIR=${PWD##*/}
	
	rsync -azcu -e 'ssh -q' --exclude-from=$path/.gitignore $path $REMOTE_HOST:$REMOTE_BASE_DIR/
	RESULT=$?

	exit $RESULT

elif [ $1 = "please_give_me_ssh" ]; then

	ssh -q -t $REMOTE_HOST "cd $REMOTE_BASE_DIR; bash"
	RESULT=$?

	exit $RESULT
fi



echo "You do something wrong"
exit 1
