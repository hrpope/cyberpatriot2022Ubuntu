#!/bin/bash

# This program finds bad files, and lists them in an output file.
# The user can then choose which to delete at their discretion.



find /home -name "*.midi" -type f 
find /home -name "*.mid" -type f 
find /home -name "*.mp3" -type f 
find /home -name "*.flac" -type f 


find /home -name "*.jpg" -type f 
find /home -name "*.png" -type f 
find /home -name "*.jpeg" -type f 
find /home -name "*.gif" -type f 



find /home -name "*.avi" -type f 
find /home -name "*.mp4" -type f 
find /home -name "*.wmv" -type f 
find /home -name "*.mpg" -type f 
find /home -name "*.MPG" -type f 
find /home -name ".*mpeg" -type f 
