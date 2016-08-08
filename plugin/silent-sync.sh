#!/bin/bash

set -- junk $2
shift

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


if  [ $1 = "please_sync_this_project" ]; then
	path=`realpath $2`
	source_sync_file
	PROJECT_DIR=${PWD##*/}
	
	rsync -azcu -e 'ssh -q' --exclude-from=$path/.gitignore $path $REMOTE_HOST:$REMOTE_BASE_DIR/
	RESULT=$?

	exit $RESULT
fi


bash "$@"
