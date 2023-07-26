#!/bin/sh
for p in $(find /sys/fs/cgroup/ -name cgroup.procs ); do
	d="$(dirname $p)"
	echo $d
	echo "controllers:"
	cat "$d/cgroup.controllers"
	echo "subtree_control:"
	cat "$d/cgroup.subtree_control"
	echo "pids:"
	for pid in $(cat $p); do
		echo "  $pid: $(cat /proc/$pid/comm)"
    done
done
