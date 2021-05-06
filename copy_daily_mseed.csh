#!/bin/csh
# =====Input arguments===== #
if($#argv != 3) then
  echo
  echo "copy_daily_mseed.csh [input] [jday1] [jday2]"
  echo "e.g. copy_daily_mseed.csh /home/dmc/pgm/csv2mseed_utility/RCEC_seed_file.list 093 124"
  echo
  exit 1
endif

# Input
set list = $1
set jday1 = $2
set jday2 = $3

set lines = `awk '{print $1}' $list`

set jdays = ()
foreach x (`seq $jday1 1 $jday2`)
     set x = `echo $x | awk '{printf "%03d\n", $1}'`
     set jdays = ($jdays $x)
end
echo $jdays
# Process
set tmp = $jday1\_$jday2
mkdir $tmp
cd $tmp

foreach line ($lines)
  echo $line
  set sta = `echo $line | awk -F'/' '{print $NF}'`
  echo $sta
  set staDir = $sta
  mkdir $staDir
  cd $staDir
  foreach jday ($jdays)
    ls $line/*.2021.$jday.*
    cp $line/*.2021.$jday.* .
  end
  cd ..
end
