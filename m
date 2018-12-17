MIME-Version: 1.0
Date: Mon, 17 Dec 2018 11:00:57 -0600
References: <20181129130559.66732-1-chris.brandt@renesas.com>
	<20181129130559.66732-3-chris.brandt@renesas.com>
	<20181212021549.GA26333@bogus>
	<TYXPR01MB1568DD386FE18BD1F985E5178AA70@TYXPR01MB1568.jpnprd01.prod.outlook.com>
	<CAL_Jsq+Ah7Xg0VnEaYyn4giFeQme9r9GyRsFDucq78BP+Cw2=A@mail.gmail.com>
	<TY2SPR01MB0015C0AC923F1CDEC44061D88AA70@TY2SPR01MB0015.jpnprd01.prod.outlook.com>
	<CAL_JsqL5rLb+6Qhet0zqpHuqeU42wsFRJ+S48N0KPg43KxOiDg@mail.gmail.com>
	<TYXPR01MB156894C0FEE2A2CF02820A018ABC0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB156894C0FEE2A2CF02820A018ABC0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
Message-ID: <CAL_JsqLkqUTWh7RkG8tdTNhaTOMTOovDstZCqC=croQbAWmJSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Kumar Gala <kumar.gala@linaro.org>, Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Dec 17, 2018 at 10:22 AM Chris Brandt <Chris.Brandt@renesas.com> wrote:
>
> On Monday, December 17, 2018 1, Rob Herring wrote:
> > > But, XIP_KERNEL does not seem to be mainstream either.
> >
> > Part of the problem there is XIP_KERNEL doesn't work with
> > multi-platform. I think that is mainly due to the dependency on
> > run-time phys2virt patching. We should fix that such that either we
> > can set a default phys_offset or possibly we could do some offline
> > patching.
>
> Not really. I fixed all of that back in 4.6.
>
> The issue is more of the 'theoretical' kind.
>
> The ARM maintainer defines "multiplatform" as being able to build 1
> binary image that can be run on multiple SoCs.
> But...that won't work when you have to define the ROM/RAM area at
> compile time.
>
> I prefer to think of "multiplatform" as a way of grouping like SoCs
> together (if you need to) and use DT to sort out any differences.

Yes, I'm aware of all that. I did a bunch of the work to enable it.

> Basically, I just need this simple patch in order to build and boot so I
> can test kernel releases:
>
> [arch/arm/Kconfig]
>
> config XIP_KERNEL
>         bool "Kernel Execute-In-Place from ROM"
> -       depends on !ARM_LPAE && !ARCH_MULTIPLATFORM
> +       depends on !ARM_LPAE

Okay, I guess it's not that hard to enable if one wants. Perhaps all

> However...I've given up on trying to get XIP_KERNEL enabled in Kconfig.
> But, of course still keep an eye on all the 'code' in the ARM core to
> make sure no one breaks it.


> > > At the end of the day, all I want is for the kernel to do an ioremap of
> > > this area for me so my file system (XIP cramfs in this case) can access
> > > it. "mtd-rom" does this for me today.
> >
> > And partition layout? If it was only what to map, we could add a
> > property in chosen or perhaps a reserved-memory node. But I doubt it
> > will remain that simple. What happens when you have clock management
> > and need to keep the SPI clock enabled for example.
>
> Yup...there's the killer!
> You'll notice that in mainline RZ/A devices, there is no QSPI driver,
> and also the QSPI clock is left out of the list of HW clocks. Otherwise,
> as you mentioned, that 'unused' clock would get shut off at the end of
> boot...and you're whole system would stop immediately.

If you had a simple driver with the binding as I proposed, then it
could do the ioremap and clock management. And you could also have
specific SPI and flash drivers for when you need to flashing without
changing the DT.

> > The other option is just have your platform code instantiate an
> > mtd-rom device. Either describe the h/w with DT or don't use DT.
>
> You mean in a 'board' file?

Yes.

> BTW, I still use board files for things that are too complicated for DT.

As you should.

> > > The other XIP file system that we use more often (AXFS, not in mainline)
> > > does not require the partitions in DT at all, so it's really only
> > > needed when using cramfs. So for now, maybe it would be better to just
> > remove
> > > this confusing portion of the dts.
> >
> > What does AXFS have that cramfs doesn't making it not need partitions?
>
> For AXFS, you pass in the physical address to your rootfs on the kernel
> command line and then AXFS does the ioreapping itself inside the driver.
>
> When Nicolas Pitre started adding XIP mode to cramfs last year, he also
> started out that way. But, that was rejected (as it was also rejected
> when DAX was first started). The file system people said 'file system
> drives should not have the ability to map physical memory themselves'.

Right, I remember that now.

> Another thing AXFS can do that Cramfs can't do (yet), is AXFS can within
> *each file* select what pages will be XIP, and what ones will be
> compressed. This saves a lot on Flash space when only your executable and
> const pages are left as uncompressed XIP pages.
>
>
> Chris
>
