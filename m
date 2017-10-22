From: Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [of] c810c0a17e BUG: unable to handle kernel paging request at
 6b6b6b6b
Date: Mon, 23 Oct 2017 02:29:06 +0800
Message-ID: <20171022182906.godtmavsjcuait2b@wfg-t540p.sh.intel.com>
References: <59ebc4a8.j7dAqYigPV5Jdu9G%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="yobwwn5mohwvacnn"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <59ebc4a8.j7dAqYigPV5Jdu9G%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lixin Wang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
Cc: wfg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKP <lkp-JC7UmRfGjtg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--yobwwn5mohwvacnn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lixin,

FYI, here is another bug triggered by

https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next

commit c810c0a17e019d1e4345bcbc49b6eddcf5dd001d
Author:     Lixin Wang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
AuthorDate: Fri Oct 20 09:59:09 2017 +0800
Commit:     Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
CommitDate: Fri Oct 20 10:27:33 2017 -0500

     of: dynamic: fix memory leak related to properties of __of_node_dup
     
     If a node with no properties is dynamically added, then a property is
     dynamically added to the node, then the property is dynamically removed,
     the result will be node->properties == NULL and node->deadprops != NULL.
     
     Add a separate function to release the properties in both lists.
     
     Signed-off-by: Lixin Wang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
     Reviewed-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
     Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

4ee7c0d964  of: overlay: make pr_err() string unique
c810c0a17e  of: dynamic: fix memory leak related to properties of __of_node_dup
c810c0a17e  of: dynamic: fix memory leak related to properties of __of_node_dup
+-------------------------------------------------------------+------------+------------+------------+
|                                                             | 4ee7c0d964 | c810c0a17e | c810c0a17e |
+-------------------------------------------------------------+------------+------------+------------+
| boot_successes                                              | 1          | 0          | 0          |
| boot_failures                                               | 47         | 15         | 15         |
| es#_lib.c:#ess_reset_at#:failed                             | 37         | 15         | 15         |
| WARNING:at_arch/x86/mm/tlb.c:#initialize_tlbstate_and_flush | 2          | 2          | 2          |
| EIP:initialize_tlbstate_and_flush                           | 2          | 2          | 2          |
| BUG:workqueue_lockup-pool                                   | 10         |            |            |
| WARNING:kernel_stack                                        | 1          |            |            |
| BUG:unable_to_handle_kernel                                 | 0          | 15         | 15         |
| Oops:#[##]                                                  | 0          | 15         | 15         |
| EIP:property_list_free                                      | 0          | 15         | 15         |
| Kernel_panic-not_syncing:Fatal_exception                    | 0          | 15         | 15         |
+-------------------------------------------------------------+------------+------------+------------+

[  100.467439] OF: overlay: node_overlaps_later_cs: #6 overlaps with #7 @/testcase-data/overlay-node/test-bus/test-unittest8
[  100.469350] OF: overlay: overlay #6 is not topmost
[  100.483290] BUG: unable to handle kernel paging request at 6b6b6b6b
[  100.484270] IP: property_list_free+0x8/0x6e
[  100.484895] *pde = 00000000
[  100.485329] Oops: 0000 [#1] SMP
[  100.485817] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.14.0-rc1-00047-gc810c0a #1
[  100.486932] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014
[  100.488085] task: 8f43c040 task.stack: 8f43e000
[  100.488712] EIP: property_list_free+0x8/0x6e
[  100.489324] EFLAGS: 00210202 CPU: 0
[  100.489847] EAX: 00200246 EBX: 6b6b6b6b ECX: 00000004 EDX: 00000007
[  100.492481] ESI: 8dced700 EDI: 828ea738 EBP: 8f43fe08 ESP: 8f43fe04
[  100.493433]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
[  100.494219] CR0: 80050033 CR2: 6b6b6b6b CR3: 02c1e000 CR4: 00000690
[  100.495122] Call Trace:
[  100.495498]  of_node_release+0x7d/0xe9
[  100.496066]  kobject_put+0x132/0x19b
[  100.496586]  of_node_put+0x2b/0x3b
[  100.497106]  of_changeset_destroy+0x34/0x9a
[  100.497748]  free_overlay_changeset+0x36/0xf1
[  100.498360]  of_overlay_remove+0x3d9/0x452
[  100.498960]  ? platform_device_put+0x2b/0x3b
[  100.499610]  of_unittest_apply_revert_overlay_check+0x17b/0x297
[  100.500665]  of_unittest_overlay+0xc8a/0x1179
[  100.501258]  of_unittest+0xf74/0x1009
[  100.501778]  ? kobject_add+0x89/0x9d
[  100.502285]  ? add_sysfs_fw_map_entry+0xa8/0xef
[  100.502986]  ? of_unittest_overlay+0x1179/0x1179
[  100.503672]  do_one_initcall+0x10e/0x263
[  100.504263]  ? parse_args+0x23f/0x3bd
[  100.504883]  ? kernel_init_freeable+0x222/0x3c6
[  100.505613]  kernel_init_freeable+0x24c/0x3c6
[  100.506251]  ? rest_init+0x43a/0x43a
[  100.506713]  kernel_init+0x16/0x248
[  100.507130]  ret_from_fork+0x19/0x30
[  100.507566] Code: 00 00 00 8b 50 24 89 53 28 89 58 24 3e 80 63 50 fb 83 05 90 d6 8b 84 01 83 15 94 d6 8b 84 00 58 5b 5d c3 55 89
e5 53 89 c3 eb 51 <8b> 03 83 05 98 d7 8b 84 01 83 15 9c d7 8b 84 00 e8 ea 3b 45 ff
[  100.510025] EIP: property_list_free+0x8/0x6e SS:ESP: 0068:8f43fe04
                                                           # HH:MM RESULT GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
git bisect start 227bce24b050beee52867e026e92e03e944c8ce4 33d930e59a98fa10a0db9f56c7fa2f21a4aef9b9 --
git bisect  bad c984b398ef43624c3d27240a22eada56263e9b90  # 18:26  B      0     3   19   4  Merge 'renesas-drivers/sh-pfc-for-v4.15' into devel-hourly-2017102111
git bisect  bad 96eb39168a471cda84010eb8101a5ed8ea1643dc  # 19:31  B      0     1   17   4  Merge 'daeinki-drm-exynos/fixes/exynos-drm-fixes-for-v4.14-rc5' into devel-hourly-2017102111
git bisect good c975db1a8af80e951a4cf9b6335dbf007cdc2910  # 20:41  G     10     0   10  14  Merge 'vkoul-soundwire/topic/patch_v1' into devel-hourly-2017102111
git bisect good 82cfe9bb8eadbcd33e85f0177c256a60c0264a1e  # 21:28  G     11     0   11  11  Merge 'robclark/msm-next-wip' into devel-hourly-2017102111
git bisect  bad 71e1ffe3feb6bd9741377292f6a2053ba8db3cb9  # 22:07  B      0     9   21   0  Merge 'kbuild/fixes' into devel-hourly-2017102111
git bisect good 748badd589d8a3e5224d8ebb5968dfe26665efe3  # 22:52  G     11     0   11  15  Merge 'linux-review/Willem-de-Bruijn/sock-correct-sk_wmem_queued-accounting-on-efault-in-tcp-zerocopy/20171021-060957' into devel-hourly-2017102111
git bisect good 183e80a3082ac768745b31465bd3360c997c8f69  # 23:33  G     11     0   11  15  Merge 'robh/dt/testing' into devel-hourly-2017102111
git bisect good a51e5ec261634da00b45480e367247fb303da406  # 00:51  G     11     0   11  15  Merge 'dm/for-4.15/dm' into devel-hourly-2017102111
git bisect  bad a761d220ab2dcc898979a84a889e05bee2009176  # 01:08  B      0     1   13   0  Merge 'robh/dt/next' into devel-hourly-2017102111
git bisect good 87f242c119c403e8b948c8b95eca4ab6212fd1a9  # 01:32  G     11     0   11  13  of: overlay: expand check of whether overlay changeset can be removed
git bisect good e0a58f3e08d4b7fa8e2a4075c522f1a98c9e4cab  # 01:57  G     11     0   10  10  of: overlay: remove a dependency on device node full_name
git bisect good a1d19bd4cf1febf0d5ff60243826a248bd20f1a5  # 03:45  G     11     0   10  14  of: overlay: pr_err from return NOTIFY_OK to overlay apply/remove
git bisect  bad c810c0a17e019d1e4345bcbc49b6eddcf5dd001d  # 05:31  B      0     2   19   5  of: dynamic: fix memory leak related to properties of __of_node_dup
git bisect good 4ee7c0d9649d472d31969b9cbb8151161db6a807  # 05:55  G     11     0   11  15  of: overlay: make pr_err() string unique
# first bad commit: [c810c0a17e019d1e4345bcbc49b6eddcf5dd001d] of: dynamic: fix memory leak related to properties of __of_node_dup
git bisect good 4ee7c0d9649d472d31969b9cbb8151161db6a807  # 06:42  G     30     0   29  44  of: overlay: make pr_err() string unique
# extra tests with CONFIG_DEBUG_INFO_REDUCED
git bisect  bad c810c0a17e019d1e4345bcbc49b6eddcf5dd001d  # 07:39  B      0    11   27   4  of: dynamic: fix memory leak related to properties of __of_node_dup
# extra tests on HEAD of linux-devel/devel-hourly-2017102111
git bisect  bad 227bce24b050beee52867e026e92e03e944c8ce4  # 07:39  B      0    13   28   0  0day head guard for 'devel-hourly-2017102111'
# extra tests on tree/branch robh/for-next
git bisect  bad c810c0a17e019d1e4345bcbc49b6eddcf5dd001d  # 07:46  B      0    15   27   0  of: dynamic: fix memory leak related to properties of __of_node_dup
# extra tests with first bad commit reverted
git bisect good 773db3dc93897f3a5cc2fe3b9d9698696c9ea367  # 10:04  G     11     0   10  10  Revert "of: dynamic: fix memory leak related to properties of __of_node_dup"

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/lkp                          Intel Corporation

--yobwwn5mohwvacnn
Content-Type: application/gzip
Content-Disposition: attachment; filename="dmesg-yocto-intel12-14:20171022040020:i386-randconfig-h0-10211618:4.14.0-rc1-00047-gc810c0a:1.gz"
Content-Transfer-Encoding: base64

H4sICLP861kAA2RtZXNnLXlvY3RvLWludGVsMTItMTQ6MjAxNzEwMjIwNDAwMjA6aTM4Ni1y
YW5kY29uZmlnLWgwLTEwMjExNjE4OjQuMTQuMC1yYzEtMDAwNDctZ2M4MTBjMGE6MQCsW2tz
2ziy/XzzK3prP6x8ryUDfFNV2lo/5Fhly9ZYzkx2U1MqigRljvkaPhwrtT/+doOkXpQcJ2NX
JRLJxkEDbHSfbkDCycIluEmcJ6GAIIZcFGWKNzzxQew+Ey9F5rjF7ElksQg/BHFaFjPPKZw+
sBemcc1jFqtvhyKWd5ljCqFoH5KywNvyFmfyr761klQUU9cd90OFPiuSwglnefBNyKfqXCjU
6MOFcJMozUSeB/ECboK4fOn1ejBxMnljeHNJl7cJZCJMXKcIkhhiITzh0X0viUXvw1mSFCRc
PAqouut9+AL4x3qVbr9XwPAsEBUBtB7XeqybubyLTzWzu3AtzlzmQOdpXgah96/wKe0+5jiK
I+gsXHfV0ugpPQYK4wazGYfOhZgHTn27qx4dwd85TMcTmJYx3LkFKAowta9rfa7B+fSBWpq7
ul0P72+HN5CXaZpkhfDATcu8vysFcDq+gNMSBxkXgYsXbYmHzInzSBQOfBRxGcTiYfxiGa/J
rb6dTz7tyuGtPg489pJsFnjwjxpzFBci/AeU8VOcfI2PoZQvaiFikQUu2lVQtGZfIv07KTPI
l3khIoicJcwFYuSFMw9FqwFqfeKnZR+/mHA5+QRfgzDEngRcfp6e/jrclReWwvpwNrqbdtMs
eQ7QPCB9XOaB64RwfzrGDtPWjErxquWXCJUi897+627dsv257/+OWpDKPwRm+24bzCcwNHyR
PQvvh+D8tm7+z8Px1lB93+P+Tw0VWyotsJ/WzRc+TdwmHN36abgKbQvuu9p5Yl4u+hAs4iQj
Ow+TRSieRUielZxOy3Tn6IwaJ/tF+lwEJhONaS5b+Lfoulz0ibefoTN8EW5ZCLgI5LwfAdpy
IVzp81wnjpOCFk0N1Ic4ibuT02Ht8v62i4wr20uiPvhOXshlKb3lrtR0TBMGSs8C8sLoW1oj
uhiP+vDLcPwJpgViOpkHk3PoBJrGLj/D/8FkNPp8DNy2jaNjOf3Ae5z1lC4Hpp0wfoJOT9sF
vVqmON9BnmQ4xTRIGtH1r+NduSJ3+3BJQ3iYnuMshME8q6JA5Xcmo4f9zqBMMZSJXRto3v2G
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
//5SWHpECXqmr377ih7v/wda1y4GybkAAA==

--yobwwn5mohwvacnn
Content-Type: application/gzip
Content-Disposition: attachment; filename="dmesg-vm-lkp-hsw01-openwrt-ia32-14:20171022055105:i386-randconfig-h0-10211618:4.14.0-rc1-00046-g4ee7c0d:1.gz"
Content-Transfer-Encoding: base64

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

--yobwwn5mohwvacnn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="reproduce-yocto-intel12-14:20171022040020:i386-randconfig-h0-10211618:4.14.0-rc1-00047-gc810c0a:1"

#!/bin/bash

kernel=$1
initrd=yocto-trinity-i386.cgz

wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/master/initrd/$initrd

kvm=(
	qemu-system-x86_64
	-enable-kvm
	-cpu Haswell,+smep,+smap
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

--yobwwn5mohwvacnn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="config-4.14.0-rc1-00047-gc810c0a"

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
CONFIG_CONSTRUCTORS=y
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
# CONFIG_KERNEL_LZMA is not set
CONFIG_KERNEL_XZ=y
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SWAP is not set
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
# CONFIG_POSIX_MQUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_FHANDLE=y
CONFIG_USELIB=y
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

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
CONFIG_IRQ_DOMAIN_DEBUG=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
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
# CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_IRQ_TIME_ACCOUNTING is not set
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=32
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_FAST_NO_HZ is not set
# CONFIG_RCU_NOCB_CPU is not set
CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_LOG_BUF_SHIFT=17
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CGROUPS=y
# CONFIG_MEMCG is not set
# CONFIG_BLK_CGROUP is not set
# CONFIG_CGROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CPUSETS is not set
CONFIG_CGROUP_DEVICE=y
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_DEBUG is not set
# CONFIG_SOCK_CGROUP_DATA is not set
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
# CONFIG_IPC_NS is not set
# CONFIG_USER_NS is not set
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
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SYSCTL=y
CONFIG_ANON_INODES=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_BPF=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
# CONFIG_SYSFS_SYSCALL is not set
# CONFIG_SYSCTL_SYSCALL is not set
CONFIG_POSIX_TIMERS=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
# CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_PRINTK=y
CONFIG_PRINTK_NMI=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
# CONFIG_BASE_FULL is not set
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
# CONFIG_EVENTFD is not set
CONFIG_BPF_SYSCALL=y
# CONFIG_SHMEM is not set
CONFIG_AIO=y
# CONFIG_ADVISE_SYSCALLS is not set
# CONFIG_USERFAULTFD is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_MEMBARRIER is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PC104=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_COMPAT_BRK=y
CONFIG_SLAB=y
# CONFIG_SLUB is not set
# CONFIG_SLOB is not set
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SYSTEM_DATA_VERIFICATION is not set
CONFIG_PROFILING=y
CONFIG_OPROFILE=y
CONFIG_OPROFILE_EVENT_MULTIPLEX=y
CONFIG_HAVE_OPROFILE=y
CONFIG_OPROFILE_NMI_TIMER=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
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
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP_FILTER=y
CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
CONFIG_GCC_PLUGIN_CYC_COMPLEXITY=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
CONFIG_GCC_PLUGIN_STRUCTLEAK=y
# CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL is not set
# CONFIG_GCC_PLUGIN_STRUCTLEAK_VERBOSE is not set
# CONFIG_GCC_PLUGIN_RANDSTRUCT is not set
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
CONFIG_ISA_BUS_API=y
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
CONFIG_GCOV_KERNEL=y
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
CONFIG_GCOV_PROFILE_ALL=y
CONFIG_GCOV_FORMAT_AUTODETECT=y
# CONFIG_GCOV_FORMAT_3_4 is not set
# CONFIG_GCOV_FORMAT_4_7 is not set
CONFIG_HAVE_GENERIC_DMA_COHERENT=y
CONFIG_SLABINFO=y
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=1
# CONFIG_MODULES is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_LBDAF=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_ZONED=y
# CONFIG_BLK_CMDLINE_PARSER is not set
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_SQ=y
# CONFIG_BLK_WBT_MQ is not set
CONFIG_BLK_DEBUG_FS=y
# CONFIG_BLK_SED_OPAL is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
CONFIG_ACORN_PARTITION=y
CONFIG_ACORN_PARTITION_CUMANA=y
# CONFIG_ACORN_PARTITION_EESOX is not set
# CONFIG_ACORN_PARTITION_ICS is not set
# CONFIG_ACORN_PARTITION_ADFS is not set
CONFIG_ACORN_PARTITION_POWERTEC=y
CONFIG_ACORN_PARTITION_RISCIX=y
# CONFIG_AIX_PARTITION is not set
CONFIG_OSF_PARTITION=y
# CONFIG_AMIGA_PARTITION is not set
CONFIG_ATARI_PARTITION=y
CONFIG_MAC_PARTITION=y
# CONFIG_MSDOS_PARTITION is not set
# CONFIG_LDM_PARTITION is not set
CONFIG_SGI_PARTITION=y
CONFIG_ULTRIX_PARTITION=y
CONFIG_SUN_PARTITION=y
CONFIG_KARMA_PARTITION=y
# CONFIG_EFI_PARTITION is not set
# CONFIG_SYSV68_PARTITION is not set
# CONFIG_CMDLINE_PARTITION is not set
CONFIG_BLK_MQ_PCI=y

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=y
CONFIG_IOSCHED_DEADLINE=y
CONFIG_IOSCHED_CFQ=y
CONFIG_DEFAULT_DEADLINE=y
# CONFIG_DEFAULT_CFQ is not set
# CONFIG_DEFAULT_NOOP is not set
CONFIG_DEFAULT_IOSCHED="deadline"
# CONFIG_MQ_IOSCHED_DEADLINE is not set
# CONFIG_MQ_IOSCHED_KYBER is not set
CONFIG_IOSCHED_BFQ=y
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
# CONFIG_X86_MPPARSE is not set
CONFIG_X86_BIGSMP=y
CONFIG_GOLDFISH=y
# CONFIG_X86_EXTENDED_PLATFORM is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
# CONFIG_IOSF_MBI is not set
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
# CONFIG_M686 is not set
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
CONFIG_MWINCHIP3D=y
# CONFIG_MELAN is not set
# CONFIG_MGEODEGX1 is not set
# CONFIG_MGEODE_LX is not set
# CONFIG_MCYRIXIII is not set
# CONFIG_MVIAC3_2 is not set
# CONFIG_MVIAC7 is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_X86_GENERIC=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_ALIGNMENT_16=y
CONFIG_X86_INTEL_USERCOPY=y
CONFIG_X86_USE_PPRO_CHECKSUM=y
CONFIG_X86_TSC=y
CONFIG_X86_MINIMUM_CPU_FAMILY=4
CONFIG_PROCESSOR_SELECT=y
# CONFIG_CPU_SUP_INTEL is not set
# CONFIG_CPU_SUP_CYRIX_32 is not set
CONFIG_CPU_SUP_AMD=y
# CONFIG_CPU_SUP_CENTAUR is not set
CONFIG_CPU_SUP_TRANSMETA_32=y
# CONFIG_CPU_SUP_UMC_32 is not set
CONFIG_HPET_TIMER=y
CONFIG_DMI=y
CONFIG_NR_CPUS=32
CONFIG_SCHED_SMT=y
# CONFIG_SCHED_MC is not set
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
# CONFIG_X86_MCE is not set

#
# Performance monitoring
#
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# CONFIG_X86_LEGACY_VM86 is not set
# CONFIG_VM86 is not set
CONFIG_TOSHIBA=y
# CONFIG_I8K is not set
CONFIG_X86_REBOOTFIXUPS=y
# CONFIG_MICROCODE is not set
# CONFIG_X86_MSR is not set
CONFIG_X86_CPUID=y
# CONFIG_NOHIGHMEM is not set
CONFIG_HIGHMEM4G=y
# CONFIG_HIGHMEM64G is not set
# CONFIG_VMSPLIT_3G is not set
# CONFIG_VMSPLIT_3G_OPT is not set
CONFIG_VMSPLIT_2G=y
# CONFIG_VMSPLIT_2G_OPT is not set
# CONFIG_VMSPLIT_1G is not set
CONFIG_PAGE_OFFSET=0x80000000
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
CONFIG_MEMORY_ISOLATION=y
# CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_COMPACTION=y
CONFIG_MIGRATION=y
# CONFIG_PHYS_ADDR_T_64BIT is not set
# CONFIG_BOUNCE is not set
CONFIG_VIRT_TO_BUS=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
# CONFIG_TRANSPARENT_HUGEPAGE is not set
# CONFIG_ARCH_WANTS_THP_SWAP is not set
CONFIG_CLEANCACHE=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
CONFIG_CMA_AREAS=7
CONFIG_ZPOOL=y
CONFIG_ZBUD=y
CONFIG_Z3FOLD=y
CONFIG_ZSMALLOC=y
CONFIG_PGTABLE_MAPPING=y
# CONFIG_ZSMALLOC_STAT is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=y
# CONFIG_IDLE_PAGE_TRACKING is not set
# CONFIG_PERCPU_STATS is not set
CONFIG_HIGHPTE=y
# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
CONFIG_X86_RESERVE_LOW=64
# CONFIG_MTRR is not set
# CONFIG_ARCH_RANDOM is not set
CONFIG_X86_SMAP=y
# CONFIG_EFI is not set
CONFIG_SECCOMP=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
# CONFIG_KEXEC is not set
CONFIG_CRASH_DUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
CONFIG_DEBUG_HOTPLUG_CPU0=y
CONFIG_COMPAT_VDSO=y
# CONFIG_CMDLINE_BOOL is not set
# CONFIG_MODIFY_LDT_SYSCALL is not set
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y

#
# Power management and ACPI options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_SUSPEND_SKIP_SYNC is not set
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_OPP=y
CONFIG_PM_CLK=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
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
# CONFIG_ACPI_VIDEO is not set
CONFIG_ACPI_FAN=y
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_HOTPLUG_CPU=y
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
CONFIG_ACPI_THERMAL=y
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
CONFIG_SFI=y
# CONFIG_APM is not set

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
# CONFIG_CPU_FREQ_GOV_SCHEDUTIL is not set

#
# CPU frequency scaling drivers
#
# CONFIG_CPUFREQ_DT is not set
# CONFIG_X86_INTEL_PSTATE is not set
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_ACPI_CPUFREQ is not set
CONFIG_X86_POWERNOW_K6=y
CONFIG_X86_POWERNOW_K7=y
CONFIG_X86_POWERNOW_K7_ACPI=y
# CONFIG_X86_GX_SUSPMOD is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_SPEEDSTEP_ICH=y
CONFIG_X86_SPEEDSTEP_SMI=y
CONFIG_X86_P4_CLOCKMOD=y
CONFIG_X86_CPUFREQ_NFORCE2=y
# CONFIG_X86_LONGRUN is not set
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
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set

#
# Bus options (PCI etc.)
#
CONFIG_PCI=y
# CONFIG_PCI_GOBIOS is not set
# CONFIG_PCI_GOMMCONFIG is not set
# CONFIG_PCI_GODIRECT is not set
CONFIG_PCI_GOANY=y
CONFIG_PCI_BIOS=y
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_PCI_DOMAINS=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_PCIEPORTBUS is not set
# CONFIG_PCI_MSI is not set
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
# CONFIG_PCI_STUB is not set
CONFIG_HT_IRQ=y
CONFIG_PCI_LOCKLESS_CONFIG=y
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
# CONFIG_HOTPLUG_PCI is not set

#
# DesignWare PCI Core Support
#

#
# PCI host controller drivers
#

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
CONFIG_ISA_BUS=y
CONFIG_ISA_DMA_API=y
CONFIG_ISA=y
CONFIG_EISA=y
# CONFIG_EISA_VLB_PRIMING is not set
CONFIG_EISA_PCI_EISA=y
CONFIG_EISA_VIRTUAL_ROOT=y
CONFIG_EISA_NAMES=y
CONFIG_SCx200=y
# CONFIG_SCx200HR_TIMER is not set
# CONFIG_OLPC is not set
# CONFIG_ALIX is not set
CONFIG_NET5501=y
CONFIG_GEOS=y
CONFIG_AMD_NB=y
CONFIG_PCCARD=y
CONFIG_PCMCIA=y
# CONFIG_PCMCIA_LOAD_CIS is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
# CONFIG_YENTA is not set
# CONFIG_PD6729 is not set
# CONFIG_I82092 is not set
# CONFIG_I82365 is not set
CONFIG_TCIC=y
CONFIG_PCMCIA_PROBE=y
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
CONFIG_BINFMT_AOUT=y
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
CONFIG_COMPAT_32=y
CONFIG_HAVE_ATOMIC_IOMAP=y
CONFIG_NET=y

#
# Networking options
#
# CONFIG_PACKET is not set
CONFIG_UNIX=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_NET_KEY is not set
# CONFIG_INET is not set
# CONFIG_NETWORK_SECMARK is not set
# CONFIG_NET_PTP_CLASSIFY is not set
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_ATM is not set
# CONFIG_BRIDGE is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_DECNET is not set
# CONFIG_LLC2 is not set
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
# CONFIG_DNS_RESOLVER is not set
# CONFIG_BATMAN_ADV is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
# CONFIG_MPLS is not set
# CONFIG_NET_NSH is not set
# CONFIG_HSR is not set
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
# CONFIG_BPF_STREAM_PARSER is not set
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_BT is not set
# CONFIG_STREAM_PARSER is not set
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set
# CONFIG_LIB80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_WIMAX is not set
# CONFIG_RFKILL is not set
# CONFIG_NET_9P is not set
# CONFIG_CAIF is not set
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
# CONFIG_DST_CACHE is not set
# CONFIG_GRO_CELLS is not set
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
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set
CONFIG_FW_LOADER=y
CONFIG_FIRMWARE_IN_KERNEL=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
CONFIG_DEBUG_DEVRES=y
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_SYS_HYPERVISOR is not set
# CONFIG_GENERIC_CPU_DEVICES is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
CONFIG_DMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_PERCENTAGE=0
# CONFIG_CMA_SIZE_SEL_MBYTES is not set
CONFIG_CMA_SIZE_SEL_PERCENTAGE=y
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8

#
# Bus devices
#
# CONFIG_SIMPLE_PM_BUS is not set
# CONFIG_CONNECTOR is not set
# CONFIG_MTD is not set
CONFIG_DTC=y
CONFIG_OF=y
CONFIG_OF_UNITTEST=y
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_ADDRESS_PCI=y
CONFIG_OF_IRQ=y
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
CONFIG_PARPORT_AX88796=y
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
CONFIG_ISAPNP=y
CONFIG_PNPBIOS=y
# CONFIG_PNPBIOS_PROC_FS is not set
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=y
CONFIG_BLK_DEV_FD=y
# CONFIG_PARIDE is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
# CONFIG_BLK_DEV_DAC960 is not set
# CONFIG_BLK_DEV_UMEM is not set
# CONFIG_BLK_DEV_COW_COMMON is not set
CONFIG_BLK_DEV_LOOP=y
CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
CONFIG_BLK_DEV_CRYPTOLOOP=y

#
# DRBD disabled because PROC_FS or INET not selected
#
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_SX8 is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_BLK_DEV_RAM_DAX=y
CONFIG_CDROM_PKTCDVD=y
CONFIG_CDROM_PKTCDVD_BUFFERS=8
CONFIG_CDROM_PKTCDVD_WCACHE=y
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_BLK_DEV_RSXX is not set
CONFIG_NVME_CORE=y
# CONFIG_BLK_DEV_NVME is not set
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
CONFIG_NVME_TARGET=y
CONFIG_NVME_TARGET_LOOP=y
CONFIG_NVME_TARGET_FC=y
CONFIG_NVME_TARGET_FCLOOP=y

#
# Misc devices
#
# CONFIG_SENSORS_LIS3LV02D is not set
CONFIG_AD525X_DPOT=y
# CONFIG_AD525X_DPOT_I2C is not set
# CONFIG_AD525X_DPOT_SPI is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
# CONFIG_SGI_IOC4 is not set
# CONFIG_TIFM_CORE is not set
CONFIG_ICS932S401=y
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_HP_ILO is not set
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
# CONFIG_ISL29020 is not set
# CONFIG_SENSORS_TSL2550 is not set
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
CONFIG_HMC6352=y
# CONFIG_DS1682 is not set
CONFIG_TI_DAC7512=y
# CONFIG_PCH_PHUB is not set
# CONFIG_USB_SWITCH_FSA9480 is not set
CONFIG_LATTICE_ECP3_CONFIG=y
# CONFIG_SRAM is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_AT25=y
# CONFIG_EEPROM_LEGACY is not set
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_93XX46=y
CONFIG_EEPROM_IDT_89HPESX=y
# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# CONFIG_SENSORS_LIS3_I2C is not set

#
# Altera FPGA firmware download module
#
CONFIG_ALTERA_STAPL=y
# CONFIG_INTEL_MEI is not set
# CONFIG_INTEL_MEI_ME is not set
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_VMWARE_VMCI is not set

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
# CONFIG_RAID_ATTRS is not set
# CONFIG_SCSI is not set
# CONFIG_SCSI_DMA is not set
# CONFIG_SCSI_NETLINK is not set
# CONFIG_ATA is not set
# CONFIG_MD is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
CONFIG_MACINTOSH_DRIVERS=y
# CONFIG_MAC_EMUMOUSEBTN is not set
# CONFIG_NETDEVICES is not set
CONFIG_NVM=y
# CONFIG_NVM_DEBUG is not set
# CONFIG_NVM_RRPC is not set
CONFIG_NVM_PBLK=y

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
# CONFIG_INPUT_FF_MEMLESS is not set
# CONFIG_INPUT_POLLDEV is not set
# CONFIG_INPUT_SPARSEKMAP is not set
# CONFIG_INPUT_MATRIXKMAP is not set

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5520 is not set
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
# CONFIG_KEYBOARD_OMAP4 is not set
# CONFIG_KEYBOARD_TC3589X is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CAP11XX is not set
# CONFIG_KEYBOARD_BCM is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
# CONFIG_MOUSE_PS2_ELANTECH is not set
# CONFIG_MOUSE_PS2_SENTELIC is not set
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
# CONFIG_MOUSE_PS2_VMMOUSE is not set
CONFIG_MOUSE_PS2_SMBUS=y
# CONFIG_MOUSE_SERIAL is not set
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
# CONFIG_MOUSE_CYAPA is not set
# CONFIG_MOUSE_ELAN_I2C is not set
# CONFIG_MOUSE_INPORT is not set
# CONFIG_MOUSE_LOGIBM is not set
# CONFIG_MOUSE_PC110PAD is not set
# CONFIG_MOUSE_VSXXXAA is not set
# CONFIG_MOUSE_GPIO is not set
# CONFIG_MOUSE_SYNAPTICS_I2C is not set
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
# CONFIG_RMI4_CORE is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
# CONFIG_SERIO_ALTERA_PS2 is not set
# CONFIG_SERIO_PS2MULT is not set
# CONFIG_SERIO_ARC_PS2 is not set
# CONFIG_SERIO_APBPS2 is not set
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=y
# CONFIG_GAMEPORT_L4 is not set
# CONFIG_GAMEPORT_EMU10K1 is not set
# CONFIG_GAMEPORT_FM801 is not set

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_NOZOMI is not set
# CONFIG_N_GSM is not set
CONFIG_TRACE_ROUTER=y
CONFIG_TRACE_SINK=y
# CONFIG_GOLDFISH_TTY is not set
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
CONFIG_SERIAL_8250_EXAR=y
# CONFIG_SERIAL_8250_CS is not set
CONFIG_SERIAL_8250_MEN_MCB=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
# CONFIG_SERIAL_8250_MANY_PORTS is not set
CONFIG_SERIAL_8250_ASPEED_VUART=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
# CONFIG_SERIAL_8250_FSL is not set
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
# CONFIG_SERIAL_8250_MOXA is not set
CONFIG_SERIAL_OF_PLATFORM=y

#
# Non-8250 serial port support
#
CONFIG_SERIAL_MAX3100=y
CONFIG_SERIAL_MAX310X=y
CONFIG_SERIAL_UARTLITE=y
# CONFIG_SERIAL_UARTLITE_CONSOLE is not set
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
CONFIG_SERIAL_SCCNXP=y
CONFIG_SERIAL_SCCNXP_CONSOLE=y
# CONFIG_SERIAL_SC16IS7XX is not set
CONFIG_SERIAL_TIMBERDALE=y
CONFIG_SERIAL_ALTERA_JTAGUART=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_ALTERA_UART_CONSOLE=y
CONFIG_SERIAL_IFX6X60=y
# CONFIG_SERIAL_PCH_UART is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
CONFIG_SERIAL_ARC=y
# CONFIG_SERIAL_ARC_CONSOLE is not set
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
CONFIG_SERIAL_MEN_Z135=y
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_TTY_PRINTK=y
# CONFIG_PRINTER is not set
CONFIG_PPDEV=y
# CONFIG_IPMI_HANDLER is not set
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
CONFIG_HW_RANDOM_INTEL=y
CONFIG_HW_RANDOM_AMD=y
CONFIG_HW_RANDOM_GEODE=y
CONFIG_HW_RANDOM_VIA=y
# CONFIG_HW_RANDOM_TPM is not set
CONFIG_NVRAM=y
# CONFIG_DTLK is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set
# CONFIG_SONYPI is not set

#
# PCMCIA character devices
#
CONFIG_SYNCLINK_CS=y
CONFIG_CARDMAN_4000=y
CONFIG_CARDMAN_4040=y
# CONFIG_SCR24X is not set
# CONFIG_MWAVE is not set
# CONFIG_SCx200_GPIO is not set
CONFIG_PC8736x_GPIO=y
CONFIG_NSC_GPIO=y
CONFIG_RAW_DRIVER=y
CONFIG_MAX_RAW_DEVS=256
# CONFIG_HPET is not set
CONFIG_HANGCHECK_TIMER=y
CONFIG_TCG_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
CONFIG_TCG_TIS_SPI=y
CONFIG_TCG_TIS_I2C_ATMEL=y
CONFIG_TCG_TIS_I2C_INFINEON=y
CONFIG_TCG_TIS_I2C_NUVOTON=y
CONFIG_TCG_NSC=y
# CONFIG_TCG_ATMEL is not set
# CONFIG_TCG_INFINEON is not set
# CONFIG_TCG_CRB is not set
CONFIG_TCG_VTPM_PROXY=y
CONFIG_TCG_TIS_ST33ZP24=y
CONFIG_TCG_TIS_ST33ZP24_I2C=y
CONFIG_TCG_TIS_ST33ZP24_SPI=y
CONFIG_TELCLOCK=y
# CONFIG_DEVPORT is not set
CONFIG_XILLYBUS=y
# CONFIG_XILLYBUS_OF is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
CONFIG_I2C_MUX_GPIO=y
CONFIG_I2C_MUX_GPMUX=y
CONFIG_I2C_MUX_LTC4306=y
CONFIG_I2C_MUX_PCA9541=y
# CONFIG_I2C_MUX_PCA954x is not set
CONFIG_I2C_MUX_REG=y
CONFIG_I2C_MUX_MLXCPLD=y
CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_ISMT is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
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
CONFIG_I2C_DESIGNWARE_SLAVE=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EG20T is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
CONFIG_I2C_KEMPLD=y
CONFIG_I2C_OCORES=y
CONFIG_I2C_PCA_PLATFORM=y
# CONFIG_I2C_PXA is not set
# CONFIG_I2C_PXA_PCI is not set
# CONFIG_I2C_RK3X is not set
CONFIG_I2C_SIMTEC=y
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
# CONFIG_I2C_DLN2 is not set
CONFIG_I2C_PARPORT=y
CONFIG_I2C_PARPORT_LIGHT=y
CONFIG_I2C_ROBOTFUZZ_OSIF=y
# CONFIG_I2C_TAOS_EVM is not set
CONFIG_I2C_TINY_USB=y
CONFIG_I2C_VIPERBOARD=y

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_PCA_ISA is not set
# CONFIG_SCx200_ACB is not set
CONFIG_I2C_SLAVE=y
# CONFIG_I2C_SLAVE_EEPROM is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ALTERA=y
CONFIG_SPI_AXI_SPI_ENGINE=y
CONFIG_SPI_BITBANG=y
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
CONFIG_SPI_DESIGNWARE=y
# CONFIG_SPI_DW_PCI is not set
CONFIG_SPI_DW_MMIO=y
# CONFIG_SPI_DLN2 is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_FSL_SPI is not set
CONFIG_SPI_OC_TINY=y
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_PXA2XX_PCI is not set
CONFIG_SPI_ROCKCHIP=y
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_TOPCLIFF_PCH is not set
CONFIG_SPI_XCOMM=y
CONFIG_SPI_XILINX=y
CONFIG_SPI_ZYNQMP_GQSPI=y

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=y
CONFIG_SPI_TLE62X0=y
CONFIG_SPI_SLAVE=y
CONFIG_SPI_SLAVE_TIME=y
# CONFIG_SPI_SLAVE_SYSTEM_CONTROL is not set
CONFIG_SPMI=y
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
# CONFIG_PPS_CLIENT_LDISC is not set
CONFIG_PPS_CLIENT_PARPORT=y
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
# CONFIG_PTP_1588_CLOCK is not set

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# CONFIG_PTP_1588_CLOCK_PCH is not set
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
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_FTGPIO010 is not set
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_GRGPIO=y
# CONFIG_GPIO_ICH is not set
# CONFIG_GPIO_LYNXPOINT is not set
# CONFIG_GPIO_MENZ127 is not set
CONFIG_GPIO_MOCKUP=y
CONFIG_GPIO_SYSCON=y
# CONFIG_GPIO_VX855 is not set
CONFIG_GPIO_XILINX=y

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_104_DIO_48E=y
CONFIG_GPIO_104_IDIO_16=y
# CONFIG_GPIO_104_IDI_48 is not set
CONFIG_GPIO_F7188X=y
# CONFIG_GPIO_GPIO_MM is not set
CONFIG_GPIO_IT87=y
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
CONFIG_GPIO_WS16C48=y

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADP5588=y
# CONFIG_GPIO_ADP5588_IRQ is not set
CONFIG_GPIO_ADNP=y
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
# CONFIG_GPIO_MAX732X_IRQ is not set
CONFIG_GPIO_PCA953X=y
# CONFIG_GPIO_PCA953X_IRQ is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set

#
# MFD GPIO expanders
#
# CONFIG_GPIO_ADP5520 is not set
CONFIG_GPIO_ARIZONA=y
# CONFIG_GPIO_BD9571MWV is not set
# CONFIG_GPIO_DA9052 is not set
# CONFIG_GPIO_DLN2 is not set
CONFIG_GPIO_KEMPLD=y
CONFIG_GPIO_LP3943=y
CONFIG_GPIO_LP873X=y
# CONFIG_GPIO_PALMAS is not set
CONFIG_GPIO_TC3589X=y
CONFIG_GPIO_TPS65086=y
# CONFIG_GPIO_TPS65218 is not set
# CONFIG_GPIO_TPS6586X is not set
# CONFIG_GPIO_TPS65912 is not set
CONFIG_GPIO_TWL6040=y
CONFIG_GPIO_UCB1400=y
CONFIG_GPIO_WM831X=y
CONFIG_GPIO_WM8994=y

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_RDC321X is not set
# CONFIG_GPIO_SODAVILLE is not set

#
# SPI GPIO expanders
#
CONFIG_GPIO_74X164=y
CONFIG_GPIO_MAX7301=y
# CONFIG_GPIO_MC33880 is not set
CONFIG_GPIO_PISOSR=y
# CONFIG_GPIO_XRA1403 is not set

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=y
CONFIG_W1=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
CONFIG_W1_MASTER_DS2490=y
CONFIG_W1_MASTER_DS2482=y
CONFIG_W1_MASTER_DS1WM=y
# CONFIG_W1_MASTER_GPIO is not set

#
# 1-wire Slaves
#
# CONFIG_W1_SLAVE_THERM is not set
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=y
# CONFIG_W1_SLAVE_DS2408 is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=y
# CONFIG_W1_SLAVE_DS2431 is not set
CONFIG_W1_SLAVE_DS2433=y
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS2760=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
# CONFIG_W1_SLAVE_DS28E04 is not set
# CONFIG_POWER_AVS is not set
# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
# CONFIG_PDA_POWER is not set
CONFIG_MAX8925_POWER=y
# CONFIG_WM831X_BACKUP is not set
CONFIG_WM831X_POWER=y
# CONFIG_TEST_POWER is not set
CONFIG_BATTERY_88PM860X=y
# CONFIG_BATTERY_ACT8945A is not set
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=y
# CONFIG_BATTERY_DS2782 is not set
CONFIG_BATTERY_SBS=y
# CONFIG_CHARGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=y
# CONFIG_BATTERY_BQ27XXX_HDQ is not set
# CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
CONFIG_BATTERY_DA9030=y
CONFIG_BATTERY_DA9052=y
CONFIG_BATTERY_MAX17040=y
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_BATTERY_MAX1721X is not set
CONFIG_CHARGER_88PM860X=y
CONFIG_CHARGER_ISP1704=y
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
# CONFIG_CHARGER_LTC3651 is not set
CONFIG_CHARGER_DETECTOR_MAX14656=y
CONFIG_CHARGER_MAX8997=y
CONFIG_CHARGER_BQ2415X=y
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=y
# CONFIG_CHARGER_BQ24735 is not set
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_SMB347=y
# CONFIG_CHARGER_TPS65217 is not set
CONFIG_BATTERY_GAUGE_LTC2941=y
CONFIG_BATTERY_GOLDFISH=y
CONFIG_CHARGER_RT9455=y
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=y
CONFIG_SENSORS_ABITUGURU3=y
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=y
CONFIG_SENSORS_AD7418=y
CONFIG_SENSORS_ADM1021=y
CONFIG_SENSORS_ADM1025=y
# CONFIG_SENSORS_ADM1026 is not set
CONFIG_SENSORS_ADM1029=y
# CONFIG_SENSORS_ADM1031 is not set
CONFIG_SENSORS_ADM9240=y
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7310=y
CONFIG_SENSORS_ADT7410=y
# CONFIG_SENSORS_ADT7411 is not set
CONFIG_SENSORS_ADT7462=y
# CONFIG_SENSORS_ADT7470 is not set
# CONFIG_SENSORS_ADT7475 is not set
# CONFIG_SENSORS_ASC7621 is not set
# CONFIG_SENSORS_K8TEMP is not set
# CONFIG_SENSORS_K10TEMP is not set
# CONFIG_SENSORS_FAM15H_POWER is not set
# CONFIG_SENSORS_APPLESMC is not set
CONFIG_SENSORS_ASB100=y
CONFIG_SENSORS_ASPEED=y
CONFIG_SENSORS_ATXP1=y
CONFIG_SENSORS_DS620=y
# CONFIG_SENSORS_DS1621 is not set
CONFIG_SENSORS_DELL_SMM=y
CONFIG_SENSORS_DA9052_ADC=y
# CONFIG_SENSORS_I5K_AMB is not set
CONFIG_SENSORS_F71805F=y
# CONFIG_SENSORS_F71882FG is not set
CONFIG_SENSORS_F75375S=y
CONFIG_SENSORS_MC13783_ADC=y
CONFIG_SENSORS_FSCHMD=y
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=y
CONFIG_SENSORS_G760A=y
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_GPIO_FAN is not set
# CONFIG_SENSORS_HIH6130 is not set
# CONFIG_SENSORS_I5500 is not set
# CONFIG_SENSORS_CORETEMP is not set
CONFIG_SENSORS_IT87=y
# CONFIG_SENSORS_JC42 is not set
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=y
CONFIG_SENSORS_LTC2945=y
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC4151=y
# CONFIG_SENSORS_LTC4215 is not set
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=y
CONFIG_SENSORS_LTC4260=y
CONFIG_SENSORS_LTC4261=y
CONFIG_SENSORS_MAX1111=y
# CONFIG_SENSORS_MAX16065 is not set
# CONFIG_SENSORS_MAX1619 is not set
# CONFIG_SENSORS_MAX1668 is not set
CONFIG_SENSORS_MAX197=y
CONFIG_SENSORS_MAX31722=y
CONFIG_SENSORS_MAX6639=y
CONFIG_SENSORS_MAX6642=y
CONFIG_SENSORS_MAX6650=y
CONFIG_SENSORS_MAX6697=y
CONFIG_SENSORS_MAX31790=y
CONFIG_SENSORS_MCP3021=y
# CONFIG_SENSORS_TC654 is not set
CONFIG_SENSORS_MENF21BMC_HWMON=y
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=y
CONFIG_SENSORS_LM70=y
CONFIG_SENSORS_LM73=y
CONFIG_SENSORS_LM75=y
# CONFIG_SENSORS_LM77 is not set
CONFIG_SENSORS_LM78=y
CONFIG_SENSORS_LM80=y
CONFIG_SENSORS_LM83=y
CONFIG_SENSORS_LM85=y
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=y
CONFIG_SENSORS_LM92=y
CONFIG_SENSORS_LM93=y
CONFIG_SENSORS_LM95234=y
# CONFIG_SENSORS_LM95241 is not set
CONFIG_SENSORS_LM95245=y
CONFIG_SENSORS_PC87360=y
CONFIG_SENSORS_PC87427=y
CONFIG_SENSORS_NTC_THERMISTOR=y
CONFIG_SENSORS_NCT6683=y
# CONFIG_SENSORS_NCT6775 is not set
CONFIG_SENSORS_NCT7802=y
CONFIG_SENSORS_NCT7904=y
CONFIG_SENSORS_PCF8591=y
CONFIG_PMBUS=y
CONFIG_SENSORS_PMBUS=y
# CONFIG_SENSORS_ADM1275 is not set
# CONFIG_SENSORS_IBM_CFFPS is not set
CONFIG_SENSORS_IR35221=y
# CONFIG_SENSORS_LM25066 is not set
CONFIG_SENSORS_LTC2978=y
CONFIG_SENSORS_LTC2978_REGULATOR=y
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_MAX16064=y
CONFIG_SENSORS_MAX20751=y
# CONFIG_SENSORS_MAX34440 is not set
CONFIG_SENSORS_MAX8688=y
CONFIG_SENSORS_TPS40422=y
CONFIG_SENSORS_TPS53679=y
CONFIG_SENSORS_UCD9000=y
# CONFIG_SENSORS_UCD9200 is not set
CONFIG_SENSORS_ZL6100=y
# CONFIG_SENSORS_PWM_FAN is not set
CONFIG_SENSORS_SHT15=y
CONFIG_SENSORS_SHT21=y
CONFIG_SENSORS_SHT3x=y
CONFIG_SENSORS_SHTC1=y
# CONFIG_SENSORS_SIS5595 is not set
CONFIG_SENSORS_DME1737=y
# CONFIG_SENSORS_EMC1403 is not set
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC6W201=y
# CONFIG_SENSORS_SMSC47M1 is not set
# CONFIG_SENSORS_SMSC47M192 is not set
CONFIG_SENSORS_SMSC47B397=y
# CONFIG_SENSORS_SCH56XX_COMMON is not set
CONFIG_SENSORS_STTS751=y
CONFIG_SENSORS_SMM665=y
CONFIG_SENSORS_ADC128D818=y
CONFIG_SENSORS_ADS1015=y
CONFIG_SENSORS_ADS7828=y
CONFIG_SENSORS_ADS7871=y
CONFIG_SENSORS_AMC6821=y
CONFIG_SENSORS_INA209=y
CONFIG_SENSORS_INA2XX=y
CONFIG_SENSORS_INA3221=y
CONFIG_SENSORS_TC74=y
# CONFIG_SENSORS_THMC50 is not set
CONFIG_SENSORS_TMP102=y
# CONFIG_SENSORS_TMP103 is not set
CONFIG_SENSORS_TMP108=y
CONFIG_SENSORS_TMP401=y
CONFIG_SENSORS_TMP421=y
CONFIG_SENSORS_VIA_CPUTEMP=y
# CONFIG_SENSORS_VIA686A is not set
CONFIG_SENSORS_VT1211=y
# CONFIG_SENSORS_VT8231 is not set
# CONFIG_SENSORS_W83781D is not set
# CONFIG_SENSORS_W83791D is not set
# CONFIG_SENSORS_W83792D is not set
CONFIG_SENSORS_W83793=y
# CONFIG_SENSORS_W83795 is not set
CONFIG_SENSORS_W83L785TS=y
CONFIG_SENSORS_W83L786NG=y
CONFIG_SENSORS_W83627HF=y
CONFIG_SENSORS_W83627EHF=y
# CONFIG_SENSORS_WM831X is not set

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
# CONFIG_SENSORS_ATK0110 is not set
CONFIG_THERMAL=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_HWMON is not set
CONFIG_THERMAL_OF=y
# CONFIG_THERMAL_WRITABLE_TRIPS is not set
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=y
# CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
# CONFIG_THERMAL_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
CONFIG_CPU_THERMAL=y
# CONFIG_CLOCK_THERMAL is not set
# CONFIG_DEVFREQ_THERMAL is not set
# CONFIG_THERMAL_EMULATION is not set
CONFIG_QORIQ_THERMAL=y
# CONFIG_DA9062_THERMAL is not set
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# CONFIG_INTEL_PCH_THERMAL is not set
# CONFIG_WATCHDOG is not set
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
CONFIG_SSB_SDIOHOST=y
CONFIG_SSB_SILENT=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
# CONFIG_SSB_DRIVER_PCICORE is not set
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_CS5535 is not set
CONFIG_MFD_ACT8945A=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_AS3722 is not set
CONFIG_PMIC_ADP5520=y
CONFIG_MFD_AAT2870_CORE=y
CONFIG_MFD_ATMEL_FLEXCOM=y
CONFIG_MFD_ATMEL_HLCDC=y
CONFIG_MFD_BCM590XX=y
CONFIG_MFD_BD9571MWV=y
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_CROS_EC is not set
CONFIG_PMIC_DA903X=y
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_SPI=y
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=y
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_DLN2=y
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_SPI=y
CONFIG_MFD_MC13XXX_I2C=y
# CONFIG_MFD_HI6421_PMIC is not set
CONFIG_HTC_PASIC3=y
CONFIG_HTC_I2CPLD=y
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
# CONFIG_INTEL_SOC_PMIC is not set
# CONFIG_INTEL_SOC_PMIC_CHTWC is not set
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
# CONFIG_MFD_INTEL_LPSS_PCI is not set
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
CONFIG_MFD_88PM860X=y
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77620 is not set
# CONFIG_MFD_MAX77686 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
CONFIG_MFD_MAX8925=y
CONFIG_MFD_MAX8997=y
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=y
# CONFIG_EZX_PCAP is not set
CONFIG_MFD_CPCAP=y
CONFIG_MFD_VIPERBOARD=y
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
CONFIG_UCB1400_CORE=y
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RTSX_PCI is not set
# CONFIG_MFD_RT5033 is not set
CONFIG_MFD_RTSX_USB=y
# CONFIG_MFD_RC5T583 is not set
CONFIG_MFD_RK808=y
CONFIG_MFD_RN5T618=y
# CONFIG_MFD_SEC_CORE is not set
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SM501=y
# CONFIG_MFD_SM501_GPIO is not set
CONFIG_MFD_SKY81452=y
CONFIG_MFD_SMSC=y
CONFIG_ABX500_CORE=y
CONFIG_AB3100_CORE=y
# CONFIG_AB3100_OTP is not set
# CONFIG_MFD_STMPE is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=y
CONFIG_MFD_PALMAS=y
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TPS65217=y
# CONFIG_MFD_TPS68470 is not set
CONFIG_MFD_TI_LP873X=y
# CONFIG_MFD_TI_LP87565 is not set
CONFIG_MFD_TPS65218=y
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=y
# CONFIG_MFD_TPS65912_I2C is not set
CONFIG_MFD_TPS65912_SPI=y
CONFIG_MFD_TPS80031=y
# CONFIG_TWL4030_CORE is not set
CONFIG_TWL6040_CORE=y
# CONFIG_MFD_WL1273_CORE is not set
CONFIG_MFD_LM3533=y
# CONFIG_MFD_TIMBERDALE is not set
CONFIG_MFD_TC3589X=y
# CONFIG_MFD_TMIO is not set
# CONFIG_MFD_VX855 is not set
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_ARIZONA_SPI=y
CONFIG_MFD_CS47L24=y
# CONFIG_MFD_WM5102 is not set
CONFIG_MFD_WM5110=y
# CONFIG_MFD_WM8997 is not set
CONFIG_MFD_WM8998=y
CONFIG_MFD_WM8400=y
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=y
CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
CONFIG_REGULATOR_88PM800=y
# CONFIG_REGULATOR_88PM8607 is not set
# CONFIG_REGULATOR_ACT8865 is not set
CONFIG_REGULATOR_ACT8945A=y
CONFIG_REGULATOR_AD5398=y
# CONFIG_REGULATOR_ANATOP is not set
CONFIG_REGULATOR_AAT2870=y
CONFIG_REGULATOR_AB3100=y
CONFIG_REGULATOR_ARIZONA_LDO1=y
CONFIG_REGULATOR_ARIZONA_MICSUPP=y
CONFIG_REGULATOR_BCM590XX=y
CONFIG_REGULATOR_BD9571MWV=y
CONFIG_REGULATOR_CPCAP=y
# CONFIG_REGULATOR_DA903X is not set
CONFIG_REGULATOR_DA9052=y
CONFIG_REGULATOR_DA9062=y
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=y
# CONFIG_REGULATOR_GPIO is not set
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=y
CONFIG_REGULATOR_LM363X=y
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=y
CONFIG_REGULATOR_LP872X=y
CONFIG_REGULATOR_LP873X=y
# CONFIG_REGULATOR_LP8755 is not set
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX8649=y
# CONFIG_REGULATOR_MAX8660 is not set
# CONFIG_REGULATOR_MAX8925 is not set
CONFIG_REGULATOR_MAX8952=y
CONFIG_REGULATOR_MAX8973=y
CONFIG_REGULATOR_MAX8997=y
CONFIG_REGULATOR_MC13XXX_CORE=y
CONFIG_REGULATOR_MC13783=y
CONFIG_REGULATOR_MC13892=y
# CONFIG_REGULATOR_MT6311 is not set
CONFIG_REGULATOR_PALMAS=y
CONFIG_REGULATOR_PFUZE100=y
# CONFIG_REGULATOR_PV88060 is not set
CONFIG_REGULATOR_PV88080=y
# CONFIG_REGULATOR_PV88090 is not set
CONFIG_REGULATOR_PWM=y
CONFIG_REGULATOR_QCOM_SPMI=y
# CONFIG_REGULATOR_RK808 is not set
# CONFIG_REGULATOR_RN5T618 is not set
CONFIG_REGULATOR_SKY81452=y
CONFIG_REGULATOR_TPS51632=y
# CONFIG_REGULATOR_TPS62360 is not set
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=y
CONFIG_REGULATOR_TPS65086=y
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS65217=y
CONFIG_REGULATOR_TPS65218=y
# CONFIG_REGULATOR_TPS6524X is not set
# CONFIG_REGULATOR_TPS6586X is not set
# CONFIG_REGULATOR_TPS65912 is not set
CONFIG_REGULATOR_TPS80031=y
CONFIG_REGULATOR_VCTRL=y
CONFIG_REGULATOR_WM831X=y
CONFIG_REGULATOR_WM8400=y
CONFIG_REGULATOR_WM8994=y
CONFIG_RC_CORE=y
CONFIG_RC_MAP=y
CONFIG_RC_DECODERS=y
# CONFIG_LIRC is not set
CONFIG_IR_NEC_DECODER=y
CONFIG_IR_RC5_DECODER=y
CONFIG_IR_RC6_DECODER=y
CONFIG_IR_JVC_DECODER=y
CONFIG_IR_SONY_DECODER=y
CONFIG_IR_SANYO_DECODER=y
CONFIG_IR_SHARP_DECODER=y
CONFIG_IR_MCE_KBD_DECODER=y
CONFIG_IR_XMP_DECODER=y
# CONFIG_RC_DEVICES is not set
# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_VGA_SWITCHEROO is not set
CONFIG_DRM=y
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
CONFIG_DRM_DEBUG_MM=y
CONFIG_DRM_DEBUG_MM_SELFTEST=y
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_KMS_FB_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_GEM_CMA_HELPER=y
CONFIG_DRM_KMS_CMA_HELPER=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
CONFIG_DRM_I2C_SIL164=y
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set

#
# ACP (Audio CoProcessor) Configuration
#
# CONFIG_DRM_NOUVEAU is not set
# CONFIG_DRM_I915 is not set
CONFIG_DRM_VGEM=y
# CONFIG_DRM_VMWGFX is not set
# CONFIG_DRM_GMA500 is not set
CONFIG_DRM_UDL=y
# CONFIG_DRM_AST is not set
# CONFIG_DRM_MGAG200 is not set
# CONFIG_DRM_CIRRUS_QEMU is not set
# CONFIG_DRM_RCAR_DW_HDMI is not set
# CONFIG_DRM_QXL is not set
# CONFIG_DRM_BOCHS is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_LVDS=y
# CONFIG_DRM_PANEL_SIMPLE is not set
# CONFIG_DRM_PANEL_INNOLUX_P079ZCA is not set
CONFIG_DRM_PANEL_JDI_LT070ME05000=y
# CONFIG_DRM_PANEL_SAMSUNG_LD9040 is not set
CONFIG_DRM_PANEL_LG_LG4573=y
CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=y
CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=y
# CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
# CONFIG_DRM_PANEL_SHARP_LQ101R1SX01 is not set
# CONFIG_DRM_PANEL_SHARP_LS043T1LE01 is not set
# CONFIG_DRM_PANEL_SITRONIX_ST7789V is not set
CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
CONFIG_DRM_DUMB_VGA_DAC=y
CONFIG_DRM_LVDS_ENCODER=y
# CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
# CONFIG_DRM_NXP_PTN3460 is not set
# CONFIG_DRM_PARADE_PS8622 is not set
# CONFIG_DRM_SIL_SII8620 is not set
CONFIG_DRM_SII902X=y
CONFIG_DRM_TOSHIBA_TC358767=y
# CONFIG_DRM_TI_TFP410 is not set
CONFIG_DRM_I2C_ADV7511=y
# CONFIG_DRM_I2C_ADV7511_AUDIO is not set
CONFIG_DRM_I2C_ADV7533=y
# CONFIG_DRM_ARCPGU is not set
# CONFIG_DRM_HISI_HIBMC is not set
# CONFIG_DRM_MXSFB is not set
CONFIG_DRM_TINYDRM=y
CONFIG_TINYDRM_MIPI_DBI=y
CONFIG_TINYDRM_MI0283QT=y
CONFIG_TINYDRM_REPAPER=y
CONFIG_TINYDRM_ST7586=y
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_LIB_RANDOM=y

#
# Frame buffer Devices
#
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
# CONFIG_FB_DDC is not set
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
CONFIG_FB_HECUBA=y
# CONFIG_FB_SVGALIB is not set
# CONFIG_FB_MACMODES is not set
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
CONFIG_FB_ARC=y
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
CONFIG_FB_VESA=y
CONFIG_FB_N411=y
CONFIG_FB_HGA=y
CONFIG_FB_OPENCORES=y
CONFIG_FB_S1D13XXX=y
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_GEODE is not set
CONFIG_FB_SM501=y
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
CONFIG_FB_IBM_GXT4500=y
# CONFIG_FB_GOLDFISH is not set
CONFIG_FB_VIRTUAL=y
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_BROADSHEET=y
# CONFIG_FB_AUO_K190X is not set
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
CONFIG_BACKLIGHT_LCD_SUPPORT=y
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_L4F00242T03=y
CONFIG_LCD_LMS283GF05=y
# CONFIG_LCD_LTV350QV is not set
CONFIG_LCD_ILI922X=y
CONFIG_LCD_ILI9320=y
# CONFIG_LCD_TDO24M is not set
CONFIG_LCD_VGG2432A4=y
# CONFIG_LCD_PLATFORM is not set
CONFIG_LCD_S6E63M0=y
CONFIG_LCD_LD9040=y
CONFIG_LCD_AMS369FG06=y
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_GENERIC is not set
# CONFIG_BACKLIGHT_LM3533 is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_DA903X=y
# CONFIG_BACKLIGHT_DA9052 is not set
CONFIG_BACKLIGHT_MAX8925=y
# CONFIG_BACKLIGHT_APPLE is not set
CONFIG_BACKLIGHT_PM8941_WLED=y
# CONFIG_BACKLIGHT_SAHARA is not set
CONFIG_BACKLIGHT_WM831X=y
CONFIG_BACKLIGHT_ADP5520=y
CONFIG_BACKLIGHT_ADP8860=y
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_88PM860X is not set
CONFIG_BACKLIGHT_AAT2870=y
CONFIG_BACKLIGHT_LM3630A=y
# CONFIG_BACKLIGHT_LM3639 is not set
# CONFIG_BACKLIGHT_LP855X is not set
CONFIG_BACKLIGHT_SKY81452=y
CONFIG_BACKLIGHT_TPS65217=y
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# CONFIG_VGASTATE is not set
CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y
CONFIG_LOGO=y
CONFIG_LOGO_LINUX_MONO=y
CONFIG_LOGO_LINUX_VGA16=y
# CONFIG_LOGO_LINUX_CLUT224 is not set
CONFIG_SOUND=y
CONFIG_SOUND_OSS_CORE=y
# CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_DMAENGINE_PCM=y
CONFIG_SND_HWDEP=y
CONFIG_SND_SEQ_DEVICE=y
CONFIG_SND_RAWMIDI=y
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
CONFIG_SND_MIXER_OSS=y
CONFIG_SND_PCM_OSS=y
# CONFIG_SND_PCM_OSS_PLUGINS is not set
# CONFIG_SND_PCM_TIMER is not set
CONFIG_SND_HRTIMER=y
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
CONFIG_SND_SUPPORT_OLD_API=y
CONFIG_SND_PROC_FS=y
CONFIG_SND_VERBOSE_PROCFS=y
CONFIG_SND_VERBOSE_PRINTK=y
CONFIG_SND_DEBUG=y
CONFIG_SND_DEBUG_VERBOSE=y
# CONFIG_SND_PCM_XRUN_DEBUG is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_DMA_SGBUF=y
CONFIG_SND_SEQUENCER=y
CONFIG_SND_SEQ_DUMMY=y
CONFIG_SND_SEQUENCER_OSS=y
CONFIG_SND_SEQ_HRTIMER_DEFAULT=y
CONFIG_SND_SEQ_MIDI_EVENT=y
CONFIG_SND_SEQ_MIDI=y
CONFIG_SND_SEQ_MIDI_EMUL=y
CONFIG_SND_SEQ_VIRMIDI=y
CONFIG_SND_MPU401_UART=y
CONFIG_SND_OPL3_LIB=y
CONFIG_SND_OPL4_LIB=y
CONFIG_SND_OPL3_LIB_SEQ=y
CONFIG_SND_OPL4_LIB_SEQ=y
CONFIG_SND_VX_LIB=y
CONFIG_SND_AC97_CODEC=y
# CONFIG_SND_DRIVERS is not set
CONFIG_SND_WSS_LIB=y
CONFIG_SND_SB_COMMON=y
CONFIG_SND_SB8_DSP=y
CONFIG_SND_SB16_DSP=y
CONFIG_SND_ISA=y
CONFIG_SND_ADLIB=y
CONFIG_SND_AD1816A=y
CONFIG_SND_AD1848=y
# CONFIG_SND_ALS100 is not set
# CONFIG_SND_AZT1605 is not set
CONFIG_SND_AZT2316=y
CONFIG_SND_AZT2320=y
# CONFIG_SND_CMI8328 is not set
CONFIG_SND_CMI8330=y
CONFIG_SND_CS4231=y
CONFIG_SND_CS4236=y
CONFIG_SND_ES1688=y
CONFIG_SND_ES18XX=y
# CONFIG_SND_SC6000 is not set
# CONFIG_SND_GUSCLASSIC is not set
CONFIG_SND_GUSEXTREME=y
CONFIG_SND_GUSMAX=y
CONFIG_SND_INTERWAVE=y
CONFIG_SND_INTERWAVE_STB=y
CONFIG_SND_JAZZ16=y
CONFIG_SND_OPL3SA2=y
# CONFIG_SND_OPTI92X_AD1848 is not set
CONFIG_SND_OPTI92X_CS4231=y
# CONFIG_SND_OPTI93X is not set
CONFIG_SND_MIRO=y
CONFIG_SND_SB8=y
CONFIG_SND_SB16=y
CONFIG_SND_SBAWE=y
CONFIG_SND_SBAWE_SEQ=y
# CONFIG_SND_SB16_CSP is not set
CONFIG_SND_SSCAPE=y
CONFIG_SND_WAVEFRONT=y
# CONFIG_SND_MSND_PINNACLE is not set
CONFIG_SND_MSND_CLASSIC=y
CONFIG_SND_PCI=y
# CONFIG_SND_AD1889 is not set
# CONFIG_SND_ALS300 is not set
# CONFIG_SND_ALS4000 is not set
# CONFIG_SND_ALI5451 is not set
# CONFIG_SND_ASIHPI is not set
# CONFIG_SND_ATIIXP is not set
# CONFIG_SND_ATIIXP_MODEM is not set
# CONFIG_SND_AU8810 is not set
# CONFIG_SND_AU8820 is not set
# CONFIG_SND_AU8830 is not set
# CONFIG_SND_AW2 is not set
# CONFIG_SND_AZT3328 is not set
# CONFIG_SND_BT87X is not set
# CONFIG_SND_CA0106 is not set
# CONFIG_SND_CMIPCI is not set
# CONFIG_SND_OXYGEN is not set
# CONFIG_SND_CS4281 is not set
# CONFIG_SND_CS46XX is not set
# CONFIG_SND_CS5530 is not set
# CONFIG_SND_CS5535AUDIO is not set
# CONFIG_SND_CTXFI is not set
# CONFIG_SND_DARLA20 is not set
# CONFIG_SND_GINA20 is not set
# CONFIG_SND_LAYLA20 is not set
# CONFIG_SND_DARLA24 is not set
# CONFIG_SND_GINA24 is not set
# CONFIG_SND_LAYLA24 is not set
# CONFIG_SND_MONA is not set
# CONFIG_SND_MIA is not set
# CONFIG_SND_ECHO3G is not set
# CONFIG_SND_INDIGO is not set
# CONFIG_SND_INDIGOIO is not set
# CONFIG_SND_INDIGODJ is not set
# CONFIG_SND_INDIGOIOX is not set
# CONFIG_SND_INDIGODJX is not set
# CONFIG_SND_EMU10K1 is not set
# CONFIG_SND_EMU10K1_SEQ is not set
# CONFIG_SND_EMU10K1X is not set
# CONFIG_SND_ENS1370 is not set
# CONFIG_SND_ENS1371 is not set
# CONFIG_SND_ES1938 is not set
# CONFIG_SND_ES1968 is not set
# CONFIG_SND_FM801 is not set
# CONFIG_SND_HDSP is not set
# CONFIG_SND_HDSPM is not set
# CONFIG_SND_ICE1712 is not set
# CONFIG_SND_ICE1724 is not set
# CONFIG_SND_INTEL8X0 is not set
# CONFIG_SND_INTEL8X0M is not set
# CONFIG_SND_KORG1212 is not set
# CONFIG_SND_LOLA is not set
# CONFIG_SND_LX6464ES is not set
# CONFIG_SND_MAESTRO3 is not set
# CONFIG_SND_MIXART is not set
# CONFIG_SND_NM256 is not set
# CONFIG_SND_PCXHR is not set
# CONFIG_SND_RIPTIDE is not set
# CONFIG_SND_RME32 is not set
# CONFIG_SND_RME96 is not set
# CONFIG_SND_RME9652 is not set
# CONFIG_SND_SE6X is not set
# CONFIG_SND_SIS7019 is not set
# CONFIG_SND_SONICVIBES is not set
# CONFIG_SND_TRIDENT is not set
# CONFIG_SND_VIA82XX is not set
# CONFIG_SND_VIA82XX_MODEM is not set
# CONFIG_SND_VIRTUOSO is not set
# CONFIG_SND_VX222 is not set
# CONFIG_SND_YMFPCI is not set

#
# HD-Audio
#
# CONFIG_SND_HDA_INTEL is not set
CONFIG_SND_HDA_PREALLOC_SIZE=64
CONFIG_SND_SPI=y
CONFIG_SND_USB=y
CONFIG_SND_USB_AUDIO=y
CONFIG_SND_USB_UA101=y
# CONFIG_SND_USB_USX2Y is not set
CONFIG_SND_USB_CAIAQ=y
# CONFIG_SND_USB_CAIAQ_INPUT is not set
CONFIG_SND_USB_US122L=y
CONFIG_SND_USB_6FIRE=y
CONFIG_SND_USB_HIFACE=y
CONFIG_SND_BCD2000=y
CONFIG_SND_USB_LINE6=y
# CONFIG_SND_USB_POD is not set
# CONFIG_SND_USB_PODHD is not set
CONFIG_SND_USB_TONEPORT=y
CONFIG_SND_USB_VARIAX=y
CONFIG_SND_PCMCIA=y
CONFIG_SND_VXPOCKET=y
CONFIG_SND_PDAUDIOCF=y
CONFIG_SND_SOC=y
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
# CONFIG_SND_SOC_AMD_ACP is not set
# CONFIG_SND_ATMEL_SOC is not set
# CONFIG_SND_DESIGNWARE_I2S is not set

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
CONFIG_SND_SOC_FSL_ASRC=y
# CONFIG_SND_SOC_FSL_SAI is not set
CONFIG_SND_SOC_FSL_SSI=y
CONFIG_SND_SOC_FSL_SPDIF=y
CONFIG_SND_SOC_FSL_ESAI=y
# CONFIG_SND_SOC_IMX_AUDMUX is not set
CONFIG_SND_I2S_HI6210_I2S=y
CONFIG_SND_SOC_IMG=y
CONFIG_SND_SOC_IMG_I2S_IN=y
# CONFIG_SND_SOC_IMG_I2S_OUT is not set
CONFIG_SND_SOC_IMG_PARALLEL_OUT=y
CONFIG_SND_SOC_IMG_SPDIF_IN=y
# CONFIG_SND_SOC_IMG_SPDIF_OUT is not set
CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC=y
# CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH is not set
# CONFIG_SND_SOC_INTEL_BXT_RT298_MACH is not set
# CONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH is not set
# CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH is not set
# CONFIG_SND_SOC_INTEL_SKL_RT286_MACH is not set

#
# STMicroelectronics STM32 SOC audio support
#
CONFIG_SND_SOC_XTFPGA_I2S=y
# CONFIG_ZX_TDM is not set
CONFIG_SND_SOC_I2C_AND_SPI=y

#
# CODEC drivers
#
CONFIG_SND_SOC_AC97_CODEC=y
CONFIG_SND_SOC_ADAU_UTILS=y
# CONFIG_SND_SOC_ADAU1701 is not set
CONFIG_SND_SOC_ADAU17X1=y
CONFIG_SND_SOC_ADAU1761=y
CONFIG_SND_SOC_ADAU1761_I2C=y
CONFIG_SND_SOC_ADAU1761_SPI=y
CONFIG_SND_SOC_ADAU7002=y
CONFIG_SND_SOC_AK4104=y
CONFIG_SND_SOC_AK4554=y
CONFIG_SND_SOC_AK4613=y
CONFIG_SND_SOC_AK4642=y
# CONFIG_SND_SOC_AK5386 is not set
# CONFIG_SND_SOC_ALC5623 is not set
# CONFIG_SND_SOC_BT_SCO is not set
CONFIG_SND_SOC_CS35L32=y
CONFIG_SND_SOC_CS35L33=y
CONFIG_SND_SOC_CS35L34=y
CONFIG_SND_SOC_CS35L35=y
# CONFIG_SND_SOC_CS42L42 is not set
# CONFIG_SND_SOC_CS42L51_I2C is not set
# CONFIG_SND_SOC_CS42L52 is not set
# CONFIG_SND_SOC_CS42L56 is not set
CONFIG_SND_SOC_CS42L73=y
CONFIG_SND_SOC_CS4265=y
CONFIG_SND_SOC_CS4270=y
CONFIG_SND_SOC_CS4271=y
# CONFIG_SND_SOC_CS4271_I2C is not set
CONFIG_SND_SOC_CS4271_SPI=y
CONFIG_SND_SOC_CS42XX8=y
CONFIG_SND_SOC_CS42XX8_I2C=y
CONFIG_SND_SOC_CS43130=y
CONFIG_SND_SOC_CS4349=y
CONFIG_SND_SOC_CS53L30=y
# CONFIG_SND_SOC_DIO2125 is not set
CONFIG_SND_SOC_ES7134=y
CONFIG_SND_SOC_ES8316=y
CONFIG_SND_SOC_ES8328=y
CONFIG_SND_SOC_ES8328_I2C=y
# CONFIG_SND_SOC_ES8328_SPI is not set
CONFIG_SND_SOC_GTM601=y
CONFIG_SND_SOC_INNO_RK3036=y
CONFIG_SND_SOC_MAX98504=y
CONFIG_SND_SOC_MAX98927=y
CONFIG_SND_SOC_MAX9860=y
# CONFIG_SND_SOC_MSM8916_WCD_ANALOG is not set
# CONFIG_SND_SOC_MSM8916_WCD_DIGITAL is not set
# CONFIG_SND_SOC_PCM1681 is not set
CONFIG_SND_SOC_PCM179X=y
CONFIG_SND_SOC_PCM179X_I2C=y
CONFIG_SND_SOC_PCM179X_SPI=y
# CONFIG_SND_SOC_PCM3168A_I2C is not set
# CONFIG_SND_SOC_PCM3168A_SPI is not set
CONFIG_SND_SOC_PCM512x=y
CONFIG_SND_SOC_PCM512x_I2C=y
CONFIG_SND_SOC_PCM512x_SPI=y
# CONFIG_SND_SOC_RT5616 is not set
CONFIG_SND_SOC_RT5631=y
# CONFIG_SND_SOC_RT5677_SPI is not set
# CONFIG_SND_SOC_SGTL5000 is not set
CONFIG_SND_SOC_SIGMADSP=y
CONFIG_SND_SOC_SIGMADSP_REGMAP=y
# CONFIG_SND_SOC_SIRF_AUDIO_CODEC is not set
CONFIG_SND_SOC_SPDIF=y
CONFIG_SND_SOC_SSM2602=y
# CONFIG_SND_SOC_SSM2602_SPI is not set
CONFIG_SND_SOC_SSM2602_I2C=y
# CONFIG_SND_SOC_SSM4567 is not set
CONFIG_SND_SOC_STA32X=y
# CONFIG_SND_SOC_STA350 is not set
# CONFIG_SND_SOC_STI_SAS is not set
CONFIG_SND_SOC_TAS2552=y
# CONFIG_SND_SOC_TAS5086 is not set
CONFIG_SND_SOC_TAS571X=y
CONFIG_SND_SOC_TAS5720=y
# CONFIG_SND_SOC_TFA9879 is not set
CONFIG_SND_SOC_TLV320AIC23=y
# CONFIG_SND_SOC_TLV320AIC23_I2C is not set
CONFIG_SND_SOC_TLV320AIC23_SPI=y
CONFIG_SND_SOC_TLV320AIC31XX=y
CONFIG_SND_SOC_TLV320AIC3X=y
# CONFIG_SND_SOC_TS3A227E is not set
CONFIG_SND_SOC_WM8510=y
CONFIG_SND_SOC_WM8523=y
# CONFIG_SND_SOC_WM8524 is not set
CONFIG_SND_SOC_WM8580=y
# CONFIG_SND_SOC_WM8711 is not set
CONFIG_SND_SOC_WM8728=y
CONFIG_SND_SOC_WM8731=y
CONFIG_SND_SOC_WM8737=y
CONFIG_SND_SOC_WM8741=y
CONFIG_SND_SOC_WM8750=y
CONFIG_SND_SOC_WM8753=y
CONFIG_SND_SOC_WM8770=y
CONFIG_SND_SOC_WM8776=y
CONFIG_SND_SOC_WM8804=y
CONFIG_SND_SOC_WM8804_I2C=y
# CONFIG_SND_SOC_WM8804_SPI is not set
CONFIG_SND_SOC_WM8903=y
# CONFIG_SND_SOC_WM8960 is not set
# CONFIG_SND_SOC_WM8962 is not set
CONFIG_SND_SOC_WM8974=y
CONFIG_SND_SOC_WM8978=y
# CONFIG_SND_SOC_WM8985 is not set
CONFIG_SND_SOC_ZX_AUD96P22=y
CONFIG_SND_SOC_NAU8540=y
CONFIG_SND_SOC_NAU8810=y
# CONFIG_SND_SOC_NAU8824 is not set
# CONFIG_SND_SOC_TPA6130A2 is not set
CONFIG_SND_SIMPLE_CARD_UTILS=y
CONFIG_SND_SIMPLE_CARD=y
CONFIG_SND_SIMPLE_SCU_CARD=y
CONFIG_SND_AUDIO_GRAPH_CARD=y
# CONFIG_SND_AUDIO_GRAPH_SCU_CARD is not set
CONFIG_SND_X86=y
CONFIG_SND_SYNTH_EMUX=y
CONFIG_AC97_BUS=y

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
# CONFIG_HIDRAW is not set
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
# CONFIG_HID_ACCUTOUCH is not set
# CONFIG_HID_ACRUX is not set
# CONFIG_HID_APPLE is not set
# CONFIG_HID_APPLEIR is not set
# CONFIG_HID_ASUS is not set
# CONFIG_HID_AUREAL is not set
# CONFIG_HID_BELKIN is not set
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_CHERRY is not set
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_PRODIKEYS is not set
# CONFIG_HID_CMEDIA is not set
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CYPRESS is not set
# CONFIG_HID_DRAGONRISE is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELECOM is not set
# CONFIG_HID_ELO is not set
# CONFIG_HID_EZKEY is not set
# CONFIG_HID_GEMBIRD is not set
# CONFIG_HID_GFRM is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_GT683R is not set
# CONFIG_HID_KEYTOUCH is not set
# CONFIG_HID_KYE is not set
# CONFIG_HID_UCLOGIC is not set
# CONFIG_HID_WALTOP is not set
# CONFIG_HID_GYRATION is not set
# CONFIG_HID_ICADE is not set
# CONFIG_HID_ITE is not set
# CONFIG_HID_TWINHAN is not set
# CONFIG_HID_KENSINGTON is not set
# CONFIG_HID_LCPOWER is not set
# CONFIG_HID_LED is not set
# CONFIG_HID_LENOVO is not set
# CONFIG_HID_LOGITECH is not set
# CONFIG_HID_MAGICMOUSE is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_MICROSOFT is not set
# CONFIG_HID_MONTEREY is not set
# CONFIG_HID_MULTITOUCH is not set
# CONFIG_HID_NTI is not set
# CONFIG_HID_NTRIG is not set
# CONFIG_HID_ORTEK is not set
# CONFIG_HID_PANTHERLORD is not set
# CONFIG_HID_PENMOUNT is not set
# CONFIG_HID_PETALYNX is not set
# CONFIG_HID_PICOLCD is not set
# CONFIG_HID_PLANTRONICS is not set
# CONFIG_HID_PRIMAX is not set
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
# CONFIG_HID_SAITEK is not set
# CONFIG_HID_SAMSUNG is not set
# CONFIG_HID_SONY is not set
# CONFIG_HID_SPEEDLINK is not set
# CONFIG_HID_STEELSERIES is not set
# CONFIG_HID_SUNPLUS is not set
# CONFIG_HID_RMI is not set
# CONFIG_HID_GREENASIA is not set
# CONFIG_HID_SMARTJOYPLUS is not set
# CONFIG_HID_TIVO is not set
# CONFIG_HID_TOPSEED is not set
# CONFIG_HID_THINGM is not set
# CONFIG_HID_THRUSTMASTER is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_WACOM is not set
# CONFIG_HID_WIIMOTE is not set
# CONFIG_HID_XINMO is not set
# CONFIG_HID_ZEROPLUS is not set
# CONFIG_HID_ZYDACRON is not set
# CONFIG_HID_SENSOR_HUB is not set
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
# CONFIG_I2C_HID is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
CONFIG_USB_DYNAMIC_MINORS=y
CONFIG_USB_OTG=y
# CONFIG_USB_OTG_WHITELIST is not set
# CONFIG_USB_OTG_BLACKLIST_HUB is not set
# CONFIG_USB_OTG_FSM is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_MON=y
CONFIG_USB_WUSB=y
CONFIG_USB_WUSB_CBAF=y
# CONFIG_USB_WUSB_CBAF_DEBUG is not set

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
# CONFIG_USB_XHCI_HCD is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
# CONFIG_USB_EHCI_TT_NEWSCHED is not set
CONFIG_USB_EHCI_PCI=y
CONFIG_USB_EHCI_HCD_PLATFORM=y
# CONFIG_USB_OXU210HP_HCD is not set
CONFIG_USB_ISP116X_HCD=y
CONFIG_USB_ISP1362_HCD=y
CONFIG_USB_FOTG210_HCD=y
CONFIG_USB_MAX3421_HCD=y
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_SSB is not set
CONFIG_USB_OHCI_HCD_PLATFORM=y
# CONFIG_USB_UHCI_HCD is not set
CONFIG_USB_U132_HCD=y
# CONFIG_USB_SL811_HCD is not set
CONFIG_USB_R8A66597_HCD=y
# CONFIG_USB_WHCI_HCD is not set
# CONFIG_USB_HWA_HCD is not set
CONFIG_USB_HCD_SSB=y
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
CONFIG_USB_PRINTER=y
# CONFIG_USB_WDM is not set
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
# CONFIG_USBIP_CORE is not set
CONFIG_USB_MUSB_HDRC=y
CONFIG_USB_MUSB_HOST=y

#
# Platform Glue Layer
#

#
# MUSB DMA mode
#
# CONFIG_MUSB_PIO_ONLY is not set
CONFIG_USB_DWC3=y
CONFIG_USB_DWC3_ULPI=y
CONFIG_USB_DWC3_HOST=y

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
# CONFIG_USB_DWC2_PCI is not set
CONFIG_USB_DWC2_DEBUG=y
CONFIG_USB_DWC2_VERBOSE=y
# CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
# CONFIG_USB_DWC2_DEBUG_PERIODIC is not set
CONFIG_USB_CHIPIDEA=y
CONFIG_USB_CHIPIDEA_OF=y
CONFIG_USB_CHIPIDEA_PCI=y
# CONFIG_USB_CHIPIDEA_HOST is not set
CONFIG_USB_CHIPIDEA_ULPI=y
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
CONFIG_USB_USS720=y
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
CONFIG_USB_RIO500=y
CONFIG_USB_LEGOTOWER=y
# CONFIG_USB_LCD is not set
CONFIG_USB_CYPRESS_CY7C63=y
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
CONFIG_USB_FTDI_ELAN=y
# CONFIG_USB_APPLEDISPLAY is not set
CONFIG_USB_SISUSBVGA=y
CONFIG_USB_LD=y
# CONFIG_USB_TRANCEVIBRATOR is not set
CONFIG_USB_IOWARRIOR=y
CONFIG_USB_TEST=y
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
CONFIG_USB_YUREX=y
CONFIG_USB_EZUSB_FX2=y
# CONFIG_USB_HUB_USB251XB is not set
CONFIG_USB_HSIC_USB3503=y
CONFIG_USB_HSIC_USB4604=y
CONFIG_USB_LINK_LAYER_TEST=y
CONFIG_USB_CHAOSKEY=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_NOP_USB_XCEIV=y
# CONFIG_USB_GPIO_VBUS is not set
CONFIG_USB_ISP1301=y
# CONFIG_USB_GADGET is not set

#
# USB Power Delivery and Type-C drivers
#
CONFIG_TYPEC=y
CONFIG_TYPEC_UCSI=y
# CONFIG_UCSI_ACPI is not set
# CONFIG_USB_LED_TRIG is not set
CONFIG_USB_ULPI_BUS=y
CONFIG_UWB=y
CONFIG_UWB_HWA=y
# CONFIG_UWB_WHCI is not set
# CONFIG_UWB_I1480U is not set
CONFIG_MMC=y
CONFIG_PWRSEQ_EMMC=y
# CONFIG_PWRSEQ_SIMPLE is not set
CONFIG_MMC_BLOCK=y
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=y
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
# CONFIG_MMC_SDHCI is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_GOLDFISH is not set
CONFIG_MMC_SPI=y
# CONFIG_MMC_SDRICOH_CS is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
CONFIG_MMC_VUB300=y
CONFIG_MMC_USHC=y
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_REALTEK_USB=y
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_88PM860X=y
CONFIG_LEDS_AS3645A=y
CONFIG_LEDS_BCM6328=y
# CONFIG_LEDS_BCM6358 is not set
CONFIG_LEDS_CPCAP=y
CONFIG_LEDS_LM3530=y
# CONFIG_LEDS_LM3533 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=y
CONFIG_LEDS_LP3952=y
CONFIG_LEDS_LP55XX_COMMON=y
# CONFIG_LEDS_LP5521 is not set
CONFIG_LEDS_LP5523=y
CONFIG_LEDS_LP5562=y
# CONFIG_LEDS_LP8501 is not set
CONFIG_LEDS_LP8860=y
# CONFIG_LEDS_CLEVO_MAIL is not set
# CONFIG_LEDS_PCA955X is not set
CONFIG_LEDS_PCA963X=y
# CONFIG_LEDS_WM831X_STATUS is not set
# CONFIG_LEDS_DA903X is not set
CONFIG_LEDS_DA9052=y
CONFIG_LEDS_DAC124S085=y
CONFIG_LEDS_PWM=y
# CONFIG_LEDS_REGULATOR is not set
# CONFIG_LEDS_BD2802 is not set
# CONFIG_LEDS_INTEL_SS4200 is not set
# CONFIG_LEDS_LT3593 is not set
CONFIG_LEDS_ADP5520=y
CONFIG_LEDS_MC13783=y
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=y
# CONFIG_LEDS_MAX8997 is not set
CONFIG_LEDS_LM355x=y
CONFIG_LEDS_OT200=y
# CONFIG_LEDS_MENF21BMC is not set
CONFIG_LEDS_KTD2692=y
CONFIG_LEDS_IS31FL319X=y
# CONFIG_LEDS_IS31FL32XX is not set

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
# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_GPIO is not set
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
# CONFIG_LEDS_TRIGGER_CAMERA is not set
CONFIG_LEDS_TRIGGER_PANIC=y
# CONFIG_ACCESSIBILITY is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
CONFIG_EDAC_DEBUG=y
# CONFIG_EDAC_AMD76X is not set
# CONFIG_EDAC_E7XXX is not set
# CONFIG_EDAC_E752X is not set
# CONFIG_EDAC_I82875P is not set
# CONFIG_EDAC_I82975X is not set
# CONFIG_EDAC_I3000 is not set
# CONFIG_EDAC_I3200 is not set
# CONFIG_EDAC_IE31200 is not set
# CONFIG_EDAC_X38 is not set
# CONFIG_EDAC_I5400 is not set
# CONFIG_EDAC_I82860 is not set
# CONFIG_EDAC_R82600 is not set
# CONFIG_EDAC_I5000 is not set
# CONFIG_EDAC_I5100 is not set
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
# CONFIG_KS0108 is not set
CONFIG_IMG_ASCII_LCD=y
# CONFIG_HT16K33 is not set
# CONFIG_PANEL is not set
CONFIG_UIO=y
# CONFIG_UIO_CIF is not set
# CONFIG_UIO_PDRV_GENIRQ is not set
CONFIG_UIO_DMEM_GENIRQ=y
# CONFIG_UIO_AEC is not set
# CONFIG_UIO_SERCOS3 is not set
# CONFIG_UIO_PCI_GENERIC is not set
# CONFIG_UIO_NETX is not set
CONFIG_UIO_PRUSS=y
# CONFIG_UIO_MF624 is not set
# CONFIG_VIRT_DRIVERS is not set

#
# Virtio drivers
#
# CONFIG_VIRTIO_PCI is not set
# CONFIG_VIRTIO_MMIO is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# CONFIG_HYPERV_TSCPAGE is not set
CONFIG_STAGING=y
# CONFIG_IRDA is not set
# CONFIG_COMEDI is not set
# CONFIG_FB_SM750 is not set
# CONFIG_FB_XGI is not set

#
# Speakup console speech
#
# CONFIG_STAGING_MEDIA is not set

#
# Android
#
# CONFIG_ION is not set
# CONFIG_STAGING_BOARD is not set
# CONFIG_GOLDFISH_AUDIO is not set
# CONFIG_DGNC is not set
# CONFIG_GS_FPGABOOT is not set
# CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
CONFIG_FB_TFT=y
# CONFIG_FB_TFT_AGM1264K_FL is not set
CONFIG_FB_TFT_BD663474=y
CONFIG_FB_TFT_HX8340BN=y
CONFIG_FB_TFT_HX8347D=y
# CONFIG_FB_TFT_HX8353D is not set
CONFIG_FB_TFT_HX8357D=y
# CONFIG_FB_TFT_ILI9163 is not set
CONFIG_FB_TFT_ILI9320=y
CONFIG_FB_TFT_ILI9325=y
CONFIG_FB_TFT_ILI9340=y
CONFIG_FB_TFT_ILI9341=y
CONFIG_FB_TFT_ILI9481=y
CONFIG_FB_TFT_ILI9486=y
CONFIG_FB_TFT_PCD8544=y
CONFIG_FB_TFT_RA8875=y
CONFIG_FB_TFT_S6D02A1=y
# CONFIG_FB_TFT_S6D1121 is not set
CONFIG_FB_TFT_SH1106=y
# CONFIG_FB_TFT_SSD1289 is not set
# CONFIG_FB_TFT_SSD1305 is not set
# CONFIG_FB_TFT_SSD1306 is not set
# CONFIG_FB_TFT_SSD1325 is not set
CONFIG_FB_TFT_SSD1331=y
CONFIG_FB_TFT_SSD1351=y
CONFIG_FB_TFT_ST7735R=y
CONFIG_FB_TFT_ST7789V=y
CONFIG_FB_TFT_TINYLCD=y
CONFIG_FB_TFT_TLS8204=y
CONFIG_FB_TFT_UC1611=y
CONFIG_FB_TFT_UC1701=y
CONFIG_FB_TFT_UPD161704=y
CONFIG_FB_TFT_WATTEROTT=y
CONFIG_FB_FLEX=y
# CONFIG_FB_TFT_FBTFT_DEVICE is not set
# CONFIG_MOST is not set
# CONFIG_KS7010 is not set
CONFIG_GREYBUS=y
CONFIG_GREYBUS_ES2=y
# CONFIG_GREYBUS_AUDIO is not set
# CONFIG_GREYBUS_BOOTROM is not set
CONFIG_GREYBUS_FIRMWARE=y
# CONFIG_GREYBUS_HID is not set
CONFIG_GREYBUS_LIGHT=y
# CONFIG_GREYBUS_LOG is not set
# CONFIG_GREYBUS_LOOPBACK is not set
# CONFIG_GREYBUS_POWER is not set
# CONFIG_GREYBUS_RAW is not set
CONFIG_GREYBUS_VIBRATOR=y
CONFIG_GREYBUS_BRIDGED_PHY=y
# CONFIG_GREYBUS_GPIO is not set
CONFIG_GREYBUS_I2C=y
CONFIG_GREYBUS_PWM=y
CONFIG_GREYBUS_SDIO=y
CONFIG_GREYBUS_SPI=y
CONFIG_GREYBUS_UART=y
# CONFIG_GREYBUS_USB is not set
CONFIG_CRYPTO_DEV_CCREE=y

#
# USB Power Delivery and Type-C drivers
#
CONFIG_TYPEC_TCPM=y
CONFIG_TYPEC_TCPCI=y
CONFIG_TYPEC_FUSB302=y
# CONFIG_DRM_VBOXVIDEO is not set
CONFIG_PI433=y
CONFIG_X86_PLATFORM_DEVICES=y
# CONFIG_ACERHDF is not set
# CONFIG_ASUS_LAPTOP is not set
# CONFIG_DELL_LAPTOP is not set
# CONFIG_DELL_SMO8800 is not set
# CONFIG_FUJITSU_LAPTOP is not set
# CONFIG_FUJITSU_TABLET is not set
# CONFIG_HP_ACCEL is not set
# CONFIG_HP_WIRELESS is not set
# CONFIG_PANASONIC_LAPTOP is not set
# CONFIG_THINKPAD_ACPI is not set
# CONFIG_SENSORS_HDAPS is not set
# CONFIG_INTEL_MENLOW is not set
# CONFIG_ASUS_WIRELESS is not set
# CONFIG_ACPI_WMI is not set
# CONFIG_TOPSTAR_LAPTOP is not set
# CONFIG_TOSHIBA_BT_RFKILL is not set
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_ACPI_CMPC is not set
# CONFIG_INTEL_CHT_INT33FE is not set
# CONFIG_INTEL_INT0002_VGPIO is not set
# CONFIG_INTEL_HID_EVENT is not set
# CONFIG_INTEL_VBTN is not set
# CONFIG_INTEL_IPS is not set
# CONFIG_INTEL_PMC_CORE is not set
# CONFIG_IBM_RTL is not set
CONFIG_SAMSUNG_LAPTOP=y
# CONFIG_SAMSUNG_Q10 is not set
# CONFIG_APPLE_GMUX is not set
# CONFIG_INTEL_RST is not set
# CONFIG_INTEL_SMARTCONNECT is not set
# CONFIG_PVPANIC is not set
# CONFIG_INTEL_PMC_IPC is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
# CONFIG_INTEL_PUNIT_IPC is not set
CONFIG_MLX_CPLD_PLATFORM=y
CONFIG_PMC_ATOM=y
CONFIG_GOLDFISH_BUS=y
CONFIG_GOLDFISH_PIPE=y
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Common Clock Framework
#
# CONFIG_COMMON_CLK_WM831X is not set
# CONFIG_CLK_HSDK is not set
# CONFIG_COMMON_CLK_RK808 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI514 is not set
# CONFIG_COMMON_CLK_SI570 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CDCE925 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_CLK_TWL6040 is not set
# CONFIG_COMMON_CLK_NXP is not set
# CONFIG_COMMON_CLK_PALMAS is not set
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_COMMON_CLK_PXA is not set
# CONFIG_COMMON_CLK_PIC32 is not set
# CONFIG_COMMON_CLK_VC5 is not set
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
# CONFIG_REMOTEPROC is not set

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
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
# CONFIG_PM_DEVFREQ_EVENT is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ARIZONA is not set
# CONFIG_EXTCON_GPIO is not set
# CONFIG_EXTCON_INTEL_INT3496 is not set
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_MAX8997=y
CONFIG_EXTCON_PALMAS=y
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
# CONFIG_NTB is not set
# CONFIG_VME_BUS is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_ATMEL_HLCDC_PWM is not set
CONFIG_PWM_FSL_FTM=y
# CONFIG_PWM_LP3943 is not set
# CONFIG_PWM_LPSS_PCI is not set
# CONFIG_PWM_LPSS_PLATFORM is not set
CONFIG_PWM_PCA9685=y
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
CONFIG_BCM_KONA_USB2_PHY=y
# CONFIG_PHY_PXA_28NM_HSIC is not set
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_QCOM_USB_HS=y
CONFIG_PHY_QCOM_USB_HSIC=y
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
CONFIG_ANDROID=y
# CONFIG_ANDROID_BINDER_IPC is not set
CONFIG_DAX=y
CONFIG_NVMEM=y
# CONFIG_STM is not set
CONFIG_INTEL_TH=y
# CONFIG_INTEL_TH_PCI is not set
CONFIG_INTEL_TH_GTH=y
CONFIG_INTEL_TH_MSU=y
# CONFIG_INTEL_TH_PTI is not set
CONFIG_INTEL_TH_DEBUG=y
# CONFIG_FPGA is not set

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
# CONFIG_MUX_GPIO is not set
CONFIG_MUX_MMIO=y

#
# Firmware Drivers
#
CONFIG_EDD=y
CONFIG_EDD_OFF=y
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DELL_RBU=y
# CONFIG_DCDBAS is not set
# CONFIG_DMIID is not set
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT_FIND is not set
CONFIG_FW_CFG_SYSFS=y
CONFIG_FW_CFG_SYSFS_CMDLINE=y
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_GOOGLE_COREBOOT_TABLE_ACPI is not set
# CONFIG_GOOGLE_COREBOOT_TABLE_OF is not set
# CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY is not set
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
CONFIG_EXT2_FS_POSIX_ACL=y
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
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_DEBUG=y
# CONFIG_XFS_ASSERT_FATAL is not set
# CONFIG_GFS2_FS is not set
# CONFIG_OCFS2_FS is not set
CONFIG_BTRFS_FS=y
# CONFIG_BTRFS_FS_POSIX_ACL is not set
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
CONFIG_BTRFS_DEBUG=y
CONFIG_BTRFS_ASSERT=y
CONFIG_NILFS2_FS=y
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
# CONFIG_F2FS_FS_POSIX_ACL is not set
CONFIG_F2FS_FS_SECURITY=y
CONFIG_F2FS_CHECK_FS=y
CONFIG_F2FS_FS_ENCRYPTION=y
CONFIG_F2FS_FAULT_INJECTION=y
CONFIG_FS_DAX=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
# CONFIG_MANDATORY_FILE_LOCKING is not set
CONFIG_FS_ENCRYPTION=y
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
CONFIG_QUOTA=y
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
# CONFIG_PRINT_QUOTA_WARNING is not set
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QFMT_V1=y
# CONFIG_QFMT_V2 is not set
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
CONFIG_OVERLAY_FS=y
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
CONFIG_OVERLAY_FS_INDEX=y

#
# Caches
#
CONFIG_FSCACHE=y
# CONFIG_FSCACHE_STATS is not set
# CONFIG_FSCACHE_HISTOGRAM is not set
CONFIG_FSCACHE_DEBUG=y
# CONFIG_FSCACHE_OBJECT_LIST is not set
# CONFIG_CACHEFILES is not set

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set

#
# DOS/FAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=y
# CONFIG_VFAT_FS is not set
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_NTFS_FS=y
CONFIG_NTFS_DEBUG=y
CONFIG_NTFS_RW=y

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_VMCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
# CONFIG_HUGETLBFS is not set
# CONFIG_HUGETLB_PAGE is not set
CONFIG_CONFIGFS_FS=y
# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=y
CONFIG_NLS_CODEPAGE_850=y
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=y
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=y
CONFIG_NLS_CODEPAGE_950=y
CONFIG_NLS_CODEPAGE_932=y
# CONFIG_NLS_CODEPAGE_949 is not set
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=y
# CONFIG_NLS_ASCII is not set
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=y
# CONFIG_NLS_ISO8859_3 is not set
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=y
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=y
CONFIG_NLS_MAC_GAELIC=y
CONFIG_NLS_MAC_GREEK=y
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=y
# CONFIG_NLS_MAC_TURKISH is not set
CONFIG_NLS_UTF8=y

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
# CONFIG_ENABLE_WARN_DEPRECATED is not set
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=1024
# CONFIG_STRIP_ASM_SYMS is not set
CONFIG_READABLE_ASM=y
CONFIG_UNUSED_SYMBOLS=y
# CONFIG_PAGE_OWNER is not set
CONFIG_DEBUG_FS=y
CONFIG_HEADERS_CHECK=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_FRAME_POINTER=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_DEBUG_KERNEL=y

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_DEBUG_PAGEALLOC=y
# CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
# CONFIG_PAGE_POISONING is not set
CONFIG_DEBUG_RODATA_TEST=y
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
CONFIG_DEBUG_OBJECTS_FREE=y
CONFIG_DEBUG_OBJECTS_TIMERS=y
CONFIG_DEBUG_OBJECTS_WORK=y
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
CONFIG_DEBUG_SLAB=y
# CONFIG_DEBUG_SLAB_LEAK is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
CONFIG_DEBUG_STACK_USAGE=y
CONFIG_DEBUG_VM=y
CONFIG_DEBUG_VM_VMACACHE=y
# CONFIG_DEBUG_VM_RB is not set
CONFIG_DEBUG_VM_PGFLAGS=y
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
CONFIG_DEBUG_PER_CPU_MAPS=y
# CONFIG_DEBUG_HIGHMEM is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_HAVE_ARCH_KMEMCHECK=y
CONFIG_DEBUG_SHIRQ=y

#
# Debug Lockups and Hangs
#
# CONFIG_SOFTLOCKUP_DETECTOR is not set
# CONFIG_HARDLOCKUP_DETECTOR is not set
# CONFIG_DETECT_HUNG_TASK is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
CONFIG_SCHED_DEBUG=y
# CONFIG_SCHED_INFO is not set
# CONFIG_SCHEDSTATS is not set
CONFIG_SCHED_STACK_END_CHECK=y
# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_PROVE_LOCKING=y
CONFIG_LOCKDEP=y
CONFIG_LOCK_STAT=y
CONFIG_LOCKDEP_CROSSRELEASE=y
CONFIG_LOCKDEP_COMPLETIONS=y
CONFIG_DEBUG_LOCKDEP=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=y
# CONFIG_WW_MUTEX_SELFTEST is not set
CONFIG_TRACE_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set
# CONFIG_DEBUG_KOBJECT_RELEASE is not set
CONFIG_DEBUG_BUGVERBOSE=y
# CONFIG_DEBUG_LIST is not set
CONFIG_DEBUG_PI_LIST=y
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
CONFIG_TORTURE_TEST=y
# CONFIG_RCU_PERF_TEST is not set
CONFIG_RCU_TORTURE_TEST=y
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_TRACE=y
# CONFIG_RCU_EQS_DEBUG is not set
CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
CONFIG_CPU_HOTPLUG_STATE_CONTROL=y
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
# CONFIG_FAULT_INJECTION is not set
# CONFIG_LATENCYTOP is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set

#
# Runtime Testing
#
# CONFIG_LKDTM is not set
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_TEST_SORT is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_RBTREE_TEST is not set
CONFIG_INTERVAL_TREE_TEST=y
CONFIG_ATOMIC64_SELFTEST=y
# CONFIG_TEST_HEXDUMP is not set
CONFIG_TEST_STRING_HELPERS=y
CONFIG_TEST_KSTRTOX=y
CONFIG_TEST_PRINTF=y
CONFIG_TEST_BITMAP=y
# CONFIG_TEST_UUID is not set
CONFIG_TEST_RHASHTABLE=y
# CONFIG_TEST_HASH is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
# CONFIG_DMA_API_DEBUG is not set
CONFIG_TEST_FIRMWARE=y
# CONFIG_TEST_SYSCTL is not set
CONFIG_TEST_UDELAY=y
# CONFIG_MEMTEST is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
# CONFIG_UBSAN is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
# CONFIG_STRICT_DEVMEM is not set
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
# CONFIG_EARLY_PRINTK_DBGP is not set
# CONFIG_EARLY_PRINTK_USB_XDBC is not set
CONFIG_X86_PTDUMP_CORE=y
CONFIG_X86_PTDUMP=y
CONFIG_DEBUG_WX=y
# CONFIG_DOUBLEFAULT is not set
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
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_OPTIMIZE_INLINING is not set
CONFIG_DEBUG_ENTRY=y
CONFIG_DEBUG_NMI_SELFTEST=y
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_FRAME_POINTER_UNWINDER=y
# CONFIG_GUESS_UNWINDER is not set

#
# Security options
#
CONFIG_KEYS=y
CONFIG_PERSISTENT_KEYRINGS=y
# CONFIG_TRUSTED_KEYS is not set
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
# CONFIG_SECURITY_WRITABLE_HOOKS is not set
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_PATH=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_PAGESPAN=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
# CONFIG_SECURITY_YAMA is not set
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
# CONFIG_IMA is not set
CONFIG_EVM=y
# CONFIG_EVM_ATTR_FSUUID is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_DEFAULT_SECURITY=""
CONFIG_XOR_BLOCKS=y
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
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
# CONFIG_CRYPTO_PCRYPT is not set
CONFIG_CRYPTO_WORKQUEUE=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_MCRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_SIMD=y

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
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_KEYWRAP=y

#
# Hash modes
#
# CONFIG_CRYPTO_CMAC is not set
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_VMAC=y

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_INTEL=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRC32_PCLMUL=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
CONFIG_CRYPTO_RMD128=y
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_RMD256=y
# CONFIG_CRYPTO_RMD320 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
# CONFIG_CRYPTO_TGR192 is not set
# CONFIG_CRYPTO_WP512 is not set

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
CONFIG_CRYPTO_AES_586=y
CONFIG_CRYPTO_AES_NI_INTEL=y
# CONFIG_CRYPTO_ANUBIS is not set
CONFIG_CRYPTO_ARC4=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
# CONFIG_CRYPTO_FCRYPT is not set
CONFIG_CRYPTO_KHAZAD=y
CONFIG_CRYPTO_SALSA20=y
CONFIG_CRYPTO_SALSA20_586=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_SEED=y
CONFIG_CRYPTO_SERPENT=y
# CONFIG_CRYPTO_SERPENT_SSE2_586 is not set
# CONFIG_CRYPTO_TEA is not set
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
CONFIG_CRYPTO_TWOFISH_586=y

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
# CONFIG_CRYPTO_LZO is not set
# CONFIG_CRYPTO_842 is not set
CONFIG_CRYPTO_LZ4=y
# CONFIG_CRYPTO_LZ4HC is not set

#
# Random Number Generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=y
CONFIG_CRYPTO_DEV_PADLOCK_AES=y
# CONFIG_CRYPTO_DEV_PADLOCK_SHA is not set
# CONFIG_CRYPTO_DEV_GEODE is not set
# CONFIG_CRYPTO_DEV_HIFN_795X is not set
# CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_DESC is not set
# CONFIG_CRYPTO_DEV_CCP is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
# CONFIG_CRYPTO_DEV_QAT_C62X is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
# CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS7_MESSAGE_PARSER=y

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
CONFIG_HAVE_KVM=y
# CONFIG_VIRTUALIZATION is not set
# CONFIG_BINARY_PRINTF is not set

#
# Library routines
#
CONFIG_RAID6_PQ=y
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
CONFIG_CRC32_SELFTEST=y
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
CONFIG_CRC32_SARWATE=y
# CONFIG_CRC32_BIT is not set
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
# CONFIG_DMA_NOOP_OPS is not set
# CONFIG_DMA_VIRT_OPS is not set
# CONFIG_CPUMASK_OFFSTACK is not set
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_CORDIC=y
# CONFIG_DDR is not set
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
# CONFIG_SG_SPLIT is not set
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_SG_CHAIN=y
CONFIG_STACKDEPOT=y
CONFIG_SBITMAP=y
CONFIG_PRIME_NUMBERS=y
CONFIG_STRING_SELFTEST=y

--yobwwn5mohwvacnn--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
