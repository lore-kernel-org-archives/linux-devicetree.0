From: Ezaul Zillmer <ezaulzillmer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/2] mtd: nand: add sunxi NAND flash
 controller support
Date: Fri, 26 Sep 2014 11:11:18 -0700 (PDT)
Message-ID: <9855a145-713d-4481-9c4e-94b30dd39a3c@googlegroups.com>
References: <1408382788-32153-1-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_670_1488698117.1411755078642"
Return-path: <linux-sunxi+bncBD2ILSOUX4CBBR6YS2QQKGQENMNC7IY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1408382788-32153-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rzk333-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yassinjaffer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, quitte-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.orgboris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_670_1488698117.1411755078642
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Good afternoon everyone=20

I've been doing some test patches Emilio L=C3=B3pez=20

dma: sun4i: Add support for the DMA engine on sun [457] i SoCs=20
spi: sun4i: add DMA support=20
ARM: sun7i: Add node to Represent the DMA controller=20
ARM: sun7i: enable DMA on SPI=20

But Patches Boris BREZILLON=20
Add the sunxi NAND Flash Controller V5=20

Result I have is this:

Image Name:   Linux-3.16.0-rc6

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 3.16.0-rc6-g40a77a5-dirty (root@vbi7) (gcc=20
version 4.7.2 (Debian 4.7.2-5) ) #3 SMP Fri Sep 26 11:56:35 BRT 2014
[    0.000000] CPU: ARMv7 Processor [410fc074] revision 4 (ARMv7),=20
cr=3D30c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing=20
instruction cache
[    0.000000] Machine model: Cubietech Cubieboard2
[    0.000000] Forcing write-allocate cache policy for SMP
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: Using PSCI v0.1 Function IDs from DT
[    0.000000] PERCPU: Embedded 7 pages/cpu @eefd0000 s7936 r8192 d12544=20
u32768
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.=20
 Total pages: 260624
[    0.000000] Kernel command line: console=3Dtty0 console=3DttyS0,115200=
=20
hdmi.audio=3DEDID:0 disp.screen0_output_mode=3DEDID:1280x800p60=20
root=3D/dev/mmcblk0p1 rootfstype=3Dext4 0
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288=20
bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144=20
bytes)
[    0.000000] Memory: 1026836K/1048576K available (8121K kernel code, 779K=
=20
rwdata, 2716K rodata, 595K init, 321K bss, 21740K reserved, 270336K highmem=
)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xffe00000   (2048 kB)
[    0.000000]     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0a9d7c0   (10838 kB)
[    0.000000]       .init : 0xc0a9e000 - 0xc0b32f00   ( 596 kB)
[    0.000000]       .data : 0xc0b34000 - 0xc0bf6c48   ( 780 kB)
[    0.000000]        .bss : 0xc0bf6c50 - 0xc0c47070   ( 322 kB)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, N=
odes=3D1
[    0.000000] Hierarchical RCU implementation.
[    0.000000]  RCU restricting CPUs from NR_CPUS=3D4 to nr_cpu_ids=3D2.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D2
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] Architected cp15 timer(s) running at 24.00MHz (phys).
[    0.000007] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every=
=20
2863311519744ns
[    0.000014] Switching to timer-based delay loop
[    0.001052] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every=
=20
178956969942ns
[    0.001378] sched_clock: 32 bits at 160MHz, resolution 6ns, wraps every=
=20
26843545593ns
[    0.001587] Console: colour dummy device 80x30
[    0.002002] console [tty0] enabled
[    0.002035] Calibrating delay loop (skipped), value calculated using=20
timer frequency.. 48.00 BogoMIPS (lpj=3D240000)
[    0.002063] pid_max: default: 32768 minimum: 301
[    0.002197] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.002220] Mountpoint-cache hash table entries: 2048 (order: 1, 8192=20
bytes)
[    0.002811] CPU: Testing write buffer coherency: ok
[    0.003090] /cpus/cpu@0 missing clock-frequency property
[    0.003119] /cpus/cpu@1 missing clock-frequency property
[    0.003140] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.003311] Setting up static identity map for 0x407b1ec0 - 0x407b1f58
[    0.005296] CPU1: Booted secondary processor
[    0.005341] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.005426] Brought up 2 CPUs
[    0.005476] SMP: Total of 2 processors activated.
[    0.005490] CPU: All CPU(s) started in HYP mode.
[    0.005501] CPU: Virtualization extensions available.
[    0.006172] devtmpfs: initialized
[    0.010413] VFP support v0.3: implementor 41 architecture 2 part 30=20
variant 7 rev 4
[    0.010862] pinctrl core: initialized pinctrl subsystem
[    0.011360] regulator-dummy: no parameters
[    0.017149] NET: Registered protocol family 16
[    0.017683] DMA: preallocated 256 KiB pool for atomic coherent=20
allocations
[    0.026000] Serial: AMBA PL011 UART driver
[    0.039029] edma-dma-engine edma-dma-engine.0: Can't allocate PaRAM=20
dummy slot
[    0.039082] edma-dma-engine: probe of edma-dma-engine.0 failed with=20
error -5
[    0.039546] reg-fixed-voltage ahci-5v: could not find pctldev for node=
=20
/soc@01c00000/pinctrl@01c20800/ahci_pwr_pin@0, deferring probe
[    0.039585] platform ahci-5v: Driver reg-fixed-voltage requests probe=20
deferral
[    0.039621] reg-fixed-voltage usb1-vbus: could not find pctldev for node=
=20
/soc@01c00000/pinctrl@01c20800/usb1_vbus_pin@0, deferring probe
[    0.039650] platform usb1-vbus: Driver reg-fixed-voltage requests probe=
=20
deferral
[    0.039681] reg-fixed-voltage usb2-vbus: could not find pctldev for node=
=20
/soc@01c00000/pinctrl@01c20800/usb2_vbus_pin@0, deferring probe
[    0.039710] platform usb2-vbus: Driver reg-fixed-voltage requests probe=
=20
deferral
[    0.039899] vcc3v0: 3000 mV
[    0.040216] vcc3v3: 3300 mV
[    0.041627] SCSI subsystem initialized
[    0.042259] usbcore: registered new interface driver usbfs
[    0.042343] usbcore: registered new interface driver hub
[    0.042466] usbcore: registered new device driver usb
[    0.043205] pps_core: LinuxPPS API ver. 1 registered
[    0.043225] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo=
=20
Giometti <giometti-k2GhghHVRtY@public.gmane.org>
[    0.043268] PTP clock support registered
[    0.043360] EDAC MC: Ver: 3.0.0
[    0.044601] Bluetooth: Core ver 2.19
[    0.044676] NET: Registered protocol family 31
[    0.044691] Bluetooth: HCI device and connection manager initialized
[    0.044718] Bluetooth: HCI socket layer initialized
[    0.044737] Bluetooth: L2CAP socket layer initialized
[    0.044773] Bluetooth: SCO socket layer initialized
[    0.045283] Switched to clocksource arch_sys_counter
[    0.045659] FS-Cache: Loaded
[    0.055161] NET: Registered protocol family 2
[    0.055906] TCP established hash table entries: 8192 (order: 3, 32768=20
bytes)
[    0.056001] TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
[    0.056130] TCP: Hash tables configured (established 8192 bind 8192)
[    0.056214] TCP: reno registered
[    0.056236] UDP hash table entries: 512 (order: 2, 16384 bytes)
[    0.056296] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
[    0.056557] NET: Registered protocol family 1
[    0.056921] RPC: Registered named UNIX socket transport module.
[    0.056951] RPC: Registered udp transport module.
[    0.056965] RPC: Registered tcp transport module.
[    0.056978] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.057745] kvm [1]: Using HYP init bounce page @6e1ef000
[    0.058071] kvm [1]: interrupt-controller@1c84000 IRQ25
[    0.058278] kvm [1]: timer IRQ27
[    0.058317] kvm [1]: Hyp mode initialized successfully
[    0.059885] futex hash table entries: 512 (order: 3, 32768 bytes)
[    0.060498] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.070185] VFS: Disk quotas dquot_6.5.2
[    0.070444] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    0.072364] FS-Cache: Netfs 'nfs' registered for caching
[    0.072989] NFS: Registering the id_resolver key type
[    0.073059] Key type id_resolver registered
[    0.073075] Key type id_legacy registered
[    0.073103] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.073135] Installing knfsd (copyright (C) 1996 okir-pn4DOG8n3UYbFoVRYvo4fw@public.gmane.org).
[    0.073686] FS-Cache: Netfs 'cifs' registered for caching
[    0.074116] ntfs: driver 2.1.30 [Flags: R/W DEBUG].
[    0.074506] fuse init (API version 7.23)
[    0.075114] msgmni has been set to 1477
[    0.076386] bounce: pool size: 64 pages
[    0.076674] Block layer SCSI generic (bsg) driver version 0.4 loaded=20
(major 250)
[    0.076708] io scheduler noop registered
[    0.076727] io scheduler deadline registered
[    0.076933] io scheduler cfq registered (default)
[    0.077552] platform 1c13400.phy: Driver sun4i-usb-phy requests probe=20
deferral
[    0.080305] sun7i-a20-pinctrl 1c20800.pinctrl: initialized sunXi PIO=20
driver
[    0.080827] gpio-sch311xI/O address 0x002e already in use
[    0.080850] gpio-sch311xI/O address 0x004e already in use
[    0.080865] gpio-sch311xI/O address 0x162e already in use
[    0.080879] gpio-sch311xI/O address 0x164e already in use
[    0.082490] ipmi message handler version 39.2
[    0.082543] ipmi device interface
[    0.082701] IPMI System Interface driver.
[    0.082749] ipmi_si: Unable to find any System Interface(s)
[    0.082782] IPMI Watchdog: driver initialized
[    0.082804] Copyright (C) 2004 MontaVista Software - IPMI Powerdown via=
=20
sys_reboot.
[    0.090613] xenfs: not registering filesystem on non-xen platform
[    0.147908] Serial: 8250/16550 driver, 8 ports, IRQ sharing disabled
[    0.150995] console [ttyS0] disabled
[    0.171179] 1c28000.serial: ttyS0 at MMIO 0x1c28000 (irq =3D 33, base_ba=
ud=20
=3D 1500000) is a U6_16550A
[    0.968467] console [ttyS0] enabled
[    0.972364] Serial: IMX driver
[    0.976408] serial: Freescale lpuart driver
[    0.981436] [drm] Initialized drm 1.1.0 20060810
[    0.996285] drbd: initialized. Version: 8.4.3 (api:1/proto:86-101)
[    1.002491] drbd: built-in
[    1.005199] drbd: registered as block device major 147
[    1.011934] platform 1c18000.sata: Driver ahci-sunxi requests probe=20
deferral
[    1.019707] SSFDC read-only Flash Translation layer
[    1.047215] nand: Could not find valid JEDEC parameter page; aborting
[    1.053679] nand: device found, Manufacturer ID: 0xec, Chip ID: 0xd7
[    1.060066] nand: Samsung NAND 4GiB 3,3V 8-bit
[    1.064513] nand: 4096MiB, MLC, page size: 8192, OOB size: 640
[    1.070444] sunxi_nand 1c03000.nand: failed to init nand chips
[    1.076380] sunxi_nand: probe of 1c03000.nand failed with error -22


What could I do to fix this error?=20
will be I did something wrong?=20

Hug!

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_670_1488698117.1411755078642
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Good afternoon everyone&nbsp;</div><div><br></div><di=
v>I've been doing some test patches Emilio L=C3=B3pez&nbsp;</div><div><br><=
/div><div>dma: sun4i: Add support for the DMA engine on sun [457] i SoCs&nb=
sp;</div><div>spi: sun4i: add DMA support&nbsp;</div><div>ARM: sun7i: Add n=
ode to Represent the DMA controller&nbsp;</div><div>ARM: sun7i: enable DMA =
on SPI&nbsp;</div><div><br></div><div>But Patches Boris BREZILLON&nbsp;</di=
v><div>Add the sunxi NAND Flash Controller V5&nbsp;</div><div><br></div><di=
v>Result I have is this:</div><div><br></div><div>Image Name: &nbsp; Linux-=
3.16.0-rc6<br></div><div><br></div><div><div>[ &nbsp; &nbsp;0.000000] Booti=
ng Linux on physical CPU 0x0</div><div>[ &nbsp; &nbsp;0.000000] Linux versi=
on 3.16.0-rc6-g40a77a5-dirty (root@vbi7) (gcc version 4.7.2 (Debian 4.7.2-5=
) ) #3 SMP Fri Sep 26 11:56:35 BRT 2014</div><div>[ &nbsp; &nbsp;0.000000] =
CPU: ARMv7 Processor [410fc074] revision 4 (ARMv7), cr=3D30c5387d</div><div=
>[ &nbsp; &nbsp;0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT ali=
asing instruction cache</div><div>[ &nbsp; &nbsp;0.000000] Machine model: C=
ubietech Cubieboard2</div><div>[ &nbsp; &nbsp;0.000000] Forcing write-alloc=
ate cache policy for SMP</div><div>[ &nbsp; &nbsp;0.000000] Memory policy: =
Data cache writealloc</div><div>[ &nbsp; &nbsp;0.000000] psci: probing for =
conduit method from DT.</div><div>[ &nbsp; &nbsp;0.000000] psci: Using PSCI=
 v0.1 Function IDs from DT</div><div>[ &nbsp; &nbsp;0.000000] PERCPU: Embed=
ded 7 pages/cpu @eefd0000 s7936 r8192 d12544 u32768</div><div>[ &nbsp; &nbs=
p;0.000000] Built 1 zonelists in Zone order, mobility grouping on. &nbsp;To=
tal pages: 260624</div><div>[ &nbsp; &nbsp;0.000000] Kernel command line: c=
onsole=3Dtty0 console=3DttyS0,115200 hdmi.audio=3DEDID:0 disp.screen0_outpu=
t_mode=3DEDID:1280x800p60 root=3D/dev/mmcblk0p1 rootfstype=3Dext4 0</div><d=
iv>[ &nbsp; &nbsp;0.000000] PID hash table entries: 4096 (order: 2, 16384 b=
ytes)</div><div>[ &nbsp; &nbsp;0.000000] Dentry cache hash table entries: 1=
31072 (order: 7, 524288 bytes)</div><div>[ &nbsp; &nbsp;0.000000] Inode-cac=
he hash table entries: 65536 (order: 6, 262144 bytes)</div><div>[ &nbsp; &n=
bsp;0.000000] Memory: 1026836K/1048576K available (8121K kernel code, 779K =
rwdata, 2716K rodata, 595K init, 321K bss, 21740K reserved, 270336K highmem=
)</div><div>[ &nbsp; &nbsp;0.000000] Virtual kernel memory layout:</div><di=
v>[ &nbsp; &nbsp;0.000000] &nbsp; &nbsp; vector &nbsp;: 0xffff0000 - 0xffff=
1000 &nbsp; ( &nbsp; 4 kB)</div><div>[ &nbsp; &nbsp;0.000000] &nbsp; &nbsp;=
 fixmap &nbsp;: 0xffc00000 - 0xffe00000 &nbsp; (2048 kB)</div><div>[ &nbsp;=
 &nbsp;0.000000] &nbsp; &nbsp; vmalloc : 0xf0000000 - 0xff000000 &nbsp; ( 2=
40 MB)</div><div>[ &nbsp; &nbsp;0.000000] &nbsp; &nbsp; lowmem &nbsp;: 0xc0=
000000 - 0xef800000 &nbsp; ( 760 MB)</div><div>[ &nbsp; &nbsp;0.000000] &nb=
sp; &nbsp; pkmap &nbsp; : 0xbfe00000 - 0xc0000000 &nbsp; ( &nbsp; 2 MB)</di=
v><div>[ &nbsp; &nbsp;0.000000] &nbsp; &nbsp; modules : 0xbf000000 - 0xbfe0=
0000 &nbsp; ( &nbsp;14 MB)</div><div>[ &nbsp; &nbsp;0.000000] &nbsp; &nbsp;=
 &nbsp; .text : 0xc0008000 - 0xc0a9d7c0 &nbsp; (10838 kB)</div><div>[ &nbsp=
; &nbsp;0.000000] &nbsp; &nbsp; &nbsp; .init : 0xc0a9e000 - 0xc0b32f00 &nbs=
p; ( 596 kB)</div><div>[ &nbsp; &nbsp;0.000000] &nbsp; &nbsp; &nbsp; .data =
: 0xc0b34000 - 0xc0bf6c48 &nbsp; ( 780 kB)</div><div>[ &nbsp; &nbsp;0.00000=
0] &nbsp; &nbsp; &nbsp; &nbsp;.bss : 0xc0bf6c50 - 0xc0c47070 &nbsp; ( 322 k=
B)</div><div>[ &nbsp; &nbsp;0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinO=
bjects=3D0, CPUs=3D2, Nodes=3D1</div><div>[ &nbsp; &nbsp;0.000000] Hierarch=
ical RCU implementation.</div><div>[ &nbsp; &nbsp;0.000000] &nbsp;RCU restr=
icting CPUs from NR_CPUS=3D4 to nr_cpu_ids=3D2.</div><div>[ &nbsp; &nbsp;0.=
000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D2</d=
iv><div>[ &nbsp; &nbsp;0.000000] NR_IRQS:16 nr_irqs:16 16</div><div>[ &nbsp=
; &nbsp;0.000000] Architected cp15 timer(s) running at 24.00MHz (phys).</di=
v><div>[ &nbsp; &nbsp;0.000007] sched_clock: 56 bits at 24MHz, resolution 4=
1ns, wraps every 2863311519744ns</div><div>[ &nbsp; &nbsp;0.000014] Switchi=
ng to timer-based delay loop</div><div>[ &nbsp; &nbsp;0.001052] sched_clock=
: 32 bits at 24MHz, resolution 41ns, wraps every 178956969942ns</div><div>[=
 &nbsp; &nbsp;0.001378] sched_clock: 32 bits at 160MHz, resolution 6ns, wra=
ps every 26843545593ns</div><div>[ &nbsp; &nbsp;0.001587] Console: colour d=
ummy device 80x30</div><div>[ &nbsp; &nbsp;0.002002] console [tty0] enabled=
</div><div>[ &nbsp; &nbsp;0.002035] Calibrating delay loop (skipped), value=
 calculated using timer frequency.. 48.00 BogoMIPS (lpj=3D240000)</div><div=
>[ &nbsp; &nbsp;0.002063] pid_max: default: 32768 minimum: 301</div><div>[ =
&nbsp; &nbsp;0.002197] Mount-cache hash table entries: 2048 (order: 1, 8192=
 bytes)</div><div>[ &nbsp; &nbsp;0.002220] Mountpoint-cache hash table entr=
ies: 2048 (order: 1, 8192 bytes)</div><div>[ &nbsp; &nbsp;0.002811] CPU: Te=
sting write buffer coherency: ok</div><div>[ &nbsp; &nbsp;0.003090] /cpus/c=
pu@0 missing clock-frequency property</div><div>[ &nbsp; &nbsp;0.003119] /c=
pus/cpu@1 missing clock-frequency property</div><div>[ &nbsp; &nbsp;0.00314=
0] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000</div><div>[ &nbsp; &nbs=
p;0.003311] Setting up static identity map for 0x407b1ec0 - 0x407b1f58</div=
><div>[ &nbsp; &nbsp;0.005296] CPU1: Booted secondary processor</div><div>[=
 &nbsp; &nbsp;0.005341] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001</d=
iv><div>[ &nbsp; &nbsp;0.005426] Brought up 2 CPUs</div><div>[ &nbsp; &nbsp=
;0.005476] SMP: Total of 2 processors activated.</div><div>[ &nbsp; &nbsp;0=
.005490] CPU: All CPU(s) started in HYP mode.</div><div>[ &nbsp; &nbsp;0.00=
5501] CPU: Virtualization extensions available.</div><div>[ &nbsp; &nbsp;0.=
006172] devtmpfs: initialized</div><div>[ &nbsp; &nbsp;0.010413] VFP suppor=
t v0.3: implementor 41 architecture 2 part 30 variant 7 rev 4</div><div>[ &=
nbsp; &nbsp;0.010862] pinctrl core: initialized pinctrl subsystem</div><div=
>[ &nbsp; &nbsp;0.011360] regulator-dummy: no parameters</div><div>[ &nbsp;=
 &nbsp;0.017149] NET: Registered protocol family 16</div><div>[ &nbsp; &nbs=
p;0.017683] DMA: preallocated 256 KiB pool for atomic coherent allocations<=
/div><div>[ &nbsp; &nbsp;0.026000] Serial: AMBA PL011 UART driver</div><div=
>[ &nbsp; &nbsp;0.039029] edma-dma-engine edma-dma-engine.0: Can't allocate=
 PaRAM dummy slot</div><div>[ &nbsp; &nbsp;0.039082] edma-dma-engine: probe=
 of edma-dma-engine.0 failed with error -5</div><div>[ &nbsp; &nbsp;0.03954=
6] reg-fixed-voltage ahci-5v: could not find pctldev for node /soc@01c00000=
/pinctrl@01c20800/ahci_pwr_pin@0, deferring probe</div><div>[ &nbsp; &nbsp;=
0.039585] platform ahci-5v: Driver reg-fixed-voltage requests probe deferra=
l</div><div>[ &nbsp; &nbsp;0.039621] reg-fixed-voltage usb1-vbus: could not=
 find pctldev for node /soc@01c00000/pinctrl@01c20800/usb1_vbus_pin@0, defe=
rring probe</div><div>[ &nbsp; &nbsp;0.039650] platform usb1-vbus: Driver r=
eg-fixed-voltage requests probe deferral</div><div>[ &nbsp; &nbsp;0.039681]=
 reg-fixed-voltage usb2-vbus: could not find pctldev for node /soc@01c00000=
/pinctrl@01c20800/usb2_vbus_pin@0, deferring probe</div><div>[ &nbsp; &nbsp=
;0.039710] platform usb2-vbus: Driver reg-fixed-voltage requests probe defe=
rral</div><div>[ &nbsp; &nbsp;0.039899] vcc3v0: 3000 mV</div><div>[ &nbsp; =
&nbsp;0.040216] vcc3v3: 3300 mV</div><div>[ &nbsp; &nbsp;0.041627] SCSI sub=
system initialized</div><div>[ &nbsp; &nbsp;0.042259] usbcore: registered n=
ew interface driver usbfs</div><div>[ &nbsp; &nbsp;0.042343] usbcore: regis=
tered new interface driver hub</div><div>[ &nbsp; &nbsp;0.042466] usbcore: =
registered new device driver usb</div><div>[ &nbsp; &nbsp;0.043205] pps_cor=
e: LinuxPPS API ver. 1 registered</div><div>[ &nbsp; &nbsp;0.043225] pps_co=
re: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti &lt;giometti=
@linux.it&gt;</div><div>[ &nbsp; &nbsp;0.043268] PTP clock support register=
ed</div><div>[ &nbsp; &nbsp;0.043360] EDAC MC: Ver: 3.0.0</div><div>[ &nbsp=
; &nbsp;0.044601] Bluetooth: Core ver 2.19</div><div>[ &nbsp; &nbsp;0.04467=
6] NET: Registered protocol family 31</div><div>[ &nbsp; &nbsp;0.044691] Bl=
uetooth: HCI device and connection manager initialized</div><div>[ &nbsp; &=
nbsp;0.044718] Bluetooth: HCI socket layer initialized</div><div>[ &nbsp; &=
nbsp;0.044737] Bluetooth: L2CAP socket layer initialized</div><div>[ &nbsp;=
 &nbsp;0.044773] Bluetooth: SCO socket layer initialized</div><div>[ &nbsp;=
 &nbsp;0.045283] Switched to clocksource arch_sys_counter</div><div>[ &nbsp=
; &nbsp;0.045659] FS-Cache: Loaded</div><div>[ &nbsp; &nbsp;0.055161] NET: =
Registered protocol family 2</div><div>[ &nbsp; &nbsp;0.055906] TCP establi=
shed hash table entries: 8192 (order: 3, 32768 bytes)</div><div>[ &nbsp; &n=
bsp;0.056001] TCP bind hash table entries: 8192 (order: 4, 65536 bytes)</di=
v><div>[ &nbsp; &nbsp;0.056130] TCP: Hash tables configured (established 81=
92 bind 8192)</div><div>[ &nbsp; &nbsp;0.056214] TCP: reno registered</div>=
<div>[ &nbsp; &nbsp;0.056236] UDP hash table entries: 512 (order: 2, 16384 =
bytes)</div><div>[ &nbsp; &nbsp;0.056296] UDP-Lite hash table entries: 512 =
(order: 2, 16384 bytes)</div><div>[ &nbsp; &nbsp;0.056557] NET: Registered =
protocol family 1</div><div>[ &nbsp; &nbsp;0.056921] RPC: Registered named =
UNIX socket transport module.</div><div>[ &nbsp; &nbsp;0.056951] RPC: Regis=
tered udp transport module.</div><div>[ &nbsp; &nbsp;0.056965] RPC: Registe=
red tcp transport module.</div><div>[ &nbsp; &nbsp;0.056978] RPC: Registere=
d tcp NFSv4.1 backchannel transport module.</div><div>[ &nbsp; &nbsp;0.0577=
45] kvm [1]: Using HYP init bounce page @6e1ef000</div><div>[ &nbsp; &nbsp;=
0.058071] kvm [1]: interrupt-controller@1c84000 IRQ25</div><div>[ &nbsp; &n=
bsp;0.058278] kvm [1]: timer IRQ27</div><div>[ &nbsp; &nbsp;0.058317] kvm [=
1]: Hyp mode initialized successfully</div><div>[ &nbsp; &nbsp;0.059885] fu=
tex hash table entries: 512 (order: 3, 32768 bytes)</div><div>[ &nbsp; &nbs=
p;0.060498] HugeTLB registered 2 MB page size, pre-allocated 0 pages</div><=
div>[ &nbsp; &nbsp;0.070185] VFS: Disk quotas dquot_6.5.2</div><div>[ &nbsp=
; &nbsp;0.070444] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes=
)</div><div>[ &nbsp; &nbsp;0.072364] FS-Cache: Netfs 'nfs' registered for c=
aching</div><div>[ &nbsp; &nbsp;0.072989] NFS: Registering the id_resolver =
key type</div><div>[ &nbsp; &nbsp;0.073059] Key type id_resolver registered=
</div><div>[ &nbsp; &nbsp;0.073075] Key type id_legacy registered</div><div=
>[ &nbsp; &nbsp;0.073103] nfs4filelayout_init: NFSv4 File Layout Driver Reg=
istering...</div><div>[ &nbsp; &nbsp;0.073135] Installing knfsd (copyright =
(C) 1996 okir-pn4DOG8n3UYbFoVRYvo4fw@public.gmane.org).</div><div>[ &nbsp; &nbsp;0.073686] FS-Cache: N=
etfs 'cifs' registered for caching</div><div>[ &nbsp; &nbsp;0.074116] ntfs:=
 driver 2.1.30 [Flags: R/W DEBUG].</div><div>[ &nbsp; &nbsp;0.074506] fuse =
init (API version 7.23)</div><div>[ &nbsp; &nbsp;0.075114] msgmni has been =
set to 1477</div><div>[ &nbsp; &nbsp;0.076386] bounce: pool size: 64 pages<=
/div><div>[ &nbsp; &nbsp;0.076674] Block layer SCSI generic (bsg) driver ve=
rsion 0.4 loaded (major 250)</div><div>[ &nbsp; &nbsp;0.076708] io schedule=
r noop registered</div><div>[ &nbsp; &nbsp;0.076727] io scheduler deadline =
registered</div><div>[ &nbsp; &nbsp;0.076933] io scheduler cfq registered (=
default)</div><div>[ &nbsp; &nbsp;0.077552] platform 1c13400.phy: Driver su=
n4i-usb-phy requests probe deferral</div><div>[ &nbsp; &nbsp;0.080305] sun7=
i-a20-pinctrl 1c20800.pinctrl: initialized sunXi PIO driver</div><div>[ &nb=
sp; &nbsp;0.080827] gpio-sch311xI/O address 0x002e already in use</div><div=
>[ &nbsp; &nbsp;0.080850] gpio-sch311xI/O address 0x004e already in use</di=
v><div>[ &nbsp; &nbsp;0.080865] gpio-sch311xI/O address 0x162e already in u=
se</div><div>[ &nbsp; &nbsp;0.080879] gpio-sch311xI/O address 0x164e alread=
y in use</div><div>[ &nbsp; &nbsp;0.082490] ipmi message handler version 39=
.2</div><div>[ &nbsp; &nbsp;0.082543] ipmi device interface</div><div>[ &nb=
sp; &nbsp;0.082701] IPMI System Interface driver.</div><div>[ &nbsp; &nbsp;=
0.082749] ipmi_si: Unable to find any System Interface(s)</div><div>[ &nbsp=
; &nbsp;0.082782] IPMI Watchdog: driver initialized</div><div>[ &nbsp; &nbs=
p;0.082804] Copyright (C) 2004 MontaVista Software - IPMI Powerdown via sys=
_reboot.</div><div>[ &nbsp; &nbsp;0.090613] xenfs: not registering filesyst=
em on non-xen platform</div><div>[ &nbsp; &nbsp;0.147908] Serial: 8250/1655=
0 driver, 8 ports, IRQ sharing disabled</div><div>[ &nbsp; &nbsp;0.150995] =
console [ttyS0] disabled</div><div>[ &nbsp; &nbsp;0.171179] 1c28000.serial:=
 ttyS0 at MMIO 0x1c28000 (irq =3D 33, base_baud =3D 1500000) is a U6_16550A=
</div><div>[ &nbsp; &nbsp;0.968467] console [ttyS0] enabled</div><div>[ &nb=
sp; &nbsp;0.972364] Serial: IMX driver</div><div>[ &nbsp; &nbsp;0.976408] s=
erial: Freescale lpuart driver</div><div>[ &nbsp; &nbsp;0.981436] [drm] Ini=
tialized drm 1.1.0 20060810</div><div>[ &nbsp; &nbsp;0.996285] drbd: initia=
lized. Version: 8.4.3 (api:1/proto:86-101)</div><div>[ &nbsp; &nbsp;1.00249=
1] drbd: built-in</div><div>[ &nbsp; &nbsp;1.005199] drbd: registered as bl=
ock device major 147</div><div>[ &nbsp; &nbsp;1.011934] platform 1c18000.sa=
ta: Driver ahci-sunxi requests probe deferral</div><div>[ &nbsp; &nbsp;1.01=
9707] SSFDC read-only Flash Translation layer</div><div>[ &nbsp; &nbsp;1.04=
7215] nand: Could not find valid JEDEC parameter page; aborting</div><div>[=
 &nbsp; &nbsp;1.053679] nand: device found, Manufacturer ID: 0xec, Chip ID:=
 0xd7</div><div>[ &nbsp; &nbsp;1.060066] nand: Samsung NAND 4GiB 3,3V 8-bit=
</div><div>[ &nbsp; &nbsp;1.064513] nand: 4096MiB, MLC, page size: 8192, OO=
B size: 640</div><div>[ &nbsp; &nbsp;1.070444] sunxi_nand 1c03000.nand: fai=
led to init nand chips</div><div>[ &nbsp; &nbsp;1.076380] sunxi_nand: probe=
 of 1c03000.nand failed with error -22</div></div><div><br></div><div><br><=
/div><div><div>What could I do to fix this error?&nbsp;</div><div>will be I=
 did something wrong?&nbsp;</div><div><br></div><div>Hug!</div></div><div><=
br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_670_1488698117.1411755078642--
