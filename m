From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v2 0/4] arm64: dts: r8a7795: Add HSUSB device node and
 enable channel 0 of USB2.0
Date: Tue, 28 Jun 2016 11:25:04 +0000
Message-ID: <SG2PR06MB091964752DE05021C42FEB06D8220@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1464086058-1276-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20160526024636.GH18393@verge.net.au> <20160530012252.GA12180@verge.net.au>
 <SG2PR06MB0919E6D163804F427DFC1ECAD8450@SG2PR06MB0919.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB0919E6D163804F427DFC1ECAD8450@SG2PR06MB0919.apcprd06.prod.outlook.com>
Content-Language: ja-JP
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon-san,

> From: Yoshihiro Shimoda
> Sent: Monday, May 30, 2016 12:30 PM
> 
> Hi Simon-san,
> 
> > From: Simon Horman
> > Sent: Monday, May 30, 2016 10:23 AM
> >
> > On Thu, May 26, 2016 at 11:46:36AM +0900, Simon Horman wrote:
> > > On Tue, May 24, 2016 at 07:34:14PM +0900, Yoshihiro Shimoda wrote:
> > > > This patch is based on the renesas-drivers / renesas-drivers-2016-05-17-v4.6 tag.
> > >
> > > Thanks, I have queued this up for v4.8.
> > > Please let me know if that was not your intention.
> >
> > Hi Shimoda-san,
> >
> > unfortunately I have observed a problem with patch 3/4 ("arm64: dts:
> > salvator-x: enable USB 2.0 Host channel 0") after rebasing the
> > arm64-dt-for-v4.8 branch of the renesas tree on v4.7-rc1.
> >
> > The problem I see occurs when booting using "defconfig" to an NFS-root
> > Debian user-space as per the boot log below. It appears to be readily
> > reproducible in my environment.
> 
> Thank you for the report!
> I also reproduced this issue if I set the SW15 to pin 1-2 side on the board (this is the default setting).
> (My environment is NFS-rootfs and Yocto user-space.)
> If I set the SW15 to pin 2-3 side (as the commit log mentioned), this issue disappeared.
> Anyway, I will investigate this issue later.

I found a root cause and I sent fixed patch to the phy maintainer:
http://thread.gmane.org/gmane.linux.kernel.renesas-soc/5187

However, I guess there is a bad timing to submit this patch set now,
So, I intend to resubmit the integration patches after the fixed patch is merged
into the phy maintainer's repo.
(In other words, the integration patches should be for v4.9)

Best regards,
Yoshihiro Shimoda

> > As the problem prevents the system booting to user-space using the defconfig
> > I have dropped this series pending a resolution.
> 
> I got it.
> 
> Best regards,
> Yoshihiro Shimoda
> 
> > [    0.000000] Booting Linux on physical CPU 0x0
> > [    0.000000] Linux version 4.7.0-rc1+ (horms@ayumi.isobedori.kobe.vergenet.net) (gcc version 4.8.5 (Linaro GCC
> > 4.8-2015.06) ) #161 SMP PREEMPT Mon May 30 10:08:57 JST 2016
> > [    0.000000] Boot CPU: AArch64 Processor [411fd073]
> > [    0.000000] debug: ignoring loglevel setting.
> > [    0.000000] efi: Getting EFI parameters from FDT:
> > [    0.000000] efi: UEFI not found.
> > [    0.000000] cma: Reserved 16 MiB at 0x000000007f000000
> > [    0.000000] On node 0 totalpages: 229376
> > [    0.000000]   DMA zone: 3584 pages used for memmap
> > [    0.000000]   DMA zone: 0 pages reserved
> > [    0.000000]   DMA zone: 229376 pages, LIFO batch:31
> > [    0.000000] psci: probing for conduit method from DT.
> > [    0.000000] psci: PSCIv1.0 detected in firmware.
> > [    0.000000] psci: Using standard PSCI v0.2 function IDs
> > [    0.000000] psci: Trusted OS migration not required
> > [    0.000000] percpu: Embedded 20 pages/cpu @ffff80003ef79000 s42752 r8192 d30976 u81920
> > [    0.000000] pcpu-alloc: s42752 r8192 d30976 u81920 alloc=20*4096
> > [    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
> > [    0.000000] Detected PIPT I-cache on CPU0
> > [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 225792
> > [    0.000000] Kernel command line: ignore_loglevel rw root=/dev/nfs ip=dhcp
> nfsroot=10.3.3.135:/srv/nfs/salvator-x-arm64
> > [    0.000000] log_buf_len individual max cpu contribution: 4096 bytes
> > [    0.000000] log_buf_len total cpu_extra contributions: 12288 bytes
> > [    0.000000] log_buf_len min size: 16384 bytes
> > [    0.000000] log_buf_len: 32768 bytes
> > [    0.000000] early log buf free: 14796(90%)
> > [    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
> > [    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
> > [    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)
> > [    0.000000] software IO TLB [mem 0x79c00000-0x7dc00000] (64MB) mapped at [ffff800039c00000-ffff80003dbfffff]
> > [    0.000000] Memory: 804172K/917504K available (7372K kernel code, 642K rwdata, 3184K rodata, 960K init, 259K bss,
> 96948K
> > reserved, 16384K cma-reserved)
> > [    0.000000] Virtual kernel memory layout:
> > [    0.000000]     modules : 0xffff000000000000 - 0xffff000008000000   (   128 MB)
> > [    0.000000]     vmalloc : 0xffff000008000000 - 0xffff7dffbfff0000   (129022 GB)
> > [    0.000000]       .text : 0xffff000008080000 - 0xffff0000087b0000   (  7360 KB)
> > [    0.000000]     .rodata : 0xffff0000087b0000 - 0xffff000008ad0000   (  3200 KB)
> > [    0.000000]       .init : 0xffff000008ad0000 - 0xffff000008bc0000   (   960 KB)
> > [    0.000000]       .data : 0xffff000008bc0000 - 0xffff000008c60a00   (   643 KB)
> > [    0.000000]        .bss : 0xffff000008c60a00 - 0xffff000008ca19b0   (   260 KB)
> > [    0.000000]     fixed   : 0xffff7dfffe7fd000 - 0xffff7dfffec00000   (  4108 KB)
> > [    0.000000]     PCI I/O : 0xffff7dfffee00000 - 0xffff7dffffe00000   (    16 MB)
> > [    0.000000]     vmemmap : 0xffff7e0000000000 - 0xffff800000000000   (  2048 GB maximum)
> > [    0.000000]               0xffff7e0000200000 - 0xffff7e0001000000   (    14 MB actual)
> > [    0.000000]     memory  : 0xffff800008000000 - 0xffff800040000000   (   896 MB)
> > [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
> > [    0.000000] Preemptible hierarchical RCU implementation.
> > [    0.000000]  Build-time adjustment of leaf fanout to 64.
> > [    0.000000]  RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=4.
> > [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=64, nr_cpu_ids=4
> > [    0.000000] NR_IRQS:64 nr_irqs:64 0
> > [    0.000000] Architected cp15 timer(s) running at 8.33MHz (virt).
> > [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1ec02923e, max_idle_ns: 440795202125
> > ns
> > [    0.000003] sched_clock: 56 bits at 8MHz, resolution 120ns, wraps every 2199023255496ns
> > [    0.000162] Console: colour dummy device 80x25
> > [    0.000500] console [tty0] enabled
> > [    0.000526] Calibrating delay loop (skipped), value calculated using timer frequency.. 16.66 BogoMIPS (lpj=33333)
> > [    0.000543] pid_max: default: 32768 minimum: 301
> > [    0.000599] Security Framework initialized
> > [    0.000633] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
> > [    0.000643] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes)
> > [    0.001391] ASID allocator initialised with 65536 entries
> > [    0.020598] EFI services will not be available.
> > [    0.044220] Detected PIPT I-cache on CPU1
> > [    0.044273] CPU1: Booted secondary processor [411fd073]
> > [    0.060210] Detected PIPT I-cache on CPU2
> > [    0.060231] CPU2: Booted secondary processor [411fd073]
> > [    0.076218] Detected PIPT I-cache on CPU3
> > [    0.076238] CPU3: Booted secondary processor [411fd073]
> > [    0.076275] Brought up 4 CPUs
> > [    0.076324] SMP: Total of 4 processors activated.
> > [    0.076336] CPU features: detected feature: 32-bit EL0 Support
> > [    0.076347] CPU: All CPU(s) started at EL1
> > [    0.077233] devtmpfs: initialized
> > [    0.080201] DMI not present or invalid.
> > [    0.080376] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> > [    0.080717] pinctrl core: initialized pinctrl subsystem
> > [    0.081638] NET: Registered protocol family 16
> > [    0.092136] cpuidle: using governor menu
> > [    0.092252] vdso: 2 pages (1 code @ ffff0000087b6000, 1 data @ ffff000008bc4000)
> > [    0.092280] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
> > [    0.092906] DMA: preallocated 256 KiB pool for atomic allocations
> > [    0.093066] Serial: AMBA PL011 UART driver
> > [    0.095910] sh-pfc e6060000.pfc: r8a77950_pfc support registered
> > [    0.096130] renesas_irqc e61c0000.interrupt-controller: failed to add to PM domain always-on: -517
> > [    0.124739] HugeTLB registered 2 MB page size, pre-allocated 0 pages
> > [    0.125565] ACPI: Interpreter disabled.
> > [    0.126257] vgaarb: loaded
> > [    0.126446] SCSI subsystem initialized
> > [    0.126556] libata version 3.00 loaded.
> > [    0.126756] usbcore: registered new interface driver usbfs
> > [    0.126797] usbcore: registered new interface driver hub
> > [    0.126841] usbcore: registered new device driver usb
> > [    0.127189] pps_core: LinuxPPS API ver. 1 registered
> > [    0.127203] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> > [    0.127227] PTP clock support registered
> > [    0.127327] dmi: Firmware registration failed.
> > [    0.128590] Advanced Linux Sound Architecture Driver Initialized.
> > [    0.129212] clocksource: Switched to clocksource arch_sys_counter
> > [    0.129328] VFS: Disk quotas dquot_6.6.0
> > [    0.129375] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> > [    0.129559] pnp: PnP ACPI: disabled
> > [    0.134027] NET: Registered protocol family 2
> > [    0.134468] TCP established hash table entries: 8192 (order: 4, 65536 bytes)
> > [    0.134508] TCP bind hash table entries: 8192 (order: 5, 131072 bytes)
> > [    0.134603] TCP: Hash tables configured (established 8192 bind 8192)
> > [    0.134699] UDP hash table entries: 512 (order: 2, 16384 bytes)
> > [    0.134718] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
> > [    0.134824] NET: Registered protocol family 1
> > [    0.135023] RPC: Registered named UNIX socket transport module.
> > [    0.135035] RPC: Registered udp transport module.
> > [    0.135043] RPC: Registered tcp transport module.
> > [    0.135051] RPC: Registered tcp NFSv4.1 backchannel transport module.
> > [    0.135065] PCI: CLS 0 bytes, default 128
> > [    0.135517] hw perfevents: enabled with armv8_cortex_a57 PMU driver, 7 counters available
> > [    0.135715] kvm [1]: HYP mode not available
> > [    0.137311] futex hash table entries: 1024 (order: 5, 131072 bytes)
> > [    0.137420] audit: initializing netlink subsys (disabled)
> > [    0.137472] audit: type=2000 audit(0.135:1): initialized
> > [    0.137905] workingset: timestamp_bits=44 max_order=18 bucket_order=0
> > [    0.143669] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> > [    0.144276] NFS: Registering the id_resolver key type
> > [    0.144319] Key type id_resolver registered
> > [    0.144327] Key type id_legacy registered
> > [    0.144486] fuse init (API version 7.24)
> > [    0.144791] 9p: Installing v9fs 9p2000 file system support
> > [    0.146335] io scheduler noop registered
> > [    0.146468] io scheduler cfq registered (default)
> > [    0.149759] gpio_rcar e6050000.gpio: driving 16 GPIOs
> > [    0.150111] gpio_rcar e6051000.gpio: driving 28 GPIOs
> > [    0.150372] gpio_rcar e6052000.gpio: driving 15 GPIOs
> > [    0.150613] gpio_rcar e6053000.gpio: driving 16 GPIOs
> > [    0.150860] gpio_rcar e6054000.gpio: driving 18 GPIOs
> > [    0.151130] gpio_rcar e6055000.gpio: driving 26 GPIOs
> > [    0.151405] gpio_rcar e6055400.gpio: driving 32 GPIOs
> > [    0.151617] gpio_rcar e6055800.gpio: driving 4 GPIOs
> > [    0.152159] PCI host bridge /soc/pcie@fe000000 ranges:
> > [    0.152189]    IO 0xfe100000..0xfe1fffff -> 0x00000000
> > [    0.152205]   MEM 0xfe200000..0xfe3fffff -> 0xfe200000
> > [    0.152217]   MEM 0x30000000..0x37ffffff -> 0x30000000
> > [    0.152227]   MEM 0x38000000..0x3fffffff -> 0x38000000
> > [    0.269217] rcar-pcie fe000000.pcie: PCIe link down
> > [    0.269332] PCI host bridge /soc/pcie@ee800000 ranges:
> > [    0.269354]    IO 0xee900000..0xee9fffff -> 0x00000000
> > [    0.269368]   MEM 0xeea00000..0xeebfffff -> 0xeea00000
> > [    0.269380]   MEM 0xc0000000..0xc7ffffff -> 0xc0000000
> > [    0.269390]   MEM 0xc8000000..0xcfffffff -> 0xc8000000
> > [    0.389211] rcar-pcie ee800000.pcie: PCIe link down
> > [    0.399210] xenfs: not registering filesystem on non-xen platform
> > [    0.401344] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> > [    0.402593] SuperH (H)SCI(F) driver initialized
> > [    0.403028] e6e68000.serial: ttySC1 at MMIO 0xe6e68000 (irq = 134, base_baud = 0) is a scif
> > [    0.403430] e6e88000.serial: ttySC0 at MMIO 0xe6e88000 (irq = 135, base_baud = 0) is a scif
> > [    1.268247] console [ttySC0] enabled
> > [    1.272313] msm_serial: driver initialized
> > [    1.280657] loop: module loaded
> > [    1.285441] scsi host0: sata_rcar
> > [    1.288932] ata1: SATA max UDMA/133 irq 137
> > [    1.293999] tun: Universal TUN/TAP device driver, 1.6
> > [    1.299093] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
> > [    1.305592] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
> > [    1.311471] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> > [    1.317443] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.3.0-k
> > [    1.324412] igb: Copyright (c) 2007-2014 Intel Corporation.
> > [    1.330025] igbvf: Intel(R) Gigabit Virtual Function Network Driver - version 2.0.2-k
> > [    1.337866] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
> > [    1.343823] sky2: driver version 1.30
> > [    1.348151] libphy: ravb_mii: probed
> > [    1.352632] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:09:0a:00:83:92, IRQ 131.
> > [    1.361787] VFIO - User Level meta-driver version: 0.3
> > [    1.367651] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> > [    1.374216] ehci-pci: EHCI PCI platform driver
> > [    1.378701] ehci-platform: EHCI generic platform driver
> > [    1.384259] ehci-platform ee0a0100.usb: EHCI Host Controller
> > [    1.389955] ehci-platform ee0a0100.usb: new USB bus registered, assigned bus number 1
> > [    1.397985] ehci-platform ee0a0100.usb: irq 144, io mem 0xee0a0100
> > [    1.413222] ehci-platform ee0a0100.usb: USB 2.0 started, EHCI 1.10
> > [    1.419856] hub 1-0:1.0: USB hub found
> > [    1.423632] hub 1-0:1.0: 1 port detected
> > [    1.427848] ehci-platform ee0c0100.usb: EHCI Host Controller
> > [    1.433529] ehci-platform ee0c0100.usb: new USB bus registered, assigned bus number 2
> > [    1.441486] ehci-platform ee0c0100.usb: irq 145, io mem 0xee0c0100
> > [    1.457217] ehci-platform ee0c0100.usb: USB 2.0 started, EHCI 1.10
> > [    1.463725] hub 2-0:1.0: USB hub found
> > [    1.467492] hub 2-0:1.0: 1 port detected
> > [    1.471608] ehci-msm: Qualcomm On-Chip EHCI Host Controller
> > [    1.477294] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> > [    1.483492] ohci-pci: OHCI PCI platform driver
> > [    1.487984] ohci-platform: OHCI generic platform driver
> > [    1.493395] ohci-platform ee0a0000.usb: Generic Platform OHCI controller
> > [    1.500113] ohci-platform ee0a0000.usb: new USB bus registered, assigned bus number 3
> > [    1.508029] ohci-platform ee0a0000.usb: irq 144, io mem 0xee0a0000
> > [    1.599661] hub 3-0:1.0: USB hub found
> > [    1.603431] hub 3-0:1.0: 1 port detected
> > [    1.607570] ohci-platform ee0c0000.usb: Generic Platform OHCI controller
> > [    1.614289] ohci-platform ee0c0000.usb: new USB bus registered, assigned bus number 4
> > [    1.622195] ohci-platform ee0c0000.usb: irq 145, io mem 0xee0c0000
> > [    1.701214] ata1: link resume succeeded after 1 retries
> > [    1.711542] hub 4-0:1.0: USB hub found
> > [    1.715309] hub 4-0:1.0: 1 port detected
> > [    1.719514] usbcore: registered new interface driver usb-storage
> > [    1.726259] mousedev: PS/2 mouse device common for all mice
> > [    1.732326] i2c /dev entries driver
> > [    1.736934] i2c-rcar e6510000.i2c: probed
> > [    1.741990] sdhci: Secure Digital Host Controller Interface driver
> > [    1.748182] sdhci: Copyright(c) Pierre Ossman
> > [    1.752562] Synopsys Designware Multimedia Card Interface Driver
> > [    1.758859] sdhci-pltfm: SDHCI platform and OF driver helper
> > [    1.764886] ledtrig-cpu: registered to indicate activity on CPUs
> > [    1.771349] usbcore: registered new interface driver usbhid
> > [    1.776931] usbhid: USB HID core driver
> > [    1.786075] cs2000-cp 2-004f: revision - C1
> > [    1.791318] ak4613-codec 2-0010: No cache used with register defaults set!
> > [    1.802742] rcar_sound ec500000.sound: probed
> > [    1.807384] NET: Registered protocol family 17
> > [    1.811933] 9pnet: Installing 9P2000 support
> > [    1.812641] ata1: SATA link down (SStatus 0 SControl 300)
> > [    1.821686] Key type dns_resolver registered
> > [    1.826430] registered taskstats version 1
> > [    1.830955] renesas_irqc e61c0000.interrupt-controller: driving 6 irqs
> > [    1.838965] ehci-platform ee080100.usb: EHCI Host Controller
> > [    1.844678] ehci-platform ee080100.usb: new USB bus registered, assigned bus number 5
> > [    1.852737] ehci-platform ee080100.usb: irq 143, io mem 0xee080100
> > [    1.869225] ehci-platform ee080100.usb: USB 2.0 started, EHCI 1.10
> > [    1.875924] hub 5-0:1.0: USB hub found
> > [    1.879737] hub 5-0:1.0: 1 port detected
> > [    1.884365] ohci-platform ee080000.usb: Generic Platform OHCI controller
> > [    1.891140] ohci-platform ee080000.usb: new USB bus registered, assigned bus number 6
> > [    1.899193] ohci-platform ee080000.usb: irq 143, io mem 0xee080000
> > [    1.991820] hub 6-0:1.0: USB hub found
> > [    1.995649] hub 6-0:1.0: 1 port detected
> > [    2.000832] asoc-simple-card sound: ak4613-hifi <-> ec500000.sound mapping ok
> > [    2.013932] hctosys: unable to open rtc device (rtc0)
> > [    2.089368] ravb e6800000.ethernet eth0: limited PHY to 100Mbit/s
> > [    2.095566] Micrel KSZ9031 Gigabit PHY e6800000.etherne:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY]
> > (mii_bus:phy_addr=e6800000.etherne:00, irq=208)
> > [    4.643242] ravb e6800000.ethernet eth0: Link is Up - 100Mbps/Full - flow control off
> > [    4.665226] Sending DHCP requests .
> > [    4.670246] ravb e6800000.ethernet eth0: Link is Down
> > [    7.049220] .
> > [    7.210860] ravb e6800000.ethernet eth0: Link is Up - 100Mbps/Full - flow control off
> > [    8.090016] random: nonblocking pool is initialized
> > [   11.221213] ., OK
> > [   12.313237] IP-Config: Got DHCP answer from 10.3.3.2, my address is 10.3.3.70
> > [   12.320632] IP-Config: Complete:
> > [   12.323917]      device=eth0, hwaddr=2e:09:0a:00:83:92, ipaddr=10.3.3.70, mask=255.255.255.0, gw=10.3.3.2
> > [   12.333515]      host=10.3.3.70, domain=isobedori.kobe.vergenet.net kanocho.kobe.vergenet.net vergenet.,
> > nis-domain=(none)
> > [   12.344569]      bootserver=0.0.0.0, rootserver=10.3.3.135, rootpath=     nameserver0=10.3.3.2,
> nameserver1=8.8.8.8
> > [   12.355073] SDHI0 Vcc: disabling
> > [   12.358311] SDHI3 Vcc: disabling
> > [   12.361895] ALSA device list:
> > [   12.364862]   #0: rsnd-dai.0-ak4613-hifi
> > [   12.372869] VFS: Mounted root (nfs filesystem) on device 0:15.
> > [   12.379011] devtmpfs: mounted
> > [   12.382755] Freeing unused kernel memory: 960K (ffff800008ad0000 - ffff800008bc0000)
> > [   12.790713] systemd[1]: Failed to set the kernel's timezone, ignoring: Invalid argument
> > [   12.829873] systemd[1]: systemd 215 running in system mode. (+PAM +AUDIT +SELINUX +IMA +SYSVINIT +LIBCRYPTSETUP +GCRYPT
> > +ACL +XZ -SECCOMP -APPARMOR)
> > [   12.843536] systemd[1]: Detected architecture 'arm64'.
> >
> > Welcome to Debian GNU/Linux 8 (jessie)!
> >
> > [   12.863659] systemd[1]: Failed to insert module 'ipv6'
> > [   12.875770] systemd[1]: Set hostname to <Debian>.
> > [   13.116303] systemd[1]: Cannot add dependency job for unit dbus.socket, ignoring: Unit dbus.socket failed to load:
> > No such file or directory.
> > [   13.129178] systemd[1]: Cannot add dependency job for unit display-manager.service, ignoring: Unit
> > display-manager.service failed to load: No such file or directory.
> > [   13.145888] systemd[1]: Expecting device dev-ttySC0.device...
> >          Expecting device dev-ttySC0.device...
> > [   13.161320] systemd[1]: Starting Forward Password Requests to Wall Directory Watch.
> > [   13.169165] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
> > [   13.176849] systemd[1]: Starting Remote File Systems (Pre).
> > [  OK  ] Reached target Remote File Systems (Pre).
> > [   13.193270] systemd[1]: Reached target Remote File Systems (Pre).
> > [   13.199488] systemd[1]: Starting Dispatch Password Requests to Console Directory Watch.
> > [   13.207672] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
> > [   13.215665] systemd[1]: Starting Paths.
> > [  OK  ] Reached target Paths.
> > [   13.229265] systemd[1]: Reached target Paths.
> > [   13.233735] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
> > [   13.243206] systemd[1]: Starting Encrypted Volumes.
> > [  OK  ] Reached target Encrypted Volumes.
> > [   13.257266] systemd[1]: Reached target Encrypted Volumes.
> > [   13.262733] systemd[1]: Starting Swap.
> > [  OK  ] Reached target Swap.
> > [   13.273250] systemd[1]: Reached target Swap.
> > [   13.277607] systemd[1]: Starting Root Slice.
> > [  OK  ] Created slice Root Slice.
> > [   13.289264] systemd[1]: Created slice Root Slice.
> > [   13.294053] systemd[1]: Starting User and Session Slice.
> > [  OK  ] Created slice User and Session Slice.
> > [   13.309259] systemd[1]: Created slice User and Session Slice.
> > [   13.315063] systemd[1]: Starting Delayed Shutdown Socket.
> > [  OK  ] Listening on Delayed Shutdown Socket.
> > [   13.329275] systemd[1]: Listening on Delayed Shutdown Socket.
> > [   13.335154] systemd[1]: Starting /dev/initctl Compatibility Named Pipe.
> > [  OK  ] Listening on /dev/initctl Compatibility Named Pipe.
> > [   13.353282] systemd[1]: Listening on /dev/initctl Compatibility Named Pipe.
> > [   13.360319] systemd[1]: Starting Journal Socket (/dev/log).
> > [  OK  ] Listening on Journal Socket (/dev/log).
> > [   13.377273] systemd[1]: Listening on Journal Socket (/dev/log).
> > [   13.383296] systemd[1]: Starting udev Control Socket.
> > [  OK  ] Listening on udev Control Socket.
> > [   13.397275] systemd[1]: Listening on udev Control Socket.
> > [   13.402780] systemd[1]: Starting udev Kernel Socket.
> > [  OK  ] Listening on udev Kernel Socket.
> > [   13.417282] systemd[1]: Listening on udev Kernel Socket.
> > [   13.422700] systemd[1]: Starting Journal Socket.
> > [  OK  ] Listening on Journal Socket.
> > [   13.437279] systemd[1]: Listening on Journal Socket.
> > [   13.442364] systemd[1]: Starting Sockets.
> > [  OK  ] Reached target Sockets.
> > [   13.457272] systemd[1]: Reached target Sockets.
> > [   13.461877] systemd[1]: Starting System Slice.
> > [  OK  ] Created slice System Slice.
> > [   13.477284] systemd[1]: Created slice System Slice.
> > [   13.482283] systemd[1]: Starting system-getty.slice.
> > [  OK  ] Created slice system-getty.slice.
> > [   13.497275] systemd[1]: Created slice system-getty.slice.
> > [   13.502745] systemd[1]: Starting system-serial\x2dgetty.slice.
> > [  OK  ] Created slice system-serial\x2dgetty.slice.
> > [   13.517278] systemd[1]: Created slice system-serial\x2dgetty.slice.
> > [   13.523975] systemd[1]: Mounting Debug File System...
> >          Mounting Debug File System...
> > [   13.555894] systemd[1]: Started Set Up Additional Binary Formats.
> > [   13.562185] systemd[1]: Started Create list of required static device nodes for the current kernel.
> > [   13.571527] systemd[1]: Starting Create Static Device Nodes in /dev...
> >          Starting Create Static Device Nodes in /dev...
> > [   13.591444] systemd[1]: Starting udev Coldplug all Devices...
> >          Starting udev Coldplug all Devices...
> > [   13.620715] systemd[1]: Starting Load Kernel Modules...
> >          Starting Load Kernel Modules...
> > [   13.645889] systemd[1]: Mounting POSIX Message Queue File System...
> >          Mounting POSIX Message Queue File System...
> > [   13.663576] systemd[1]: Mounting Huge Pages File System...
> >          Mounting Huge Pages File System...
> > [   13.679517] systemd[1]: Starting Journal Service...
> >          Starting Journal Service...
> > [  OK  ] Started Journal Service.
> > [   13.705397] systemd[1]: Started Journal Service.
> > [  OK  ] Reached target Slices.
> >          Starting Remount Root and Kernel File Systems...
> > [  OK  ] Mounted Huge Pages File System.
> > [  OK  ] Mounted POSIX Message Queue File System.
> > [  OK  ] Mounted Debug File System.
> > [  OK  ] Started Create Static Device Nodes in /dev.
> > [   13.806015] BUG: scheduling while atomic: kworker/u8:2/37/0x00010102
> > [   13.812393] Modules linked in:
> > [   13.815463] CPU: 0 PID: 37 Comm: kworker/u8:2 Not tainted 4.7.0-rc1+ #161
> > [   13.822251] Hardware name: Renesas Salvator-X board based on r8a7795 (DT)
> > [   13.829060] Workqueue: events_unbound call_usermodehelper_exec_work
> > [   13.835335] Call trace:
> > [   13.837787] [<ffff000008088864>] dump_backtrace+0x0/0x1ac
> > [   13.843187] [<ffff000008088a24>] show_stack+0x14/0x1c
> > [   13.848246] [<ffff0000083361f4>] dump_stack+0x8c/0xb0
> > [   13.853307] [<ffff00000814d0d4>] __schedule_bug+0x40/0x58
> > [   13.858713] [<ffff00000879a9bc>] __schedule+0x46c/0x568
> > [   13.863936] [<ffff00000879aaf4>] schedule+0x3c/0xa0
> > [   13.868814] [<ffff00000879aec8>] schedule_preempt_disabled+0x20/0x38
> > [   13.875174] [<ffff0000080ee514>] mutex_optimistic_spin+0x174/0x1b0
> > [   13.881355] [<ffff00000879c4e8>] __mutex_lock_slowpath+0x38/0x148
> > [   13.887446] [<ffff00000879c63c>] mutex_lock+0x44/0x48
> > [   13.892501] [<ffff00000833a054>] kobject_uevent_env+0x244/0x510
> > [   13.898427] [<ffff000008687df8>] extcon_update_state+0x1d4/0x2a8
> > [   13.904432] [<ffff000008687f64>] extcon_set_cable_state_+0x70/0x80
> > [   13.910624] [<ffff000008363594>] rcar_gen3_device_recognition+0xc4/0xe0
> > [   13.917239] [<ffff0000083636e0>] rcar_gen3_phy_usb2_irq+0x38/0x44
> > [   13.923334] [<ffff0000080f6b9c>] handle_irq_event_percpu+0x60/0x140
> > [   13.929599] [<ffff0000080f6cc0>] handle_irq_event+0x44/0x74
> > [   13.935174] [<ffff0000080fa0d0>] handle_fasteoi_irq+0xb4/0x184
> > [   13.941005] [<ffff0000080f6124>] generic_handle_irq+0x24/0x38
> > [   13.946750] [<ffff0000080f6460>] __handle_domain_irq+0x64/0xb0
> > [   13.952582] [<ffff00000808153c>] gic_handle_irq+0x5c/0xb4
> > [   13.957979] Exception stack(0xffff80003ef7cca0 to 0xffff80003ef7cdc0)
> > [   13.964420] cca0: ffff80003ef7ccd0 ffff800039095000 ffff80003ef7cdf0 ffff000008561ed8
> > [   13.972253] ccc0: 0000000040000145 0000000000000014 0000000000000040 0000000000000000
> > [   13.980084] cce0: 0000000000000001 ffff000008357584 0000000077ddd380 0000000000000000
> > [   13.987916] cd00: 0000000000040000 ffff800037c6b290 ffff80003ef823e8 ffff0000080932b0
> > [   13.995747] cd20: 0000000000000000 0000000000000000 0000000000000087 0000000000000000
> > [   14.003578] cd40: 000000000a030387 0000000000000000 0000000000000000 0000000000000001
> > [   14.011409] cd60: ffff0000088ad5e0 ffff800039095000 ffff800039095000 ffff00000802c37c
> > [   14.019240] cd80: 000000000000003f ffff000008d8a000 0000000000000014 ffff800038807f00
> > [   14.027071] cda0: 0000000000000602 ffff800039095800 ffff800039095000 ffff80003ef7cdf0
> > [   14.034905] [<ffff000008084720>] el1_irq+0xa0/0x10c
> > [   14.039788] [<ffff0000086dcd0c>] net_rx_action+0x130/0x2cc
> > [   14.045277] [<ffff0000080bc454>] __do_softirq+0x10c/0x210
> > [   14.050675] [<ffff0000080bc7a4>] irq_exit+0x8c/0xcc
> > [   14.055552] [<ffff0000080f6464>] __handle_domain_irq+0x68/0xb0
> > [   14.061383] [<ffff00000808153c>] gic_handle_irq+0x5c/0xb4
> > [   14.066780] Exception stack(0xffff80003ef7d050 to 0xffff80003ef7d170)
> > [   14.073218] d040:                                   ffff800039a9fb70 ffff80003efbe380
> > [   14.081049] d060: ffff800039a9fc90 ffff00000879e310 0000000060000145 ffff800038816e80
> > [   14.088880] d080: ffff800039a9fc90 ffff800039a9fb70 0000000000000000 0000000000000000
> > [   14.096711] d0a0: ffff80003911c750 0000000000000000 0000000000000000 0000000000000000
> > [   14.104542] d0c0: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > [   14.112373] d0e0: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > [   14.120203] d100: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > [   14.128034] d120: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > [   14.135865] d140: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > [   14.143696] d160: 0000000000000000 0000000000000000
> > [   14.148573] [<ffff000008084720>] el1_irq+0xa0/0x10c
> > [   14.153454] [<ffff00000879e310>] _raw_spin_unlock_irqrestore+0x18/0x40
> > [   14.159983] [<ffff0000080db2e0>] wake_up_new_task+0x10c/0x150
> > [   14.165729] [<ffff0000080b7220>] _do_fork+0x138/0x338
> > [   14.170778] [<ffff0000080b746c>] kernel_thread+0x34/0x3c
> > [   14.176091] [<ffff0000080caeb0>] call_usermodehelper_exec_work+0x2c/0xd8
> > [   14.182792] [<ffff0000080cda2c>] process_one_work+0x130/0x2e8
> > [   14.188535] [<ffff0000080cdc3c>] worker_thread+0x58/0x438
> > [   14.193936] [<ffff0000080d34b8>] kthread+0xd4/0xe8
> > [   14.198726] [<ffff000008084e10>] ret_from_fork+0x10/0x40
> > [   14.204075] Unable to handle kernel NULL pointer dereference at virtual address 0000083c
