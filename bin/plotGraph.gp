#!/usr/bin/gnuplot 
reset
set terminal png
if (!exist("outFilename")) outFilename='defaultGraph.png'
set output outFilename

if (!exists("inFilename")) filename='log.txt'

if (!exists("yLabel")) yLabel='PDR'
set ylabel yLabel

if(!exist("xLabel")) xLabel='Time in Cycle'
set xlabel xLabel 
#set xlabel "Time in Cycle"

set title "Debt-based Algorithm " font ",15"
set style line 1 lw 2 pt 3 ps 0.5

set style data linespoints
set key below 
set grid

#plot inFilename  using 1:2  title outFilename with lines
plot inFilename using 2 pointinterval 100 lt rgb "#000044" pt 5  title 'Flow1' , \
     inFilename using 3 pointinterval 100 lt rgb "#008800" pt 6  title 'Flow2' , \
     inFilename using 4 pointinterval 100 lt rgb "#990000" pt 7  title 'Flow3' 
