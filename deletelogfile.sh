#!/bin/bash
#---------------------------------------------
#
#  Author      : even li
#  Description : even li 
#  History     : 2018-06-28 Created
#
#---------------------------------------------

g_count=0 
function deletelogfile()
{
	filename=$1
	fileformart=`echo ${filename##*.}`
	if [ $fileformart = "log" ];
	then
		echo "-----rm----$filename-----"
		let g_count+=1
		rm $filename
	fi
}

function findlogfile()
{
	for element in `ls $1`
	do
		dir_or_file=$1"/"$element
		if [ -d $dir_or_file ];
		then
			findlogfile $dir_or_file
		else
			deletelogfile $dir_or_file
		fi
	done
}

codefiledir=$1
findlogfile $codefiledir
echo "----delete[$g_count]log file------" 
