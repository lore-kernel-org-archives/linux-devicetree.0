From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 4/7] of: configure the platform device dma parameters
Date: Fri, 02 May 2014 17:13:46 +0200
Message-ID: <4526988.X68ZFJZdRl@wuerfel>
References: <1398353407-2345-1-git-send-email-santosh.shilimkar@ti.com> <5279118.J5305KQNjB@wuerfel> <53639A0C.8070306@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53639A0C.8070306-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Strashko, Grygorii" <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 02 May 2014 09:13:48 Santosh Shilimkar wrote:
> On Friday 02 May 2014 05:58 AM, Arnd Bergmann wrote:
> > On Thursday 01 May 2014 14:12:10 Grant Likely wrote:
> >>>> I've got two concerns here. of_dma_get_range() retrieves only th=
e first
> >>>> tuple from the dma-ranges property, but it is perfectly valid fo=
r
> >>>> dma-ranges to contain multiple tuples. How should we handle it i=
f a
> >>>> device has multiple ranges it can DMA from?
> >>>>
> >>>
> >>> We've not found any cases in current Linux where more than one dm=
a-ranges
> >>> would be used. Moreover, The MM (definitely for ARM) isn't suppor=
ted such
> >>> cases at all (if i understand everything right).
> >>> - there are only one arm_dma_pfn_limit
> >>> - there is only one MM zone is used for ARM
> >>> - some arches like x86,mips can support 2 zones (per arch - not p=
er device or bus)
> >>>   DMA & DMA32, but they configured once and forever per arch.
> >>
> >> Okay. If anyone ever does implement multiple ranges then this code=
 will
> >> need to be revisited.
> >=20
> > I wonder if it's needed for platforms implementing the standard "AR=
M memory map" [1].
> > The document only talks about addresses as seen from the CPU, and I=
 can see
> > two logical interpretations how the RAM is supposed to be visible f=
rom a device:
> > either all RAM would be visible contiguously at DMA address zero, o=
r everything
> > would be visible at the same physical address as the CPU sees it.
> >=20
> > If anyone picks the first interpretation, we will have to implement=
 that
> > in Linux. We can of course hope that all hardware designs follow th=
e second
> > interpretation, which would be more convenient for us here.
> >
> not sure if I got your point correctly but DMA address 0 isn't used a=
s DRAM start in
> any of the ARM SOC today, mainly because of the boot architecture whe=
re address 0 is
> typically used by ROM code. RAM start will be at some offset always a=
nd hence I
> believe ARM SOCs will follow second interpretation. This was one of t=
he main reason
> we ended up fixing the max*pfn stuff.=20
> 26ba47b {ARM: 7805/1: mm: change max*pfn to include the physical offs=
et of memory}

Marvell normally has memory starting at physical address zero.

Even if RAM starts elsewhere, I don't think that is a reason to have
the DMA address do the same. The memory controller internally obviously
starts at zero, and it wouldn't be unreasonable to have the DMA space
match what the memory controller sees rather than have it match what
the CPU sees.

If you look at the table 3.1.4, you have both addresses listed:

	  Physical Addresses in SoC	Offset	 		Internal DRAM address

2 GBytes	0x00 8000 0000 =E2=80=93	-0x00 8000 0000		0x00 0000 0000 =E2=80=
=93
		0x00 FFFF FFFF			 		0x00 7FFF FFFF

30 GBytes	0x08 8000 0000 =E2=80=93 	-0x08 0000 0000		0x00 8000 0000 =E2=
=80=93
		0x0F FFFF FFFF					0x07 FFFF FFFF

32 GBytes	0x88 0000 0000 -	-0x80 0000 0000	 	0x08 0000 0000 -
		0x8F FFFF FFFF					0x0F FFFF FFFF

The wording "Physical Addresses in SoC" would indeed suggest that the
same address is used for DMA, but I would trust everybody to do that.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
