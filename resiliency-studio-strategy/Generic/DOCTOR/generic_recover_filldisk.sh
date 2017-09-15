#!/bin/bash

# *******************************************************************************
# *   BSD License
# *    
# *   Copyright (c) 2017, AT&T Intellectual Property.  All other rights reserved.
# *    
# *   Redistribution and use in source and binary forms, with or without modification, are permitted
# *   provided that the following conditions are met:
# *    
# *   1. Redistributions of source code must retain the above copyright notice, this list of conditions
# *      and the following disclaimer.
# *   2. Redistributions in binary form must reproduce the above copyright notice, this list of
# *      conditions and the following disclaimer in the documentation and/or other materials provided
# *      with the distribution.
# *   3. All advertising materials mentioning features or use of this software must display the
# *      following acknowledgement:  This product includes software developed by the AT&T.
# *   4. Neither the name of AT&T nor the names of its contributors may be used to endorse or
# *      promote products derived from this software without specific prior written permission.
# *    
# *   THIS SOFTWARE IS PROVIDED BY AT&T INTELLECTUAL PROPERTY ''AS IS'' AND ANY EXPRESS OR
# *   IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# *   MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
# *   SHALL AT&T INTELLECTUAL PROPERTY BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# *   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# *   PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;  LOSS OF USE, DATA, OR PROFITS;
# *   OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# *   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# *   ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
# *   DAMAGE.
# *******************************************************************************

#
# Script for Generic recover FillDisk Doctor Monkey to recover from the disk fill
#
# Purpose
#   Run this script to recover from the disk filling
#
# Usage Syntax:
#   $0
#     
# STEPS:
#  Delete the dynamic shell script and the temp file generated by filldisk chaos monkey
#
# Exit Codes:
#  0 - Script execution success and execution result passed
#  101 - Script execution success and execution result failed
#  others - Script execution failed and execution result failed
#


scriptName="/tmp/rsdiskfill.sh"   #Dynamic script name created as part of chaos monkey

fileToDelete="/tmp/rsdiskfill"    #File name created during chaos monkey

#Check if the filldisk script is already running
pcount=$(ps -ef | grep -v grep | grep bash | grep "$scriptName" | wc -l)

if [ "$pcount" = 0 ]
then
	echo ""
	echo "No FillDisk Chaos Monkey with scriptname $scriptName is running, so couldn't terminate any running process" 
else
	echo ""
	echo "Terminating the execution of FillDisk monkey strategy" 
	parentpid=$(ps -ef | grep "$scriptName" | grep -v grep | grep bash | awk '{ print $3 }')
	if [ "$parentpid" -gt 50 ];
	then
		kill -KILL -$parentpid
	else
		processid=$(ps -ef | grep -v grep | grep bash | grep "$scriptName" | awk '{print $2}')
		processgrpid=$(ps -o pgid= $processid | grep -o [0-9]*)
		kill -KILL -$processgrpid
	fi
fi

if [ -f "$fileToDelete" ]
then
	echo "File $fileToDelete found, removing to cleanup the disk"
	rm "$fileToDelete"
else
	echo "File $fileToDelete not found for deletion"
fi

if [ $? = 0 ]
then
    echo "Monkey executed successfully"
else
    echo "Monkey execution returned with error" $?
fi

