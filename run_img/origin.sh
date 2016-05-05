#!/bin/sh

export_top_env()
{
	export LKP_SERVER='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export testcase='ebizzy'
	export model='Nehalem-EX'
	export memory='256G'
	export nr_cpu=64
	export nr_ssd_partitions=6
	export ssd_partitions='/dev/vda /dev/vdb /dev/vdc /dev/vdd /dev/vde /dev/vdf'
	export swap_partitions='/dev/vdg'
	export category='benchmark'
	export branch='pm/linux-next'
	export commit='c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b'
	export queue='unit'
	export repeat_to=2
	export testbox='lkp-nex04'
	export tbox_group='lkp-nex04'
	export kconfig='x86_64-rhel'
	export enqueue_time='2015-08-30 23:11:41 +0800'
	export id='d19e3f5a5961468c78e47bf16b230ba6bd6be9f5'
	export user='lkp'
	export compiler='gcc-4.9'
	export head_commit='9ea77b2f63138e2a61381bc9a2a1322191c86ea5'
	export base_commit='c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b'
	export kernel='/pkg/linux/x86_64-rhel/gcc-4.9/c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b/vmlinuz-4.2.0-rc8'
	export rootfs='debian-x86_64-2015-02-07.cgz'
	export result_root='/result/ebizzy/performance-200%-100x-10s/lkp-nex04/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b/0'
	export job_file='/lkp/scheduled/lkp-nex04/unit_ebizzy-performance-200%-100x-10s-x86_64-rhel-BASE-c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b-20150830-10493-9a909m-0.yaml'
	export dequeue_time='2015-08-30 23:42:55 +0800'
	export max_uptime=3319.6800000000003
	export initrd='/osimage/debian/debian-x86_64-2015-02-07.cgz'
	export bootloader_append='root=/dev/ram0
user=lkp
job=/lkp/scheduled/lkp-nex04/unit_ebizzy-performance-200%-100x-10s-x86_64-rhel-BASE-c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b-20150830-10493-9a909m-0.yaml
ARCH=x86_64
kconfig=x86_64-rhel
branch=pm/linux-next
commit=c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b
BOOT_IMAGE=/pkg/linux/x86_64-rhel/gcc-4.9/c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b/vmlinuz-4.2.0-rc8
max_uptime=3319
RESULT_ROOT=/result/ebizzy/performance-200%-100x-10s/lkp-nex04/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b/0
LKP_SERVER=inn


earlyprintk=ttyS0,115200 systemd.log_level=err
debug apic=debug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=100
panic=-1 softlockup_panic=1 nmi_watchdog=panic oops=panic load_ramdisk=2 prompt_ramdisk=0
console=ttyS0,115200 console=tty0 vga=normal

rw'
	export lkp_initrd='/lkp/lkp/lkp-x86_64.cgz'
	export modules_initrd='/pkg/linux/x86_64-rhel/gcc-4.9/c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b/modules.cgz'
	export bm_initrd='/osimage/deps/debian-x86_64-2015-02-07.cgz/lkp.cgz,/osimage/deps/debian-x86_64-2015-02-07.cgz/run-ipconfig.cgz,/osimage/deps/debian-x86_64-2015-02-07.cgz/turbostat.cgz,/lkp/benchmarks/turbostat.cgz,/lkp/benchmarks/ebizzy-x86_64.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	default_monitors()
	{
		run_monitor $LKP_SRC/monitors/event/wait 'activate-monitor'
		run_monitor $LKP_SRC/monitors/wrapper kmsg
		run_monitor $LKP_SRC/monitors/wrapper uptime
		run_monitor $LKP_SRC/monitors/wrapper iostat
		run_monitor $LKP_SRC/monitors/wrapper vmstat
		run_monitor $LKP_SRC/monitors/wrapper numa-numastat
		run_monitor $LKP_SRC/monitors/wrapper numa-vmstat
		run_monitor $LKP_SRC/monitors/wrapper numa-meminfo
		run_monitor $LKP_SRC/monitors/wrapper proc-vmstat
		export interval=10
		run_monitor $LKP_SRC/monitors/wrapper proc-stat
		unset interval

		run_monitor $LKP_SRC/monitors/wrapper meminfo
		run_monitor $LKP_SRC/monitors/wrapper slabinfo
		run_monitor $LKP_SRC/monitors/wrapper interrupts
		run_monitor $LKP_SRC/monitors/wrapper lock_stat
		run_monitor $LKP_SRC/monitors/wrapper latency_stats
		run_monitor $LKP_SRC/monitors/wrapper softirqs
		run_monitor $LKP_SRC/monitors/wrapper bdi_dev_mapping
		run_monitor $LKP_SRC/monitors/wrapper diskstats
		run_monitor $LKP_SRC/monitors/wrapper nfsstat
		run_monitor $LKP_SRC/monitors/wrapper cpuidle
		run_monitor $LKP_SRC/monitors/wrapper cpufreq-stats
		run_monitor $LKP_SRC/monitors/wrapper turbostat
		run_monitor $LKP_SRC/monitors/wrapper pmeter
		export interval=60
		run_monitor $LKP_SRC/monitors/wrapper sched_debug
		unset interval
	}
	default_monitors &

	run_setup $LKP_SRC/setup/cpufreq_governor 'performance'

	default_watchdogs()
	{
		run_monitor $LKP_SRC/monitors/wrapper oom-killer
		run_monitor $LKP_SRC/monitors/wrapper watchdog
	}
	default_watchdogs &

	run_setup $LKP_SRC/setup/nr_threads '200%'

	run_setup $LKP_SRC/setup/iterations '1x'

	export duration='10s'
	run_test $LKP_SRC/tests/wrapper ebizzy
	unset duration

	wait
}

extract_stats()
{
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper uptime
	$LKP_SRC/stats/wrapper iostat
	$LKP_SRC/stats/wrapper vmstat
	$LKP_SRC/stats/wrapper numa-numastat
	$LKP_SRC/stats/wrapper numa-vmstat
	$LKP_SRC/stats/wrapper numa-meminfo
	$LKP_SRC/stats/wrapper proc-vmstat
	$LKP_SRC/stats/wrapper meminfo
	$LKP_SRC/stats/wrapper slabinfo
	$LKP_SRC/stats/wrapper interrupts
	$LKP_SRC/stats/wrapper lock_stat
	$LKP_SRC/stats/wrapper latency_stats
	$LKP_SRC/stats/wrapper softirqs
	$LKP_SRC/stats/wrapper diskstats
	$LKP_SRC/stats/wrapper nfsstat
	$LKP_SRC/stats/wrapper cpuidle
	$LKP_SRC/stats/wrapper turbostat
	$LKP_SRC/stats/wrapper pmeter
	$LKP_SRC/stats/wrapper sched_debug
	$LKP_SRC/stats/wrapper ebizzy

	$LKP_SRC/stats/wrapper time ebizzy.time
	$LKP_SRC/stats/wrapper time
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper last_state
}

"$@"
