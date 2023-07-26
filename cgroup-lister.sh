#!/bin/sh
for d in $(find /sys/fs/cgroup/ -type d | sort); do
	echo $d
	echo "controllers:"
	cat "$d/cgroup.controllers"
	echo "subtree_control:"
	cat "$d/cgroup.subtree_control"
	echo "pids:"
	for pid in $(cat $d/cgroup.procs); do
		echo "  $pid: $(cat /proc/$pid/comm)"
    done
done
