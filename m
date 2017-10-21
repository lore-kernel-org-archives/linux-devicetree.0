From: kernel test robot <fengguang.wu@intel.com>
Subject: c810c0a17e ("of: dynamic: fix memory leak related to .."):
  WARNING: CPU: 0 PID: 0 at arch/x86/mm/tlb.c:265
 initialize_tlbstate_and_flush
Date: Sun, 22 Oct 2017 06:05:28 +0800
Message-ID: <59ebc4a8.j7dAqYigPV5Jdu9G%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_59ebc4a8.la70dycVkjxahXE5wAtj33PwzrR6eeNh+KTjKU72vRdy4Owk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lixin Wang <alan.1.wang@nokia-sbell.com>
Cc: LKP <lkp@01.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Frank Rowand <frank.rowand@sony.com>, Rob Herring <robh@kernel.org>, wfg@linux.intel.com
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.

--=_59ebc4a8.la70dycVkjxahXE5wAtj33PwzrR6eeNh+KTjKU72vRdy4Owk
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Greetings,

0day kernel testing robot got the below dmesg and the first bad commit is

https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next

commit c810c0a17e019d1e4345bcbc49b6eddcf5dd001d
Author:     Lixin Wang <alan.1.wang@nokia-sbell.com>
AuthorDate: Fri Oct 20 09:59:09 2017 +0800
Commit:     Rob Herring <robh@kernel.org>
CommitDate: Fri Oct 20 10:27:33 2017 -0500

    of: dynamic: fix memory leak related to properties of __of_node_dup
    
    If a node with no properties is dynamically added, then a property is
    dynamically added to the node, then the property is dynamically removed,
    the result will be node->properties == NULL and node->deadprops != NULL.
    
    Add a separate function to release the properties in both lists.
    
    Signed-off-by: Lixin Wang <alan.1.wang@nokia-sbell.com>
    Reviewed-by: Frank Rowand <frank.rowand@sony.com>
    Signed-off-by: Rob Herring <robh@kernel.org>

4ee7c0d964  of: overlay: make pr_err() string unique
c810c0a17e  of: dynamic: fix memory leak related to properties of __of_node_dup
c810c0a17e  of: dynamic: fix memory leak related to properties of __of_node_dup
+-------------------------------------------------------------+------------+------------+------------+
|                                                             | 4ee7c0d964 | c810c0a17e | c810c0a17e |
+-------------------------------------------------------------+------------+------------+------------+
| boot_successes                                              | 2          | 0          | 0          |
| boot_failures                                               | 46         | 15         | 15         |
| WARNING:at_arch/x86/mm/tlb.c:#initialize_tlbstate_and_flush | 46         | 13         | 13         |
| EIP:initialize_tlbstate_and_flush                           | 46         | 13         | 13         |
| BUG:unable_to_handle_kernel                                 | 0          | 15         | 15         |
| Oops:#[##]                                                  | 0          | 15         | 15         |
| EIP:property_list_free                                      | 0          | 15         | 15         |
| Kernel_panic-not_syncing:Fatal_exception                    | 0          | 15         | 15         |
+-------------------------------------------------------------+------------+------------+------------+

[    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Initializing CPU#0
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/x86/mm/tlb.c:265 initialize_tlbstate_and_flush+0x1ae/0x1d0
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.14.0-rc1-00047-gc810c0a #1
[    0.000000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014
[    0.000000] task: c7caca40 task.stack: c7c94000
[    0.000000] EIP: initialize_tlbstate_and_flush+0x1ae/0x1d0
[    0.000000] EFLAGS: 00210002 CPU: 0
[    0.000000] EAX: 00000000 EBX: c7caca00 ECX: 00000000 EDX: 00000001
[    0.000000] ESI: 00000000 EDI: c7cd7320 EBP: c7c95f4c ESP: c7c95f30
[    0.000000]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
[    0.000000] CR0: 80050033 CR2: 00000000 CR3: 08683000 CR4: 00040690
[    0.000000] Call Trace:
[    0.000000]  cpu_init+0x16e/0x390
[    0.000000]  trap_init+0x3c/0x44
[    0.000000]  start_kernel+0x1e4/0x495
[    0.000000]  i386_start_kernel+0xa8/0xac
[    0.000000]  startup_32_smp+0x15f/0x161
[    0.000000] Code: 67 c8 75 c9 83 c4 10 5b 5e 5f 5d c3 90 c7 04 24 01 00 00 00 31 c9 ba 01 00 00 00 b8 30 e5 df c7 e8 68 53 12 00 ff 05 4c 83 ed c7 <0f> ff ba 01 00 00 00 e9 01 ff ff ff 8d b6 00 00 00 00 0f ff e9
[    0.000000] ---[ end trace c79475d607a84e11 ]---
[    0.000000] allocated 266092 bytes of page_ext

                                                          # HH:MM RESULT GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
git bisect start 22ecfe34fbc8bd717ba4a1f66f9d87ae5234c16c 33d930e59a98fa10a0db9f56c7fa2f21a4aef9b9 --
git bisect  bad 17895e2403c7805bafbf647bbdc6871541ae53d1  # 21:21  B      0    10   23   0  Merge 'linux-review/Gilad-Ben-Yossef/simplify-crypto-wait-for-async-op/20171017-115841' into devel-hourly-2017102114
git bisect  bad 74809e3e33e71e07cbf6dc562a7389864391c786  # 21:46  B      0    11   27   4  Merge 'linux-review/Christos-Gkekas/ceph-Delete-unused-variable-in-mds_client/20171017-130016' into devel-hourly-2017102114
git bisect good d9b3968e0082578dd385f77bdd6cae61ce4aa145  # 22:07  G     11     0    0   0  Merge 'linux-review/Julian-Wiedmann/s390-net-updates-2017-10-18/20171021-124933' into devel-hourly-2017102114
git bisect good 4538f02d6ca9c88a74897f3c2b1f3b077e9e69a4  # 22:37  G     11     0    0   0  Merge 'linux-review/netanel-amazon-com/ENA-ethernet-driver-bug-fixes/20171018-104932' into devel-hourly-2017102114
git bisect good bda58c82af9721dd3b223d0a292eecbcc2298608  # 23:54  G     11     0    0   0  Merge 'kbuild/fixes' into devel-hourly-2017102114
git bisect good 5c8abb79d7ec7619462fbec057851419b098db02  # 01:15  G     11     0    0   0  Merge 'slave-dma/topic/img' into devel-hourly-2017102114
git bisect  bad c8457e695b501385772741836ad0c1eb1536d583  # 01:28  B      0    11   23   0  Merge 'linux-review/Icenowy-Zheng/dt-bindings-add-binding-for-A64-DE2-CCU-with-SRAM-section/20171017-082603' into devel-hourly-2017102114
git bisect  bad 3edf700b6837f1f29865deb34caa1040a37fc6fe  # 01:45  B      0    11   23   0  Merge 'linux-review/Kees-Cook/tty-mips_ejtag_fdc-Convert-timers-to-use-timer_setup/20171019-231009' into devel-hourly-2017102114
git bisect  bad e3dd326d7fdb6224bd6044f388f98219c1fc3cdc  # 03:06  B      0    11   28   4  Merge 'robh/for-next' into devel-hourly-2017102114
git bisect good 87f242c119c403e8b948c8b95eca4ab6212fd1a9  # 03:28  G     11     0   11  11  of: overlay: expand check of whether overlay changeset can be removed
git bisect good e0a58f3e08d4b7fa8e2a4075c522f1a98c9e4cab  # 03:53  G     11     0   11  13  of: overlay: remove a dependency on device node full_name
git bisect good a1d19bd4cf1febf0d5ff60243826a248bd20f1a5  # 04:15  G     11     0   11  13  of: overlay: pr_err from return NOTIFY_OK to overlay apply/remove
git bisect  bad c810c0a17e019d1e4345bcbc49b6eddcf5dd001d  # 04:30  B      0    11   27   4  of: dynamic: fix memory leak related to properties of __of_node_dup
git bisect good 4ee7c0d9649d472d31969b9cbb8151161db6a807  # 04:50  G     11     0   11  13  of: overlay: make pr_err() string unique
# first bad commit: [c810c0a17e019d1e4345bcbc49b6eddcf5dd001d] of: dynamic: fix memory leak related to properties of __of_node_dup
git bisect good 4ee7c0d9649d472d31969b9cbb8151161db6a807  # 04:58  G     33     0   33  46  of: overlay: make pr_err() string unique
# extra tests with CONFIG_DEBUG_INFO_REDUCED
git bisect  bad c810c0a17e019d1e4345bcbc49b6eddcf5dd001d  # 05:26  B      0    11   23   0  of: dynamic: fix memory leak related to properties of __of_node_dup
# extra tests on HEAD of linux-devel/devel-hourly-2017102114
git bisect  bad 22ecfe34fbc8bd717ba4a1f66f9d87ae5234c16c  # 05:27  B      0    45   62   2  0day head guard for 'devel-hourly-2017102114'
# extra tests on tree/branch robh/for-next
git bisect  bad c810c0a17e019d1e4345bcbc49b6eddcf5dd001d  # 05:38  B      0    15   27   0  of: dynamic: fix memory leak related to properties of __of_node_dup
# extra tests with first bad commit reverted
git bisect good 773db3dc93897f3a5cc2fe3b9d9698696c9ea367  # 06:04  G     11     0   11  11  Revert "of: dynamic: fix memory leak related to properties of __of_node_dup"

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/lkp                          Intel Corporation

--=_59ebc4a8.la70dycVkjxahXE5wAtj33PwzrR6eeNh+KTjKU72vRdy4Owk
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="dmesg-yocto-lkp-hsw01-108:20171022042734:i386-randconfig-c0-10211919:4.14.0-rc1-00047-gc810c0a:1.gz"

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
e9RBC+FLAQA=

--=_59ebc4a8.la70dycVkjxahXE5wAtj33PwzrR6eeNh+KTjKU72vRdy4Owk
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="dmesg-vm-kbuild-yocto-i386-46:20171022044610:i386-randconfig-c0-10211919:4.14.0-rc1-00046-g4ee7c0d:1.gz"

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
OcWMl8R4wZkwtt4uIJZf/rbhCiRJAQA=

--=_59ebc4a8.la70dycVkjxahXE5wAtj33PwzrR6eeNh+KTjKU72vRdy4Owk
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reproduce-yocto-lkp-hsw01-108:20171022042734:i386-randconfig-c0-10211919:4.14.0-rc1-00047-gc810c0a:1"

#!/bin/bash

kernel=$1
initrd=yocto-trinity-i386.cgz

wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/master/initrd/$initrd

kvm=(
	qemu-system-x86_64
	-enable-kvm
	-cpu Haswell,+smep
	-kernel $kernel
	-initrd $initrd
	-m 256
	-smp 1
	-device e1000,netdev=net0
	-netdev user,id=net0
	-boot order=nc
	-no-reboot
	-watchdog i6300esb
	-watchdog-action debug
	-rtc base=localtime
	-serial stdio
	-display none
	-monitor null
)

append=(
	root=/dev/ram0
	hung_task_panic=1
	debug
	apic=debug
	sysrq_always_enabled
	rcupdate.rcu_cpu_stall_timeout=100
	net.ifnames=0
	printk.devkmsg=on
	panic=-1
	softlockup_panic=1
	nmi_watchdog=panic
	oops=panic
	load_ramdisk=2
	prompt_ramdisk=0
	drbd.minor_count=8
	systemd.log_level=err
	ignore_loglevel
	console=tty0
	earlyprintk=ttyS0,115200
	console=ttyS0,115200
	vga=normal
	rw
	drbd.minor_count=8
)

"${kvm[@]}" -append "${append[*]}"

--=_59ebc4a8.la70dycVkjxahXE5wAtj33PwzrR6eeNh+KTjKU72vRdy4Owk
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="config-4.14.0-rc1-00047-gc810c0a"

#
# Automatically generated file; DO NOT EDIT.
# Linux/i386 4.14.0-rc1 Kernel Configuration
#
# CONFIG_64BIT is not set
CONFIG_X86_32=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf32-i386"
CONFIG_ARCH_DEFCONFIG="arch/x86/configs/i386_defconfig"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_BITS_MAX=16
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_RWSEM_XCHGADD_ALGORITHM=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_X86_32_SMP=y
CONFIG_X86_32_LAZY_GS=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=2
CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_EXTABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_CROSS_COMPILE=""
# CONFIG_COMPILE_TEST is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
CONFIG_KERNEL_LZMA=y
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
# CONFIG_SYSVIPC is not set
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_FHANDLE=y
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y
CONFIG_AUDIT_WATCH=y
CONFIG_AUDIT_TREE=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
# CONFIG_IRQ_DOMAIN_DEBUG is not set
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_DATA=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
CONFIG_NO_HZ=y
# CONFIG_HIGH_RES_TIMERS is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_BSD_PROCESS_ACCT=y
# CONFIG_BSD_PROCESS_ACCT_V3 is not set
# CONFIG_TASKSTATS is not set

#
# RCU Subsystem
#
CONFIG_PREEMPT_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=32
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_FAST_NO_HZ is not set
CONFIG_RCU_BOOST=y
CONFIG_RCU_BOOST_DELAY=500
CONFIG_RCU_NOCB_CPU=y
CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_LOG_BUF_SHIFT=17
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_MEMCG_SWAP=y
CONFIG_MEMCG_SWAP_ENABLED=y
CONFIG_BLK_CGROUP=y
# CONFIG_DEBUG_BLK_CGROUP is not set
CONFIG_CGROUP_WRITEBACK=y
# CONFIG_CGROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
# CONFIG_CGROUP_HUGETLB is not set
# CONFIG_CPUSETS is not set
CONFIG_CGROUP_DEVICE=y
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
# CONFIG_IPC_NS is not set
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL=y
CONFIG_ANON_INODES=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_BPF=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
# CONFIG_SYSCTL_SYSCALL is not set
CONFIG_POSIX_TIMERS=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_ALL is not set
# CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_PRINTK=y
CONFIG_PRINTK_NMI=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
# CONFIG_BPF_SYSCALL is not set
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_USERFAULTFD=y
CONFIG_PCI_QUIRKS=y
CONFIG_MEMBARRIER=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_MEMCG_SYSFS_ON is not set
CONFIG_COMPAT_BRK=y
# CONFIG_SLAB is not set
CONFIG_SLUB=y
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_CPU_PARTIAL is not set
# CONFIG_SYSTEM_DATA_VERIFICATION is not set
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_OPROFILE=y
# CONFIG_OPROFILE_EVENT_MULTIPLEX is not set
CONFIG_HAVE_OPROFILE=y
CONFIG_OPROFILE_NMI_TIMER=y
CONFIG_JUMP_LABEL=y
CONFIG_STATIC_KEYS_SELFTEST=y
# CONFIG_UPROBES is not set
# CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_DMA_API_DEBUG=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_RCU_TABLE_FREE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_HAVE_GCC_PLUGINS=y
# CONFIG_GCC_PLUGINS is not set
CONFIG_HAVE_CC_STACKPROTECTOR=y
# CONFIG_CC_STACKPROTECTOR is not set
CONFIG_CC_STACKPROTECTOR_NONE=y
# CONFIG_CC_STACKPROTECTOR_REGULAR is not set
# CONFIG_CC_STACKPROTECTOR_STRONG is not set
CONFIG_THIN_ARCHIVES=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=8
CONFIG_HAVE_COPY_THREAD_TLS=y
# CONFIG_HAVE_ARCH_HASH is not set
# CONFIG_ISA_BUS_API is not set
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
# CONFIG_CPU_NO_EFFICIENT_FFS is not set
# CONFIG_HAVE_ARCH_VMAP_STACK is not set
# CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
# CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_REFCOUNT_FULL=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
CONFIG_HAVE_GENERIC_DMA_COHERENT=y
CONFIG_SLABINFO=y
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
# CONFIG_MODULES is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_LBDAF=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_ZONED=y
# CONFIG_BLK_DEV_THROTTLING is not set
CONFIG_BLK_CMDLINE_PARSER=y
# CONFIG_BLK_WBT is not set
CONFIG_BLK_DEBUG_FS=y
# CONFIG_BLK_SED_OPAL is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=y
# CONFIG_IOSCHED_DEADLINE is not set
CONFIG_IOSCHED_CFQ=y
# CONFIG_CFQ_GROUP_IOSCHED is not set
# CONFIG_DEFAULT_CFQ is not set
CONFIG_DEFAULT_NOOP=y
CONFIG_DEFAULT_IOSCHED="noop"
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
# CONFIG_IOSCHED_BFQ is not set
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_FREEZER=y

#
# Processor type and features
#
CONFIG_ZONE_DMA=y
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_FAST_FEATURE_TESTS=y
CONFIG_X86_MPPARSE=y
# CONFIG_X86_BIGSMP is not set
CONFIG_GOLDFISH=y
# CONFIG_INTEL_RDT is not set
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
# CONFIG_X86_INTEL_QUARK is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_RDC321X=y
# CONFIG_X86_32_NON_STANDARD is not set
# CONFIG_X86_32_IRIS is not set
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
# CONFIG_PARAVIRT_SPINLOCKS is not set
CONFIG_KVM_GUEST=y
# CONFIG_KVM_DEBUG_FS is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
CONFIG_NO_BOOTMEM=y
# CONFIG_M486 is not set
# CONFIG_M586 is not set
# CONFIG_M586TSC is not set
# CONFIG_M586MMX is not set
CONFIG_M686=y
# CONFIG_MPENTIUMII is not set
# CONFIG_MPENTIUMIII is not set
# CONFIG_MPENTIUMM is not set
# CONFIG_MPENTIUM4 is not set
# CONFIG_MK6 is not set
# CONFIG_MK7 is not set
# CONFIG_MK8 is not set
# CONFIG_MCRUSOE is not set
# CONFIG_MEFFICEON is not set
# CONFIG_MWINCHIPC6 is not set
# CONFIG_MWINCHIP3D is not set
# CONFIG_MELAN is not set
# CONFIG_MGEODEGX1 is not set
# CONFIG_MGEODE_LX is not set
# CONFIG_MCYRIXIII is not set
# CONFIG_MVIAC3_2 is not set
# CONFIG_MVIAC7 is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
# CONFIG_X86_GENERIC is not set
CONFIG_X86_INTERNODE_CACHE_SHIFT=5
CONFIG_X86_L1_CACHE_SHIFT=5
CONFIG_X86_PPRO_FENCE=y
CONFIG_X86_USE_PPRO_CHECKSUM=y
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=5
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_TRANSMETA_32=y
CONFIG_HPET_TIMER=y
CONFIG_DMI=y
CONFIG_NR_CPUS=8
# CONFIG_SCHED_SMT is not set
CONFIG_SCHED_MC=y
# CONFIG_SCHED_MC_PRIO is not set
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
# CONFIG_X86_MCE is not set

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# CONFIG_PERF_EVENTS_AMD_POWER is not set
CONFIG_X86_LEGACY_VM86=y
CONFIG_VM86=y
CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX32=y
# CONFIG_TOSHIBA is not set
CONFIG_I8K=y
CONFIG_X86_REBOOTFIXUPS=y
# CONFIG_MICROCODE is not set
CONFIG_X86_MSR=y
# CONFIG_X86_CPUID is not set
# CONFIG_NOHIGHMEM is not set
CONFIG_HIGHMEM4G=y
# CONFIG_HIGHMEM64G is not set
CONFIG_PAGE_OFFSET=0xC0000000
CONFIG_HIGHMEM=y
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ILLEGAL_POINTER_VALUE=0
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_FLATMEM_MANUAL=y
# CONFIG_SPARSEMEM_MANUAL is not set
CONFIG_FLATMEM=y
CONFIG_FLAT_NODE_MEM_MAP=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_HAVE_MEMBLOCK=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_HAVE_GENERIC_GUP=y
CONFIG_ARCH_DISCARD_MEMBLOCK=y
# CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_COMPACTION=y
CONFIG_MIGRATION=y
# CONFIG_PHYS_ADDR_T_64BIT is not set
CONFIG_BOUNCE=y
CONFIG_VIRT_TO_BUS=y
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
# CONFIG_TRANSPARENT_HUGEPAGE is not set
# CONFIG_ARCH_WANTS_THP_SWAP is not set
CONFIG_CLEANCACHE=y
CONFIG_FRONTSWAP=y
# CONFIG_CMA is not set
# CONFIG_ZSWAP is not set
# CONFIG_ZPOOL is not set
CONFIG_ZBUD=y
# CONFIG_ZSMALLOC is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_IDLE_PAGE_TRACKING=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_HIGHPTE is not set
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
CONFIG_X86_RESERVE_LOW=64
# CONFIG_MATH_EMULATION is not set
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=0
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_ARCH_RANDOM=y
CONFIG_X86_SMAP=y
# CONFIG_EFI is not set
# CONFIG_SECCOMP is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
# CONFIG_SCHED_HRTICK is not set
CONFIG_KEXEC=y
# CONFIG_CRASH_DUMP is not set
# CONFIG_KEXEC_JUMP is not set
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
CONFIG_RANDOMIZE_BASE=y
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_HOTPLUG_CPU=y
# CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
CONFIG_COMPAT_VDSO=y
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y

#
# Power management and ACPI options
#
# CONFIG_SUSPEND is not set
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_AUTOSLEEP=y
CONFIG_PM_WAKELOCKS=y
CONFIG_PM_WAKELOCKS_LIMIT=100
CONFIG_PM_WAKELOCKS_GC=y
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_OPP=y
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SLEEP=y
# CONFIG_ACPI_PROCFS_POWER is not set
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=y
CONFIG_ACPI_FAN=y
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_HOTPLUG_CPU=y
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_CUSTOM_DSDT_FILE=""
# CONFIG_ACPI_CUSTOM_DSDT is not set
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_X86_PM_TIMER=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
# CONFIG_ACPI_HED is not set
# CONFIG_ACPI_CUSTOM_METHOD is not set
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
# CONFIG_DPTF_POWER is not set
# CONFIG_PMIC_OPREGION is not set
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_SFI is not set
CONFIG_X86_APM_BOOT=y
CONFIG_APM=y
CONFIG_APM_IGNORE_USER_SUSPEND=y
CONFIG_APM_DO_ENABLE=y
# CONFIG_APM_CPU_IDLE is not set
CONFIG_APM_DISPLAY_BLANK=y
# CONFIG_APM_ALLOW_INTS is not set

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
# CONFIG_CPU_FREQ_STAT is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
# CONFIG_CPUFREQ_DT is not set
# CONFIG_X86_INTEL_PSTATE is not set
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_ACPI_CPUFREQ is not set
# CONFIG_X86_POWERNOW_K6 is not set
# CONFIG_X86_POWERNOW_K7 is not set
# CONFIG_X86_GX_SUSPMOD is not set
CONFIG_X86_SPEEDSTEP_CENTRINO=y
CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=y
CONFIG_X86_SPEEDSTEP_ICH=y
CONFIG_X86_SPEEDSTEP_SMI=y
CONFIG_X86_P4_CLOCKMOD=y
CONFIG_X86_CPUFREQ_NFORCE2=y
CONFIG_X86_LONGRUN=y
# CONFIG_X86_LONGHAUL is not set
# CONFIG_X86_E_POWERSAVER is not set

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=y
CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK=y

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
CONFIG_INTEL_IDLE=y

#
# Bus options (PCI etc.)
#
CONFIG_PCI=y
# CONFIG_PCI_GOBIOS is not set
# CONFIG_PCI_GOMMCONFIG is not set
# CONFIG_PCI_GODIRECT is not set
# CONFIG_PCI_GOOLPC is not set
CONFIG_PCI_GOANY=y
CONFIG_PCI_BIOS=y
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_PCI_OLPC=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
# CONFIG_HOTPLUG_PCI_PCIE is not set
CONFIG_PCIEAER=y
# CONFIG_PCIE_ECRC is not set
# CONFIG_PCIEAER_INJECT is not set
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEBUG=y
# CONFIG_PCIEASPM_DEFAULT is not set
CONFIG_PCIEASPM_POWERSAVE=y
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
# CONFIG_PCIE_DPC is not set
CONFIG_PCIE_PTM=y
# CONFIG_PCI_MSI is not set
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_HT_IRQ=y
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
CONFIG_PCI_LABEL=y
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_COMPAQ=y
CONFIG_HOTPLUG_PCI_COMPAQ_NVRAM=y
CONFIG_HOTPLUG_PCI_IBM=y
# CONFIG_HOTPLUG_PCI_ACPI is not set
CONFIG_HOTPLUG_PCI_CPCI=y
# CONFIG_HOTPLUG_PCI_CPCI_ZT5550 is not set
# CONFIG_HOTPLUG_PCI_CPCI_GENERIC is not set
# CONFIG_HOTPLUG_PCI_SHPC is not set

#
# DesignWare PCI Core Support
#

#
# PCI host controller drivers
#

#
# PCI Endpoint
#
CONFIG_PCI_ENDPOINT=y
# CONFIG_PCI_ENDPOINT_CONFIGFS is not set
CONFIG_PCI_EPF_TEST=y

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=y
CONFIG_ISA_DMA_API=y
# CONFIG_ISA is not set
CONFIG_SCx200=y
# CONFIG_SCx200HR_TIMER is not set
CONFIG_OLPC=y
CONFIG_OLPC_XO1_PM=y
CONFIG_OLPC_XO1_SCI=y
# CONFIG_OLPC_XO15_SCI is not set
CONFIG_ALIX=y
CONFIG_NET5501=y
CONFIG_GEOS=y
CONFIG_AMD_NB=y
CONFIG_PCCARD=y
CONFIG_PCMCIA=y
# CONFIG_PCMCIA_LOAD_CIS is not set
# CONFIG_CARDBUS is not set

#
# PC-card bridges
#
# CONFIG_YENTA is not set
CONFIG_PD6729=y
# CONFIG_I82092 is not set
CONFIG_PCCARD_NONSTATIC=y
# CONFIG_RAPIDIO is not set
CONFIG_X86_SYSFB=y

#
# Executable file formats / Emulations
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_HAVE_AOUT=y
# CONFIG_BINFMT_AOUT is not set
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
CONFIG_COMPAT_32=y
CONFIG_HAVE_ATOMIC_IOMAP=y
CONFIG_NET=y
CONFIG_NET_INGRESS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=y
CONFIG_UNIX=y
CONFIG_UNIX_DIAG=y
CONFIG_TLS=y
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
# CONFIG_XFRM_USER is not set
# CONFIG_XFRM_SUB_POLICY is not set
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_IPCOMP=y
CONFIG_NET_KEY=y
CONFIG_NET_KEY_MIGRATE=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
# CONFIG_IP_FIB_TRIE_STATS is not set
CONFIG_IP_MULTIPLE_TABLES=y
# CONFIG_IP_ROUTE_MULTIPATH is not set
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=y
CONFIG_NET_IPGRE_DEMUX=y
CONFIG_NET_IP_TUNNEL=y
CONFIG_NET_IPGRE=y
# CONFIG_NET_IPGRE_BROADCAST is not set
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
# CONFIG_IP_PIMSM_V1 is not set
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=y
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=y
CONFIG_NET_FOU_IP_TUNNELS=y
# CONFIG_INET_AH is not set
CONFIG_INET_ESP=y
CONFIG_INET_ESP_OFFLOAD=y
# CONFIG_INET_IPCOMP is not set
# CONFIG_INET_XFRM_TUNNEL is not set
CONFIG_INET_TUNNEL=y
CONFIG_INET_XFRM_MODE_TRANSPORT=y
CONFIG_INET_XFRM_MODE_TUNNEL=y
CONFIG_INET_XFRM_MODE_BEET=y
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
CONFIG_INET_UDP_DIAG=y
CONFIG_INET_RAW_DIAG=y
CONFIG_INET_DIAG_DESTROY=y
CONFIG_TCP_CONG_ADVANCED=y
# CONFIG_TCP_CONG_BIC is not set
CONFIG_TCP_CONG_CUBIC=y
# CONFIG_TCP_CONG_WESTWOOD is not set
CONFIG_TCP_CONG_HTCP=y
# CONFIG_TCP_CONG_HSTCP is not set
CONFIG_TCP_CONG_HYBLA=y
CONFIG_TCP_CONG_VEGAS=y
# CONFIG_TCP_CONG_NV is not set
CONFIG_TCP_CONG_SCALABLE=y
CONFIG_TCP_CONG_LP=y
CONFIG_TCP_CONG_VENO=y
CONFIG_TCP_CONG_YEAH=y
# CONFIG_TCP_CONG_ILLINOIS is not set
CONFIG_TCP_CONG_DCTCP=y
CONFIG_TCP_CONG_CDG=y
# CONFIG_TCP_CONG_BBR is not set
# CONFIG_DEFAULT_CUBIC is not set
# CONFIG_DEFAULT_HTCP is not set
# CONFIG_DEFAULT_HYBLA is not set
CONFIG_DEFAULT_VEGAS=y
# CONFIG_DEFAULT_VENO is not set
# CONFIG_DEFAULT_DCTCP is not set
# CONFIG_DEFAULT_CDG is not set
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="vegas"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
# CONFIG_INET6_ESP is not set
CONFIG_INET6_IPCOMP=y
# CONFIG_IPV6_MIP6 is not set
CONFIG_IPV6_ILA=y
CONFIG_INET6_XFRM_TUNNEL=y
CONFIG_INET6_TUNNEL=y
# CONFIG_INET6_XFRM_MODE_TRANSPORT is not set
CONFIG_INET6_XFRM_MODE_TUNNEL=y
CONFIG_INET6_XFRM_MODE_BEET=y
CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION=y
CONFIG_IPV6_VTI=y
# CONFIG_IPV6_SIT is not set
CONFIG_IPV6_TUNNEL=y
# CONFIG_IPV6_GRE is not set
CONFIG_IPV6_FOU=y
CONFIG_IPV6_FOU_TUNNEL=y
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_NETLABEL is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=y

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_NETLINK=y
CONFIG_NETFILTER_NETLINK_ACCT=y
CONFIG_NETFILTER_NETLINK_QUEUE=y
# CONFIG_NETFILTER_NETLINK_LOG is not set
CONFIG_NF_CONNTRACK=y
CONFIG_NF_LOG_COMMON=y
CONFIG_NF_LOG_NETDEV=y
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
# CONFIG_NF_CONNTRACK_PROCFS is not set
# CONFIG_NF_CONNTRACK_EVENTS is not set
CONFIG_NF_CONNTRACK_TIMEOUT=y
# CONFIG_NF_CONNTRACK_TIMESTAMP is not set
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
# CONFIG_NF_CT_PROTO_SCTP is not set
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=y
CONFIG_NF_CONNTRACK_FTP=y
# CONFIG_NF_CONNTRACK_H323 is not set
# CONFIG_NF_CONNTRACK_IRC is not set
CONFIG_NF_CONNTRACK_BROADCAST=y
# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
CONFIG_NF_CONNTRACK_SNMP=y
CONFIG_NF_CONNTRACK_PPTP=y
# CONFIG_NF_CONNTRACK_SANE is not set
# CONFIG_NF_CONNTRACK_SIP is not set
CONFIG_NF_CONNTRACK_TFTP=y
CONFIG_NF_CT_NETLINK=y
CONFIG_NF_CT_NETLINK_TIMEOUT=y
# CONFIG_NETFILTER_NETLINK_GLUE_CT is not set
CONFIG_NF_NAT=y
CONFIG_NF_NAT_NEEDED=y
CONFIG_NF_NAT_PROTO_DCCP=y
CONFIG_NF_NAT_PROTO_UDPLITE=y
CONFIG_NF_NAT_AMANDA=y
CONFIG_NF_NAT_FTP=y
# CONFIG_NF_NAT_IRC is not set
# CONFIG_NF_NAT_SIP is not set
CONFIG_NF_NAT_TFTP=y
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NETFILTER_SYNPROXY=y
CONFIG_NF_TABLES=y
# CONFIG_NF_TABLES_INET is not set
# CONFIG_NF_TABLES_NETDEV is not set
# CONFIG_NFT_EXTHDR is not set
# CONFIG_NFT_META is not set
CONFIG_NFT_RT=y
# CONFIG_NFT_NUMGEN is not set
# CONFIG_NFT_CT is not set
CONFIG_NFT_SET_RBTREE=y
CONFIG_NFT_SET_HASH=y
CONFIG_NFT_SET_BITMAP=y
CONFIG_NFT_COUNTER=y
# CONFIG_NFT_LOG is not set
CONFIG_NFT_LIMIT=y
# CONFIG_NFT_MASQ is not set
CONFIG_NFT_REDIR=y
CONFIG_NFT_NAT=y
# CONFIG_NFT_OBJREF is not set
# CONFIG_NFT_QUEUE is not set
# CONFIG_NFT_QUOTA is not set
# CONFIG_NFT_REJECT is not set
CONFIG_NFT_COMPAT=y
# CONFIG_NFT_HASH is not set
CONFIG_NFT_FIB=y
CONFIG_NETFILTER_XTABLES=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=y
CONFIG_NETFILTER_XT_CONNMARK=y

#
# Xtables targets
#
# CONFIG_NETFILTER_XT_TARGET_AUDIT is not set
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=y
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=y
# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=y
CONFIG_NETFILTER_XT_TARGET_CT=y
CONFIG_NETFILTER_XT_TARGET_DSCP=y
CONFIG_NETFILTER_XT_TARGET_HL=y
CONFIG_NETFILTER_XT_TARGET_HMARK=y
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=y
# CONFIG_NETFILTER_XT_TARGET_LED is not set
# CONFIG_NETFILTER_XT_TARGET_LOG is not set
CONFIG_NETFILTER_XT_TARGET_MARK=y
# CONFIG_NETFILTER_XT_NAT is not set
CONFIG_NETFILTER_XT_TARGET_NETMAP=y
# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
CONFIG_NETFILTER_XT_TARGET_NOTRACK=y
CONFIG_NETFILTER_XT_TARGET_RATEEST=y
CONFIG_NETFILTER_XT_TARGET_REDIRECT=y
CONFIG_NETFILTER_XT_TARGET_TEE=y
CONFIG_NETFILTER_XT_TARGET_TPROXY=y
CONFIG_NETFILTER_XT_TARGET_TRACE=y
# CONFIG_NETFILTER_XT_TARGET_SECMARK is not set
# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
# CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
# CONFIG_NETFILTER_XT_MATCH_BPF is not set
# CONFIG_NETFILTER_XT_MATCH_CGROUP is not set
CONFIG_NETFILTER_XT_MATCH_CLUSTER=y
CONFIG_NETFILTER_XT_MATCH_COMMENT=y
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=y
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=y
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=y
CONFIG_NETFILTER_XT_MATCH_CONNMARK=y
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
# CONFIG_NETFILTER_XT_MATCH_CPU is not set
CONFIG_NETFILTER_XT_MATCH_DCCP=y
# CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set
CONFIG_NETFILTER_XT_MATCH_DSCP=y
CONFIG_NETFILTER_XT_MATCH_ECN=y
# CONFIG_NETFILTER_XT_MATCH_ESP is not set
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=y
# CONFIG_NETFILTER_XT_MATCH_HELPER is not set
CONFIG_NETFILTER_XT_MATCH_HL=y
CONFIG_NETFILTER_XT_MATCH_IPCOMP=y
# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
# CONFIG_NETFILTER_XT_MATCH_IPVS is not set
CONFIG_NETFILTER_XT_MATCH_L2TP=y
CONFIG_NETFILTER_XT_MATCH_LENGTH=y
CONFIG_NETFILTER_XT_MATCH_LIMIT=y
CONFIG_NETFILTER_XT_MATCH_MAC=y
CONFIG_NETFILTER_XT_MATCH_MARK=y
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=y
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
# CONFIG_NETFILTER_XT_MATCH_OSF is not set
CONFIG_NETFILTER_XT_MATCH_OWNER=y
CONFIG_NETFILTER_XT_MATCH_POLICY=y
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=y
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=y
CONFIG_NETFILTER_XT_MATCH_QUOTA=y
CONFIG_NETFILTER_XT_MATCH_RATEEST=y
# CONFIG_NETFILTER_XT_MATCH_REALM is not set
CONFIG_NETFILTER_XT_MATCH_RECENT=y
CONFIG_NETFILTER_XT_MATCH_SCTP=y
# CONFIG_NETFILTER_XT_MATCH_STATE is not set
CONFIG_NETFILTER_XT_MATCH_STATISTIC=y
CONFIG_NETFILTER_XT_MATCH_STRING=y
# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
CONFIG_NETFILTER_XT_MATCH_TIME=y
CONFIG_NETFILTER_XT_MATCH_U32=y
# CONFIG_IP_SET is not set
CONFIG_IP_VS=y
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
# CONFIG_IP_VS_PROTO_TCP is not set
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=y
CONFIG_IP_VS_WRR=y
CONFIG_IP_VS_LC=y
# CONFIG_IP_VS_WLC is not set
CONFIG_IP_VS_FO=y
CONFIG_IP_VS_OVF=y
# CONFIG_IP_VS_LBLC is not set
CONFIG_IP_VS_LBLCR=y
# CONFIG_IP_VS_DH is not set
CONFIG_IP_VS_SH=y
# CONFIG_IP_VS_SED is not set
# CONFIG_IP_VS_NQ is not set

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS application helper
#
CONFIG_IP_VS_NFCT=y

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=y
# CONFIG_NF_CONNTRACK_IPV4 is not set
CONFIG_NF_SOCKET_IPV4=y
# CONFIG_NF_TABLES_IPV4 is not set
# CONFIG_NF_TABLES_ARP is not set
CONFIG_NF_DUP_IPV4=y
CONFIG_NF_LOG_ARP=y
# CONFIG_NF_LOG_IPV4 is not set
# CONFIG_NF_REJECT_IPV4 is not set
CONFIG_IP_NF_IPTABLES=y
CONFIG_IP_NF_MATCH_AH=y
CONFIG_IP_NF_MATCH_ECN=y
CONFIG_IP_NF_MATCH_RPFILTER=y
CONFIG_IP_NF_MATCH_TTL=y
# CONFIG_IP_NF_FILTER is not set
CONFIG_IP_NF_TARGET_SYNPROXY=y
CONFIG_IP_NF_MANGLE=y
# CONFIG_IP_NF_TARGET_ECN is not set
# CONFIG_IP_NF_TARGET_TTL is not set
# CONFIG_IP_NF_RAW is not set
CONFIG_IP_NF_SECURITY=y
CONFIG_IP_NF_ARPTABLES=y
# CONFIG_IP_NF_ARPFILTER is not set
# CONFIG_IP_NF_ARP_MANGLE is not set

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV6=y
# CONFIG_NF_CONNTRACK_IPV6 is not set
# CONFIG_NF_SOCKET_IPV6 is not set
CONFIG_NF_TABLES_IPV6=y
CONFIG_NFT_CHAIN_ROUTE_IPV6=y
# CONFIG_NFT_REJECT_IPV6 is not set
CONFIG_NFT_DUP_IPV6=y
CONFIG_NFT_FIB_IPV6=y
CONFIG_NF_DUP_IPV6=y
CONFIG_NF_REJECT_IPV6=y
# CONFIG_NF_LOG_IPV6 is not set
CONFIG_IP6_NF_IPTABLES=y
CONFIG_IP6_NF_MATCH_AH=y
# CONFIG_IP6_NF_MATCH_EUI64 is not set
# CONFIG_IP6_NF_MATCH_FRAG is not set
CONFIG_IP6_NF_MATCH_OPTS=y
CONFIG_IP6_NF_MATCH_HL=y
# CONFIG_IP6_NF_MATCH_IPV6HEADER is not set
# CONFIG_IP6_NF_MATCH_MH is not set
CONFIG_IP6_NF_MATCH_RPFILTER=y
CONFIG_IP6_NF_MATCH_RT=y
CONFIG_IP6_NF_TARGET_HL=y
CONFIG_IP6_NF_FILTER=y
CONFIG_IP6_NF_TARGET_REJECT=y
# CONFIG_IP6_NF_TARGET_SYNPROXY is not set
CONFIG_IP6_NF_MANGLE=y
CONFIG_IP6_NF_RAW=y
CONFIG_IP6_NF_SECURITY=y

#
# DECnet: Netfilter Configuration
#
CONFIG_DECNET_NF_GRABULATOR=y
CONFIG_NF_TABLES_BRIDGE=y
CONFIG_NF_LOG_BRIDGE=y
CONFIG_BRIDGE_NF_EBTABLES=y
# CONFIG_BRIDGE_EBT_BROUTE is not set
# CONFIG_BRIDGE_EBT_T_FILTER is not set
CONFIG_BRIDGE_EBT_T_NAT=y
CONFIG_BRIDGE_EBT_802_3=y
CONFIG_BRIDGE_EBT_AMONG=y
CONFIG_BRIDGE_EBT_ARP=y
CONFIG_BRIDGE_EBT_IP=y
CONFIG_BRIDGE_EBT_IP6=y
CONFIG_BRIDGE_EBT_LIMIT=y
CONFIG_BRIDGE_EBT_MARK=y
CONFIG_BRIDGE_EBT_PKTTYPE=y
CONFIG_BRIDGE_EBT_STP=y
CONFIG_BRIDGE_EBT_VLAN=y
# CONFIG_BRIDGE_EBT_ARPREPLY is not set
# CONFIG_BRIDGE_EBT_DNAT is not set
CONFIG_BRIDGE_EBT_MARK_T=y
CONFIG_BRIDGE_EBT_REDIRECT=y
CONFIG_BRIDGE_EBT_SNAT=y
CONFIG_BRIDGE_EBT_LOG=y
CONFIG_BRIDGE_EBT_NFLOG=y
CONFIG_IP_DCCP=y
CONFIG_INET_DCCP_DIAG=y

#
# DCCP CCIDs Configuration
#
CONFIG_IP_DCCP_CCID2_DEBUG=y
# CONFIG_IP_DCCP_CCID3 is not set

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
CONFIG_IP_SCTP=y
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
# CONFIG_SCTP_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=y
# CONFIG_RDS is not set
CONFIG_TIPC=y
CONFIG_TIPC_MEDIA_UDP=y
CONFIG_ATM=y
CONFIG_ATM_CLIP=y
# CONFIG_ATM_CLIP_NO_ICMP is not set
CONFIG_ATM_LANE=y
CONFIG_ATM_MPOA=y
CONFIG_ATM_BR2684=y
# CONFIG_ATM_BR2684_IPFILTER is not set
CONFIG_L2TP=y
CONFIG_L2TP_DEBUGFS=y
# CONFIG_L2TP_V3 is not set
CONFIG_STP=y
CONFIG_BRIDGE=y
CONFIG_BRIDGE_IGMP_SNOOPING=y
# CONFIG_BRIDGE_VLAN_FILTERING is not set
CONFIG_HAVE_NET_DSA=y
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=y
# CONFIG_VLAN_8021Q_GVRP is not set
# CONFIG_VLAN_8021Q_MVRP is not set
CONFIG_DECNET=y
# CONFIG_DECNET_ROUTER is not set
CONFIG_LLC=y
# CONFIG_LLC2 is not set
CONFIG_IPX=y
# CONFIG_IPX_INTERN is not set
CONFIG_ATALK=y
CONFIG_DEV_APPLETALK=y
CONFIG_IPDDP=y
# CONFIG_IPDDP_ENCAP is not set
CONFIG_X25=y
CONFIG_LAPB=y
# CONFIG_PHONET is not set
CONFIG_6LOWPAN=y
CONFIG_6LOWPAN_DEBUGFS=y
CONFIG_6LOWPAN_NHC=y
CONFIG_6LOWPAN_NHC_DEST=y
CONFIG_6LOWPAN_NHC_FRAGMENT=y
CONFIG_6LOWPAN_NHC_HOP=y
# CONFIG_6LOWPAN_NHC_IPV6 is not set
CONFIG_6LOWPAN_NHC_MOBILITY=y
# CONFIG_6LOWPAN_NHC_ROUTING is not set
CONFIG_6LOWPAN_NHC_UDP=y
CONFIG_6LOWPAN_GHC_EXT_HDR_HOP=y
CONFIG_6LOWPAN_GHC_UDP=y
CONFIG_6LOWPAN_GHC_ICMPV6=y
# CONFIG_6LOWPAN_GHC_EXT_HDR_DEST is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE is not set
CONFIG_IEEE802154=y
CONFIG_IEEE802154_NL802154_EXPERIMENTAL=y
# CONFIG_IEEE802154_SOCKET is not set
CONFIG_IEEE802154_6LOWPAN=y
# CONFIG_MAC802154 is not set
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=y
CONFIG_NET_SCH_HTB=y
CONFIG_NET_SCH_HFSC=y
CONFIG_NET_SCH_ATM=y
CONFIG_NET_SCH_PRIO=y
CONFIG_NET_SCH_MULTIQ=y
CONFIG_NET_SCH_RED=y
# CONFIG_NET_SCH_SFB is not set
# CONFIG_NET_SCH_SFQ is not set
CONFIG_NET_SCH_TEQL=y
CONFIG_NET_SCH_TBF=y
CONFIG_NET_SCH_GRED=y
CONFIG_NET_SCH_DSMARK=y
# CONFIG_NET_SCH_NETEM is not set
CONFIG_NET_SCH_DRR=y
CONFIG_NET_SCH_MQPRIO=y
CONFIG_NET_SCH_CHOKE=y
CONFIG_NET_SCH_QFQ=y
CONFIG_NET_SCH_CODEL=y
# CONFIG_NET_SCH_FQ_CODEL is not set
# CONFIG_NET_SCH_FQ is not set
# CONFIG_NET_SCH_HHF is not set
# CONFIG_NET_SCH_PIE is not set
CONFIG_NET_SCH_PLUG=y
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_CODEL is not set
CONFIG_DEFAULT_PFIFO_FAST=y
CONFIG_DEFAULT_NET_SCH="pfifo_fast"

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=y
CONFIG_NET_CLS_TCINDEX=y
# CONFIG_NET_CLS_ROUTE4 is not set
CONFIG_NET_CLS_FW=y
# CONFIG_NET_CLS_U32 is not set
# CONFIG_NET_CLS_RSVP is not set
CONFIG_NET_CLS_RSVP6=y
CONFIG_NET_CLS_FLOW=y
# CONFIG_NET_CLS_CGROUP is not set
CONFIG_NET_CLS_BPF=y
CONFIG_NET_CLS_FLOWER=y
# CONFIG_NET_CLS_MATCHALL is not set
# CONFIG_NET_EMATCH is not set
# CONFIG_NET_CLS_ACT is not set
CONFIG_NET_CLS_IND=y
CONFIG_NET_SCH_FIFO=y
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=y
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=y
CONFIG_OPENVSWITCH_GRE=y
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=y
# CONFIG_MPLS_IPTUNNEL is not set
CONFIG_NET_NSH=y
CONFIG_HSR=y
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_NET_NCSI is not set
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=y
CONFIG_NET_DROP_MONITOR=y
CONFIG_HAMRADIO=y

#
# Packet Radio protocols
#
CONFIG_AX25=y
CONFIG_AX25_DAMA_SLAVE=y
CONFIG_NETROM=y
CONFIG_ROSE=y

#
# AX.25 network device drivers
#
CONFIG_MKISS=y
CONFIG_6PACK=y
CONFIG_BPQETHER=y
# CONFIG_BAYCOM_SER_FDX is not set
CONFIG_BAYCOM_SER_HDX=y
CONFIG_BAYCOM_PAR=y
CONFIG_BAYCOM_EPP=y
# CONFIG_YAM is not set
CONFIG_CAN=y
CONFIG_CAN_RAW=y
CONFIG_CAN_BCM=y
CONFIG_CAN_GW=y

#
# CAN Device Drivers
#
CONFIG_CAN_VCAN=y
# CONFIG_CAN_VXCAN is not set
# CONFIG_CAN_SLCAN is not set
CONFIG_CAN_DEV=y
# CONFIG_CAN_CALC_BITTIMING is not set
CONFIG_CAN_LEDS=y
# CONFIG_CAN_GRCAN is not set
# CONFIG_CAN_JANZ_ICAN3 is not set
CONFIG_PCH_CAN=y
# CONFIG_CAN_C_CAN is not set
CONFIG_CAN_CC770=y
CONFIG_CAN_CC770_ISA=y
CONFIG_CAN_CC770_PLATFORM=y
CONFIG_CAN_IFI_CANFD=y
CONFIG_CAN_M_CAN=y
CONFIG_CAN_PEAK_PCIEFD=y
# CONFIG_CAN_SJA1000 is not set
# CONFIG_CAN_SOFTING is not set

#
# CAN USB interfaces
#
# CONFIG_CAN_EMS_USB is not set
CONFIG_CAN_ESD_USB2=y
# CONFIG_CAN_GS_USB is not set
# CONFIG_CAN_KVASER_USB is not set
CONFIG_CAN_PEAK_USB=y
CONFIG_CAN_8DEV_USB=y
CONFIG_CAN_MCBA_USB=y
# CONFIG_CAN_DEBUG_DEVICES is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
# CONFIG_STREAM_PARSER is not set
CONFIG_FIB_RULES=y
# CONFIG_WIRELESS is not set
CONFIG_WIMAX=y
CONFIG_WIMAX_DEBUG_LEVEL=8
CONFIG_RFKILL=y
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
# CONFIG_NET_9P is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=y
CONFIG_CEPH_LIB_PRETTYDEBUG=y
# CONFIG_CEPH_LIB_USE_DNS_RESOLVER is not set
CONFIG_NFC=y
CONFIG_NFC_DIGITAL=y
CONFIG_NFC_NCI=y
CONFIG_NFC_NCI_UART=y
CONFIG_NFC_HCI=y
CONFIG_NFC_SHDLC=y

#
# Near Field Communication (NFC) devices
#
CONFIG_NFC_MEI_PHY=y
CONFIG_NFC_SIM=y
CONFIG_NFC_PORT100=y
CONFIG_NFC_FDP=y
# CONFIG_NFC_FDP_I2C is not set
CONFIG_NFC_PN544=y
CONFIG_NFC_PN544_I2C=y
CONFIG_NFC_PN544_MEI=y
CONFIG_NFC_PN533=y
CONFIG_NFC_PN533_USB=y
# CONFIG_NFC_PN533_I2C is not set
# CONFIG_NFC_MICROREAD_I2C is not set
# CONFIG_NFC_MICROREAD_MEI is not set
CONFIG_NFC_MRVL=y
CONFIG_NFC_MRVL_USB=y
# CONFIG_NFC_MRVL_UART is not set
# CONFIG_NFC_MRVL_I2C is not set
CONFIG_NFC_ST21NFCA=y
CONFIG_NFC_ST21NFCA_I2C=y
# CONFIG_NFC_ST_NCI_I2C is not set
CONFIG_NFC_NXP_NCI=y
CONFIG_NFC_NXP_NCI_I2C=y
# CONFIG_NFC_S3FWRN5_I2C is not set
CONFIG_PSAMPLE=y
CONFIG_NET_IFE=y
CONFIG_LWTUNNEL=y
# CONFIG_LWTUNNEL_BPF is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
# CONFIG_NET_DEVLINK is not set
CONFIG_MAY_USE_DEVLINK=y

#
# Device Drivers
#

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set
CONFIG_FW_LOADER=y
CONFIG_FIRMWARE_IN_KERNEL=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_SYS_HYPERVISOR is not set
# CONFIG_GENERIC_CPU_DEVICES is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set

#
# Bus devices
#
CONFIG_SIMPLE_PM_BUS=y
CONFIG_CONNECTOR=y
# CONFIG_PROC_EVENTS is not set
CONFIG_MTD=y
# CONFIG_MTD_REDBOOT_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=y
# CONFIG_MTD_OF_PARTS is not set
CONFIG_MTD_AR7_PARTS=y

#
# Partition parsers
#

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
# CONFIG_MTD_BLOCK is not set
CONFIG_MTD_BLOCK_RO=y
CONFIG_FTL=y
CONFIG_NFTL=y
CONFIG_NFTL_RW=y
# CONFIG_INFTL is not set
CONFIG_RFD_FTL=y
# CONFIG_SSFDC is not set
CONFIG_SM_FTL=y
CONFIG_MTD_OOPS=y
# CONFIG_MTD_SWAP is not set
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=y
CONFIG_MTD_ABSENT=y

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
CONFIG_MTD_PHYSMAP=y
# CONFIG_MTD_PHYSMAP_COMPAT is not set
CONFIG_MTD_PHYSMAP_OF=y
CONFIG_MTD_PHYSMAP_OF_VERSATILE=y
CONFIG_MTD_PHYSMAP_OF_GEMINI=y
# CONFIG_MTD_AMD76XROM is not set
CONFIG_MTD_ICHXROM=y
CONFIG_MTD_ESB2ROM=y
CONFIG_MTD_CK804XROM=y
# CONFIG_MTD_SCB2_FLASH is not set
# CONFIG_MTD_NETtel is not set
CONFIG_MTD_L440GX=y
# CONFIG_MTD_INTEL_VR_NOR is not set
CONFIG_MTD_PLATRAM=y

#
# Self-contained MTD device drivers
#
CONFIG_MTD_PMC551=y
# CONFIG_MTD_PMC551_BUGFIX is not set
CONFIG_MTD_PMC551_DEBUG=y
CONFIG_MTD_SLRAM=y
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLOCK2MTD is not set

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=y
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
CONFIG_MTD_NAND_ECC=y
# CONFIG_MTD_NAND_ECC_SMC is not set
CONFIG_MTD_NAND=y
# CONFIG_MTD_NAND_ECC_BCH is not set
CONFIG_MTD_SM_COMMON=y
CONFIG_MTD_NAND_DENALI=y
# CONFIG_MTD_NAND_DENALI_PCI is not set
CONFIG_MTD_NAND_DENALI_DT=y
CONFIG_MTD_NAND_GPIO=y
# CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
CONFIG_MTD_NAND_RICOH=y
CONFIG_MTD_NAND_DISKONCHIP=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH=y
CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y
CONFIG_MTD_NAND_DOCG4=y
# CONFIG_MTD_NAND_CAFE is not set
CONFIG_MTD_NAND_CS553X=y
# CONFIG_MTD_NAND_NANDSIM is not set
CONFIG_MTD_NAND_PLATFORM=y
CONFIG_MTD_ONENAND=y
# CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
CONFIG_MTD_ONENAND_GENERIC=y
CONFIG_MTD_ONENAND_OTP=y
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set

#
# LPDDR & LPDDR2 PCM memory drivers
#
# CONFIG_MTD_LPDDR is not set
# CONFIG_MTD_SPI_NOR is not set
# CONFIG_MTD_UBI is not set
CONFIG_DTC=y
CONFIG_OF=y
CONFIG_OF_UNITTEST=y
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_PROMTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_ADDRESS_PCI=y
CONFIG_OF_IRQ=y
CONFIG_OF_NET=y
CONFIG_OF_MDIO=y
CONFIG_OF_PCI=y
CONFIG_OF_PCI_IRQ=y
CONFIG_OF_RESOLVE=y
CONFIG_OF_OVERLAY=y
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
CONFIG_PARPORT_PC=y
# CONFIG_PARPORT_SERIAL is not set
CONFIG_PARPORT_PC_FIFO=y
CONFIG_PARPORT_PC_SUPERIO=y
CONFIG_PARPORT_PC_PCMCIA=y
# CONFIG_PARPORT_GSC is not set
# CONFIG_PARPORT_AX88796 is not set
# CONFIG_PARPORT_1284 is not set
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_NULL_BLK is not set
# CONFIG_BLK_DEV_FD is not set
# CONFIG_PARIDE is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_BLK_DEV_DAC960 is not set
# CONFIG_BLK_DEV_UMEM is not set
# CONFIG_BLK_DEV_COW_COMMON is not set
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_SX8 is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_VIRTIO_BLK is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_RSXX is not set
CONFIG_NVME_CORE=y
CONFIG_BLK_DEV_NVME=y
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
# CONFIG_NVME_TARGET is not set

#
# Misc devices
#
# CONFIG_SENSORS_LIS3LV02D is not set
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
CONFIG_DUMMY_IRQ=y
CONFIG_IBM_ASM=y
CONFIG_PHANTOM=y
# CONFIG_SGI_IOC4 is not set
# CONFIG_TIFM_CORE is not set
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=y
CONFIG_CS5535_MFGPT=y
CONFIG_CS5535_MFGPT_DEFAULT_IRQ=7
CONFIG_CS5535_CLOCK_EVENT_SRC=y
CONFIG_HP_ILO=y
# CONFIG_APDS9802ALS is not set
# CONFIG_ISL29003 is not set
CONFIG_ISL29020=y
CONFIG_SENSORS_TSL2550=y
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=y
CONFIG_DS1682=y
# CONFIG_VMWARE_BALLOON is not set
CONFIG_PCH_PHUB=y
# CONFIG_USB_SWITCH_FSA9480 is not set
# CONFIG_SRAM is not set
CONFIG_PCI_ENDPOINT_TEST=y
CONFIG_C2PORT=y
CONFIG_C2PORT_DURAMAR_2150=y

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
# CONFIG_EEPROM_LEGACY is not set
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_IDT_89HPESX=y
CONFIG_CB710_CORE=y
CONFIG_CB710_DEBUG=y
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# CONFIG_SENSORS_LIS3_I2C is not set

#
# Altera FPGA firmware download module
#
CONFIG_ALTERA_STAPL=y
CONFIG_INTEL_MEI=y
# CONFIG_INTEL_MEI_ME is not set
CONFIG_INTEL_MEI_TXE=y
CONFIG_VMWARE_VMCI=y

#
# Intel MIC Bus Driver
#

#
# SCIF Bus Driver
#

#
# VOP Bus Driver
#

#
# Intel MIC Host Driver
#

#
# Intel MIC Card Driver
#

#
# SCIF Driver
#

#
# Intel MIC Coprocessor State Management (COSM) Drivers
#

#
# VOP Driver
#
CONFIG_ECHO=y
# CONFIG_CXL_BASE is not set
# CONFIG_CXL_AFU_DRIVER_OPS is not set
# CONFIG_CXL_LIB is not set
CONFIG_HAVE_IDE=y
# CONFIG_IDE is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
# CONFIG_SCSI_NETLINK is not set
# CONFIG_SCSI_MQ_DEFAULT is not set
# CONFIG_SCSI_PROC_FS is not set

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
# CONFIG_CHR_DEV_ST is not set
CONFIG_CHR_DEV_OSST=y
# CONFIG_BLK_DEV_SR is not set
# CONFIG_CHR_DEV_SG is not set
CONFIG_CHR_DEV_SCH=y
# CONFIG_SCSI_ENCLOSURE is not set
# CONFIG_SCSI_CONSTANTS is not set
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
# CONFIG_SCSI_FC_ATTRS is not set
CONFIG_SCSI_ISCSI_ATTRS=y
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
# CONFIG_SCSI_SAS_HOST_SMP is not set
CONFIG_SCSI_SRP_ATTRS=y
CONFIG_SCSI_LOWLEVEL=y
CONFIG_ISCSI_TCP=y
CONFIG_ISCSI_BOOT_SYSFS=y
CONFIG_SCSI_CXGB3_ISCSI=y
CONFIG_SCSI_CXGB4_ISCSI=y
CONFIG_SCSI_BNX2_ISCSI=y
CONFIG_BE2ISCSI=y
CONFIG_BLK_DEV_3W_XXXX_RAID=y
CONFIG_SCSI_HPSA=y
# CONFIG_SCSI_3W_9XXX is not set
CONFIG_SCSI_3W_SAS=y
# CONFIG_SCSI_ACARD is not set
CONFIG_SCSI_AACRAID=y
CONFIG_SCSI_AIC7XXX=y
CONFIG_AIC7XXX_CMDS_PER_DEVICE=32
CONFIG_AIC7XXX_RESET_DELAY_MS=5000
# CONFIG_AIC7XXX_BUILD_FIRMWARE is not set
CONFIG_AIC7XXX_DEBUG_ENABLE=y
CONFIG_AIC7XXX_DEBUG_MASK=0
CONFIG_AIC7XXX_REG_PRETTY_PRINT=y
CONFIG_SCSI_AIC79XX=y
CONFIG_AIC79XX_CMDS_PER_DEVICE=32
CONFIG_AIC79XX_RESET_DELAY_MS=5000
# CONFIG_AIC79XX_BUILD_FIRMWARE is not set
CONFIG_AIC79XX_DEBUG_ENABLE=y
CONFIG_AIC79XX_DEBUG_MASK=0
CONFIG_AIC79XX_REG_PRETTY_PRINT=y
# CONFIG_SCSI_AIC94XX is not set
CONFIG_SCSI_MVSAS=y
# CONFIG_SCSI_MVSAS_DEBUG is not set
# CONFIG_SCSI_MVSAS_TASKLET is not set
CONFIG_SCSI_MVUMI=y
# CONFIG_SCSI_DPT_I2O is not set
CONFIG_SCSI_ADVANSYS=y
CONFIG_SCSI_ARCMSR=y
CONFIG_SCSI_ESAS2R=y
# CONFIG_MEGARAID_NEWGEN is not set
CONFIG_MEGARAID_LEGACY=y
CONFIG_MEGARAID_SAS=y
CONFIG_SCSI_MPT3SAS=y
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
CONFIG_SCSI_MPT2SAS=y
CONFIG_SCSI_SMARTPQI=y
CONFIG_SCSI_UFSHCD=y
CONFIG_SCSI_UFSHCD_PCI=y
CONFIG_SCSI_UFS_DWC_TC_PCI=y
# CONFIG_SCSI_UFSHCD_PLATFORM is not set
# CONFIG_SCSI_HPTIOP is not set
CONFIG_SCSI_BUSLOGIC=y
CONFIG_SCSI_FLASHPOINT=y
CONFIG_VMWARE_PVSCSI=y
CONFIG_SCSI_SNIC=y
CONFIG_SCSI_SNIC_DEBUG_FS=y
# CONFIG_SCSI_DMX3191D is not set
CONFIG_SCSI_EATA=y
# CONFIG_SCSI_EATA_TAGGED_QUEUE is not set
CONFIG_SCSI_EATA_LINKED_COMMANDS=y
CONFIG_SCSI_EATA_MAX_TAGS=16
CONFIG_SCSI_FUTURE_DOMAIN=y
# CONFIG_SCSI_GDTH is not set
# CONFIG_SCSI_ISCI is not set
# CONFIG_SCSI_IPS is not set
CONFIG_SCSI_INITIO=y
CONFIG_SCSI_INIA100=y
# CONFIG_SCSI_PPA is not set
CONFIG_SCSI_IMM=y
CONFIG_SCSI_IZIP_EPP16=y
CONFIG_SCSI_IZIP_SLOW_CTR=y
CONFIG_SCSI_STEX=y
CONFIG_SCSI_SYM53C8XX_2=y
CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1
CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=16
CONFIG_SCSI_SYM53C8XX_MAX_TAGS=64
CONFIG_SCSI_SYM53C8XX_MMIO=y
CONFIG_SCSI_QLOGIC_1280=y
CONFIG_SCSI_QLA_ISCSI=y
CONFIG_SCSI_DC395x=y
CONFIG_SCSI_AM53C974=y
# CONFIG_SCSI_NSP32 is not set
CONFIG_SCSI_WD719X=y
# CONFIG_SCSI_DEBUG is not set
CONFIG_SCSI_PMCRAID=y
CONFIG_SCSI_PM8001=y
CONFIG_SCSI_VIRTIO=y
CONFIG_SCSI_LOWLEVEL_PCMCIA=y
# CONFIG_SCSI_DH is not set
# CONFIG_SCSI_OSD_INITIATOR is not set
# CONFIG_ATA is not set
# CONFIG_MD is not set
CONFIG_TARGET_CORE=y
CONFIG_TCM_IBLOCK=y
CONFIG_TCM_FILEIO=y
# CONFIG_TCM_PSCSI is not set
CONFIG_TCM_USER2=y
# CONFIG_LOOPBACK_TARGET is not set
CONFIG_ISCSI_TARGET=y
# CONFIG_ISCSI_TARGET_CXGB4 is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
CONFIG_MACINTOSH_DRIVERS=y
# CONFIG_MAC_EMUMOUSEBTN is not set
CONFIG_NETDEVICES=y
CONFIG_MII=y
# CONFIG_NET_CORE is not set
CONFIG_ARCNET=y
CONFIG_ARCNET_1201=y
# CONFIG_ARCNET_1051 is not set
CONFIG_ARCNET_RAW=y
CONFIG_ARCNET_CAP=y
# CONFIG_ARCNET_COM90xx is not set
CONFIG_ARCNET_COM90xxIO=y
CONFIG_ARCNET_RIM_I=y
CONFIG_ARCNET_COM20020=y
CONFIG_ARCNET_COM20020_PCI=y
CONFIG_ARCNET_COM20020_CS=y
# CONFIG_ATM_DRIVERS is not set

#
# CAIF transport drivers
#

#
# Distributed Switch Architecture drivers
#
CONFIG_ETHERNET=y
CONFIG_MDIO=y
# CONFIG_NET_VENDOR_3COM is not set
CONFIG_NET_VENDOR_ADAPTEC=y
CONFIG_ADAPTEC_STARFIRE=y
# CONFIG_NET_VENDOR_AGERE is not set
# CONFIG_NET_VENDOR_ALACRITECH is not set
# CONFIG_NET_VENDOR_ALTEON is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
CONFIG_ATL1=y
# CONFIG_ATL1E is not set
CONFIG_ATL1C=y
# CONFIG_ALX is not set
CONFIG_NET_VENDOR_AURORA=y
# CONFIG_AURORA_NB8800 is not set
# CONFIG_NET_CADENCE is not set
CONFIG_NET_VENDOR_BROADCOM=y
CONFIG_B44=y
CONFIG_B44_PCI_AUTOSELECT=y
CONFIG_B44_PCICORE_AUTOSELECT=y
CONFIG_B44_PCI=y
# CONFIG_BCMGENET is not set
CONFIG_BNX2=y
CONFIG_CNIC=y
CONFIG_TIGON3=y
CONFIG_TIGON3_HWMON=y
CONFIG_BNX2X=y
# CONFIG_BNX2X_SRIOV is not set
CONFIG_SYSTEMPORT=y
CONFIG_BNXT=y
CONFIG_BNXT_SRIOV=y
CONFIG_BNXT_FLOWER_OFFLOAD=y
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_CAVIUM=y
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
CONFIG_CHELSIO_T3=y
CONFIG_CHELSIO_T4=y
CONFIG_CHELSIO_T4VF=y
CONFIG_CHELSIO_LIB=y
CONFIG_NET_VENDOR_CISCO=y
CONFIG_ENIC=y
# CONFIG_CX_ECAT is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
# CONFIG_NET_VENDOR_DLINK is not set
# CONFIG_NET_VENDOR_EMULEX is not set
# CONFIG_NET_VENDOR_EZCHIP is not set
CONFIG_NET_VENDOR_EXAR=y
CONFIG_S2IO=y
CONFIG_VXGE=y
CONFIG_VXGE_DEBUG_TRACE_ALL=y
# CONFIG_NET_VENDOR_FUJITSU is not set
CONFIG_NET_VENDOR_HP=y
CONFIG_HP100=y
# CONFIG_NET_VENDOR_HUAWEI is not set
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
# CONFIG_I40E is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_JME=y
CONFIG_NET_VENDOR_MARVELL=y
CONFIG_MVMDIO=y
# CONFIG_MVNETA_BM is not set
CONFIG_SKGE=y
# CONFIG_SKGE_DEBUG is not set
# CONFIG_SKGE_GENESIS is not set
# CONFIG_SKY2 is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX4_CORE is not set
# CONFIG_MLX5_CORE is not set
CONFIG_MLXSW_CORE=y
# CONFIG_MLXSW_CORE_HWMON is not set
# CONFIG_MLXSW_CORE_THERMAL is not set
# CONFIG_MLXSW_PCI is not set
# CONFIG_MLXSW_I2C is not set
CONFIG_MLXFW=y
# CONFIG_NET_VENDOR_MICREL is not set
# CONFIG_NET_VENDOR_MYRI is not set
CONFIG_FEALNX=y
# CONFIG_NET_VENDOR_NATSEMI is not set
# CONFIG_NET_VENDOR_NETRONOME is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
CONFIG_PCH_GBE=y
# CONFIG_ETHOC is not set
# CONFIG_NET_PACKET_ENGINE is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
CONFIG_QLCNIC=y
CONFIG_QLCNIC_SRIOV=y
# CONFIG_QLCNIC_HWMON is not set
CONFIG_QLGE=y
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
CONFIG_RMNET=y
CONFIG_NET_VENDOR_REALTEK=y
CONFIG_ATP=y
CONFIG_8139CP=y
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
# CONFIG_NET_VENDOR_RENESAS is not set
CONFIG_NET_VENDOR_RDC=y
CONFIG_R6040=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
CONFIG_SXGBE_ETH=y
CONFIG_NET_VENDOR_SEEQ=y
# CONFIG_NET_VENDOR_SILAN is not set
# CONFIG_NET_VENDOR_SIS is not set
# CONFIG_NET_VENDOR_SOLARFLARE is not set
# CONFIG_NET_VENDOR_SMSC is not set
# CONFIG_NET_VENDOR_STMICRO is not set
CONFIG_NET_VENDOR_SUN=y
CONFIG_HAPPYMEAL=y
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
# CONFIG_NET_VENDOR_TEHUTI is not set
# CONFIG_NET_VENDOR_TI is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
# CONFIG_NET_VENDOR_WIZNET is not set
CONFIG_NET_VENDOR_XIRCOM=y
# CONFIG_PCMCIA_XIRC2PS is not set
# CONFIG_NET_VENDOR_SYNOPSYS is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_MDIO_BCM_UNIMAC=y
# CONFIG_MDIO_BITBANG is not set
CONFIG_MDIO_BUS_MUX=y
CONFIG_MDIO_BUS_MUX_GPIO=y
CONFIG_MDIO_BUS_MUX_MMIOREG=y
# CONFIG_MDIO_HISI_FEMAC is not set
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set

#
# MII PHY device drivers
#
CONFIG_AMD_PHY=y
# CONFIG_AQUANTIA_PHY is not set
CONFIG_AT803X_PHY=y
CONFIG_BCM7XXX_PHY=y
CONFIG_BCM87XX_PHY=y
CONFIG_BCM_NET_PHYLIB=y
CONFIG_BROADCOM_PHY=y
CONFIG_CICADA_PHY=y
CONFIG_CORTINA_PHY=y
CONFIG_DAVICOM_PHY=y
CONFIG_DP83848_PHY=y
# CONFIG_DP83867_PHY is not set
CONFIG_FIXED_PHY=y
CONFIG_ICPLUS_PHY=y
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_MARVELL_PHY is not set
CONFIG_MARVELL_10G_PHY=y
CONFIG_MICREL_PHY=y
CONFIG_MICROCHIP_PHY=y
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=y
CONFIG_ROCKCHIP_PHY=y
# CONFIG_SMSC_PHY is not set
CONFIG_STE10XP=y
# CONFIG_TERANETICS_PHY is not set
CONFIG_VITESSE_PHY=y
# CONFIG_XILINX_GMII2RGMII is not set
CONFIG_PLIP=y
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
CONFIG_USB_CATC=y
CONFIG_USB_KAWETH=y
CONFIG_USB_PEGASUS=y
# CONFIG_USB_RTL8150 is not set
# CONFIG_USB_RTL8152 is not set
CONFIG_USB_LAN78XX=y
# CONFIG_USB_USBNET is not set
# CONFIG_USB_HSO is not set
# CONFIG_USB_IPHETH is not set
# CONFIG_WLAN is not set

#
# WiMAX Wireless Broadband devices
#
CONFIG_WIMAX_I2400M=y
CONFIG_WIMAX_I2400M_USB=y
CONFIG_WIMAX_I2400M_DEBUG_LEVEL=8
# CONFIG_WAN is not set
# CONFIG_IEEE802154_DRIVERS is not set
# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_ISDN is not set
CONFIG_NVM=y
CONFIG_NVM_DEBUG=y
CONFIG_NVM_RRPC=y
CONFIG_NVM_PBLK=y

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_POLLDEV=y
# CONFIG_INPUT_SPARSEKMAP is not set
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=y
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADC is not set
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_STMPE is not set
# CONFIG_KEYBOARD_OMAP4 is not set
# CONFIG_KEYBOARD_TC3589X is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CROS_EC is not set
# CONFIG_KEYBOARD_CAP11XX is not set
# CONFIG_KEYBOARD_BCM is not set
CONFIG_INPUT_MOUSE=y
# CONFIG_MOUSE_PS2 is not set
CONFIG_MOUSE_SERIAL=y
CONFIG_MOUSE_APPLETOUCH=y
CONFIG_MOUSE_BCM5974=y
CONFIG_MOUSE_CYAPA=y
CONFIG_MOUSE_ELAN_I2C=y
# CONFIG_MOUSE_ELAN_I2C_I2C is not set
# CONFIG_MOUSE_ELAN_I2C_SMBUS is not set
CONFIG_MOUSE_VSXXXAA=y
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=y
# CONFIG_MOUSE_SYNAPTICS_USB is not set
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
CONFIG_JOYSTICK_A3D=y
# CONFIG_JOYSTICK_ADI is not set
CONFIG_JOYSTICK_COBRA=y
CONFIG_JOYSTICK_GF2K=y
# CONFIG_JOYSTICK_GRIP is not set
CONFIG_JOYSTICK_GRIP_MP=y
CONFIG_JOYSTICK_GUILLEMOT=y
CONFIG_JOYSTICK_INTERACT=y
CONFIG_JOYSTICK_SIDEWINDER=y
# CONFIG_JOYSTICK_TMDC is not set
# CONFIG_JOYSTICK_IFORCE is not set
# CONFIG_JOYSTICK_WARRIOR is not set
CONFIG_JOYSTICK_MAGELLAN=y
CONFIG_JOYSTICK_SPACEORB=y
# CONFIG_JOYSTICK_SPACEBALL is not set
CONFIG_JOYSTICK_STINGER=y
# CONFIG_JOYSTICK_TWIDJOY is not set
CONFIG_JOYSTICK_ZHENHUA=y
CONFIG_JOYSTICK_DB9=y
# CONFIG_JOYSTICK_GAMECON is not set
CONFIG_JOYSTICK_TURBOGRAFX=y
# CONFIG_JOYSTICK_AS5011 is not set
CONFIG_JOYSTICK_JOYDUMP=y
CONFIG_JOYSTICK_XPAD=y
# CONFIG_JOYSTICK_XPAD_FF is not set
# CONFIG_JOYSTICK_XPAD_LEDS is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_88PM860X_ONKEY is not set
CONFIG_INPUT_AD714X=y
CONFIG_INPUT_AD714X_I2C=y
CONFIG_INPUT_ATMEL_CAPTOUCH=y
CONFIG_INPUT_BMA150=y
# CONFIG_INPUT_E3X0_BUTTON is not set
CONFIG_INPUT_PCSPKR=y
CONFIG_INPUT_MAX77693_HAPTIC=y
CONFIG_INPUT_MMA8450=y
CONFIG_INPUT_APANEL=y
CONFIG_INPUT_GP2A=y
# CONFIG_INPUT_GPIO_BEEPER is not set
# CONFIG_INPUT_GPIO_TILT_POLLED is not set
CONFIG_INPUT_GPIO_DECODER=y
# CONFIG_INPUT_WISTRON_BTNS is not set
# CONFIG_INPUT_ATLAS_BTNS is not set
CONFIG_INPUT_ATI_REMOTE2=y
CONFIG_INPUT_KEYSPAN_REMOTE=y
CONFIG_INPUT_KXTJ9=y
CONFIG_INPUT_KXTJ9_POLLED_MODE=y
CONFIG_INPUT_POWERMATE=y
CONFIG_INPUT_YEALINK=y
CONFIG_INPUT_CM109=y
CONFIG_INPUT_REGULATOR_HAPTIC=y
CONFIG_INPUT_TPS65218_PWRBUTTON=y
# CONFIG_INPUT_AXP20X_PEK is not set
# CONFIG_INPUT_TWL6040_VIBRA is not set
CONFIG_INPUT_UINPUT=y
CONFIG_INPUT_PCF50633_PMU=y
# CONFIG_INPUT_PCF8574 is not set
CONFIG_INPUT_PWM_BEEPER=y
CONFIG_INPUT_PWM_VIBRA=y
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
CONFIG_INPUT_DA9052_ONKEY=y
# CONFIG_INPUT_DA9055_ONKEY is not set
CONFIG_INPUT_DA9063_ONKEY=y
CONFIG_INPUT_WM831X_ON=y
# CONFIG_INPUT_ADXL34X is not set
CONFIG_INPUT_IMS_PCU=y
# CONFIG_INPUT_CMA3000 is not set
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
# CONFIG_INPUT_DRV260X_HAPTICS is not set
CONFIG_INPUT_DRV2665_HAPTICS=y
CONFIG_INPUT_DRV2667_HAPTICS=y
CONFIG_RMI4_CORE=y
# CONFIG_RMI4_I2C is not set
CONFIG_RMI4_SMB=y
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
CONFIG_SERIO_PARKBD=y
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
CONFIG_SERIO_APBPS2=y
CONFIG_SERIO_OLPC_APSP=y
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
CONFIG_GAMEPORT_L4=y
# CONFIG_GAMEPORT_EMU10K1 is not set
CONFIG_GAMEPORT_FM801=y

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_ROCKETPORT=y
CONFIG_CYCLADES=y
# CONFIG_CYZ_INTR is not set
CONFIG_MOXA_INTELLIO=y
CONFIG_MOXA_SMARTIO=y
# CONFIG_SYNCLINK is not set
CONFIG_SYNCLINKMP=y
CONFIG_SYNCLINK_GT=y
# CONFIG_NOZOMI is not set
# CONFIG_ISI is not set
# CONFIG_N_HDLC is not set
CONFIG_N_GSM=y
# CONFIG_TRACE_ROUTER is not set
CONFIG_TRACE_SINK=y
CONFIG_GOLDFISH_TTY=y
CONFIG_DEVMEM=y
# CONFIG_DEVKMEM is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
CONFIG_SERIAL_8250_FINTEK=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCI=y
# CONFIG_SERIAL_8250_EXAR is not set
# CONFIG_SERIAL_8250_CS is not set
CONFIG_SERIAL_8250_MEN_MCB=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_8250_ASPEED_VUART=y
# CONFIG_SERIAL_8250_FSL is not set
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
# CONFIG_SERIAL_8250_LPSS is not set
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_MOXA=y
CONFIG_SERIAL_OF_PLATFORM=y

#
# Non-8250 serial port support
#
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=y
CONFIG_SERIAL_SCCNXP=y
CONFIG_SERIAL_SCCNXP_CONSOLE=y
CONFIG_SERIAL_SC16IS7XX_CORE=y
CONFIG_SERIAL_SC16IS7XX=y
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_TIMBERDALE=y
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_PCH_UART is not set
CONFIG_SERIAL_XILINX_PS_UART=y
# CONFIG_SERIAL_XILINX_PS_UART_CONSOLE is not set
CONFIG_SERIAL_ARC=y
# CONFIG_SERIAL_ARC_CONSOLE is not set
CONFIG_SERIAL_ARC_NR_PORTS=1
CONFIG_SERIAL_RP2=y
CONFIG_SERIAL_RP2_NR_UARTS=32
CONFIG_SERIAL_FSL_LPUART=y
CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
CONFIG_SERIAL_CONEXANT_DIGICOLOR=y
# CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE is not set
# CONFIG_SERIAL_MEN_Z135 is not set
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_PRINTER=y
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=y
CONFIG_HVC_DRIVER=y
CONFIG_VIRTIO_CONSOLE=y
# CONFIG_IPMI_HANDLER is not set
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
# CONFIG_HW_RANDOM_INTEL is not set
CONFIG_HW_RANDOM_AMD=y
CONFIG_HW_RANDOM_GEODE=y
CONFIG_HW_RANDOM_VIA=y
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_HW_RANDOM_TPM is not set
# CONFIG_NVRAM is not set
CONFIG_R3964=y
CONFIG_APPLICOM=y
CONFIG_SONYPI=y

#
# PCMCIA character devices
#
# CONFIG_SYNCLINK_CS is not set
CONFIG_CARDMAN_4000=y
# CONFIG_CARDMAN_4040 is not set
CONFIG_SCR24X=y
# CONFIG_IPWIRELESS is not set
CONFIG_MWAVE=y
# CONFIG_SCx200_GPIO is not set
# CONFIG_PC8736x_GPIO is not set
CONFIG_NSC_GPIO=y
CONFIG_RAW_DRIVER=y
CONFIG_MAX_RAW_DEVS=256
# CONFIG_HPET is not set
# CONFIG_HANGCHECK_TIMER is not set
CONFIG_TCG_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
CONFIG_TCG_TIS_I2C_ATMEL=y
# CONFIG_TCG_TIS_I2C_INFINEON is not set
CONFIG_TCG_TIS_I2C_NUVOTON=y
# CONFIG_TCG_NSC is not set
# CONFIG_TCG_ATMEL is not set
# CONFIG_TCG_INFINEON is not set
# CONFIG_TCG_CRB is not set
CONFIG_TCG_VTPM_PROXY=y
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
CONFIG_TELCLOCK=y
CONFIG_DEVPORT=y
# CONFIG_XILLYBUS is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
# CONFIG_I2C_MUX_GPIO is not set
CONFIG_I2C_MUX_GPMUX=y
# CONFIG_I2C_MUX_LTC4306 is not set
CONFIG_I2C_MUX_PCA9541=y
CONFIG_I2C_MUX_PCA954x=y
# CONFIG_I2C_MUX_REG is not set
# CONFIG_I2C_MUX_MLXCPLD is not set
# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_ALI1535=y
# CONFIG_I2C_ALI1563 is not set
CONFIG_I2C_ALI15X3=y
CONFIG_I2C_AMD756=y
CONFIG_I2C_AMD756_S4882=y
CONFIG_I2C_AMD8111=y
CONFIG_I2C_I801=y
CONFIG_I2C_ISCH=y
CONFIG_I2C_ISMT=y
CONFIG_I2C_PIIX4=y
CONFIG_I2C_NFORCE2=y
CONFIG_I2C_NFORCE2_S4985=y
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
CONFIG_I2C_VIA=y
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PCI=y
# CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
CONFIG_I2C_EG20T=y
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
CONFIG_I2C_OCORES=y
CONFIG_I2C_PCA_PLATFORM=y
CONFIG_I2C_PXA=y
CONFIG_I2C_PXA_PCI=y
CONFIG_I2C_RK3X=y
# CONFIG_I2C_SIMTEC is not set
CONFIG_I2C_XILINX=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
# CONFIG_I2C_DLN2 is not set
# CONFIG_I2C_PARPORT is not set
CONFIG_I2C_PARPORT_LIGHT=y
CONFIG_I2C_ROBOTFUZZ_OSIF=y
# CONFIG_I2C_TAOS_EVM is not set
CONFIG_I2C_TINY_USB=y
CONFIG_I2C_VIPERBOARD=y

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_CROS_EC_TUNNEL=y
CONFIG_SCx200_ACB=y
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# CONFIG_SPI is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
CONFIG_PPS_CLIENT_LDISC=y
CONFIG_PPS_CLIENT_PARPORT=y
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_PTP_1588_CLOCK_PCH=y
CONFIG_PTP_1588_CLOCK_KVM=y
CONFIG_GPIOLIB=y
CONFIG_OF_GPIO=y
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
CONFIG_GPIO_ALTERA=y
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_AXP209 is not set
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_FTGPIO010 is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_GRGPIO=y
CONFIG_GPIO_ICH=y
# CONFIG_GPIO_LYNXPOINT is not set
CONFIG_GPIO_MENZ127=y
CONFIG_GPIO_MOCKUP=y
# CONFIG_GPIO_SYSCON is not set
CONFIG_GPIO_VX855=y
# CONFIG_GPIO_XILINX is not set

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_F7188X=y
# CONFIG_GPIO_IT87 is not set
CONFIG_GPIO_SCH=y
# CONFIG_GPIO_SCH311X is not set

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADP5588=y
# CONFIG_GPIO_ADP5588_IRQ is not set
# CONFIG_GPIO_ADNP is not set
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
CONFIG_GPIO_MAX732X_IRQ=y
# CONFIG_GPIO_PCA953X is not set
CONFIG_GPIO_PCF857X=y
CONFIG_GPIO_TPIC2810=y

#
# MFD GPIO expanders
#
CONFIG_GPIO_ARIZONA=y
CONFIG_GPIO_CS5535=y
# CONFIG_GPIO_DA9052 is not set
CONFIG_GPIO_DA9055=y
CONFIG_GPIO_DLN2=y
CONFIG_GPIO_JANZ_TTL=y
CONFIG_GPIO_LP3943=y
CONFIG_GPIO_LP873X=y
CONFIG_GPIO_LP87565=y
# CONFIG_GPIO_MAX77620 is not set
# CONFIG_GPIO_RC5T583 is not set
# CONFIG_GPIO_STMPE is not set
CONFIG_GPIO_TC3589X=y
CONFIG_GPIO_TIMBERDALE=y
CONFIG_GPIO_TPS65086=y
CONFIG_GPIO_TPS65912=y
CONFIG_GPIO_TWL6040=y
CONFIG_GPIO_WM831X=y
CONFIG_GPIO_WM8994=y

#
# PCI GPIO expanders
#
CONFIG_GPIO_AMD8111=y
CONFIG_GPIO_BT8XX=y
CONFIG_GPIO_ML_IOH=y
# CONFIG_GPIO_PCH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
CONFIG_GPIO_RDC321X=y
# CONFIG_GPIO_SODAVILLE is not set

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=y
CONFIG_W1=y
# CONFIG_W1_CON is not set

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=y
CONFIG_W1_MASTER_DS2490=y
CONFIG_W1_MASTER_DS2482=y
# CONFIG_W1_MASTER_DS1WM is not set
# CONFIG_W1_MASTER_GPIO is not set

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=y
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
# CONFIG_W1_SLAVE_DS2805 is not set
CONFIG_W1_SLAVE_DS2431=y
CONFIG_W1_SLAVE_DS2433=y
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS2760=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
# CONFIG_POWER_AVS is not set
# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
# CONFIG_PDA_POWER is not set
# CONFIG_GENERIC_ADC_BATTERY is not set
CONFIG_WM831X_BACKUP=y
CONFIG_WM831X_POWER=y
# CONFIG_TEST_POWER is not set
# CONFIG_BATTERY_88PM860X is not set
CONFIG_BATTERY_ACT8945A=y
# CONFIG_BATTERY_DS2760 is not set
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
CONFIG_BATTERY_LEGO_EV3=y
CONFIG_BATTERY_OLPC=y
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=y
# CONFIG_BATTERY_BQ27XXX_I2C is not set
CONFIG_BATTERY_BQ27XXX_HDQ=y
# CONFIG_BATTERY_DA9052 is not set
# CONFIG_AXP20X_POWER is not set
CONFIG_AXP288_CHARGER=y
CONFIG_AXP288_FUEL_GAUGE=y
# CONFIG_BATTERY_MAX17040 is not set
CONFIG_BATTERY_MAX17042=y
CONFIG_BATTERY_MAX1721X=y
# CONFIG_CHARGER_PCF50633 is not set
# CONFIG_CHARGER_ISP1704 is not set
CONFIG_CHARGER_MAX8903=y
# CONFIG_CHARGER_LP8727 is not set
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
CONFIG_CHARGER_LTC3651=y
# CONFIG_CHARGER_MAX14577 is not set
CONFIG_CHARGER_DETECTOR_MAX14656=y
CONFIG_CHARGER_MAX77693=y
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24190 is not set
# CONFIG_CHARGER_BQ24257 is not set
CONFIG_CHARGER_BQ24735=y
CONFIG_CHARGER_BQ25890=y
# CONFIG_CHARGER_SMB347 is not set
# CONFIG_CHARGER_TPS65217 is not set
CONFIG_BATTERY_GAUGE_LTC2941=y
# CONFIG_BATTERY_GOLDFISH is not set
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=y
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=y
# CONFIG_SENSORS_ABITUGURU3 is not set
# CONFIG_SENSORS_AD7414 is not set
# CONFIG_SENSORS_AD7418 is not set
CONFIG_SENSORS_ADM1021=y
# CONFIG_SENSORS_ADM1025 is not set
CONFIG_SENSORS_ADM1026=y
# CONFIG_SENSORS_ADM1029 is not set
CONFIG_SENSORS_ADM1031=y
CONFIG_SENSORS_ADM9240=y
# CONFIG_SENSORS_ADT7410 is not set
# CONFIG_SENSORS_ADT7411 is not set
CONFIG_SENSORS_ADT7462=y
# CONFIG_SENSORS_ADT7470 is not set
# CONFIG_SENSORS_ADT7475 is not set
# CONFIG_SENSORS_ASC7621 is not set
CONFIG_SENSORS_K8TEMP=y
# CONFIG_SENSORS_K10TEMP is not set
CONFIG_SENSORS_FAM15H_POWER=y
# CONFIG_SENSORS_APPLESMC is not set
# CONFIG_SENSORS_ASB100 is not set
CONFIG_SENSORS_ASPEED=y
# CONFIG_SENSORS_ATXP1 is not set
CONFIG_SENSORS_DS620=y
CONFIG_SENSORS_DS1621=y
CONFIG_SENSORS_DELL_SMM=y
CONFIG_SENSORS_DA9052_ADC=y
# CONFIG_SENSORS_DA9055 is not set
CONFIG_SENSORS_I5K_AMB=y
CONFIG_SENSORS_F71805F=y
CONFIG_SENSORS_F71882FG=y
CONFIG_SENSORS_F75375S=y
CONFIG_SENSORS_FSCHMD=y
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=y
# CONFIG_SENSORS_G760A is not set
CONFIG_SENSORS_G762=y
CONFIG_SENSORS_GPIO_FAN=y
CONFIG_SENSORS_HIH6130=y
CONFIG_SENSORS_IIO_HWMON=y
# CONFIG_SENSORS_I5500 is not set
CONFIG_SENSORS_CORETEMP=y
CONFIG_SENSORS_IT87=y
# CONFIG_SENSORS_JC42 is not set
CONFIG_SENSORS_POWR1220=y
CONFIG_SENSORS_LINEAGE=y
CONFIG_SENSORS_LTC2945=y
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC4151=y
CONFIG_SENSORS_LTC4215=y
CONFIG_SENSORS_LTC4222=y
CONFIG_SENSORS_LTC4245=y
CONFIG_SENSORS_LTC4260=y
CONFIG_SENSORS_LTC4261=y
CONFIG_SENSORS_MAX16065=y
CONFIG_SENSORS_MAX1619=y
CONFIG_SENSORS_MAX1668=y
# CONFIG_SENSORS_MAX197 is not set
CONFIG_SENSORS_MAX6639=y
CONFIG_SENSORS_MAX6642=y
CONFIG_SENSORS_MAX6650=y
CONFIG_SENSORS_MAX6697=y
CONFIG_SENSORS_MAX31790=y
CONFIG_SENSORS_MCP3021=y
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_MENF21BMC_HWMON is not set
# CONFIG_SENSORS_LM63 is not set
# CONFIG_SENSORS_LM73 is not set
CONFIG_SENSORS_LM75=y
CONFIG_SENSORS_LM77=y
CONFIG_SENSORS_LM78=y
CONFIG_SENSORS_LM80=y
CONFIG_SENSORS_LM83=y
CONFIG_SENSORS_LM85=y
CONFIG_SENSORS_LM87=y
# CONFIG_SENSORS_LM90 is not set
CONFIG_SENSORS_LM92=y
# CONFIG_SENSORS_LM93 is not set
CONFIG_SENSORS_LM95234=y
# CONFIG_SENSORS_LM95241 is not set
CONFIG_SENSORS_LM95245=y
CONFIG_SENSORS_PC87360=y
CONFIG_SENSORS_PC87427=y
CONFIG_SENSORS_NTC_THERMISTOR=y
CONFIG_SENSORS_NCT6683=y
CONFIG_SENSORS_NCT6775=y
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_PCF8591 is not set
# CONFIG_PMBUS is not set
CONFIG_SENSORS_PWM_FAN=y
CONFIG_SENSORS_SHT15=y
# CONFIG_SENSORS_SHT21 is not set
CONFIG_SENSORS_SHT3x=y
CONFIG_SENSORS_SHTC1=y
CONFIG_SENSORS_SIS5595=y
# CONFIG_SENSORS_DME1737 is not set
# CONFIG_SENSORS_EMC1403 is not set
CONFIG_SENSORS_EMC2103=y
# CONFIG_SENSORS_EMC6W201 is not set
CONFIG_SENSORS_SMSC47M1=y
# CONFIG_SENSORS_SMSC47M192 is not set
# CONFIG_SENSORS_SMSC47B397 is not set
CONFIG_SENSORS_SCH56XX_COMMON=y
CONFIG_SENSORS_SCH5627=y
CONFIG_SENSORS_SCH5636=y
CONFIG_SENSORS_STTS751=y
CONFIG_SENSORS_SMM665=y
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS1015=y
# CONFIG_SENSORS_ADS7828 is not set
CONFIG_SENSORS_AMC6821=y
# CONFIG_SENSORS_INA209 is not set
CONFIG_SENSORS_INA2XX=y
CONFIG_SENSORS_INA3221=y
CONFIG_SENSORS_TC74=y
CONFIG_SENSORS_THMC50=y
# CONFIG_SENSORS_TMP102 is not set
CONFIG_SENSORS_TMP103=y
CONFIG_SENSORS_TMP108=y
CONFIG_SENSORS_TMP401=y
CONFIG_SENSORS_TMP421=y
# CONFIG_SENSORS_VIA_CPUTEMP is not set
CONFIG_SENSORS_VIA686A=y
CONFIG_SENSORS_VT1211=y
CONFIG_SENSORS_VT8231=y
CONFIG_SENSORS_W83781D=y
# CONFIG_SENSORS_W83791D is not set
CONFIG_SENSORS_W83792D=y
CONFIG_SENSORS_W83793=y
CONFIG_SENSORS_W83795=y
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=y
CONFIG_SENSORS_W83L786NG=y
CONFIG_SENSORS_W83627HF=y
CONFIG_SENSORS_W83627EHF=y
CONFIG_SENSORS_WM831X=y

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
# CONFIG_SENSORS_ATK0110 is not set
CONFIG_THERMAL=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_HWMON is not set
# CONFIG_THERMAL_OF is not set
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
# CONFIG_THERMAL_GOV_BANG_BANG is not set
# CONFIG_THERMAL_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
# CONFIG_CLOCK_THERMAL is not set
# CONFIG_DEVFREQ_THERMAL is not set
CONFIG_THERMAL_EMULATION=y
# CONFIG_MAX77620_THERMAL is not set
CONFIG_INTEL_POWERCLAMP=y
CONFIG_INTEL_SOC_DTS_IOSF_CORE=y
CONFIG_INTEL_SOC_DTS_THERMAL=y

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
CONFIG_INTEL_PCH_THERMAL=y
# CONFIG_GENERIC_ADC_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
# CONFIG_WATCHDOG_SYSFS is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
CONFIG_SOFT_WATCHDOG_PRETIMEOUT=y
# CONFIG_DA9052_WATCHDOG is not set
# CONFIG_DA9055_WATCHDOG is not set
CONFIG_DA9063_WATCHDOG=y
CONFIG_GPIO_WATCHDOG=y
# CONFIG_GPIO_WATCHDOG_ARCH_INITCALL is not set
CONFIG_MENF21BMC_WATCHDOG=y
# CONFIG_WDAT_WDT is not set
CONFIG_WM831X_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=y
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_RN5T618_WATCHDOG is not set
CONFIG_MAX63XX_WATCHDOG=y
CONFIG_MAX77620_WATCHDOG=y
CONFIG_ACQUIRE_WDT=y
CONFIG_ADVANTECH_WDT=y
# CONFIG_ALIM1535_WDT is not set
# CONFIG_ALIM7101_WDT is not set
CONFIG_F71808E_WDT=y
CONFIG_SP5100_TCO=y
CONFIG_GEODE_WDT=y
# CONFIG_SBC_FITPC2_WATCHDOG is not set
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=y
# CONFIG_IBMASR is not set
CONFIG_WAFER_WDT=y
# CONFIG_I6300ESB_WDT is not set
# CONFIG_IE6XX_WDT is not set
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=y
# CONFIG_IT87_WDT is not set
CONFIG_HP_WATCHDOG=y
CONFIG_HPWDT_NMI_DECODING=y
CONFIG_SC1200_WDT=y
CONFIG_SCx200_WDT=y
CONFIG_PC87413_WDT=y
CONFIG_NV_TCO=y
CONFIG_RDC321X_WDT=y
CONFIG_60XX_WDT=y
CONFIG_SBC8360_WDT=y
# CONFIG_SBC7240_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=y
CONFIG_SMSC37B787_WDT=y
CONFIG_VIA_WDT=y
# CONFIG_W83627HF_WDT is not set
CONFIG_W83877F_WDT=y
# CONFIG_W83977F_WDT is not set
# CONFIG_MACHZ_WDT is not set
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=y
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
CONFIG_MEN_A21_WDT=y

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=y
CONFIG_WDTPCI=y

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
# CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP is not set
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=y
# CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=y
CONFIG_SSB_POSSIBLE=y

#
# Sonics Silicon Backplane
#
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
# CONFIG_SSB_B43_PCI_BRIDGE is not set
CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
CONFIG_SSB_PCMCIAHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
# CONFIG_SSB_SDIOHOST is not set
CONFIG_SSB_DEBUG=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
CONFIG_SSB_DRIVER_PCICORE=y
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_SFLASH is not set
CONFIG_BCMA_DRIVER_GMAC_CMN=y
# CONFIG_BCMA_DRIVER_GPIO is not set
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_CS5535=y
CONFIG_MFD_ACT8945A=y
# CONFIG_MFD_AS3711 is not set
CONFIG_MFD_AS3722=y
# CONFIG_PMIC_ADP5520 is not set
CONFIG_MFD_AAT2870_CORE=y
# CONFIG_MFD_ATMEL_FLEXCOM is not set
CONFIG_MFD_ATMEL_HLCDC=y
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_CROS_EC=y
CONFIG_MFD_CROS_EC_I2C=y
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_I2C=y
CONFIG_MFD_DA9055=y
# CONFIG_MFD_DA9062 is not set
CONFIG_MFD_DA9063=y
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_DLN2=y
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_HI6421_PMIC is not set
CONFIG_HTC_PASIC3=y
CONFIG_HTC_I2CPLD=y
CONFIG_MFD_INTEL_QUARK_I2C_GPIO=y
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=y
# CONFIG_INTEL_SOC_PMIC is not set
# CONFIG_INTEL_SOC_PMIC_CHTWC is not set
CONFIG_MFD_INTEL_LPSS=y
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
CONFIG_MFD_INTEL_LPSS_PCI=y
CONFIG_MFD_JANZ_CMODIO=y
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
CONFIG_MFD_88PM805=y
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=y
CONFIG_MFD_MAX77620=y
CONFIG_MFD_MAX77686=y
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77843=y
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
CONFIG_MFD_MAX8998=y
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=y
CONFIG_MFD_VIPERBOARD=y
# CONFIG_MFD_RETU is not set
CONFIG_MFD_PCF50633=y
# CONFIG_PCF50633_ADC is not set
CONFIG_PCF50633_GPIO=y
CONFIG_MFD_RDC321X=y
CONFIG_MFD_RTSX_PCI=y
CONFIG_MFD_RT5033=y
# CONFIG_MFD_RTSX_USB is not set
CONFIG_MFD_RC5T583=y
# CONFIG_MFD_RK808 is not set
CONFIG_MFD_RN5T618=y
# CONFIG_MFD_SEC_CORE is not set
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SM501=y
CONFIG_MFD_SM501_GPIO=y
CONFIG_MFD_SKY81452=y
# CONFIG_MFD_SMSC is not set
CONFIG_ABX500_CORE=y
# CONFIG_AB3100_CORE is not set
CONFIG_MFD_STMPE=y

#
# STMicroelectronics STMPE Interface Drivers
#
CONFIG_STMPE_I2C=y
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=y
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=y
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
CONFIG_MFD_TPS65086=y
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TPS65217=y
# CONFIG_MFD_TPS68470 is not set
CONFIG_MFD_TI_LP873X=y
CONFIG_MFD_TI_LP87565=y
# CONFIG_MFD_TPS65218 is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
CONFIG_MFD_TPS80031=y
# CONFIG_TWL4030_CORE is not set
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=y
CONFIG_MFD_TIMBERDALE=y
CONFIG_MFD_TC3589X=y
# CONFIG_MFD_TMIO is not set
CONFIG_MFD_VX855=y
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
# CONFIG_MFD_WM5110 is not set
CONFIG_MFD_WM8997=y
CONFIG_MFD_WM8998=y
CONFIG_MFD_WM8400=y
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=y
CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
# CONFIG_REGULATOR_88PM8607 is not set
CONFIG_REGULATOR_ACT8865=y
# CONFIG_REGULATOR_ACT8945A is not set
CONFIG_REGULATOR_AD5398=y
CONFIG_REGULATOR_ANATOP=y
# CONFIG_REGULATOR_AAT2870 is not set
# CONFIG_REGULATOR_AS3722 is not set
# CONFIG_REGULATOR_AXP20X is not set
CONFIG_REGULATOR_DA9052=y
CONFIG_REGULATOR_DA9055=y
CONFIG_REGULATOR_DA9063=y
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=y
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=y
CONFIG_REGULATOR_LM363X=y
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=y
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP873X=y
# CONFIG_REGULATOR_LP8755 is not set
CONFIG_REGULATOR_LP87565=y
# CONFIG_REGULATOR_LTC3589 is not set
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=y
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX77620=y
CONFIG_REGULATOR_MAX8649=y
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8952=y
# CONFIG_REGULATOR_MAX8998 is not set
CONFIG_REGULATOR_MAX77686=y
CONFIG_REGULATOR_MAX77693=y
CONFIG_REGULATOR_MAX77802=y
CONFIG_REGULATOR_MT6311=y
# CONFIG_REGULATOR_PCF50633 is not set
CONFIG_REGULATOR_PFUZE100=y
# CONFIG_REGULATOR_PV88060 is not set
CONFIG_REGULATOR_PV88080=y
# CONFIG_REGULATOR_PV88090 is not set
# CONFIG_REGULATOR_PWM is not set
# CONFIG_REGULATOR_RC5T583 is not set
# CONFIG_REGULATOR_RN5T618 is not set
CONFIG_REGULATOR_RT5033=y
CONFIG_REGULATOR_SKY81452=y
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS6105X=y
CONFIG_REGULATOR_TPS62360=y
# CONFIG_REGULATOR_TPS65023 is not set
CONFIG_REGULATOR_TPS6507X=y
CONFIG_REGULATOR_TPS65086=y
# CONFIG_REGULATOR_TPS65132 is not set
CONFIG_REGULATOR_TPS65217=y
CONFIG_REGULATOR_TPS65912=y
CONFIG_REGULATOR_TPS80031=y
CONFIG_REGULATOR_VCTRL=y
CONFIG_REGULATOR_WM831X=y
# CONFIG_REGULATOR_WM8400 is not set
# CONFIG_REGULATOR_WM8994 is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y
# CONFIG_RC_CORE is not set
# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_AGP=y
CONFIG_AGP_ALI=y
CONFIG_AGP_ATI=y
CONFIG_AGP_AMD=y
# CONFIG_AGP_AMD64 is not set
# CONFIG_AGP_INTEL is not set
CONFIG_AGP_NVIDIA=y
# CONFIG_AGP_SIS is not set
CONFIG_AGP_SWORKS=y
CONFIG_AGP_VIA=y
# CONFIG_AGP_EFFICEON is not set
CONFIG_INTEL_GTT=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_VGA_SWITCHEROO is not set
CONFIG_DRM=y
CONFIG_DRM_MIPI_DSI=y
# CONFIG_DRM_DP_AUX_CHARDEV is not set
# CONFIG_DRM_DEBUG_MM is not set
# CONFIG_DRM_DEBUG_MM_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_KMS_FB_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_TTM=y
CONFIG_DRM_GEM_CMA_HELPER=y
CONFIG_DRM_KMS_CMA_HELPER=y
CONFIG_DRM_VM=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
# CONFIG_DRM_I2C_SIL164 is not set
CONFIG_DRM_I2C_NXP_TDA998X=y
# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set

#
# ACP (Audio CoProcessor) Configuration
#
CONFIG_DRM_NOUVEAU=y
CONFIG_NOUVEAU_DEBUG=5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3
# CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
CONFIG_DRM_I915=y
# CONFIG_DRM_I915_ALPHA_SUPPORT is not set
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
CONFIG_DRM_VGEM=y
# CONFIG_DRM_VMWGFX is not set
# CONFIG_DRM_GMA500 is not set
# CONFIG_DRM_UDL is not set
# CONFIG_DRM_AST is not set
# CONFIG_DRM_MGAG200 is not set
CONFIG_DRM_CIRRUS_QEMU=y
CONFIG_DRM_RCAR_DW_HDMI=y
CONFIG_DRM_QXL=y
# CONFIG_DRM_BOCHS is not set
CONFIG_DRM_VIRTIO_GPU=y
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_LVDS is not set
CONFIG_DRM_PANEL_SIMPLE=y
CONFIG_DRM_PANEL_INNOLUX_P079ZCA=y
# CONFIG_DRM_PANEL_JDI_LT070ME05000 is not set
CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=y
# CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=y
CONFIG_DRM_PANEL_SHARP_LS043T1LE01=y
CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_ANALOGIX_ANX78XX=y
CONFIG_DRM_DUMB_VGA_DAC=y
# CONFIG_DRM_LVDS_ENCODER is not set
CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW=y
CONFIG_DRM_NXP_PTN3460=y
# CONFIG_DRM_PARADE_PS8622 is not set
# CONFIG_DRM_SIL_SII8620 is not set
CONFIG_DRM_SII902X=y
CONFIG_DRM_TOSHIBA_TC358767=y
CONFIG_DRM_TI_TFP410=y
CONFIG_DRM_I2C_ADV7511=y
CONFIG_DRM_I2C_ADV7533=y
CONFIG_DRM_DW_HDMI=y
CONFIG_DRM_DW_HDMI_CEC=y
CONFIG_DRM_ARCPGU=y
# CONFIG_DRM_HISI_HIBMC is not set
# CONFIG_DRM_MXSFB is not set
CONFIG_DRM_TINYDRM=y
# CONFIG_DRM_LEGACY is not set
# CONFIG_DRM_LIB_RANDOM is not set

#
# Frame buffer Devices
#
CONFIG_FB=y
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB_DDC=y
CONFIG_FB_BOOT_VESA_SUPPORT=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA is not set
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_SVGALIB=y
# CONFIG_FB_MACMODES is not set
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
CONFIG_FB_CIRRUS=y
CONFIG_FB_PM2=y
CONFIG_FB_PM2_FIFO_DISCONNECT=y
# CONFIG_FB_CYBER2000 is not set
CONFIG_FB_ARC=y
CONFIG_FB_ASILIANT=y
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
# CONFIG_FB_VESA is not set
# CONFIG_FB_N411 is not set
CONFIG_FB_HGA=y
CONFIG_FB_OPENCORES=y
# CONFIG_FB_S1D13XXX is not set
CONFIG_FB_NVIDIA=y
CONFIG_FB_NVIDIA_I2C=y
CONFIG_FB_NVIDIA_DEBUG=y
# CONFIG_FB_NVIDIA_BACKLIGHT is not set
CONFIG_FB_RIVA=y
CONFIG_FB_RIVA_I2C=y
# CONFIG_FB_RIVA_DEBUG is not set
CONFIG_FB_RIVA_BACKLIGHT=y
CONFIG_FB_I740=y
CONFIG_FB_LE80578=y
CONFIG_FB_CARILLO_RANCH=y
CONFIG_FB_MATROX=y
CONFIG_FB_MATROX_MILLENIUM=y
# CONFIG_FB_MATROX_MYSTIQUE is not set
CONFIG_FB_MATROX_G=y
# CONFIG_FB_MATROX_I2C is not set
CONFIG_FB_RADEON=y
# CONFIG_FB_RADEON_I2C is not set
# CONFIG_FB_RADEON_BACKLIGHT is not set
CONFIG_FB_RADEON_DEBUG=y
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
CONFIG_FB_SAVAGE=y
# CONFIG_FB_SAVAGE_I2C is not set
# CONFIG_FB_SAVAGE_ACCEL is not set
CONFIG_FB_SIS=y
# CONFIG_FB_SIS_300 is not set
CONFIG_FB_SIS_315=y
CONFIG_FB_VIA=y
# CONFIG_FB_VIA_DIRECT_PROCFS is not set
# CONFIG_FB_VIA_X_COMPATIBILITY is not set
CONFIG_FB_NEOMAGIC=y
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
CONFIG_FB_VOODOO1=y
# CONFIG_FB_VT8623 is not set
CONFIG_FB_TRIDENT=y
CONFIG_FB_ARK=y
CONFIG_FB_PM3=y
CONFIG_FB_CARMINE=y
# CONFIG_FB_CARMINE_DRAM_EVAL is not set
CONFIG_CARMINE_DRAM_CUSTOM=y
CONFIG_FB_GEODE=y
# CONFIG_FB_GEODE_LX is not set
CONFIG_FB_GEODE_GX=y
# CONFIG_FB_GEODE_GX1 is not set
CONFIG_FB_SM501=y
CONFIG_FB_SMSCUFX=y
# CONFIG_FB_UDL is not set
CONFIG_FB_IBM_GXT4500=y
CONFIG_FB_GOLDFISH=y
CONFIG_FB_VIRTUAL=y
# CONFIG_FB_METRONOME is not set
CONFIG_FB_MB862XX=y
CONFIG_FB_MB862XX_PCI_GDC=y
# CONFIG_FB_MB862XX_I2C is not set
# CONFIG_FB_BROADSHEET is not set
CONFIG_FB_AUO_K190X=y
# CONFIG_FB_AUO_K1900 is not set
CONFIG_FB_AUO_K1901=y
# CONFIG_FB_SIMPLE is not set
CONFIG_FB_SSD1307=y
CONFIG_FB_SM712=y
CONFIG_BACKLIGHT_LCD_SUPPORT=y
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_PLATFORM=y
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_GENERIC=y
# CONFIG_BACKLIGHT_LM3533 is not set
CONFIG_BACKLIGHT_CARILLO_RANCH=y
CONFIG_BACKLIGHT_PWM=y
# CONFIG_BACKLIGHT_DA9052 is not set
# CONFIG_BACKLIGHT_APPLE is not set
CONFIG_BACKLIGHT_PM8941_WLED=y
CONFIG_BACKLIGHT_SAHARA=y
CONFIG_BACKLIGHT_WM831X=y
CONFIG_BACKLIGHT_ADP8860=y
# CONFIG_BACKLIGHT_ADP8870 is not set
CONFIG_BACKLIGHT_88PM860X=y
CONFIG_BACKLIGHT_PCF50633=y
CONFIG_BACKLIGHT_AAT2870=y
# CONFIG_BACKLIGHT_LM3630A is not set
CONFIG_BACKLIGHT_LM3639=y
# CONFIG_BACKLIGHT_LP855X is not set
# CONFIG_BACKLIGHT_OT200 is not set
CONFIG_BACKLIGHT_SKY81452=y
CONFIG_BACKLIGHT_TPS65217=y
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
CONFIG_BACKLIGHT_ARCXCNN=y
CONFIG_VGASTATE=y
CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
# CONFIG_VGACON_SOFT_SCROLLBACK is not set
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_LOGO is not set
CONFIG_SOUND=y
# CONFIG_SOUND_OSS_CORE is not set
# CONFIG_SND is not set

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
# CONFIG_HIDRAW is not set
CONFIG_UHID=y
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
CONFIG_HID_ACCUTOUCH=y
# CONFIG_HID_ACRUX is not set
CONFIG_HID_APPLE=y
# CONFIG_HID_APPLEIR is not set
# CONFIG_HID_ASUS is not set
CONFIG_HID_AUREAL=y
CONFIG_HID_BELKIN=y
CONFIG_HID_BETOP_FF=y
CONFIG_HID_CHERRY=y
# CONFIG_HID_CHICONY is not set
CONFIG_HID_CORSAIR=y
CONFIG_HID_CMEDIA=y
CONFIG_HID_CP2112=y
# CONFIG_HID_CYPRESS is not set
CONFIG_HID_DRAGONRISE=y
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELECOM is not set
# CONFIG_HID_ELO is not set
CONFIG_HID_EZKEY=y
CONFIG_HID_GEMBIRD=y
CONFIG_HID_GFRM=y
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=y
# CONFIG_HID_KYE is not set
CONFIG_HID_UCLOGIC=y
CONFIG_HID_WALTOP=y
CONFIG_HID_GYRATION=y
CONFIG_HID_ICADE=y
# CONFIG_HID_ITE is not set
# CONFIG_HID_TWINHAN is not set
CONFIG_HID_KENSINGTON=y
CONFIG_HID_LCPOWER=y
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=y
CONFIG_HID_LOGITECH=y
CONFIG_HID_LOGITECH_HIDPP=y
CONFIG_LOGITECH_FF=y
CONFIG_LOGIRUMBLEPAD2_FF=y
# CONFIG_LOGIG940_FF is not set
CONFIG_LOGIWHEELS_FF=y
CONFIG_HID_MAGICMOUSE=y
CONFIG_HID_MAYFLASH=y
# CONFIG_HID_MICROSOFT is not set
CONFIG_HID_MONTEREY=y
CONFIG_HID_MULTITOUCH=y
# CONFIG_HID_NTI is not set
CONFIG_HID_NTRIG=y
# CONFIG_HID_ORTEK is not set
CONFIG_HID_PANTHERLORD=y
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
# CONFIG_HID_PETALYNX is not set
# CONFIG_HID_PICOLCD is not set
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_PRIMAX=y
CONFIG_HID_RETRODE=y
# CONFIG_HID_ROCCAT is not set
# CONFIG_HID_SAITEK is not set
CONFIG_HID_SAMSUNG=y
# CONFIG_HID_SONY is not set
CONFIG_HID_SPEEDLINK=y
CONFIG_HID_STEELSERIES=y
CONFIG_HID_SUNPLUS=y
CONFIG_HID_RMI=y
CONFIG_HID_GREENASIA=y
# CONFIG_GREENASIA_FF is not set
# CONFIG_HID_SMARTJOYPLUS is not set
# CONFIG_HID_TIVO is not set
CONFIG_HID_TOPSEED=y
CONFIG_HID_THINGM=y
# CONFIG_HID_THRUSTMASTER is not set
# CONFIG_HID_UDRAW_PS3 is not set
CONFIG_HID_WACOM=y
# CONFIG_HID_WIIMOTE is not set
CONFIG_HID_XINMO=y
CONFIG_HID_ZEROPLUS=y
CONFIG_ZEROPLUS_FF=y
CONFIG_HID_ZYDACRON=y
CONFIG_HID_SENSOR_HUB=y
# CONFIG_HID_SENSOR_CUSTOM_SENSOR is not set
# CONFIG_HID_ALPS is not set

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set

#
# I2C HID support
#
CONFIG_I2C_HID=y
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
CONFIG_USB_DYNAMIC_MINORS=y
CONFIG_USB_OTG=y
CONFIG_USB_OTG_WHITELIST=y
# CONFIG_USB_OTG_BLACKLIST_HUB is not set
CONFIG_USB_OTG_FSM=y
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_MON=y
CONFIG_USB_WUSB_CBAF=y
CONFIG_USB_WUSB_CBAF_DEBUG=y

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
CONFIG_USB_XHCI_HCD=y
CONFIG_USB_XHCI_PCI=y
CONFIG_USB_XHCI_PLATFORM=y
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
CONFIG_USB_EHCI_HCD_PLATFORM=y
CONFIG_USB_OXU210HP_HCD=y
# CONFIG_USB_ISP116X_HCD is not set
CONFIG_USB_ISP1362_HCD=y
CONFIG_USB_FOTG210_HCD=y
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_SSB is not set
CONFIG_USB_OHCI_HCD_PLATFORM=y
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
CONFIG_USB_HCD_BCMA=y
# CONFIG_USB_HCD_SSB is not set
CONFIG_USB_HCD_TEST_MODE=y

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
CONFIG_USB_WDM=y
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=y
# CONFIG_USB_STORAGE_DEBUG is not set
CONFIG_USB_STORAGE_REALTEK=y
# CONFIG_REALTEK_AUTOPM is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
CONFIG_USB_STORAGE_FREECOM=y
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
CONFIG_USB_STORAGE_SDDR55=y
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
CONFIG_USB_STORAGE_ONETOUCH=y
CONFIG_USB_STORAGE_KARMA=y
CONFIG_USB_STORAGE_CYPRESS_ATACB=y
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
CONFIG_USB_UAS=y

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
CONFIG_USBIP_CORE=y
CONFIG_USBIP_VHCI_HCD=y
CONFIG_USBIP_VHCI_HC_PORTS=8
CONFIG_USBIP_VHCI_NR_HCS=1
CONFIG_USBIP_HOST=y
# CONFIG_USBIP_VUDC is not set
CONFIG_USBIP_DEBUG=y
CONFIG_USB_MUSB_HDRC=y
CONFIG_USB_MUSB_HOST=y
# CONFIG_USB_MUSB_GADGET is not set
# CONFIG_USB_MUSB_DUAL_ROLE is not set

#
# Platform Glue Layer
#

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
CONFIG_USB_DWC3=y
# CONFIG_USB_DWC3_ULPI is not set
# CONFIG_USB_DWC3_HOST is not set
# CONFIG_USB_DWC3_GADGET is not set
CONFIG_USB_DWC3_DUAL_ROLE=y

#
# Platform Glue Driver Support
#
CONFIG_USB_DWC3_PCI=y
CONFIG_USB_DWC3_OF_SIMPLE=y
CONFIG_USB_DWC2=y
CONFIG_USB_DWC2_HOST=y

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
# CONFIG_USB_DWC2_PERIPHERAL is not set
# CONFIG_USB_DWC2_DUAL_ROLE is not set
CONFIG_USB_DWC2_PCI=y
CONFIG_USB_DWC2_DEBUG=y
# CONFIG_USB_DWC2_VERBOSE is not set
CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
CONFIG_USB_DWC2_DEBUG_PERIODIC=y
CONFIG_USB_CHIPIDEA=y
CONFIG_USB_CHIPIDEA_OF=y
CONFIG_USB_CHIPIDEA_PCI=y
CONFIG_USB_CHIPIDEA_UDC=y
CONFIG_USB_CHIPIDEA_HOST=y
# CONFIG_USB_CHIPIDEA_ULPI is not set
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y
# CONFIG_USB_ISP1760_GADGET_ROLE is not set
# CONFIG_USB_ISP1760_DUAL_ROLE is not set

#
# USB port drivers
#
CONFIG_USB_USS720=y
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
CONFIG_USB_EMI26=y
CONFIG_USB_ADUTUX=y
CONFIG_USB_SEVSEG=y
CONFIG_USB_RIO500=y
CONFIG_USB_LEGOTOWER=y
CONFIG_USB_LCD=y
# CONFIG_USB_CYPRESS_CY7C63 is not set
CONFIG_USB_CYTHERM=y
CONFIG_USB_IDMOUSE=y
# CONFIG_USB_FTDI_ELAN is not set
CONFIG_USB_APPLEDISPLAY=y
CONFIG_USB_SISUSBVGA=y
# CONFIG_USB_SISUSBVGA_CON is not set
CONFIG_USB_LD=y
CONFIG_USB_TRANCEVIBRATOR=y
CONFIG_USB_IOWARRIOR=y
CONFIG_USB_TEST=y
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
CONFIG_USB_YUREX=y
CONFIG_USB_EZUSB_FX2=y
CONFIG_USB_HUB_USB251XB=y
CONFIG_USB_HSIC_USB3503=y
CONFIG_USB_HSIC_USB4604=y
CONFIG_USB_LINK_LAYER_TEST=y
# CONFIG_USB_CHAOSKEY is not set
CONFIG_USB_ATM=y
CONFIG_USB_SPEEDTOUCH=y
# CONFIG_USB_CXACRU is not set
# CONFIG_USB_UEAGLEATM is not set
CONFIG_USB_XUSBATM=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_NOP_USB_XCEIV=y
# CONFIG_USB_GPIO_VBUS is not set
CONFIG_USB_ISP1301=y
CONFIG_USB_GADGET=y
# CONFIG_USB_GADGET_DEBUG is not set
CONFIG_USB_GADGET_DEBUG_FILES=y
# CONFIG_USB_GADGET_DEBUG_FS is not set
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
# CONFIG_U_SERIAL_CONSOLE is not set

#
# USB Peripheral Controller
#
CONFIG_USB_FUSB300=y
# CONFIG_USB_FOTG210_UDC is not set
# CONFIG_USB_GR_UDC is not set
CONFIG_USB_R8A66597=y
# CONFIG_USB_PXA27X is not set
CONFIG_USB_MV_UDC=y
CONFIG_USB_MV_U3D=y
CONFIG_USB_SNP_CORE=y
# CONFIG_USB_SNP_UDC_PLAT is not set
CONFIG_USB_M66592=y
# CONFIG_USB_BDC_UDC is not set
CONFIG_USB_AMD5536UDC=y
# CONFIG_USB_NET2272 is not set
CONFIG_USB_NET2280=y
CONFIG_USB_GOKU=y
CONFIG_USB_EG20T=y
CONFIG_USB_GADGET_XILINX=y
# CONFIG_USB_DUMMY_HCD is not set
CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_ACM=y
CONFIG_USB_U_SERIAL=y
CONFIG_USB_U_ETHER=y
CONFIG_USB_F_ECM=y
CONFIG_USB_F_HID=y
CONFIG_USB_F_TCM=y
CONFIG_USB_CONFIGFS=y
# CONFIG_USB_CONFIGFS_SERIAL is not set
CONFIG_USB_CONFIGFS_ACM=y
# CONFIG_USB_CONFIGFS_OBEX is not set
# CONFIG_USB_CONFIGFS_NCM is not set
CONFIG_USB_CONFIGFS_ECM=y
# CONFIG_USB_CONFIGFS_ECM_SUBSET is not set
# CONFIG_USB_CONFIGFS_RNDIS is not set
# CONFIG_USB_CONFIGFS_EEM is not set
# CONFIG_USB_CONFIGFS_MASS_STORAGE is not set
# CONFIG_USB_CONFIGFS_F_LB_SS is not set
# CONFIG_USB_CONFIGFS_F_FS is not set
CONFIG_USB_CONFIGFS_F_HID=y
# CONFIG_USB_CONFIGFS_F_PRINTER is not set
CONFIG_USB_CONFIGFS_F_TCM=y

#
# USB Power Delivery and Type-C drivers
#
# CONFIG_TYPEC_UCSI is not set
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=y
# CONFIG_UWB is not set
CONFIG_MMC=y
CONFIG_PWRSEQ_EMMC=y
CONFIG_PWRSEQ_SIMPLE=y
# CONFIG_MMC_BLOCK is not set
# CONFIG_SDIO_UART is not set
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
# CONFIG_MMC_SDHCI is not set
CONFIG_MMC_WBSD=y
# CONFIG_MMC_TIFM_SD is not set
CONFIG_MMC_GOLDFISH=y
CONFIG_MMC_SDRICOH_CS=y
CONFIG_MMC_CB710=y
CONFIG_MMC_VIA_SDMMC=y
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_REALTEK_PCI=y
CONFIG_MMC_TOSHIBA_PCI=y
CONFIG_MMC_MTK=y
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_88PM860X=y
# CONFIG_LEDS_BCM6328 is not set
# CONFIG_LEDS_BCM6358 is not set
CONFIG_LEDS_LM3530=y
# CONFIG_LEDS_LM3533 is not set
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_PCA9532=y
CONFIG_LEDS_PCA9532_GPIO=y
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=y
CONFIG_LEDS_LP3952=y
CONFIG_LEDS_LP55XX_COMMON=y
CONFIG_LEDS_LP5521=y
CONFIG_LEDS_LP5523=y
CONFIG_LEDS_LP5562=y
# CONFIG_LEDS_LP8501 is not set
# CONFIG_LEDS_LP8860 is not set
CONFIG_LEDS_CLEVO_MAIL=y
# CONFIG_LEDS_PCA955X is not set
CONFIG_LEDS_PCA963X=y
CONFIG_LEDS_WM831X_STATUS=y
CONFIG_LEDS_DA9052=y
CONFIG_LEDS_PWM=y
CONFIG_LEDS_REGULATOR=y
CONFIG_LEDS_BD2802=y
CONFIG_LEDS_INTEL_SS4200=y
# CONFIG_LEDS_LT3593 is not set
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
CONFIG_LEDS_LM355x=y
CONFIG_LEDS_OT200=y
CONFIG_LEDS_MENF21BMC=y
CONFIG_LEDS_IS31FL319X=y
CONFIG_LEDS_IS31FL32XX=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
CONFIG_LEDS_SYSCON=y
CONFIG_LEDS_USER=y
# CONFIG_LEDS_NIC78BX is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
CONFIG_LEDS_TRIGGER_ONESHOT=y
CONFIG_LEDS_TRIGGER_MTD=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
# CONFIG_LEDS_TRIGGER_CPU is not set
CONFIG_LEDS_TRIGGER_GPIO=y
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
# CONFIG_LEDS_TRIGGER_CAMERA is not set
CONFIG_LEDS_TRIGGER_PANIC=y
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
# CONFIG_EDAC_LEGACY_SYSFS is not set
CONFIG_EDAC_DEBUG=y
CONFIG_EDAC_AMD76X=y
CONFIG_EDAC_E7XXX=y
# CONFIG_EDAC_E752X is not set
CONFIG_EDAC_I82875P=y
CONFIG_EDAC_I82975X=y
# CONFIG_EDAC_I3000 is not set
# CONFIG_EDAC_I3200 is not set
CONFIG_EDAC_IE31200=y
# CONFIG_EDAC_X38 is not set
CONFIG_EDAC_I5400=y
CONFIG_EDAC_I82860=y
CONFIG_EDAC_R82600=y
CONFIG_EDAC_I5000=y
CONFIG_EDAC_I5100=y
# CONFIG_EDAC_I7300 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_HD44780=y
CONFIG_KS0108=y
CONFIG_KS0108_PORT=0x378
CONFIG_KS0108_DELAY=2
CONFIG_CFAG12864B=y
CONFIG_CFAG12864B_RATE=20
# CONFIG_IMG_ASCII_LCD is not set
CONFIG_HT16K33=y
CONFIG_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
# CONFIG_PANEL_CHANGE_MESSAGE is not set
CONFIG_UIO=y
# CONFIG_UIO_CIF is not set
CONFIG_UIO_PDRV_GENIRQ=y
CONFIG_UIO_DMEM_GENIRQ=y
CONFIG_UIO_AEC=y
CONFIG_UIO_SERCOS3=y
# CONFIG_UIO_PCI_GENERIC is not set
# CONFIG_UIO_NETX is not set
CONFIG_UIO_PRUSS=y
CONFIG_UIO_MF624=y
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y

#
# Virtio drivers
#
CONFIG_VIRTIO_PCI=y
# CONFIG_VIRTIO_PCI_LEGACY is not set
# CONFIG_VIRTIO_BALLOON is not set
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_MMIO=y
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# CONFIG_HYPERV_TSCPAGE is not set
# CONFIG_STAGING is not set
CONFIG_X86_PLATFORM_DEVICES=y
# CONFIG_ACER_WMI is not set
# CONFIG_ACERHDF is not set
# CONFIG_ALIENWARE_WMI is not set
# CONFIG_ASUS_LAPTOP is not set
# CONFIG_DELL_LAPTOP is not set
# CONFIG_DELL_WMI is not set
# CONFIG_DELL_WMI_AIO is not set
# CONFIG_DELL_WMI_LED is not set
# CONFIG_DELL_SMO8800 is not set
# CONFIG_DELL_RBTN is not set
# CONFIG_FUJITSU_LAPTOP is not set
# CONFIG_FUJITSU_TABLET is not set
# CONFIG_AMILO_RFKILL is not set
# CONFIG_TC1100_WMI is not set
# CONFIG_HP_ACCEL is not set
# CONFIG_HP_WIRELESS is not set
# CONFIG_HP_WMI is not set
# CONFIG_MSI_LAPTOP is not set
# CONFIG_PANASONIC_LAPTOP is not set
# CONFIG_COMPAL_LAPTOP is not set
# CONFIG_SONY_LAPTOP is not set
# CONFIG_IDEAPAD_LAPTOP is not set
# CONFIG_THINKPAD_ACPI is not set
# CONFIG_SENSORS_HDAPS is not set
# CONFIG_INTEL_MENLOW is not set
# CONFIG_EEEPC_LAPTOP is not set
# CONFIG_ASUS_WMI is not set
# CONFIG_ASUS_WIRELESS is not set
CONFIG_ACPI_WMI=y
CONFIG_WMI_BMOF=y
# CONFIG_MSI_WMI is not set
# CONFIG_PEAQ_WMI is not set
# CONFIG_TOPSTAR_LAPTOP is not set
# CONFIG_ACPI_TOSHIBA is not set
# CONFIG_TOSHIBA_BT_RFKILL is not set
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
# CONFIG_ACPI_CMPC is not set
# CONFIG_INTEL_CHT_INT33FE is not set
# CONFIG_INTEL_INT0002_VGPIO is not set
# CONFIG_INTEL_HID_EVENT is not set
# CONFIG_INTEL_VBTN is not set
# CONFIG_INTEL_IPS is not set
# CONFIG_INTEL_PMC_CORE is not set
# CONFIG_IBM_RTL is not set
# CONFIG_XO1_RFKILL is not set
# CONFIG_XO15_EBOOK is not set
# CONFIG_SAMSUNG_LAPTOP is not set
CONFIG_MXM_WMI=y
# CONFIG_INTEL_OAKTRAIL is not set
# CONFIG_SAMSUNG_Q10 is not set
# CONFIG_APPLE_GMUX is not set
# CONFIG_INTEL_RST is not set
# CONFIG_INTEL_SMARTCONNECT is not set
# CONFIG_PVPANIC is not set
# CONFIG_INTEL_PMC_IPC is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
# CONFIG_INTEL_PUNIT_IPC is not set
# CONFIG_MLX_CPLD_PLATFORM is not set
CONFIG_PMC_ATOM=y
CONFIG_GOLDFISH_BUS=y
# CONFIG_GOLDFISH_PIPE is not set
CONFIG_CHROME_PLATFORMS=y
# CONFIG_CHROMEOS_LAPTOP is not set
# CONFIG_CHROMEOS_PSTORE is not set
# CONFIG_CROS_EC_CHARDEV is not set
# CONFIG_CROS_EC_LPC is not set
CONFIG_CROS_EC_PROTO=y
# CONFIG_CROS_KBD_LED_BACKLIGHT is not set
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Common Clock Framework
#
# CONFIG_COMMON_CLK_WM831X is not set
CONFIG_CLK_HSDK=y
CONFIG_COMMON_CLK_MAX77686=y
CONFIG_COMMON_CLK_SI5351=y
CONFIG_COMMON_CLK_SI514=y
CONFIG_COMMON_CLK_SI570=y
CONFIG_COMMON_CLK_CDCE706=y
# CONFIG_COMMON_CLK_CDCE925 is not set
CONFIG_COMMON_CLK_CS2000_CP=y
CONFIG_CLK_TWL6040=y
# CONFIG_COMMON_CLK_NXP is not set
CONFIG_COMMON_CLK_PWM=y
# CONFIG_COMMON_CLK_PXA is not set
# CONFIG_COMMON_CLK_PIC32 is not set
CONFIG_COMMON_CLK_VC5=y
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKSRC_I8253=y
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# CONFIG_ATMEL_PIT is not set
# CONFIG_SH_TIMER_CMT is not set
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_SH_TIMER_TMU is not set
# CONFIG_EM_TIMER_STI is not set
# CONFIG_MAILBOX is not set
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y

#
# Rpmsg drivers
#

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#

#
# Broadcom SoC drivers
#

#
# i.MX SoC drivers
#

#
# Qualcomm SoC drivers
#
# CONFIG_SUNXI_SRAM is not set
CONFIG_SOC_TI=y
CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
# CONFIG_DEVFREQ_GOV_USERSPACE is not set
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=y
CONFIG_EXTCON_AXP288=y
# CONFIG_EXTCON_GPIO is not set
# CONFIG_EXTCON_INTEL_INT3496 is not set
# CONFIG_EXTCON_MAX14577 is not set
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_MAX77693=y
CONFIG_EXTCON_MAX77843=y
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
CONFIG_EXTCON_USBC_CROS_EC=y
# CONFIG_MEMORY is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=y
CONFIG_IIO_SW_TRIGGER=y

#
# Accelerometers
#
# CONFIG_ADXL345_I2C is not set
# CONFIG_BMA180 is not set
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
# CONFIG_DA280 is not set
CONFIG_DA311=y
CONFIG_DMARD06=y
CONFIG_DMARD09=y
CONFIG_DMARD10=y
CONFIG_HID_SENSOR_ACCEL_3D=y
# CONFIG_IIO_ST_ACCEL_3AXIS is not set
CONFIG_KXSD9=y
CONFIG_KXSD9_I2C=y
CONFIG_KXCJK1013=y
CONFIG_MC3230=y
CONFIG_MMA7455=y
CONFIG_MMA7455_I2C=y
CONFIG_MMA7660=y
CONFIG_MMA8452=y
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=y
# CONFIG_MMA9553 is not set
# CONFIG_MXC4005 is not set
# CONFIG_MXC6255 is not set
CONFIG_STK8312=y
# CONFIG_STK8BA50 is not set

#
# Analog to digital converters
#
CONFIG_AD7291=y
CONFIG_AD799X=y
# CONFIG_AXP20X_ADC is not set
CONFIG_AXP288_ADC=y
# CONFIG_CC10001_ADC is not set
CONFIG_DLN2_ADC=y
CONFIG_ENVELOPE_DETECTOR=y
CONFIG_HX711=y
CONFIG_LTC2471=y
# CONFIG_LTC2485 is not set
CONFIG_LTC2497=y
CONFIG_MAX1363=y
# CONFIG_MAX9611 is not set
# CONFIG_MCP3422 is not set
# CONFIG_MEN_Z188_ADC is not set
# CONFIG_NAU7802 is not set
# CONFIG_TI_ADC081C is not set
# CONFIG_VF610_ADC is not set
CONFIG_VIPERBOARD_ADC=y

#
# Amplifiers
#

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
CONFIG_CCS811=y
# CONFIG_IAQCORE is not set
# CONFIG_VZ89X is not set
CONFIG_IIO_CROS_EC_SENSORS_CORE=y
CONFIG_IIO_CROS_EC_SENSORS=y

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=y
CONFIG_HID_SENSOR_IIO_TRIGGER=y
CONFIG_IIO_MS_SENSORS_I2C=y

#
# SSP Sensor Common
#
CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Counters
#

#
# Digital to analog converters
#
CONFIG_AD5064=y
# CONFIG_AD5380 is not set
CONFIG_AD5446=y
# CONFIG_AD5593R is not set
# CONFIG_DPOT_DAC is not set
CONFIG_M62332=y
# CONFIG_MAX517 is not set
CONFIG_MAX5821=y
# CONFIG_MCP4725 is not set
CONFIG_VF610_DAC=y

#
# IIO dummy driver
#
# CONFIG_IIO_SIMPLE_DUMMY is not set

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#

#
# Phase-Locked Loop (PLL) frequency synthesizers
#

#
# Digital gyroscope sensors
#
# CONFIG_BMG160 is not set
CONFIG_HID_SENSOR_GYRO_3D=y
# CONFIG_MPU3050_I2C is not set
CONFIG_IIO_ST_GYRO_3AXIS=y
CONFIG_IIO_ST_GYRO_I2C_3AXIS=y
CONFIG_ITG3200=y

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=y
CONFIG_MAX30100=y
# CONFIG_MAX30102 is not set

#
# Humidity sensors
#
CONFIG_AM2315=y
# CONFIG_DHT11 is not set
CONFIG_HDC100X=y
CONFIG_HID_SENSOR_HUMIDITY=y
# CONFIG_HTS221 is not set
# CONFIG_HTU21 is not set
CONFIG_SI7005=y
# CONFIG_SI7020 is not set

#
# Inertial measurement units
#
# CONFIG_BMI160_I2C is not set
CONFIG_KMX61=y
CONFIG_INV_MPU6050_IIO=y
CONFIG_INV_MPU6050_I2C=y
CONFIG_IIO_ST_LSM6DSX=y
CONFIG_IIO_ST_LSM6DSX_I2C=y

#
# Light sensors
#
# CONFIG_ACPI_ALS is not set
CONFIG_ADJD_S311=y
CONFIG_AL3320A=y
CONFIG_APDS9300=y
# CONFIG_APDS9960 is not set
CONFIG_BH1750=y
CONFIG_BH1780=y
CONFIG_CM32181=y
# CONFIG_CM3232 is not set
CONFIG_CM3323=y
# CONFIG_CM3605 is not set
CONFIG_CM36651=y
CONFIG_IIO_CROS_EC_LIGHT_PROX=y
CONFIG_GP2AP020A00F=y
# CONFIG_SENSORS_ISL29018 is not set
# CONFIG_SENSORS_ISL29028 is not set
CONFIG_ISL29125=y
# CONFIG_HID_SENSOR_ALS is not set
CONFIG_HID_SENSOR_PROX=y
CONFIG_JSA1212=y
CONFIG_RPR0521=y
# CONFIG_SENSORS_LM3533 is not set
# CONFIG_LTR501 is not set
# CONFIG_MAX44000 is not set
# CONFIG_OPT3001 is not set
CONFIG_PA12203001=y
CONFIG_SI1145=y
# CONFIG_STK3310 is not set
CONFIG_TCS3414=y
CONFIG_TCS3472=y
CONFIG_SENSORS_TSL2563=y
# CONFIG_TSL2583 is not set
CONFIG_TSL4531=y
# CONFIG_US5182D is not set
# CONFIG_VCNL4000 is not set
# CONFIG_VEML6070 is not set
CONFIG_VL6180=y

#
# Magnetometer sensors
#
CONFIG_AK8974=y
# CONFIG_AK8975 is not set
# CONFIG_AK09911 is not set
CONFIG_BMC150_MAGN=y
CONFIG_BMC150_MAGN_I2C=y
# CONFIG_MAG3110 is not set
# CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
CONFIG_MMC35240=y
CONFIG_IIO_ST_MAGN_3AXIS=y
CONFIG_IIO_ST_MAGN_I2C_3AXIS=y
# CONFIG_SENSORS_HMC5843_I2C is not set

#
# Multiplexers
#
CONFIG_IIO_MUX=y

#
# Inclinometer sensors
#
# CONFIG_HID_SENSOR_INCLINOMETER_3D is not set
# CONFIG_HID_SENSOR_DEVICE_ROTATION is not set

#
# Triggers - standalone
#
# CONFIG_IIO_HRTIMER_TRIGGER is not set
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
CONFIG_IIO_TIGHTLOOP_TRIGGER=y
CONFIG_IIO_SYSFS_TRIGGER=y

#
# Digital potentiometers
#
CONFIG_DS1803=y
CONFIG_MCP4531=y
CONFIG_TPL0102=y

#
# Digital potentiostats
#
CONFIG_LMP91000=y

#
# Pressure sensors
#
CONFIG_ABP060MG=y
CONFIG_BMP280=y
CONFIG_BMP280_I2C=y
CONFIG_IIO_CROS_EC_BARO=y
# CONFIG_HID_SENSOR_PRESS is not set
CONFIG_HP03=y
# CONFIG_MPL115_I2C is not set
CONFIG_MPL3115=y
CONFIG_MS5611=y
CONFIG_MS5611_I2C=y
CONFIG_MS5637=y
CONFIG_IIO_ST_PRESS=y
CONFIG_IIO_ST_PRESS_I2C=y
# CONFIG_T5403 is not set
CONFIG_HP206C=y
CONFIG_ZPA2326=y
CONFIG_ZPA2326_I2C=y

#
# Lightning sensors
#

#
# Proximity and distance sensors
#
# CONFIG_LIDAR_LITE_V2 is not set
# CONFIG_SRF04 is not set
CONFIG_SX9500=y
CONFIG_SRF08=y

#
# Temperature sensors
#
# CONFIG_HID_SENSOR_TEMP is not set
CONFIG_MLX90614=y
# CONFIG_TMP006 is not set
# CONFIG_TMP007 is not set
CONFIG_TSYS01=y
CONFIG_TSYS02D=y
CONFIG_NTB=y
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
CONFIG_NTB_PERF=y
CONFIG_NTB_TRANSPORT=y
# CONFIG_VME_BUS is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
CONFIG_PWM_ATMEL_HLCDC_PWM=y
CONFIG_PWM_CROS_EC=y
CONFIG_PWM_FSL_FTM=y
# CONFIG_PWM_LP3943 is not set
CONFIG_PWM_LPSS=y
CONFIG_PWM_LPSS_PCI=y
# CONFIG_PWM_LPSS_PLATFORM is not set
# CONFIG_PWM_PCA9685 is not set
CONFIG_PWM_STMPE=y
CONFIG_IRQCHIP=y
CONFIG_ARM_GIC_MAX_NR=1
CONFIG_IPACK_BUS=y
# CONFIG_BOARD_TPCI200 is not set
CONFIG_SERIAL_IPOCTAL=y
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_ATH79 is not set
# CONFIG_RESET_BERLIN is not set
# CONFIG_RESET_HSDK_V1 is not set
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_LANTIQ is not set
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MESON is not set
# CONFIG_RESET_PISTACHIO is not set
# CONFIG_RESET_SOCFPGA is not set
# CONFIG_RESET_STM32 is not set
# CONFIG_RESET_SUNXI is not set
# CONFIG_RESET_TI_SYSCON is not set
# CONFIG_RESET_ZYNQ is not set
# CONFIG_RESET_TEGRA_BPMP is not set
# CONFIG_FMC is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_CPCAP_USB=y
CONFIG_PHY_QCOM_USB_HS=y
# CONFIG_PHY_QCOM_USB_HSIC is not set
CONFIG_PHY_SAMSUNG_USB2=y
# CONFIG_PHY_EXYNOS4210_USB2 is not set
# CONFIG_PHY_EXYNOS4X12_USB2 is not set
# CONFIG_PHY_EXYNOS5250_USB2 is not set
CONFIG_PHY_TUSB1210=y
# CONFIG_POWERCAP is not set
CONFIG_MCB=y
# CONFIG_MCB_PCI is not set
CONFIG_MCB_LPC=y

#
# Performance monitor support
#
CONFIG_RAS=y
# CONFIG_THUNDERBOLT is not set

#
# Android
#
# CONFIG_ANDROID is not set
CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_STM=y
CONFIG_STM_DUMMY=y
# CONFIG_STM_SOURCE_CONSOLE is not set
CONFIG_STM_SOURCE_HEARTBEAT=y
CONFIG_STM_SOURCE_FTRACE=y
CONFIG_INTEL_TH=y
CONFIG_INTEL_TH_PCI=y
# CONFIG_INTEL_TH_GTH is not set
CONFIG_INTEL_TH_STH=y
# CONFIG_INTEL_TH_MSU is not set
# CONFIG_INTEL_TH_PTI is not set
# CONFIG_INTEL_TH_DEBUG is not set
CONFIG_FPGA=y
CONFIG_FPGA_MGR_ALTERA_CVP=y
# CONFIG_FPGA_BRIDGE is not set
# CONFIG_ALTERA_PR_IP_CORE is not set

#
# FSI support
#
CONFIG_FSI=y
CONFIG_FSI_MASTER_GPIO=y
# CONFIG_FSI_MASTER_HUB is not set
CONFIG_FSI_SCOM=y
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=y
CONFIG_MUX_GPIO=y
CONFIG_MUX_MMIO=y

#
# Firmware Drivers
#
# CONFIG_EDD is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DELL_RBU=y
CONFIG_DCDBAS=y
# CONFIG_DMIID is not set
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT_FIND is not set
CONFIG_FW_CFG_SYSFS=y
CONFIG_FW_CFG_SYSFS_CMDLINE=y
# CONFIG_GOOGLE_FIRMWARE is not set
# CONFIG_EFI_DEV_PATH_PARSER is not set

#
# Tegra firmware driver
#

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=y
CONFIG_EXT2_FS_XATTR=y
# CONFIG_EXT2_FS_POSIX_ACL is not set
CONFIG_EXT2_FS_SECURITY=y
CONFIG_EXT3_FS=y
CONFIG_EXT3_FS_POSIX_ACL=y
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
CONFIG_EXT4_ENCRYPTION=y
CONFIG_EXT4_FS_ENCRYPTION=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
CONFIG_JFS_FS=y
CONFIG_JFS_POSIX_ACL=y
# CONFIG_JFS_SECURITY is not set
# CONFIG_JFS_DEBUG is not set
# CONFIG_JFS_STATISTICS is not set
# CONFIG_XFS_FS is not set
CONFIG_GFS2_FS=y
CONFIG_GFS2_FS_LOCKING_DLM=y
# CONFIG_OCFS2_FS is not set
# CONFIG_BTRFS_FS is not set
# CONFIG_NILFS2_FS is not set
# CONFIG_F2FS_FS is not set
CONFIG_FS_DAX=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
# CONFIG_PRINT_QUOTA_WARNING is not set
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_FUSE_FS=y
# CONFIG_CUSE is not set
CONFIG_OVERLAY_FS=y
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
CONFIG_OVERLAY_FS_INDEX=y

#
# Caches
#
CONFIG_FSCACHE=y
# CONFIG_FSCACHE_STATS is not set
CONFIG_FSCACHE_HISTOGRAM=y
CONFIG_FSCACHE_DEBUG=y
# CONFIG_FSCACHE_OBJECT_LIST is not set
CONFIG_CACHEFILES=y
CONFIG_CACHEFILES_DEBUG=y
CONFIG_CACHEFILES_HISTOGRAM=y

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
CONFIG_UDF_FS=y
CONFIG_UDF_NLS=y

#
# DOS/FAT/NT Filesystems
#
CONFIG_FAT_FS=y
# CONFIG_MSDOS_FS is not set
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_NTFS_FS is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
CONFIG_TMPFS_XATTR=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=y
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
CONFIG_ECRYPT_FS=y
# CONFIG_ECRYPT_FS_MESSAGING is not set
CONFIG_HFS_FS=y
CONFIG_HFSPLUS_FS=y
CONFIG_HFSPLUS_FS_POSIX_ACL=y
CONFIG_BEFS_FS=y
CONFIG_BEFS_DEBUG=y
# CONFIG_BFS_FS is not set
CONFIG_EFS_FS=y
# CONFIG_JFFS2_FS is not set
CONFIG_CRAMFS=y
# CONFIG_SQUASHFS is not set
CONFIG_VXFS_FS=y
# CONFIG_MINIX_FS is not set
CONFIG_OMFS_FS=y
# CONFIG_HPFS_FS is not set
CONFIG_QNX4FS_FS=y
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
# CONFIG_PSTORE_ZLIB_COMPRESS is not set
# CONFIG_PSTORE_LZO_COMPRESS is not set
CONFIG_PSTORE_LZ4_COMPRESS=y
CONFIG_PSTORE_CONSOLE=y
CONFIG_PSTORE_PMSG=y
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=y
CONFIG_SYSV_FS=y
CONFIG_UFS_FS=y
CONFIG_UFS_FS_WRITE=y
CONFIG_UFS_DEBUG=y
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
CONFIG_NFS_V4=y
# CONFIG_NFS_SWAP is not set
# CONFIG_NFS_V4_1 is not set
# CONFIG_ROOT_NFS is not set
# CONFIG_NFS_FSCACHE is not set
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DEBUG=y
CONFIG_NFSD=y
# CONFIG_NFSD_V3 is not set
# CONFIG_NFSD_V4 is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=y
# CONFIG_RPCSEC_GSS_KRB5 is not set
CONFIG_SUNRPC_DEBUG=y
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=y
# CONFIG_CIFS_STATS is not set
# CONFIG_CIFS_WEAK_PW_HASH is not set
# CONFIG_CIFS_UPCALL is not set
# CONFIG_CIFS_XATTR is not set
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
# CONFIG_CIFS_DFS_UPCALL is not set
# CONFIG_CIFS_SMB311 is not set
# CONFIG_CIFS_FSCACHE is not set
CONFIG_NCP_FS=y
CONFIG_NCPFS_PACKET_SIGNING=y
# CONFIG_NCPFS_IOCTL_LOCKING is not set
# CONFIG_NCPFS_STRONG is not set
# CONFIG_NCPFS_NFS_NS is not set
CONFIG_NCPFS_OS2_NS=y
# CONFIG_NCPFS_SMALLDOS is not set
CONFIG_NCPFS_NLS=y
# CONFIG_NCPFS_EXTRAS is not set
CONFIG_CODA_FS=y
# CONFIG_AFS_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=y
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=y
# CONFIG_NLS_CODEPAGE_862 is not set
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
# CONFIG_NLS_CODEPAGE_865 is not set
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=y
# CONFIG_NLS_CODEPAGE_950 is not set
CONFIG_NLS_CODEPAGE_932=y
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=y
# CONFIG_NLS_ISO8859_3 is not set
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=y
# CONFIG_NLS_ISO8859_9 is not set
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
CONFIG_NLS_KOI8_U=y
# CONFIG_NLS_MAC_ROMAN is not set
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
# CONFIG_NLS_MAC_CROATIAN is not set
# CONFIG_NLS_MAC_CYRILLIC is not set
# CONFIG_NLS_MAC_GAELIC is not set
CONFIG_NLS_MAC_GREEK=y
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=y
CONFIG_NLS_UTF8=y
CONFIG_DLM=y
CONFIG_DLM_DEBUG=y

#
# Kernel hacking
#
CONFIG_TRACE_IRQFLAGS_SUPPORT=y

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
# CONFIG_DYNAMIC_DEBUG is not set

#
# Compile-time checks and compiler options
#
# CONFIG_DEBUG_INFO is not set
CONFIG_ENABLE_WARN_DEPRECATED=y
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=1024
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_UNUSED_SYMBOLS is not set
# CONFIG_PAGE_OWNER is not set
CONFIG_DEBUG_FS=y
CONFIG_HEADERS_CHECK=y
# CONFIG_DEBUG_SECTION_MISMATCH is not set
# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
CONFIG_FRAME_POINTER=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
# CONFIG_MAGIC_SYSRQ_SERIAL is not set
CONFIG_DEBUG_KERNEL=y

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_PAGE_POISONING=y
CONFIG_PAGE_POISONING_NO_SANITY=y
# CONFIG_PAGE_POISONING_ZERO is not set
# CONFIG_DEBUG_PAGE_REF is not set
CONFIG_DEBUG_RODATA_TEST=y
# CONFIG_DEBUG_OBJECTS is not set
CONFIG_SLUB_DEBUG_ON=y
CONFIG_SLUB_STATS=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_DEBUG_VM is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
# CONFIG_DEBUG_HIGHMEM is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_HAVE_ARCH_KMEMCHECK=y
# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Lockups and Hangs
#
# CONFIG_SOFTLOCKUP_DETECTOR is not set
# CONFIG_HARDLOCKUP_DETECTOR is not set
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_SCHED_DEBUG=y
# CONFIG_SCHED_INFO is not set
# CONFIG_SCHEDSTATS is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
# CONFIG_DEBUG_TIMEKEEPING is not set
CONFIG_DEBUG_PREEMPT=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
CONFIG_WW_MUTEX_SELFTEST=y
CONFIG_STACKTRACE=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
# CONFIG_DEBUG_KOBJECT is not set
CONFIG_DEBUG_BUGVERBOSE=y
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PI_LIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
# CONFIG_PROVE_RCU is not set
# CONFIG_TORTURE_TEST is not set
# CONFIG_RCU_PERF_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=21
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
# CONFIG_FAULT_INJECTION is not set
# CONFIG_LATENCYTOP is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_PREEMPT_TRACER is not set
# CONFIG_SCHED_TRACER is not set
CONFIG_HWLAT_TRACER=y
# CONFIG_FTRACE_SYSCALLS is not set
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_TRACE_BRANCH_PROFILING=y
# CONFIG_BRANCH_PROFILE_NONE is not set
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_PROFILE_ALL_BRANCHES=y
CONFIG_TRACING_BRANCHES=y
CONFIG_BRANCH_TRACER=y
CONFIG_STACK_TRACER=y
CONFIG_BLK_DEV_IO_TRACE=y
# CONFIG_UPROBE_EVENTS is not set
# CONFIG_PROBE_EVENTS is not set
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_FUNCTION_PROFILER=y
CONFIG_FTRACE_MCOUNT_RECORD=y
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_MMIOTRACE is not set
# CONFIG_HIST_TRIGGERS is not set
CONFIG_TRACEPOINT_BENCHMARK=y
CONFIG_RING_BUFFER_BENCHMARK=y
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_TRACING_EVENTS_GPIO is not set

#
# Runtime Testing
#
CONFIG_LKDTM=y
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_TEST_SORT is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
CONFIG_ATOMIC64_SELFTEST=y
CONFIG_TEST_HEXDUMP=y
# CONFIG_TEST_STRING_HELPERS is not set
CONFIG_TEST_KSTRTOX=y
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
CONFIG_TEST_RHASHTABLE=y
# CONFIG_TEST_HASH is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
# CONFIG_DMA_API_DEBUG is not set
CONFIG_TEST_FIRMWARE=y
# CONFIG_TEST_SYSCTL is not set
# CONFIG_TEST_UDELAY is not set
CONFIG_MEMTEST=y
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_SAMPLES is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
CONFIG_UBSAN=y
# CONFIG_UBSAN_SANITIZE_ALL is not set
# CONFIG_UBSAN_ALIGNMENT is not set
# CONFIG_UBSAN_NULL is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
# CONFIG_STRICT_DEVMEM is not set
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
CONFIG_X86_PTDUMP_CORE=y
# CONFIG_X86_PTDUMP is not set
CONFIG_DEBUG_WX=y
CONFIG_DOUBLEFAULT=y
# CONFIG_DEBUG_TLBFLUSH is not set
# CONFIG_IOMMU_STRESS is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
CONFIG_IO_DELAY_TYPE_0X80=0
CONFIG_IO_DELAY_TYPE_0XED=1
CONFIG_IO_DELAY_TYPE_UDELAY=2
CONFIG_IO_DELAY_TYPE_NONE=3
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
CONFIG_IO_DELAY_NONE=y
CONFIG_DEFAULT_IO_DELAY_TYPE=3
# CONFIG_DEBUG_BOOT_PARAMS is not set
# CONFIG_CPA_DEBUG is not set
# CONFIG_OPTIMIZE_INLINING is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
CONFIG_PUNIT_ATOM_DEBUG=y
CONFIG_FRAME_POINTER_UNWINDER=y

#
# Security options
#
CONFIG_KEYS=y
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_BIG_KEYS=y
# CONFIG_TRUSTED_KEYS is not set
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_KEY_DH_OPERATIONS is not set
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITY=y
CONFIG_SECURITY_WRITABLE_HOOKS=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_NETWORK_XFRM=y
# CONFIG_SECURITY_PATH is not set
CONFIG_LSM_MMAP_MIN_ADDR=65536
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
# CONFIG_FORTIFY_SOURCE is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_SELINUX=y
# CONFIG_SECURITY_SELINUX_BOOTPARAM is not set
CONFIG_SECURITY_SELINUX_DISABLE=y
CONFIG_SECURITY_SELINUX_DEVELOP=y
# CONFIG_SECURITY_SELINUX_AVC_STATS is not set
CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=0
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
CONFIG_SECURITY_LOADPIN=y
# CONFIG_SECURITY_LOADPIN_ENABLED is not set
CONFIG_SECURITY_YAMA=y
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
# CONFIG_INTEGRITY_ASYMMETRIC_KEYS is not set
# CONFIG_INTEGRITY_AUDIT is not set
# CONFIG_IMA is not set
# CONFIG_EVM is not set
# CONFIG_DEFAULT_SECURITY_SELINUX is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_DEFAULT_SECURITY=""
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_BLKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_ECDH is not set
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=y
CONFIG_CRYPTO_WORKQUEUE=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_MCRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_ABLK_HELPER=y
CONFIG_CRYPTO_GLUE_HELPER_X86=y

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XTS=y
# CONFIG_CRYPTO_KEYWRAP is not set

#
# Hash modes
#
# CONFIG_CRYPTO_CMAC is not set
CONFIG_CRYPTO_HMAC=y
# CONFIG_CRYPTO_XCBC is not set
CONFIG_CRYPTO_VMAC=y

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_INTEL=y
CONFIG_CRYPTO_CRC32=y
# CONFIG_CRYPTO_CRC32_PCLMUL is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
# CONFIG_CRYPTO_RMD128 is not set
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_RMD256=y
# CONFIG_CRYPTO_RMD320 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
CONFIG_CRYPTO_TGR192=y
# CONFIG_CRYPTO_WP512 is not set

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
CONFIG_CRYPTO_AES_586=y
# CONFIG_CRYPTO_AES_NI_INTEL is not set
# CONFIG_CRYPTO_ANUBIS is not set
CONFIG_CRYPTO_ARC4=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=y
# CONFIG_CRYPTO_KHAZAD is not set
# CONFIG_CRYPTO_SALSA20 is not set
# CONFIG_CRYPTO_SALSA20_586 is not set
CONFIG_CRYPTO_CHACHA20=y
# CONFIG_CRYPTO_SEED is not set
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SERPENT_SSE2_586=y
CONFIG_CRYPTO_TEA=y
# CONFIG_CRYPTO_TWOFISH is not set
CONFIG_CRYPTO_TWOFISH_COMMON=y
CONFIG_CRYPTO_TWOFISH_586=y

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
# CONFIG_CRYPTO_LZO is not set
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=y
# CONFIG_CRYPTO_USER_API_RNG is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_PADLOCK is not set
CONFIG_CRYPTO_DEV_GEODE=y
CONFIG_CRYPTO_DEV_HIFN_795X=y
# CONFIG_CRYPTO_DEV_HIFN_795X_RNG is not set
# CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_DESC is not set
CONFIG_CRYPTO_DEV_CCP=y
# CONFIG_CRYPTO_DEV_CCP_DD is not set
CONFIG_CRYPTO_DEV_QAT=y
CONFIG_CRYPTO_DEV_QAT_DH895xCC=y
CONFIG_CRYPTO_DEV_QAT_C3XXX=y
# CONFIG_CRYPTO_DEV_QAT_C62X is not set
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=y
# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
CONFIG_CRYPTO_DEV_QAT_C62XVF=y
# CONFIG_CRYPTO_DEV_CHELSIO is not set
# CONFIG_CRYPTO_DEV_VIRTIO is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS7_MESSAGE_PARSER is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
CONFIG_SYSTEM_EXTRA_CERTIFICATE=y
CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=4096
CONFIG_SECONDARY_TRUSTED_KEYRING=y
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
CONFIG_HAVE_KVM=y
# CONFIG_VIRTUALIZATION is not set
CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_BITREVERSE=y
# CONFIG_HAVE_ARCH_BITREVERSE is not set
CONFIG_RATIONAL=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_GENERIC_IO=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_AUDIT_GENERIC=y
# CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=y
CONFIG_BCH_CONST_PARAMS=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=y
CONFIG_TEXTSEARCH_BM=y
CONFIG_TEXTSEARCH_FSM=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
# CONFIG_DMA_NOOP_OPS is not set
# CONFIG_DMA_VIRT_OPS is not set
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_CORDIC=y
CONFIG_DDR=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_FONT_SUPPORT=y
CONFIG_FONTS=y
# CONFIG_FONT_8x8 is not set
CONFIG_FONT_8x16=y
# CONFIG_FONT_6x11 is not set
# CONFIG_FONT_7x14 is not set
CONFIG_FONT_PEARL_8x8=y
# CONFIG_FONT_ACORN_8x8 is not set
CONFIG_FONT_MINI_4x6=y
CONFIG_FONT_6x10=y
# CONFIG_FONT_10x18 is not set
# CONFIG_FONT_SUN8x16 is not set
# CONFIG_FONT_SUN12x22 is not set
# CONFIG_SG_SPLIT is not set
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_SG_CHAIN=y
CONFIG_SBITMAP=y
CONFIG_STRING_SELFTEST=y

--=_59ebc4a8.la70dycVkjxahXE5wAtj33PwzrR6eeNh+KTjKU72vRdy4Owk--
