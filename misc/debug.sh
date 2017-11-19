#!/bin/bash

# TEST by running
# _DEBUG=on ./script_name.sh
# if additional debugging info needed try to run script by: bash -x script_name.sh option

function DEBUG() {

	[ "$_DEBUG" == "on" ] && $@ || :  #: makes the shell do nothing
}

#DEBUG example
for i in {1..10}
do
	DEBUG echo $i
done
