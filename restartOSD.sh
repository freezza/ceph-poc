#!/bin/bash
#
#	Script for find an OSD location and restart it.
#	Author:
#	https://www.sebastien-han.fr/blog/2015/11/27/ceph-find-an-osd-location-and-restart-it/
#
for down_osd in $(ceph osd tree | awk '/down/ {print $1}')
do
  host=$(ceph osd find $down_osd | awk -F\" '$2 ~ /host/ {print $4}')
  ssh $host restart ceph-osd id=$down_osd
done
