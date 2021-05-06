#!/bin/csh
# =====Input arguments===== #
if($#argv != 1) then
  echo
  echo "merge_sdrsplit.csh [input]"
  echo "e.g. merge_sdrsplit.csh /data/dmc/RFi/RCEC/seed/RCEC7A"
  echo
  exit 1
endif

# Input
set ddir = $1

# Log
set log = /home/dmc/pgm/csv2mseed_utility/log.merge_sdrsplit
date >> $log

# Process
cd $ddir
set mseeds = `ls --ignore='*.mseed' --ignore='*.csh'`
set prev = $mseeds[1]
foreach mseed ($mseeds[2-$#mseeds])
  echo 'prev:'$prev
  echo 'curr:'$mseed
  set jday1 = `echo $prev | awk -F'.' '{print $7}'`
  set jday2 = `echo $mseed | awk -F'.' '{print $7}'`
  if($jday1 == $jday2)then
    echo "$jday1 merge $mseed into $prev, and remove $mseed" >> $log
    cat $mseed >> $prev
    rm -f $mseed
  endif
  set prev = $mseed
end
