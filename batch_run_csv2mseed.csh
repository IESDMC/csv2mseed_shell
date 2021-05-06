#!/bin/csh -f

# =====Input arguments===== #
if($#argv != 1) then
  echo
  echo "batch_run_csv2mseed.csh [list]"
  echo "e.g. batch_run_csv2mseed.csh /home/dmc/pgm/csv2mseed_utility/RCEC_file.list"
  echo
  exit 1
endif

# Input
set list = $1

# Output
set outputDir = /data/dmc/RFi/RCEC/seed/

# Get 
set lines = `awk '{print $1}' $list`

# Log
set log = log.csv2mseed
date >> $log

# Process
echo $lines
foreach line ($lines)
  set stn = `echo $line | awk -F'/' '{print $NF}'`
  #  echo $stn
  set csvs = `ls $line/phidgetData*.csv`
  foreach csv ($csvs)
	  #    echo $csv $outputDir/$stn
    ## run_csv2mseed.csh [input] [output]
    csh /home/dmc/pgm/csv2mseed_utility/run_csv2mseed.csh $csv $outputDir/$stn >> $log
  end
end

#set num = `cat $1 | wc | awk '{print $1}'`
#set i = 1

#while( $i <= $num)
#  echo $i
#  set line = `cat $list | awk 'NR==i{print}' i=$i`
#  set input = `echo $line | awk '{print $1}'`
#  set output = `echo $line | awk '{print $2}'`
#  echo $input $output
  # run_csv2mseed.csh [input] [output]
  #  csh run_csv2mseed.csh $input $output
  #  @ i ++
#end
