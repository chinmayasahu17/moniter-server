#!/bin/bash


get_cpu_usage(){
    echo "cpu usage:"
    mpstat | awk '$12 ~ /[0-9 .]+/  {printf "%.2f%% \n" , (100 - $12)}' 
}

get_memory_usage(){
    echo "memory usage:"
    free | awk '/Mem:/ {printf "%.2f%%\n", ($3 / $2)* 100 }'
}

get_disk_usage(){
    echo "disk usage:"
    df -h | awk '$6 == "/" {print "used: "$3" , free: "$4" , usage: "$5}'
}

get_cpu_usage
get_memory_usage
get_disk_usage
