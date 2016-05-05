# Job Documents

## aim7&aim9

- usable: no

- tag: cpu; io; function call; suite;

- introduction: 

    AIM7 is a program written in C that forks many processes called tasks, each of which concurrently runs in random order a set of subtests called jobs.
    the AIM Independent Resource Benchmark exercises and times each component of a UNIX computer system, independently. The benchmark uses 58 subtests to generate absolute processing rates, in operations per second, for subsystems, I/O transfers, function calls, and UNIX system calls. GPL'd and can be published under the "non-audited" clause. 

- page: http://lbs.sourceforge.net/

## blogbench

- usable: hold

- tag: io;

introdution: 

    Blogbench is a portable filesystem benchmark that tries to reproduce the load of a real-world busy file server.
    It stresses the filesystem with multiple threads performing random reads, writes and rewrites in order to get a realistic idea of the scalability and the concurrency a system can handle.

- page: https://www.pureftpd.org/project/blogbench

## dbench

- usable: yes

- tag: io;

- introduction: 

    DBENCH is a tool to generate I/O workloads to either a filesystem or to a networked CIFS or NFS server. It can even talk to an iSCSI target. DBENCH can be used to stress a filesystem or a server to see which workload it becomes saturated

- page: https://dbench.samba.org/

## dd-write

- usable: yes

- tag: io;

- introduction: 

    Use Linux `dd` command to test filesystem io workload.

- page: https://romanrm.net/dd-Benchmark

## ebizzy

- usable: yes

- tag: cpu; memory;

- introduction:

    ebizzy is designed to generate a workload resembling common web application server workloads.  It is highly threaded, has a large in-memory working set with low locality, and allocates and deallocates memory frequently.  When running most efficiently, it will max out the CPU. The records per second rate should be as high as possible, and the system time as low as possible.

- page: https://sourceforge.net/p/ltp/git/ci/1eb440c2b5fe43a3e5023015a16aa5d7d3385b1e/tree/utils/benchmark/ebizzy-0.3/README

## ext4-frags

- usable: yes

- tag: io;

- introduction:

```
mke2fs -t ext4 -b 1024 -J size=1 -q $partition
mount -t ext2 $partition $mnt 2>/dev/null ||
mount -t ext4 $partition $mnt             || exit
mkdir $mnt/a
cd $mnt/a
seq 1 210000  | xargs -n 1 fallocate -l 1m
seq 1 2 210000  | xargs /bin/rm
mkdir $mnt/b
cd $mnt/b
seq 1 103 | xargs -n 1 fallocate -l 1g
```

## fileio

- usable: yes

- tag: io;

- introduction:

    use `fallocate` and `sysbench` to test.
    SysBench is a modular, cross-platform and multi-threaded benchmark tool for evaluating OS parameters that are important for a system running a database under intensive load.

- page: https://github.com/akopytov/sysbench

## fsmark/fwq

- usable: yes

- tag: io;

- introduction: 

    The fs_mark benchmark tests synchronous write workloads. It can vary the number of files, directory depth, etc. It has detailed timings for reads, writes, unlinks and fsyncs that make it good for simulating mail servers and other setups.

- page: https://sourceforge.net/projects/fsmark/

## ftq

- usable: no

- tag: cpu;

- introduction:

    FWQ (fixed work quanta) and FTQ (fixed time quanta) run on each core and hardware thread within a single node via pthreads. 
    The FTQ and FWQ benchmarks measure hardware and software interference or ‘noise’ on a node from the applications perspective. 

- page: https://asc.llnl.gov/sequoia/benchmarks/#ftq

## ftrace_onoff

- usable: no

- tag: debug;

- introduction:

    Ftrace is an internal tracer designed to help out developers and designers of systems to find what is going on inside the kernel. It can be used for debugging or analyzing latencies and performance issues that take place outside of user-space.

- page: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/trace/ftrace.txt

## glbenchmark

- usable: no

- tag: graphics;

- introduction:

    Equal to GFXBench.
    GLBenchmark 2.7 is a graphics performance benchmark tool that measures different graphic and computation capabilities of your mobile device. The majority of the tests focus on graphic resources, measuring the quality and performance of the underlying OpenGL ES 2.x implementation.

- detail:

    Focus on performance test rather than stability test. And it needs mouse click to start test(GUI test form).

- page: https://gfxbench.com/benchmark.jsp

## hackbench

- usable: yes

- tag: io;

- introduction:

    Hackbench  is  both  a benchmark and a stress test for the Linux kernel scheduler. It's main job is to create a specified number  of  pairs  of schedulable entities (either threads or traditional processes) which communicate via either sockets or pipes and time how long it takes  for each pair to send data back and forth.

- page: http://people.redhat.com/mingo/cfs-scheduler/tools/hackbench.c

## hpcc

- usable: yes

- tag: cpu;

- introduction:

    `cmd mpirun.openmpi -np $nr_cpu hpcc`
    The mpirun command controls several aspects of program execution in Open MPI. mpirun uses the Open Run-Time Environment (ORTE) to launch jobs.

## iozone

- usable: yes

- tag: io;

- introduction:

    IOzone is a filesystem benchmark tool. The benchmark generates and measures a variety of file operations.

- page: http://www.iozone.org/

## iperf

- usable: no

- tag: network;

- introduction:

    iperf is a tool for active measurements of the maximum achievable bandwidth on IP networks. It supports tuning of various parameters related to timing, protocols, and buffers. For each test it reports the bandwidth, loss, and other parameters.

## kbuild

- usable: no

- introduction:

    "kbuild" is the build system used by the Linux kernel. Modules must use kbuild to stay compatible with changes in the build infrastructure and to pick up the right flags to "gcc." Functionality for building modules both in-tree and out-of-tree is provided.

## kernel_selftests

- usable: no

- introduction:

    The kernel contains a set of "self tests" under the tools/testing/selftests/ directory. These are intended to be small unit tests to exercise individual code paths in the kernel.

- page: https://www.kernel.org/doc/Documentation/kselftest.txt

## ku-latency

- usable: no

- tag: network;

- introduction:

    Measuring latency in the Linux network stack between kernel and user space.


## kvm-unit-tests

- usable: no

- tag: boot; kvm;

- introduction:

    kvm-unit-tests is a project as old as KVM. As its name suggests, it's purpose is to provide unit tests for KVM. The unit tests are tiny guest operating systems that generally execute only tens of lines of C and assembler test code in order to obtain its PASS/FAIL result. Unit tests provide KVM and virt hardware functional testing by targeting the features through minimal implementations of their use per the hardware specification. The simplicity of unit tests make them easy to verify they are correct, easy to maintain, and easy to use in timing measurements. Unit tests are also often used for quick and dirty bug reproducers. The reproducers may then be kept as regression tests. It's strongly encouraged that patches implementing new KVM features are submitted with accompanying unit tests.

- page: http://www.linux-kvm.org/page/KVM-unit-tests

## linpack

- usable: yes

- tag: cpu;

- introduction:

    The Linpack Benchmark is a measure of a computer’s floating-point rate of execution. It is determined by running a computer program that solves a dense system of linear equations.

- page: http://www.netlib.org/utk/people/JackDongarra/faq-linpack.html#_Toc27885709

## locktorture

- usable: no;

- tag: parallel;

- introduction:

    This torture test consists of creating a number of kernel threads which acquire the lock and hold it for specific amount of time, thus simulating different critical region behaviors. The amount of contention on the lock can be simulated by either enlarging this critical region hold time and/or creating more kthreads.

- page: https://www.kernel.org/doc/Documentation/locking/locktorture.txt

## ltp

- usable: yes

- tag: suite;

- introduction:

    Linux Test Project is a joint project started by SGI, OSDL and Bull developed and maintained by IBM, Cisco, Fujitsu, SUSE, Red Hat, Oracle and others. The project goal is to deliver tests to the open source community that validate the reliability, robustness, and stability of Linux.

- page: https://github.com/linux-test-project/ltp

## mce-test

- usable: yes

- tag: suite; cpu; memory;

- introduction:

    The MCE test suite is a collection of tools and test scripts for testing the Linux RAS related features, including CPU/Memory error containment and recovery, ACPI/APEI support etc.

- page: https://github.com/andikleen/mce-test

## nbench

- usable: yes

- tag: cpu;

- introduction:

    The benchmark program takes less than 10 minutes to run (on most machines) and compares the system it is run on to two benchmark systems (a Dell Pentium 90 with 256 KB cache running MSDOS and an AMD K6/233 with 512 KB cache running Linux). The archive contains the complete source, documentation, and a binary (Linux elf).

- page: http://www.tux.org/~mayer/linux/bmark.html

## ndctl

- usable: no

- tag: subsystem;

- introduction:

    Utility library for managing the Linux Kernel ND (NFIT-defined/NVDIMM) Subsystem

- page: https://github.com/pmem/ndctl

## nepim

- usable: no

- tag: network;

- introduction:

    nepim stands for network pipemeter, a tool for measuring available bandwidth between hosts. nepim is also useful to generate network traffic for testing purposes.

## netperf

- usable: no

- tag: network;

- introduction:

    Netperf is a benchmark that can be use to measure various aspect of networking performance. The primary foci are bulk (aka unidirectional) data transfer and request/response performance using either TCP or UDP and the Berkeley Sockets interface.

## netpipe

- usable: no;

- tag: network;

- introduction:

    NetPIPE is a protocol independent performance tool that encapsulates the best of ttcp and netperf and visually represents the network performance under a variety of conditions.

## nuttcp

- usable: no

- tag: network;

- introduction:

    nuttcp is a network performance measurement tool intended for use by network and system managers.

## oltp

- usable: no

- tag: network; mysql; io;

- introduction:

    OLTP (On-line Transaction Processing) is characterized by a large number of short on-line transactions (INSERT, UPDATE, DELETE). The main emphasis for OLTP systems is put on very fast query processing, maintaining data integrity in multi-access environments and an effectiveness measured by number of transactions per second.

## packetdrill

- usable: no;

- tag: network;

- introduction:

    The packetdrill scripting tool enables quick, precise tests for entire TCP/UDP/IPv4/IPv6 network stacks, from the system call layer down to the NIC hardware.

## pbzip2/pigz/pixz/plzip/pxz

- usable: yes;

- tag: cpu; io;

- introduction:

    pigz, which stands for parallel implementation of gzip, is a fully functional replacement for gzip that exploits multiple processors and multiple cores to the hilt when compressing data.

- page: http://compression.ca/pbzip2/

## perf-bench-numa-mem/perf-bench-sched-pipe

- usable: yes

- tag: memory; cpu;

- introduction:

    perf began as a tool for using the performance counters subsystem in Linux, and has had various enhancements to add tracing capabilities.

## pft

- usable: yes;

- tag: memory;

- introduction:

    Page Fault Test.

- page: https://github.com/gormanm/pft

## phoronix-test-suite

- usable: hold;

- tag: suite; 

- introduction:
 
    The Phoronix Test Suite is the most comprehensive testing and benchmarking platform available that provides an extensible framework for which new tests can be easily added.

- page: https://github.com/phoronix-test-suite/phoronix-test-suite/

## piglit

- usable: no

- tag: graphics;

- introduction:

    Piglit is a collection of automated tests for OpenGL implementations.

- page: https://github.com/Igalia/piglit

## pm-qa

- usable: yes;

- tag: power;

- introduction:

    cpufreq; cpuhotplug; cputopology; cpuidle; thermal;

## postmark

- usable: yes;

- tag: io;

- introduction:

    This is a test of NetApp's PostMark benchmark designed to simulate small-file testing similar to the tasks endured by web and mail servers. This test profile will set PostMark to perform 25,000 transactions with 500 files simultaneously with the file sizes ranging between 5 and 512 kilobytes.

- page: https://openbenchmarking.org/test/pts/postmark

## qperf

- usable: no

- tag: network;

- introduction:

    qperf measures bandwidth and latency between two nodes. It can work over TCP/IP as well as the RDMA transports.

## rcutorture

- usable: no

- tag: module;

- introduction:

    creates an rcutorture kernel module that can be loaded to run a torture test.

## reaim

- usable: yes

- tag: cpu;

- introduction:

    Update and improve the existing Open Source AIM 7 benchmark

## siege

- usable: no

- tag: network;

- introduction:

    Siege is an http load testing and benchmarking utility. It was designed to let web developers measure their code under duress, to see how it will stand up to load on the internet.

## sockperf

- usable: no

- tag: network;

- introduction:

    sockperf is a tool for network performance measurement
 
## stutter

- usable: no

- tag: internel test;

- introduction:

    unit test.

## suspend

- usable: yes;

- tag: basic;

- introduction:

    suspend resume test.

## tbench

uable: no

- tag: network;

- introduction:

    a tcp test based on netbench.

- page: http://linux.die.net/man/1/tbench

## tcrypt

- usable: hold

- tag: basic;

- introduction:

    tcrypt.ko module purpose is to test different crypto algorithm from the kenrel space.

## thrulay

- usable: no

- tag: network;

- introduction:

    The program thrulay is used to measure the capacity, delay, and other performance metrics of a network by sending a bulk TCP or UDP stream over it.

## tlbflush

- usable: no

- tag: memory;

- page: http://marc.info/?l=linux-kernel&m=133727348217113&q=raw

## trinity

- usable: hold

- tag: function call;

- introduction:

    A Linux System call fuzz tester, randomly call syscalls.

- page: http://codemonkey.org.uk/projects/trinity/

## unixbench

- usable: yes

- tag: suite;

- introduction:

    UnixBench is the original BYTE UNIX benchmark suite. The purpose of UnixBench is to provide a basic indicator of the performance of a Unix-like system; hence, multiple tests are used to test various aspects of the system's performance.

- page: https://root-wiki.de/wiki/UnixBench

## vm-scalability

- usable: hold

## will-it-scale

- usable: yes

- tag: parallel;

- introduction:

    It Scale takes a testcase and runs it from 1 through to n parallel copies to see if the testcase will scale. It builds both a process and threads based test in order to see any differences between the two.

## xfstests

- usable: yes

- tag: suite; cpu; io;

- introduction:

    Regression test suite for xfs and other filesystems.

- page: http://xfs.org/index.php/Getting_the_latest_source_code
