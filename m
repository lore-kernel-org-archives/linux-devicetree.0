From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 08/21] microblaze: get cpu node with of_get_cpu_node
Date: Mon, 10 Sep 2018 16:56:17 +0200
Message-ID: <8b227f8c-f351-18da-b55d-e8979281f510@xilinx.com>
References: <20180905193738.19325-1-robh@kernel.org>
 <20180905193738.19325-9-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-9-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 5.9.2018 21:37, Rob Herring wrote:
> "device_type" use is deprecated for FDT though it has continued to be used
> for nodes like cpu nodes. Use of_get_cpu_node() instead which works using
> node names by default. This will allow the eventually removal of cpu
> device_type properties.
> 
> Also, fix a leaked reference by adding a missing of_node_put.
> 
> Cc: Michal Simek <monstr@monstr.eu>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take via the DT tree. This is dependent on the
> first 2 patches.

I have tested it and it is align with the spec and all dtses generated
before 2015 will work without any issue.
In 2015 new device tree generator was introduced and it is not adding
reg property to cpu node which is required by this change.
This will be fixed but that means that all generated dtses from 2015 are
affected.

That's why will be great if you can also change that pr_err message to
mentioned to also check reg property to give users a chance to fix it
properly. Error log below.

Anyway here is my
Tested-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal


[    0.000000] Ramdisk addr 0x00000000,
[    0.000000] Compiled-in FDT at (ptrval)
[    0.000000] Linux version 4.19.0-rc2-00010-gf9a96b0ac503
(monstr@monstr-desktop2) (gcc version 4.9.2 (crosstool-NG 1.20.0)) #4
Mon Sep 10 16:31:14 CEST 2018
[    0.000000] setup_memory: max_mapnr: 0x40000
[    0.000000] setup_memory: min_low_pfn: 0x80000
[    0.000000] setup_memory: max_low_pfn: 0xb0000
[    0.000000] setup_memory: max_pfn: 0xc0000
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000afffffff]
[    0.000000]   Normal   empty
[    0.000000]   HighMem  [mem 0x00000000b0000000-0x00000000bfffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem
0x0000000080000000-0x00000000bfffffff]
[    0.000000] earlycon: ns16550a0 at MMIO 0x44a01000 (options '')
[    0.000000] bootconsole [ns16550a0] enabled
[    0.000000] You don't have cpu!!!
[    0.000000] setup_cpuinfo: initialising
[    0.000000] setup_cpuinfo: Using full CPU PVR support
[    0.000000] ERROR: Microblaze BARREL, MSR, PCMP or DIV-different for
PVR and DTS
[    0.000000] ERROR: Microblaze HW_MUL-different for PVR and DTS
[    0.000000] wt_msr_noirq
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 260608
[    0.000000] Kernel command line: console=ttyS0,115200 earlycon
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288
bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144
bytes)
[    0.000000] Memory: 1027496K/1048576K available (4270K kernel code,
153K rwdata, 1256K rodata, 4989K init, 561K bss, 21080K reserved, 0K
cma-reserved, 262144K highmem)
[    0.000000] Kernel virtual memory layout:
[    0.000000]   * 0xfffea000..0xfffff000  : fixmap
[    0.000000]   * 0xff800000..0xffc00000  : highmem PTEs
[    0.000000]   * 0xff7ff000..0xff800000  : early ioremap
[    0.000000]   * 0xf0000000..0xff7ff000  : vmalloc & ioremap
[    0.000000] NR_IRQS: 33
[    0.000000] irq-xilinx: /amba_pl/interrupt-controller@41200000:
num_irq=6, edge=0x0
[    0.000000] Oops: kernel access of bad area, sig: 11
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted
4.19.0-rc2-00010-gf9a96b0ac503 #4
[    0.000000]  Registers dump: mode=80571E90
[    0.000000]  r1=C028BD54, r2=C056FAB6, r3=00000000, r4=00000010
[    0.000000]  r5=00000000, r6=C0495348, r7=C0495350, r8=00000000
[    0.000000]  r9=C0571F44, r10=EF002400, r11=00000030, r12=00000000
[    0.000000]  r13=410C2FC0, r14=C0496688, r15=C02831F0, r16=00000000
[    0.000000]  r17=C02831EC, r18=FFFFFFFF, r19=C05BABE0, r20=BFFEC168
[    0.000000]  r21=BFFEC168, r22=EF7F9A80, r23=00000000, r24=00000000
[    0.000000]  r25=BFE6B84C, r26=80000000, r27=00000001, r28=90000040
[    0.000000]  r29=01000000, r30=00000380, r31=C05782E8, rPC=C02831EC
[    0.000000]  msr=000046A0, ear=0000000C, esr=00001A72, fsr=000065A0
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill
the idle task! ]---
