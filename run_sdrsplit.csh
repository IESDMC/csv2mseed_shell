#!/bin/csh

# =====Input arguments===== #
if($#argv != 1) then
  echo
  echo "run_sdrsplit.csh [input]"
  echo "e.g. run_sdrsplit.csh /data/dmc/RFi/RCEC/seed/RCEC7A"
  echo
  exit 1
endif

# Input
set ddir = $1

# Process
cd $ddir
set mseeds = `ls *mseed`
foreach mseed ($mseeds)
  sdrsplit -D $mseed
end
