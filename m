From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/3] mtd: nand: add Broadcom NAND controller support
Date: Sat, 7 Mar 2015 16:57:20 -0800
Message-ID: <20150308005720.GF12966@brian-ubuntu>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <CACna6rykQTjtfL8mqHJ4ZSY9Ci+kVhjDfDkjRpsFvg4YatNATw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACna6rykQTjtfL8mqHJ4ZSY9Ci+kVhjDfDkjRpsFvg4YatNATw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 08, 2015 at 01:01:14AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> Thanks for your work on this. It looks amazing, nice piece of code :)

Thanks :) And thanks for testing this. I believe I suggested to you tha=
t
I'd be releasing this "soon" several months ago. Better late than never=
,
I guess?

> On 7 March 2015 at 02:18, Brian Norris <computersforpeace@gmail.com> =
wrote:
> > This adds (long in coming) support for the Broadcom BCM7xxx Set-Top=
 Box NAND
> > controller. This controller has been used in a variety of Broadcom =
SoCs.
> >
> > There are a few more features I'd like add in the near future, most=
ly to
> > support more SoCs, but this is the base set, which should only need=
 relatively
> > minor additions to support chips like BCM63138, BCM3384, and Cygnus=
/iProc.
> > Particularly, we may need to straighten out some endianness issues =
for the data
> > path on iProc, and interrupt enabling/acking on iProc, BCM63xxx, BC=
M3xxx, and
> > others.
>=20
> After applying workaround for not working IRQ, it seems I have some
> problem with endianess on my BCM4708 (SoC with 6.01 controller).
>=20
> Let me start with dumps of "nvram" MTD partition.
> 1) Dumping with Netgear's original firmware:
> # hexdump -C -n 16 mtdblock1.bin
> 00000000  46 4c 53 48 40 79 00 00  84 01 00 00 47 01 1c 08  |FLSH@y..=
=2E...G...|
> 2) Dumping with OpenWrt and its bcm_nand.c:
> root@OpenWrt:/# hexdump -C -n 16 /dev/mtdblock1
> 00000000  46 4c 53 48 38 79 00 00  cb 01 00 00 47 01 1c 08  |FLSH8y..=
=2E...G...|
>=20
> This makes me feel that bcm_nand.c driver is OK.
> Unfortunately when using brcmstb_nand.c my bcm47xxpart partition
> driver didn't detect any partition at all. This means I couldn't use
> any /dev/mtdblockX, not even user space as it wasn't mounted.
>=20
> So since I didn't have user space, I decided to add some debugging to
> bcm47xxpart itself. There is what I got:
> 1) OpenWrt and its bcm_nand.c:
> [bcm47xxpart_parse] 0x80000  46 4c 53 48  38 79 00 00  cb 01 00 00  4=
7 01 1c 08
> 2) OpenWrt and brcmstb_nand.c:
> [bcm47xxpart_parse] 0x80000  48 53 4c 46  00 00 79 38  00 00 01 cb  0=
8 1c 01 47
>=20
> So obviously data returned by brcmstb_nand.c seems to be all
> endianess-flipped. Could you take a loo at this?

I'll take a look at all your comments/questions when I get back into th=
e
office, but a few pointers:

1. IRQs are a touchy subject; for platforms I've supported, I've found
it best if the NAND interrupt bits are handled in an irqchip driver.
Particularly, that's one of the use cases for
drivers/irqchip/irq-brcmstb-l2.c. If you can arrange the NAND
enable/ack registers to act as a second-level interrupt controller, tha=
t
should hopefully solve your problems.

But if BCM4708's NAND interrupt registers can't be shaped into a sane
irqchip driver, then we can probably handle them in a per-SoC extension
of the driver. I have code already that supports another chip in this
way, so I can point you that way if the first suggestion doesn't work
out.

2. Endianness is a known issue with at least one other platform. On man=
y
chips (spanning MIPS LE, MIPS BE, and ARM LE), NAND has been integrated
such that data can just be read/programmed in the native endianness
through the FLASH_CACHE registers (as this driver does), but there are =
a
few (on ARM, LE) that require a be32_to_cpu()/cpu_to_be32() swap. I'm
considering supporting DT properties like one of the following:

	brcm,nand-cache-be
	brcm,nand-cache-big-endian
	brcm,nand-cache-reverse-endian

You might also check (though I might actually be better equipped for
this) if there is a separate register that can tell the NAND data bus t=
o
automatically endian-swap data into the native endianness. I know a lot
of the buses and peripherals in BCG, at least, are designed such that
either (1) they can work naturally in the CPU's native endianness or
else (2) they can be configured to swap endianness into either format.

But if such a register does not exist, then we'll definitely have to do
something like the DT property above.

Do the bad block markers look OK without extra endian swapping? I'm
wondering whether the swapping will have to occur on both the
=46LASH_CACHE and SPARE_AREA registers.

3. I was told that there were only 2 or 3 chips that were released with
a v6.1 NAND controller, and BCM4708 wasn't one of them. Apparently I wa=
s
told wrong... I'll have to see if there are any other quirks we should
be accounting for.

Brian
