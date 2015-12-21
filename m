From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v2 0/8] Raspberry Pi 2 support.
Date: Mon, 21 Dec 2015 15:07:44 -0800
Message-ID: <874mfbflj3.fsf@eliezer.anholt.net>
References: <1450310115-22163-1-git-send-email-eric@anholt.net> <20151218100826.GB1145@omega> <20151220221158.GA6416@omega>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151220221158.GA6416@omega>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Aring <alex.aring@gmail.com>
Cc: linux-rpi-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Scott Branden <sbranden@broadcom.com>, Marc Zyngier <marc.zyngier@arm.com>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Alexander Aring <alex.aring@gmail.com> writes:

> On Fri, Dec 18, 2015 at 11:08:26AM +0100, Alexander Aring wrote:
> ...
>> Uncompressing Linux... done, booting the kernel.
>> [    0.000000] Booting Linux on physical CPU 0x0
>> [    0.000000] Initializing cgroup subsys cpuset
>> [    0.000000] Initializing cgroup subsys cpu
>> [    0.000000] Initializing cgroup subsys cpuacct
>> [    0.000000] Linux version 4.4.0-rc5+ (alex@omega) (gcc version 4.9.2 =
(OSELAS.Toolchain-2014.12.1) ) #989 Fri Dec 18 10:54:40 CET 2015
>> [    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=3D=
10c53c7d
>> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing in=
struction cache
>> [    0.000000] Machine model: Raspberry Pi 2 Model B Rev 1.1
>> [    0.000000] bootconsole [earlycon0] enabled
>> [    0.000000] Truncating RAM at 0x00000000-0x3e000000 to -0x30000000
>> [    0.000000] Consider using a HIGHMEM enabled kernel.
>
> I can remove this "note" when I enable CONFIG_HIGHMEM.
>
>> [    0.000000] Memory policy: Data cache writeback
>> [    0.000000] BUG: mapping for 0x3f201000 at 0xf0201000 out of vmalloc =
space
>> [    0.000000] ------------[ cut here ]------------
>> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm/kernel/devtree.c:149 a=
rm_dt_init_cpu_maps+0x100/0x1a4()
>> [    0.000000] DT /cpu 2 nodes greater than max cores 1, capping them
>> [    0.000000] Modules linked in:
>> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.4.0-rc5+ #989
>> [    0.000000] Hardware name: BCM2835
>> [    0.000000] [<c0016c4c>] (unwind_backtrace) from [<c0013e58>] (show_s=
tack+0x20/0x24)
>> [    0.000000] [<c0013e58>] (show_stack) from [<c0247620>] (dump_stack+0=
x20/0x28)
>> [    0.000000] [<c0247620>] (dump_stack) from [<c0023a84>] (warn_slowpat=
h_common+0x9c/0xc4)
>> [    0.000000] [<c0023a84>] (warn_slowpath_common) from [<c0023aec>] (wa=
rn_slowpath_fmt+0x40/0x48)
>> [    0.000000] [<c0023aec>] (warn_slowpath_fmt) from [<c074ef94>] (arm_d=
t_init_cpu_maps+0x100/0x1a4)
>> [    0.000000] [<c074ef94>] (arm_dt_init_cpu_maps) from [<c074e60c>] (se=
tup_arch+0x6f4/0x89c)
>> [    0.000000] [<c074e60c>] (setup_arch) from [<c074b9cc>] (start_kernel=
+0x74/0x3a4)
>> [    0.000000] [<c074b9cc>] (start_kernel) from [<00008078>] (0x8078)
>> [    0.000000] ---[ end trace cb88537fdc8fa200 ]---
>> [    0.000000] DT missing boot CPU MPIDR[23:0], fall back to default cpu=
_logical_map
>> [    0.000000] CPU: All CPU(s) started in SVC mode.
>
> I can remove this WARNING when I enable CONFIG_SMP.
>
>> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  T=
otal pages: 195072
>> [    0.000000] Kernel command line: earlyprintk console=3DttyAMA0 dma.dm=
achans=3D0x7f35 bcm2708_fb.fbwidth=3D720 bcm2708_fb.fbheight=3D576 bcm2709.=
boardrev=3D0xa01041 bcm2709.serial=3D0x3449476 smsc95xx.macaddr=3DB8:27:EB:=
44:94:76 bcm2708_fb.fbswap=3D1 bcm2709.disk_led_gpio=3D47 bcm2709.disk_led_=
active_low=3D0 sdhci-bcm2708.emmc_clock_freq=3D250000000 vc_mem.mem_base=3D=
0x3ea00000 vc_mem.mem_size=3D0x3f000000  dwc_otg.lpm_enable=3D0 console=3Dt=
tyAMA0,115200 kgdboc=3DttyAMA0,115200 root=3D/dev/mmcblk0p2 rootfstype=3Dex=
t4 rootwait consoleblank=3D0 rw
>> [    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
>> [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288=
 bytes)
>> [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 b=
ytes)
>> [    0.000000] Memory: 770408K/786432K available (5713K kernel code, 426=
K rwdata, 1720K rodata, 420K init, 687K bss, 16024K reserved, 0K cma-reserv=
ed)
>> [    0.000000] Virtual kernel memory layout:
>> [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
>> [    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
>> [    0.000000]     vmalloc : 0xf0800000 - 0xff800000   ( 240 MB)
>> [    0.000000]     lowmem  : 0xc0000000 - 0xf0000000   ( 768 MB)
>> [    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
>> [    0.000000]       .text : 0xc0008000 - 0xc074a7cc   (7434 kB)
>> [    0.000000]       .init : 0xc074b000 - 0xc07b4000   ( 420 kB)
>> [    0.000000]       .data : 0xc07b4000 - 0xc081e910   ( 427 kB)
>> [    0.000000]        .bss : 0xc081e910 - 0xc08ca80c   ( 688 kB)
>> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1=
, Nodes=3D1
>> [    0.000000] NR_IRQS:16 nr_irqs:16 16
>> [    0.000000] Kernel panic - not syncing: /soc/local_intc: unable to ma=
p local interrupt registers
>> [    0.000000]=20
>> [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W       4.4=
.0-rc5+ #989
>> [    0.000000] Hardware name: BCM2835
>> [    0.000000] [<c0016c4c>] (unwind_backtrace) from [<c0013e58>] (show_s=
tack+0x20/0x24)
>> [    0.000000] [<c0013e58>] (show_stack) from [<c0247620>] (dump_stack+0=
x20/0x28)
>> [    0.000000] [<c0247620>] (dump_stack) from [<c00c17c0>] (panic+0x84/0=
x210)
>> [    0.000000] [<c00c17c0>] (panic) from [<c0771d5c>] (bcm2836_arm_irqch=
ip_l1_intc_of_init+0x94/0x110)
>> [    0.000000] [<c0771d5c>] (bcm2836_arm_irqchip_l1_intc_of_init) from [=
<c0779f04>] (of_irq_init+0x1a0/0x2a8)
>> [    0.000000] [<c0779f04>] (of_irq_init) from [<c0771af4>] (irqchip_ini=
t+0x14/0x1c)
>> [    0.000000] [<c0771af4>] (irqchip_init) from [<c074d7a8>] (init_IRQ+0=
x28/0x88)
>> [    0.000000] [<c074d7a8>] (init_IRQ) from [<c074bb64>] (start_kernel+0=
x20c/0x3a4)
>> [    0.000000] [<c074bb64>] (start_kernel) from [<00008078>] (0x8078)
>> [    0.000000] ---[ end Kernel panic - not syncing: /soc/local_intc: una=
ble to map local interrupt registers
>>=20
>
> But still getting this panic, your patches does not contain some
> defconfig, so I still try to figure out what I need to enable to get it
> working. Maybe it is some missing config entry which should be enabled.
>
> But, for me it looks like some devicetree issue, because of_iomem returns
> NULL, at [0]. Don't know what I am doing wrong.

My best guess is that since you're not using U-Boot, the firmware's
mangling the DT in some way that breaks us.  Notably, in my current
firmware checkout, set /soc/ranges to just the first entry that we're
using, which would break the mapping.  However,
rpi/rpi-4.4.y:arch/arm/boot/dts/bcm2709.dtsi uses the same /soc/ranges
setup that we do, so I'm not sure what's going on.  Perhaps
bcm2709_io_desc[]'s initialization covers for it?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWeIZBAAoJELXWKTbR/J7oAxsQAJ2vnnZ4jAdwoJs8KTgf5SWu
2fXUd6JD0K9Usj1bjaYG40buo3TiHvGsNw0P5wlfz4ei9Pyj9ATLT/9pfKdIhu4d
xtktpGG6UJY3T8NGiBcI2mz/ShcRVA91eGsc10cRCGsEIi25I5gR1dEI8bYtuBjz
jUHVTFlYswkbMw9VUeH2VR2EbtbxEpQNFtmzPcBTvCnp9bkQDeccILfO1bndGnpZ
vJuU6kzBjPkyY/0dLrXBNUwtzGWsmL3pOM7Q+atWGgu58lBYSYIz+nSszkyMk+RV
2jChM/tD2VXtyogzJSyLyjXPuCFq8PMdyfigpt4D4aIUh8pLQwlVIwTkkIZ5owHE
JYZ5vIRDEx8uaPFxr9MpcosDy6cQdi53X04WqTv5ThX8nZUCbFICf89KcNYl6FOt
/Ga6lKPBMe9gk12ST1Zp+t4rVhtc7uCBLJ7cTqeylt2u6NUERbuAvoFT/rFyNGWh
JnTYKJpouXbLZjksIB0WChOwOU0I1wCg0YMmnK/613EoHpcv5ivcHVY0SMUnmg8v
JAGMK1rcM6GnAS1ZK6l9m+mj4kd61g3F6XzO+1ppJyNR7N9qGOM5ugcYggtNDj0r
dylXW0P2W9iWTw/5kdWJsSJRtXXbJFujxZLcxwTNawEXDAEV1PYk06sRFvzW3pbd
m+400kaf7kSI4A4V+Pji
=JG71
-----END PGP SIGNATURE-----
--=-=-=--
