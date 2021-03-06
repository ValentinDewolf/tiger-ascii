#!/bin/bash

tigerdir=${0%/*}

FRAMES[0]="$tigerdir/frames/walk-01.txt"
FRAMES[1]="$tigerdir/frames/walk-02.txt"
FRAMES[2]="$tigerdir/frames/walk-03.txt"
FRAMES[3]="$tigerdir/frames/walk-04.txt"
FRAMES[4]="$tigerdir/frames/walk-05.txt"
FRAMES[5]="$tigerdir/frames/walk-06.txt"
FRAMES[6]="$tigerdir/frames/walk-07.txt"
FRAMES[7]="$tigerdir/frames/walk-08.txt"
FRAMES[8]="$tigerdir/frames/walk-09.txt"
FRAMES[9]="$tigerdir/frames/walk-10.txt"


# Displays the content of a file with some left padding
function file_display ()
{
    echo -ne "\033[s\033[0;0H"
    offset=2
    echo -ne "\033[38;5;209m"
    IFS=''
    line_number=0
    tput civis
    while read file_line
    do
        echo -ne "\033[${offset}C"

        pos=0
        while [ $pos -lt ${#file_line} ]; do
            chr=${file_line:$pos:1}
            if [ $(($pos + $offset)) -lt ${LINE[$line_number]} ]; then
                echo -ne "\033[1C"
            else
                echo -n "$chr"
            fi
            pos=$((pos + 1))
        done
        echo


        line_number=$(($line_number + 1))
    done < $1
    tput cnorm
    echo -ne "\033[0;m"
    echo -ne "\033[u"
}


i=0
count=0
height=$(tput lines)
height=$(($height - 2))
while read line
do
    echo "$line"
    line=$(echo $line | sed -E "s/\x1B\[[0-9]([0-9])?[;m]([0-9])?([0-9])?(;)?([0-9])?([0-9])?([0-9])?(m)?//g")

    if [ $count -lt $height ]; then

            LINE[$count]=${#line}
    else
        file_display "${FRAMES[$i]}"

            tmp=0
            while [ $tmp -lt $height ]; do
                LINE[$tmp]=${LINE[$(($tmp + 1))]}
                tmp=$(($tmp + 1))
            done
            LINE[$(($height - 1))]=${#line}
    fi

    i=$(($i + 1))
    count=$(($count + 1))
    if [ $i -ge 10 ]; then
        i=0
    fi

done < "/dev/stdin"
