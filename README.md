# csv2mseed_shell
Shell scripts to convert csv to daily mseed

### Single csv file

- source code:
    - [csv2mseed](https://github.com/earthinversion/csv2mseed_utility)
    - [sdrsplit](http://ncedc.org/ftp/pub/quanterra/ucb/sdrsplit.2020.079.tar.gz)
- convert csv to mseed

    ```bash
    $ python csv2mseed.py -inp [input] -stn [stn] -net [net]
    ```

- split to daily mseed

    ```bash
    $ sdrsplit [mseed]
    ```

- merge the same day mseed

    ```bash
    $ cat [mseedfile2] >> [mseedfile1]
    ```

### Csv files in a folder

- convert csv to mseed

    ```bash
    $ csh run_csv2mseed.csh [input] [output]
    e.g. csh run_csv2mseed.csh /data/dmc/RFi/RCEC/RCEC7A/phidgetData_0010.csv /data/dmc/RFi/RCEC/seed/RCEC7A
    ```

- split to daily mseed

    ```bash
    $ csh run_sdrsplit.csh [input]
    e.g. csh run_sdrsplit.csh /data/dmc/RFi/RCEC/seed/RCEC7A
    ```

- merge split daily mseed

    ```bash
    $ csh merge_sdrsplit.csh [input]
    e.g. csh merge_sdrsplit.csh /data/dmc/RFi/RCEC/seed/RCEC7A
    ```

### Csv files in folders

- write csv file folders path

    ```bash
    # RCEC_file.list
    /data/dmc/RFi/RCEC/RCEC9
    /data/dmc/RFi/RCEC/RCEC8
    /data/dmc/RFi/RCEC/RCEC7A
    /data/dmc/RFi/RCEC/RCEC7B
    /data/dmc/RFi/RCEC/RCECB1
    ```

- convert csv to mseed

    ```bash
    $ csh batch_run_csv2mseed.csh [list]
    e.g. csh batch_run_csv2mseed.csh /home/dmc/pgm/csv2mseed_utility/RCEC_file.list

    ```

- write seed file folders path

    ```bash
    # RCEC_seed_file.list
    /data/dmc/RFi/RCEC/seed/RCEC9
    /data/dmc/RFi/RCEC/seed/RCEC8
    /data/dmc/RFi/RCEC/seed/RCEC7A
    /data/dmc/RFi/RCEC/seed/RCEC7B
    /data/dmc/RFi/RCEC/seed/RCECB1

    ```

- split mseed to daily mseed and merge them

    ```
    $ csh batch_run_merge_sdrsplit.csh [list]
    e.g. csh batch_run_merge_sdrsplit.csh /home/dmc/pgm/csv2mseed_utility/RCEC_seed_file.list
    ```
