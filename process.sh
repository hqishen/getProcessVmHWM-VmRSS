#!/bin/bash
#*************************************************
#**********File Name:process.sh
#**********Function :
#**********Author   :Jertor
#**********Email    :hqishen@126.com
#*************************************************
#ps -e | awk '{print $4}' > abc.txt    把当前的进程写到文本里
#cat /proc/`pgrep gedit`/status | grep -E "VmHWM|VmRSS"  获取占用内存峰值和当前zhi
#echo $s|tr '\n' '\t' 把回车回程tab
ProcessFile="./abc.txt";
ResultFile1="./shenlan.txt";
ResultFile2="./shenl.txt";
i=0;
for process in `cat $ProcessFile`
    do
        x=${process:0:1}
        if [ ${x} == '#' ]; then
            continue;
        else
            upid=`pgrep ${process}`;
            if [ ${upid} > 0 ] ; then
                Vm="`cat /proc/${upid}/status | egrep "VmHWM|VmRSS"`"
                echo -e "********************************************************************************************" >> ${ResultFile1}
                echo  -e "|\e[43;34;1m Name: ${process} \e[0m" "\t" "|\e[42;37;1m PID: ${upid} \e[0m" "\t" "|"${Vm} >> ${ResultFile1};
                i=$[$i + 1]
                #i=$(($i + 1));
                #((i++))
            else 
                echo -e "\e[41;37;1m ${process} is not exist!! \e[0m" >> ${ResultFile2};
            fi
        fi
    done
echo "process number $i"

