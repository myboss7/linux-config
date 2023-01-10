#!/bin/sh

cat /proc/meminfo > temp.txt

total_mem=`cat temp.txt | grep MemTotal | awk '{print $2}'`
free_mem=`cat temp.txt | grep MemFree | awk '{print $2}'`
buffer_mem=`cat temp.txt | grep Buffers | awk '{print $2}'`
inactive_mem=`cat temp.txt | grep Inactive: | awk '{print $2}'`

REAL_MEM_FREE=`expr $free_mem + $buffer_mem + $inactive_mem`
REAL_MEM_USED=`expr $total_mem - $REAL_MEM_FREE`
REAL_MEM_PERCENTAGE=`expr $REAL_MEM_USED \* 100 / $total_mem`

echo "Total Memory : $total_mem KB"
echo "USED Memory  : $REAL_MEM_USED KB"
echo "FREE Memory  : $REAL_MEM_FREE KB"
echo "USED PERCENTAGE : $REAL_MEM_PERCENTAGE %"

rm -f temp.txt
