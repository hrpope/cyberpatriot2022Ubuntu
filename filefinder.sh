#!/bin/bash

# This program finds bad files, and lists them in an output file.
# The user can then choose which to delete at their discretion.



find /home -name "*.midi" -type f | tee ./out/audio/midi.out
find /home -name "*.mid" -type f | tee ./out/audio/mid.out
find /home -name "*.mp3" -type f | tee ./out/audio/mp3.out
find /home -name "*.flac" -type f | tee ./out/audio/flac.out


find /home -name "*.jpg" -type f | tee ./out/images/jpg.out
find /home -name "*.png" -type f | tee ./out/images/png.out
find /home -name "*.jpeg" -type f | tee ./out/images/jpeg.out
find /home -name "*.gif" -type f | tee ./out/images/gif.out



find /home -name "*.avi" -type f | tee ./out/video/avi.out
find /home -name "*.mp4" -type f | tee ./out/video/mp4.out
find /home -name "*.wmv" -type f | tee ./out/video/wmv.out
find /home -name "*.mpg" -type f | tee ./out/video/mpg.out
find /home -name "*.MPG" -type f | tee ./out/video/mpg2.out
find /home -name ".*mpeg" -type f | tee ./out/video/mpeg.out
