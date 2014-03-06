#! /bin/bash

if [ $# -lt 1 ];then
	start=4
else
	start=$1
fi
Alphabet="`echo {A..Z}`"
options=( `echo ${Alphabet:0:$((2*start))}` )

for ((limit=$start;limit>0;limit--));do
	selection=$((RANDOM%limit))
	#echo $selection
	this=${options[$selection]}
	echo $this
	newOptions=()
	for i in ${options[@]};do
		[[ "$i" != $this ]] && newOptions=( "${newOptions[@]}" $i )
	done
	options=( "${newOptions[@]}" )
done
