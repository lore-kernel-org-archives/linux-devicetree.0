From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/8] Armada XP pinctrl consolidation and ix4-300d fixes
Date: Mon, 06 Oct 2014 09:47:46 +0200
Message-ID: <54324922.906@gmail.com>
References: <1411157684-6991-1-git-send-email-sebastian.hesselbarth@gmail.com> <-7443282711873112734@unknownmsgid> <20141003141102.GJ3895@titan.lakedaemon.net> <542EBB93.108@gmail.com> <A9781A2E-F3CA-4E8A-833C-D167B456D9F7@perenite.com> <542EC3A3.1060605@gmail.com> <1ACB5318-863E-40D8-8B27-41F1C0D0A4B8@perenite.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1ACB5318-863E-40D8-8B27-41F1C0D0A4B8-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Masson <benoitm-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06.10.2014 01:11, Benoit Masson wrote:
> > Le 3 oct. 2014 =E0 17:41, Sebastian Hesselbarth <sebastian.hesselba=
rth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a =E9crit :
>> On 10/03/2014 05:29 PM, Benoit Masson wrote:
>>> Le 3 oct. 2014 =E0 17:06, Sebastian Hesselbarth <sebastian.hesselba=
rth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a =E9crit :
>>>> On 10/03/2014 04:11 PM, Jason Cooper wrote:
>>>>> On Sun, Sep 21, 2014 at 04:11:23PM +0200, Benoit Masson wrote:
>>>>>>> Le 19 sept. 2014 =E0 22:14, Sebastian Hesselbarth <sebastian.he=
sselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a =E9crit :
>> [...]
>>>>>>> Patches are based on v3.17-rc1 and intended for v3.18 but I am =
not in
>>>>>>> a hurry. I only compile tested this, so a formal Tested-by from=
 Benoit
>>>>>>> for the ix4 and any other Armada XP board would be great.
[...]
>>>>> Did you ever get a chance to test this series?
>>>>
>>>> Uhm, I never prepared a branch for Benoit to test. I have pushed t=
he
>>>> patches with Thomas Acked-by's and renamed eeprom node based on
>>>> v3.17-rc1 to
>>>>
>>>> https://github.com/shesselba/linux-dove.git devel/mvebu-ix4
>>>>
[...]
>> It is too late for v3.18 anyway, so I'll resend them once v3.18-rc1
>> drops.
>>
>>> I'll test those over Sunday night.
>
> No so great, so far what I've done:
>   - use my working config this config has worked over mainline 3.16 f=
or weeks
>   - compil you branch with it using you dts file
>   - boot KO it get stuck on i2C pcf8563 init (at least it is the last=
 message dsplayed.
>
> then I turn on DEBUG_LL but I get nothing more on the serial that cou=
ld help
>
>   - I've tried removing the eeprom section you added to the dts -> sa=
me results
>
> Maybe I missed something ? is this branch you sent me a bare fork fro=
m mainline 3.17 ? does it includes the armada XP step A0 patch ?

Benoit,

the branch is straight forked from v3.17-rc1 with the patches in
question added. If there is any fixes that got in after rc1, they
are not included. I'll rebase the series on latest next tonight.

Anyway, I doubt the series is involved in the regression you see,
can you also boot plain v3.17-rc1 and v3.17 which got just released?

Also, DEBUG_LL will not give you any more information on this one,
as you passed serial console hand-off. You only need it for early
debugging and you have to make sure that (a) you select the correct
DEBUG_LL Kconfig for MVEBU with registers located at 0xd0000000 and
(b) you should always double check the phys/virt addresses of the
early console.

> dump of the serial output:
> Uncompressing Linux... done, booting the kernel.
> Booting Linux on physical CPU 0x0
> Linux version 3.17.0-rc1-42264-gb065757 (benoitm@aaaa) (gcc version 4=
=2E6.3 (Debian 4.6.3-14) ) #3 SMP Mon Oct 6 00:42:59 CEST 2014
> CPU: ARMv7 Processor [562f5842] revision 2 (ARMv7), cr=3D10c5387d
> CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
> Machine model: Lenovo Iomega ix4-300d
> Memory policy: Data cache writealloc
> PERCPU: Embedded 7 pages/cpu @dfbd9000 s6784 r8192 d13696 u32768
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: =
130048
> Kernel command line: console=3DttyS0,115200 earlyprintk=3DttyS0,11520=
0 root=3D/dev/md0 rw mem=3D512M

/dev/md0 is soft-RAID on your harddisks, isn't it?
Also, you should not need the mem=3D parameter but that is just a nit.

[...]
> NR_IRQS:16 nr_irqs:16 16
> L2C: device tree omits to specify unified cache

Jason, Thomas, Gregory,

we should add a "cache-unified" to the l2cc nodes for all SoCs.

> L2C: DT/platform modifies aux control register: 0x1a696b10 -> 0x1a696=
b12
> Aurora cache controller enabled, 16 ways, 1024 kB
> Aurora: CACHE_ID 0x00000100, AUX_CTRL 0x1a696b12
> sched_clock: 32 bits at 25MHz, resolution 40ns, wraps every 171798691=
800ns
[...]
> Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> console [ttyS0] disabled
> d0012000.serial: ttyS0 at MMIO 0xd0012000 (irq =3D 19, base_baud =3D =
15625000) is a 16550A
> console [ttyS0] enabled

Here is the serial console hand-off, i.e. if you get this far, you
don't need DEBUG_LL at all.

> zram: Created 1 device(s) ...
> pci 0000:00:01.0: enabling device (0140 -> 0143)
> sata_mv 0000:01:00.0: Gen-IIE 32 slots 4 ports SCSI mode IRQ via INTx
> scsi host0: sata_mv
> scsi host1: sata_mv
> scsi host2: sata_mv
> scsi host3: sata_mv
> ata1: SATA max UDMA/133 mmio m1048576@0xf8000000 port 0xf8022000 irq =
86
> ata2: SATA max UDMA/133 mmio m1048576@0xf8000000 port 0xf8024000 irq =
86
> ata3: SATA max UDMA/133 mmio m1048576@0xf8000000 port 0xf8026000 irq =
86
> ata4: SATA max UDMA/133 mmio m1048576@0xf8000000 port 0xf8028000 irq =
86

Shouldn't it detect your hard-disks attached here?

Sebastian

> pxa3xx-nand d00d0000.nand: This platform can't do DMA on this device
> nand: device found, Manufacturer ID: 0xec, Chip ID: 0xd3
> nand: Samsung NAND 1GiB 3,3V 8-bit
> nand: 1024MiB, SLC, page size: 2048, OOB size: 64
> pxa3xx-nand d00d0000.nand: ECC strength 1, ECC step size 512
> Bad block table found at page 524224, version 0x01
> Bad block table found at page 524160, version 0x01
> nand_read_bbt: bad block at 0x00003ca60000
> 7 ofpart partitions found on MTD device pxa3xx_nand-0
> Creating 7 MTD partitions on "pxa3xx_nand-0":
> 0x000000000000-0x0000000e0000 : "u-boot"
> 0x0000000e0000-0x000000100000 : "u-boot-env"
> 0x000000100000-0x000000120000 : "u-boot-env2"
> 0x000000120000-0x000000520000 : "zImage"
> 0x000000520000-0x000000920000 : "initrd"
> 0x000000e00000-0x000040000000 : "boot"
> 0x000000000000-0x000040000000 : "flash"
> spi_gpio spi3: gpio-miso property not found, switching to no-rx mode
> libphy: orion_mdio_bus: probed
> mvneta d0070000.ethernet eth0: Using hardware mac address 00:d0:b8:25=
:38:4d
> mvneta d0074000.ethernet eth1: Using random mac address 12:93:5b:2b:4=
4:6e
> ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> ehci-pci: EHCI PCI platform driver
> ehci-orion: EHCI orion driver
> orion-ehci d0050000.usb: EHCI Host Controller
> orion-ehci d0050000.usb: new USB bus registered, assigned bus number =
1
> orion-ehci d0050000.usb: irq 25, io mem 0xd0050000
> orion-ehci d0050000.usb: USB 2.0 started, EHCI 1.00
> hub 1-0:1.0: USB hub found
> hub 1-0:1.0: 1 port detected
> orion-ehci d0051000.usb: EHCI Host Controller
> orion-ehci d0051000.usb: new USB bus registered, assigned bus number =
2
> orion-ehci d0051000.usb: irq 26, io mem 0xd0051000
> orion-ehci d0051000.usb: USB 2.0 started, EHCI 1.00
> hub 2-0:1.0: USB hub found
> hub 2-0:1.0: 1 port detected
> xhci_hcd 0000:02:00.0: xHCI Host Controller
> xhci_hcd 0000:02:00.0: new USB bus registered, assigned bus number 3
> hub 3-0:1.0: USB hub found
> hub 3-0:1.0: 2 ports detected
> xhci_hcd 0000:02:00.0: xHCI Host Controller
> xhci_hcd 0000:02:00.0: new USB bus registered, assigned bus number 4
> hub 4-0:1.0: USB hub found
> hub 4-0:1.0: 2 ports detected
> usbcore: registered new interface driver usb-storage
> rtc-mv d0010300.rtc: rtc core: registered d0010300.rtc as rtc0
> i2c /dev entries driver
> rtc-pcf8563 0-0051: chip found, driver version 0.4.3


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
