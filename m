From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/3] mtd: nand: add Broadcom NAND controller support
Date: Mon, 9 Mar 2015 11:04:31 -0700
Message-ID: <20150309180431.GW18140@ld-irv-0074>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <CACna6rykQTjtfL8mqHJ4ZSY9Ci+kVhjDfDkjRpsFvg4YatNATw@mail.gmail.com>
 <20150308005720.GF12966@brian-ubuntu>
 <CACna6rz656H-K1hPaSGyOE+x4RKfqdUdnWKhff87n=0dvHB+fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACna6rz656H-K1hPaSGyOE+x4RKfqdUdnWKhff87n=0dvHB+fw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kevin Cernekee <cernekee@gmail.com>, sbranden@broadcom.com
List-Id: devicetree@vger.kernel.org

On Sun, Mar 08, 2015 at 11:22:40AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> On 8 March 2015 at 01:57, Brian Norris <computersforpeace@gmail.com> =
wrote:
> > 2. Endianness is a known issue with at least one other platform. On=
 many
> > chips (spanning MIPS LE, MIPS BE, and ARM LE), NAND has been integr=
ated
> > such that data can just be read/programmed in the native endianness
> > through the FLASH_CACHE registers (as this driver does), but there =
are a
> > few (on ARM, LE) that require a be32_to_cpu()/cpu_to_be32() swap. I=
'm
> > considering supporting DT properties like one of the following:
> >
> >         brcm,nand-cache-be
> >         brcm,nand-cache-big-endian
> >         brcm,nand-cache-reverse-endian
> >
> > You might also check (though I might actually be better equipped fo=
r
> > this) if there is a separate register that can tell the NAND data b=
us to
> > automatically endian-swap data into the native endianness. I know a=
 lot
> > of the buses and peripherals in BCG, at least, are designed such th=
at
> > either (1) they can work naturally in the CPU's native endianness o=
r
> > else (2) they can be configured to swap endianness into either form=
at.
> >
> > But if such a register does not exist, then we'll definitely have t=
o do
> > something like the DT property above.
>=20
> It seems there is such a magic register. Please take a look at bcm_na=
nd.c:
> https://dev.openwrt.org/browser/trunk/target/linux/bcm53xx/patches-3.=
18/420-mtd-bcm5301x_nand.patch
>=20
> There are multiple places (data, OOB, reads, writes) with:

So you do data and OOB in little endian? At least that seems consistent=
=2E

> /* Set controller to Little Endian mode for copying */
> bcmnand_reg_awrite(ctrl, NANDC_IDM_APB_LITTLE_ENDIAN, 1);
>=20
> /* Return to Big Endian mode for commands etc */
> bcmnand_reg_awrite(ctrl, NANDC_IDM_APB_LITTLE_ENDIAN, 0);
>=20
> That register is 0x408, but it's in "agent" core (AKA wrapper), so
> it's separated mapping. I'm not sure what address is it right now, as
> we read them from the EROM.
>=20
>=20
> > Do the bad block markers look OK without extra endian swapping? I'm
> > wondering whether the swapping will have to occur on both the
> > FLASH_CACHE and SPARE_AREA registers.
>=20
> I don't know, I didn't try nand-on-flash-bbt.

You don't have to use on-flash BBT to notice. Without a flash-based BBT=
,
you should just be scanning for bad block markers on *every* boot. Do
you read factory-marked bad block markers correctly? Or maybe you see n=
o
factory bad blocks?

Note that this is sometimes hard to tell, if the factory just programme=
d
the entire page + OOB to 0x00; then you obviously don't have to worry
about endianness. But if they programmed a word of 0xffffff00, then you
definitely do need to care!

Brian
