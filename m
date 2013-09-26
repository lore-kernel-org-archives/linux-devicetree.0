From: Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
Subject: Re: device tree binding documentation outdated
Date: Thu, 26 Sep 2013 18:48:38 -0500
Message-ID: <CAHCPf3vXbzL4=EZhRb5XRMUg302mgrGAdM3ns7KatSa0uTTt2w@mail.gmail.com>
References: <20130926195158.GS12758@n2100.arm.linux.org.uk>
	<CAOMZO5ANsZGcpvmtBE7d0q0E6+f0bE_U8CBF7G2v3xtqoLbqcA@mail.gmail.com>
	<20130926205906.GT12758@n2100.arm.linux.org.uk>
	<CAHCPf3u9KyoJiAPv6oc_ZdVBqgix41__RAGRXh8z+d5bXO8fQw@mail.gmail.com>
	<20130926232907.GV12758@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130926232907.GV12758-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Neat.

So the pushback I had on my initial objections was that having huge
lists of numbers is daunting and doesn't help novice device tree
writers add pin controls to the device tree. There is one benefit that
comes from it; update one preprocessor definition and all device trees
referencing it magically get new values.

An example:

https://git.linaro.org/gitweb?p=3Dpeople/shawnguo/linux-2.6.git;a=3Dcom=
mit;h=3D538bcbe251d621aa19c46babafd01ede8fb6ddde

One fix, every device tree picks it up.. so using preprocessor macros
really works. Congrats...

=2E... except this pin definition is referenced ONCE in a common includ=
e
for all i.MX6 (Q, D, L) platforms.

So the amount of work required actually could have been "patch one
line in the imx6qdl.dtsi" instead. Net benefit: zero. All the values
are in the manual, too.. and the manual is publicly available.

Add this to making the whole device tree source bigger than it needs
to be, introducing a magic 'save the preprocessor output for
validation' step for most people who debug this stuff for a living,
and a 3-extra-step round trip from the manual to create new trees from
cross reference to dirt old BSP source code (which, let's face it, is
exactly where most people doing an i.MX device tree are getting their
code from).

It is better than the original fsl,pins =3D <arbitrary_index> <pad
settings | (SION lsl 16)>, I will give you that.

I would propose we ditch pre-processing, and go back to raw values and
commenting the DT in this instance. There are other, much more noble,
uses for the preprocessing functionality.

Would anyone be too angry if I swapped the values to a logical order?


On Thu, Sep 26, 2013 at 6:29 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Thu, Sep 26, 2013 at 06:10:21PM -0500, Matt Sealey wrote:
>> Thankfully, you ran into this.. I am vindicated in my objections to
>> the initial patches, which were summarily ignored. This is not why
>> preprocessing device trees is a good idea, in fact it is the very
>> definition of the worst possible usage for it. It doesn't make writi=
ng
>> device trees easier - it took me longer to port pinctrl in the tree =
I
>> had to the new binding than it did to write the ENTIRE initial tree
>> with the old pinctrl binding in the first place.
>
> Yes.  I've been at DT for over six hours now, and all I've been able =
to
> sort out is getting the two USB and SD cards working.  Honestly, I fe=
el
> totally worn out now through the amount of cross correlation that I'm
> having to do to ensure I'm getting this stuff correct.
>
> As Rabeeh uses the old macros from the header file, I'm having to loo=
k
> those up.  Then I'm having to find the corresponding entry in the
> -pinfunc.h header file.  Then I'm having to check whether the group
> of pinctrl settings are correct - and if they are, use them.  If they
> aren't, then wonder what to do about it.
>
> I've taken the time to convert three directly (the sdhci card detect
> and write protect signals) and the OTG ID signal.  The SPDIF I've
> listed in the dts file I just grabbed from the imx6dl.dtsi file (the
> one in there is paired with spdif in.)
>
> There's the HDMI, ethernet and SPDIF out properly still to go.
>
> I haven't sorted out a rootfs for this yet, so it fails trying to fin=
d
> that.  (Rabeeh's kernel contained an initramfs buildroot image - it
> might be useful to find some way to load that as a separate image -
> does appended DT support that?)
>
> Anyway, attached are the DTS and current boot log.
>
> /dts-v1/;
>
> #include "imx6dl.dtsi"
>
> / {
>         model =3D "Solid-Run Cubox-i DL/Solo Board";
>         compatible =3D "solid-run,cubox-i", "fsl,imx6dl";
>
>         regulators {
>                 compatible =3D "simple-bus";
>
>                 reg_3p3v: 3p3v {
>                         compatible =3D "regulator-fixed";
>                         regulator-name =3D "3P3V";
>                         regulator-min-microvolt =3D <3300000>;
>                         regulator-max-microvolt =3D <3300000>;
>                         regulator-always-on;
>                 };
>
>                 reg_usb_otg_vbus: usb_otg_vbus {
>                         compatible =3D "regulator-fixed";
>                         regulator-name =3D "usb_otg_vbus";
>                         regulator-min-microvolt =3D <5000000>;
>                         regulator-max-microvolt =3D <5000000>;
>                         gpio =3D <&gpio3 22 0>;
>                         enable-active-high;
>                 };
>
>                 reg_usb_h1_vbus: usb_h1_vbus {
>                         compatible =3D "regulator-fixed";
>                         regulator-name =3D "usb_h1_vbus";
>                         regulator-min-microvolt =3D <5000000>;
>                         regulator-max-microvolt =3D <5000000>;
>                         gpio =3D <&gpio1 0 0>;
>                         enable-active-high;
>                 };
>         };
> };
>
> &can1 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_flexcan1_2>;
>         status =3D "okay";
> };
>
> &i2c1 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_i2c1_1>;
>
>         /*
>          * Not fitted on developer board
>         status =3D "okay";
>
>         rtc: pcf8523@68 {
>                 compatible =3D "nxp,pcf8523";
>                 reg =3D <0x68>;
>         };
>          */
> };
>
> &i2c2 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_i2c2_2>;
>         status =3D "okay";
>
>         /* HDMI @0x50 */
> };
>
> &iomuxc {
>         pinctrl_spdif_2_out_only: spdifgrp-3 {
>                 fsl,pins =3D <
>                         MX6QDL_PAD_GPIO_17__SPDIF_OUT 0x1b0b0
>                 >;
>         };
>
>         usbhc2 {
>                 pinctrl_usdhc2_cd_wp: usdhc2_cd_wp {
>                         fsl,pins =3D <
>                                 MX6QDL_PAD_GPIO_4__SD2_CD_B 0x1f059
>                                 MX6QDL_PAD_GPIO_2__SD2_WP 0x1f059
>                         >;
>                 };
>         };
>
>         usbotg {
>                 pinctrl_usbotg_cubox: usbotggrp-3 {
>                         /*
>                          * Originally pinctrl_usbotg_2, but we want i=
t to
>                          * be pulled down for fixed host connection.
>                          */
>                         fsl,pins =3D <
>                                 MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x13059
>                         >;
>                 };
>         };
> };
>
> &uart1 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_uart1_1>;
>         status =3D "okay";
> };
>
> &usbotg {
>         vbus-supply =3D <&reg_usb_otg_vbus>;
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_usbotg_cubox>;
>         status =3D "okay";
> };
>
> &usbh1 {
>         vbus-supply =3D <&reg_usb_h1_vbus>;
>         status =3D "okay";
> };
>
> &usdhc2 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_usdhc2_2 &pinctrl_usdhc2_cd_wp>;
>         vmmc-supply =3D <&reg_3p3v>;
>         cd-gpios =3D <&gpio1 4 0>;
>         /*
>          * Cubox-i dev board doesn't have this wired
>          * but comments suggest real hardware does.
>         wp-gpios =3D <&gpio1 2 0>;
>          */
>         status =3D "okay";
> };
>
> /* experimental stuff */
>
> /* USDHC1 - Connected to BRCM Wifi/BT/FM */
> &usdhc1 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_usdhc1_2>;
>         status =3D "okay";
> };
>
> /* SPDIF out */
>
> /* CAN1 */
> /* CCM */
>
> /* ECSPI2 */
>
> /* I2C1 */
> /* I2C2 - HDMI DDC */
>
> /* I2C3 */
> &i2c3 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_i2c3_1>;
>         status =3D "okay";
> };
>
> /* PWM */
>
> /* UART2 */
>
> /* USB OC pin */
>
> /* USDHC2 */
>
> /* USDHC3 */
> &usdhc3 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_usdhc3_1>;
>         status =3D "disabled";
> };
>
> /* USDHC4 */
> &usdhc4 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_usdhc4_1>;
>         status =3D "disabled";
> };
>
> #if 0
> &fec {
>         pintctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_enet_1>;
>         phy-mode =3D "rgmii";
>         status =3D "okay";
> };
> #endif
>
>
> Uncompressing Linux... done, booting the kernel.
> Booting Linux on physical CPU 0x0
> Linux version 3.12.0-rc1+ (rmk-eh5Bv4kxaXIANfyc6IWni62ZND6+EDdj@public.gmane.org) (gcc version =
4.5.4 (GCC) ) #7 SMP Thu Sep 26 19:28:35 BST 2013
> CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=3D10c53c7d
> CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction ca=
che
> Machine: Freescale i.MX6 Quad/DualLite (Device Tree), model: Solid-Ru=
n Cubox-i DL/Solo Board
> Memory policy: ECC disabled, Data cache writealloc
> PERCPU: Embedded 7 pages/cpu @80cc0000 s7488 r8192 d12992 u32768
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: =
130048
> Kernel command line: console=3Dttymxc0,115200 video=3Dmxcfb0:dev=3Dhd=
mi,1920x1080M@60,if=3DRGB24,bpp=3D32 rootdelay=3D3
> PID hash table entries: 2048 (order: 1, 8192 bytes)
> Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
> Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
> Memory: 510764K/524288K available (6007K kernel code, 287K rwdata, 18=
64K rodata, 323K init, 375K bss, 13524K reserved)
> Virtual kernel memory layout:
>     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
>     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
>     vmalloc : 0xa0800000 - 0xff000000   (1512 MB)
>     lowmem  : 0x80000000 - 0xa0000000   ( 512 MB)
>     modules : 0x7f000000 - 0x80000000   (  16 MB)
>       .text : 0x80008000 - 0x807b7ec8   (7872 kB)
>       .init : 0x807b8000 - 0x80808d40   ( 324 kB)
>       .data : 0x8080a000 - 0x80851d20   ( 288 kB)
>        .bss : 0x80851d28 - 0x808afa6c   ( 376 kB)
> SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1
> Hierarchical RCU implementation.
>         RCU restricting CPUs from NR_CPUS=3D4 to nr_cpu_ids=3D1.
> NR_IRQS:16 nr_irqs:16 16
> L310 cache controller enabled
> l2x0: 16 ways, CACHE_ID 0x410000c8, AUX_CTRL 0x32050000, Cache size: =
512 kB
> sched_clock: 32 bits at 66MHz, resolution 15ns, wraps every 65075ms
> CPU identified as i.MX6DL, silicon rev 1.1
> Console: colour dummy device 80x30
> Calibrating delay loop... 1581.05 BogoMIPS (lpj=3D7905280)
> pid_max: default: 32768 minimum: 301
> Mount-cache hash table entries: 512
> CPU: Testing write buffer coherency: ok
> CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
> Setting up static identity map for 0x805e37f8 - 0x805e3868
> Brought up 1 CPUs
> SMP: Total of 1 processors activated.
> CPU: All CPU(s) started in SVC mode.
> devtmpfs: initialized
> VFP support v0.3: implementor 41 architecture 3 part 30 variant 9 rev=
 4
> pinctrl core: initialized pinctrl subsystem
> regulator-dummy: no parameters
> NET: Registered protocol family 16
> DMA: preallocated 256 KiB pool for atomic coherent allocations
> syscon 20c8000.anatop: regmap [mem 0x020c8000-0x020c8fff] registered
> vdd1p1: 800 <--> 1375 mV at 1100 mV
> vdd3p0: 2800 <--> 3150 mV at 3000 mV
> vdd2p5: 2000 <--> 2750 mV at 2400 mV
> cpu: 725 <--> 1450 mV at 1150 mV
> vddpu: 725 <--> 1450 mV
> vddsoc: 725 <--> 1450 mV at 1200 mV
> syscon 20e0000.iomuxc-gpr: regmap [mem 0x020e0000-0x020e0037] registe=
red
> syscon 21bc000.ocotp: regmap [mem 0x021bc000-0x021bffff] registered
> hw-breakpoint: found 5 (+1 reserved) breakpoint and 1 watchpoint regi=
sters.
> hw-breakpoint: maximum watchpoint size is 4 bytes.
> imx6dl-pinctrl 20e0000.iomuxc: no groups defined in /soc/aips-bus@020=
00000/iomuxc@020e0000/spdifgrp-3
> imx6dl-pinctrl 20e0000.iomuxc: initialized IMX pinctrl driver
> bio: create slab <bio-0> at 0
> mxs-dma 110000.dma-apbh: initialized
> 3P3V: 3300 mV
> usb_otg_vbus: 5000 mV
> usb_h1_vbus: 5000 mV
> SCSI subsystem initialized
> usbcore: registered new interface driver usbfs
> usbcore: registered new interface driver hub
> usbcore: registered new device driver usb
> i2c i2c-1: IMX I2C adapter registered
> i2c i2c-2: IMX I2C adapter registered
> Linux video capture interface: v2.00
> pps_core: LinuxPPS API ver. 1 registered
> pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti =
<giometti-k2GhghHVRtY@public.gmane.org>
> PTP clock support registered
> Advanced Linux Sound Architecture Driver Initialized.
> Switched to clocksource mxc_timer1
> cfg80211: Calling CRDA to update world regulatory domain
> NET: Registered protocol family 2
> TCP established hash table entries: 4096 (order: 3, 32768 bytes)
> TCP bind hash table entries: 4096 (order: 3, 32768 bytes)
> TCP: Hash tables configured (established 4096 bind 4096)
> TCP: reno registered
> UDP hash table entries: 256 (order: 1, 8192 bytes)
> UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
> NET: Registered protocol family 1
> RPC: Registered named UNIX socket transport module.
> RPC: Registered udp transport module.
> RPC: Registered tcp transport module.
> RPC: Registered tcp NFSv4.1 backchannel transport module.
> hw perfevents: enabled with ARMv7 Cortex-A9 PMU driver, 7 counters av=
ailable
> VFS: Disk quotas dquot_6.5.2
> Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
> NFS: Registering the id_resolver key type
> Key type id_resolver registered
> Key type id_legacy registered
> jffs2: version 2.2. (NAND) =A9 2001-2006 Red Hat, Inc.
> fuse init (API version 7.22)
> msgmni has been set to 997
> io scheduler noop registered
> io scheduler deadline registered
> io scheduler cfq registered (default)
> imx-weim 21b8000.weim: Driver registered.
> imx-sdma 20ec000.sdma: initialized
> Serial: IMX driver
> 2020000.serial: ttymxc0 at MMIO 0x2020000 (irq =3D 58, base_baud =3D =
5000000) is a IMX
> console [ttymxc0] enabled
> serial: Freescale lpuart driver
> [drm] Initialized drm 1.1.0 20060810
> brd: module loaded
> loop: module loaded
> ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> ehci-mxc: Freescale On-Chip EHCI Host driver
> usbcore: registered new interface driver usb-storage
> imx_usb 2184000.usb: usbmisc init failed, ret=3D-517
> platform 2184000.usb: Driver imx_usb requests probe deferral
> imx_usb 2184200.usb: usbmisc init failed, ret=3D-517
> platform 2184200.usb: Driver imx_usb requests probe deferral
> mousedev: PS/2 mouse device common for all mice
> snvs_rtc 20cc034.snvs-rtc-lp: rtc core: registered 20cc034.snvs-rtc-l=
p as rtc0
> i2c /dev entries driver
> imx2-wdt 20bc000.wdog: IMX2+ Watchdog Timer enabled. timeout=3D60s (n=
owayout=3D0)
> sdhci: Secure Digital Host Controller Interface driver
> sdhci: Copyright(c) Pierre Ossman
> sdhci-pltfm: SDHCI platform and OF driver helper
> mmc0: no vqmmc regulator found
> mmc0: no vmmc regulator found
> mmc0: SDHCI controller on 2190000.usdhc [2190000.usdhc] using ADMA
> mmc1: no vqmmc regulator found
> mmc1: SDHCI controller on 2194000.usdhc [2194000.usdhc] using ADMA
> usbcore: registered new interface driver usbhid
> usbhid: USB HID core driver
> [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
> [drm] No driver support for vblank timestamp query.
> [drm] Initialized imx-drm 1.0.0 20120507 on minor 0
> imx-ipuv3 2400000.ipu: IPUv3H probed
> imx-ipuv3-crtc imx-ipuv3-crtc.0: adding crtc failed with -16.
> imx-ipuv3-crtc: probe of imx-ipuv3-crtc.0 failed with error -16
> imx-ipuv3-crtc imx-ipuv3-crtc.1: adding crtc failed with -16.
> imx-ipuv3-crtc: probe of imx-ipuv3-crtc.1 failed with error -16
> TCP: cubic registered
> NET: Registered protocol family 10
> sit: IPv6 over IPv4 tunneling driver
> NET: Registered protocol family 17
> Key type dns_resolver registered
> ci_hdrc ci_hdrc.0: doesn't support gadget
> ci_hdrc ci_hdrc.0: EHCI Host Controller
> ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus number 1
> ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
> hub 1-0:1.0: USB hub found
> hub 1-0:1.0: 1 port detected
> ci_hdrc ci_hdrc.1: doesn't support gadget
> ci_hdrc ci_hdrc.1: EHCI Host Controller
> ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 2
> ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
> hub 2-0:1.0: USB hub found
> hub 2-0:1.0: 1 port detected
> snvs_rtc 20cc034.snvs-rtc-lp: setting system clock to 1970-01-01 00:0=
0:00 UTC (0)
> imx-drm imx-drm: No connectors reported connected with modes
> [drm] Cannot find any crtc or sizes - going 1024x768
> Console: switching to colour frame buffer device 128x48
> imx-drm imx-drm: fb0:  frame buffer device
> imx-drm imx-drm: registered panic notifier
> ALSA device list:
>   No soundcards found.
> Waiting 3 sec before mounting root device...
> mmc1: host does not support reading read-only switch. assuming write-=
enable.
> mmc1: new high speed SDHC card at address 0002
> mmcblk0: mmc1:0002 00000 3.70 GiB
>  mmcblk0: p1
> usb 2-1: new full-speed USB device number 2 using ci_hdrc
> usb-storage 2-1:1.0: USB Mass Storage device detected
> usb-storage 2-1:1.0: Quirks match for vid 1370 pid 6828: 20
> scsi0 : usb-storage 2-1:1.0
> scsi 0:0:0:0: Direct-Access     SWISSBIT Victorinox       1.89 PQ: 0 =
ANSI: 2
> ready
> sd 0:0:0:0: [sda] 126720 512-byte logical blocks: (64.8 MB/61.8 MiB)
> sd 0:0:0:0: [sda] Write Protect is off
> sd 0:0:0:0: [sda] No Caching mode page found
> sd 0:0:0:0: [sda] Assuming drive cache: write through
> sd 0:0:0:0: [sda] No Caching mode page found
> sd 0:0:0:0: [sda] Assuming drive cache: write through
>  sda:
> sd 0:0:0:0: [sda] No Caching mode page found
> sd 0:0:0:0: [sda] Assuming drive cache: write through
> sd 0:0:0:0: [sda] Attached SCSI removable disk
> VFS: Cannot open root device "(null)" or unknown-block(0,0): error -6
> Please append a correct "root=3D" boot option; here are the available=
 partitions:
> b300         3880960 mmcblk0  driver: mmcblk
>   b301          130048 mmcblk0p1 00000000-01
> 0800           63360 sda  driver: sd
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-b=
lock(0,0)
> drm_kms_helper: panic occurred, switching back to text console
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
