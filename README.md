# FreeNAS Disk Temperature Graphs

This set of scripts and configuration files modify the
default FreeNAS 11 environment to create, update, and 
display disk temperature graphs.

Once installed, disk temperature graphs will show up 
at the bottom of the *Disk* graph window under the 
*Reports* tab.

## Install and run

Once you've cloned this repo on your FreeNAS system,
run the included script `install_disktemp_graphs.sh`.  
That's it!  Your graphs should immediately appear, 
and data should start displaying in 10 minutes or so.

## Maintenance

Note that you will need to re-run the `install_disktemp_graphs.sh`
every time you restore your system or update it.

Works with FreeNAS 11.1-U1.  Each version of this repo will be tagged
with the same version of FreeNAS where this configuration is known to 
work.

I'll try to tweak these scripts to keep up with FreeNAS changes as 
they occur, but it won't be immediate.  YMMV.
