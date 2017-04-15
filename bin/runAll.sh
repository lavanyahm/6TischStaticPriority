
#Check if  argument is passed
if [ $# -eq 0 ]; then
    echo "No arguments supplied ...is delay_enabled?(0/1)"
    exit
fi
delay_enabled="$1"


if [ $delay_enabled -eq 1 ]; then 
       echo " delay Enabled "
#       python runSimOneCPU.py  --isDelayConstraint --deadLineFlow1 15  --deadLineFlow2 15  --expectedPdrFlow1 0.70  --expectedPdrFlow2 0.50 --pkPeriod 0.15 --numRuns 50 
       python runSimOneCPU.py  --isDelayConstraint --deadLineFlow1 10  --deadLineFlow2 10  --expectedPdrFlow1 0.9  --expectedPdrFlow2 0.9 --pkPeriod 0.05 --numRuns 10 --enableCellAllocation --numCycles 1000
#       python runSimOneCPU.py  --numFlows 1 --isDelayConstraint --deadLineFlow1 10   --expectedPdrFlow1 0.90  --pkPeriod 0.10 --numRuns 100 --enableCellAllocation
       sleep 1
       python parse_data.py
       if [ ! -d "$DIRECTORY" ]; then
  	# Control will enter here if $DIRECTORY doesn't exist.
		mkdir Cell_3_Delay_NoOTf/
		mv  simData Cell_3_Delay_NoOTf/
		mv  runSim.log* Cell_3_Delay_NoOTf/
        	mv  parseResults Cell_3_Delay_NoOTf/
		cp  parseScipts/sample.tex Cell_3_Delay_NoOTf/parseResults/
		#cd  Cell_3_Delay_NoOTf/parseResults
		echo "Please Change sample.tex in Cell_3_Delay_NoOTf/parseResults \n pdflatex sample.tex ...."
	else 
    		echo "Connot Create Directry...Directry Exits!!!!   "
		exit
	fi	
        
else   
       python runSimOneCPU.py  --numRuns 1
       sleep 1	
       python parse_data.py 	
       if [ ! -d "$DIRECTORY" ]; then
		mkdir Cell_3_NoDelay_NoOTf/
		mv  simData Cell_3_NoDelay_NoOTf/
		mv  runSim.log* Cell_3_NoDelay_NoOTf/
	        mv  parseResults Cell_3_NoDelay_NoOTf/
		cp  parseScipts/sample.tex Cell_3_NoDelay_NoOTf/parseResults/
		#cd  Cell_3_NoDelay_NoOTf/parseResults
		echo "Please Change sample.tex in Cell_3_NoDelay_NoOTf/parseResults \n pdflatex sample.tex ...."
       else
    		echo "Connot Create Directry...Directry Exits!!!!   "
	        exit
	fi


fi


