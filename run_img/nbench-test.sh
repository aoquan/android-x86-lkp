#!/bin/sh

export_top_env()
{
	export testcase='nbench'
	export category='benchmark'
	export model='qemu-system-x86_64 -enable-kvm -cpu Nehalem'
	export nr_vm=8
	export nr_cpu=2
	export memory='1G'
	export rootfs='debian-x86_64.cgz'
	export hdd_partitions='/dev/vda /dev/vdb /dev/vdc /dev/vdd /dev/vde'
	export swap_partitions='/dev/vdf'
	export LKP_SERVER='localhost'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export testbox='kvm'
	export tbox_group='kvm'
	export branch='linux-next'
	export arch='x86_64'
	export kconfig='x86_64-rhel'
	export compiler='gcc-4.9'
	export commit='c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b'
	export user='lkp'
	export kernel='/pkg/linux/x86_64-rhel/gcc-4.9/c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b/vmlinuz-4.2.0-rc8'
	export modules_initrd='/pkg/linux/x86_64-rhel/gcc-4.9/c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b/modules.cgz'
	export linux_headers_initrd='/pkg/linux/x86_64-rhel/gcc-4.9/c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b/linux-headers.cgz'
	export initrd='/osimage/debian/debian-x86_64-2015-02-07.cgz'
	export lkp_initrd='/lkp/lkp/lkp-x86_64.cgz'
	export bm_initrd='/osimage/deps/debian-x86_64-2015-02-07.cgz/lkp.cgz, /osimage/deps/debian-x86_64-2015-02-07.cgz/run-ipconfig.cgz, /osimage/deps/debian-x86_64-2015-02-07.cgz/turbostat.cgz, /lkp/benchmarks/turbostat.cgz, /lkp/benchmarks/nbench-x86_64.cgz'
	export max_uptime=3300
	export job='/lkp/scheduled/kvm/nbench.yaml'
	export result_root='/result/nbench/1x/kvm/debian-x86_64.cgz/x86_64-rhel/gcc-4.9/c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b/2'
	export job_state='booting'
	export bootloader_append='root=/dev/ram0 user=lkp job=/lkp/scheduled/kvm/nbench.yaml ARCH=x86_64 kconfig=x86_64-rhel branch=linux-next commit=c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b BOOT_IMAGE=/pkg/linux/x86_64-rhel/gcc-4.9/c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b/vmlinuz-4.2.0-rc8 max_uptime=3300 RESULT_ROOT=/result/nbench/1x/kvm/debian-x86_64.cgz/x86_64-rhel/gcc-4.9/c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b/2 LKP_SERVER=localhost earlyprintk=ttyS0,115200 systemd.log_level=err debug apic=debug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=100 panic=-1 softlockup_panic=1 nmi_watchdog=panic oops=panic load_ramdisk=2 prompt_ramdisk=0 console=ttyS0,115200 console=tty0 vga=normal rw'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_setup $LKP_SRC/setup/iterations '1x'

	export duration='10s'
	run_test $LKP_SRC/tests/wrapper nbench
	unset duration
}

extract_stats()
{
	$LKP_SRC/stats/wrapper nbench

	$LKP_SRC/stats/wrapper time nbench.time
	$LKP_SRC/stats/wrapper time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper last_state
}

"$@"
