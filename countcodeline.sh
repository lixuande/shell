#!/bin/bash
#---------------------------------------------
#
#  Author      : even li
#  Description : even li 
#  History     : 2018-06-28 Created
#
#---------------------------------------------
 
g_count=0

function countcodeline()
{
	filename=$1
	fileformart=`echo ${filename##*.}`
	if [ $fileformart = "h" ] || [ $fileformart = "hpp" ] \
	|| [ $fileformart = "c" ] || [ $fileformart = "cpp" ];
	then
		line=`cat $filename|wc -l`
		echo "$filename--$line--"
		let g_count+=line
	fi
}

function findcodefile()
{
	for element in `ls $1`
	do
		dir_or_file=$1"/"$element
		if [ -d $dir_or_file ];
		then
			findcodefile $dir_or_file
		else
			countcodeline $dir_or_file
		fi
	done
}

codefiledir=$1
findcodefile $codefiledir
echo $g_count
