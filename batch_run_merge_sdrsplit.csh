#!/bin/csh -f

# =====Input arguments===== #
if($#argv != 1) then
  echo
  echo "batch_run_merge_sdrsplit.csh [list]"
  echo "e.g. batch_run_merge_sdrsplit.csh /home/dmc/pgm/csv2mseed_utility/RCEC_seed_file.list"
  echo
  exit 1
endif

# Input
set list = $1

# Get 
set lines = `awk '{print $1}' $list`

# Process
echo $lines
foreach line ($lines)
  echo $line
  # run_sdrsplit
  csh run_sdrsplit.csh $line
  # merge_sdrsplit
  csh merge_sdrsplit.csh $line
end

