#!/bin/csh

# =====Input arguments===== #
if($#argv != 2) then
  echo
  echo "run_csv2mseed.csh [input] [output]"
  echo "e.g. run_csv2mseed.csh /data/dmc/RFi/RCEC/RCEC7A/phidgetData_0010.csv /data/dmc/RFi/RCEC/seed/RCEC7A"
  echo
  exit 1
endif

# Enable virtual environment for python
conda activate 'rfidgetenv'

# Input
set input = $1
set output = $2

# Output
if (! -d $output) mkdir $output

# Get variables
set stn = `echo $output | awk -F'/' '{print $NF}'`
set index = `echo $input | awk -F'/' '{print $NF}' | cut -c 13-16`

# Process
python /home/dmc/pgm/csv2mseed_utility/csv2mseed.py -inp $input -stn $stn -net TW

# Rename
rename -v $stn $stn\_$index *.mseed

# Move
/bin/mv *.mseed $output




