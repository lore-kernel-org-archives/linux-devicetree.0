MIME-Version: 1.0
Date: Mon, 17 Dec 2018 09:27:47 -0600
References: <20181129130559.66732-1-chris.brandt@renesas.com>
	<20181129130559.66732-3-chris.brandt@renesas.com>
	<20181212021549.GA26333@bogus>
	<TYXPR01MB1568DD386FE18BD1F985E5178AA70@TYXPR01MB1568.jpnprd01.prod.outlook.com>
	<CAL_Jsq+Ah7Xg0VnEaYyn4giFeQme9r9GyRsFDucq78BP+Cw2=A@mail.gmail.com>
	<TY2SPR01MB0015C0AC923F1CDEC44061D88AA70@TY2SPR01MB0015.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2SPR01MB0015C0AC923F1CDEC44061D88AA70@TY2SPR01MB0015.jpnprd01.prod.outlook.com>
Message-ID: <CAL_JsqL5rLb+6Qhet0zqpHuqeU42wsFRJ+S48N0KPg43KxOiDg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Kumar Gala <kumar.gala@linaro.org>, Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Dec 12, 2018 at 12:03 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
>
> On Wednesday, December 12, 2018 1, Rob Herring wrote:
> > > Not really.
> > > The "QSPI" actually works as a memory mapped SPI (as in, the CPU sees
> > > the QSPI flash as a linear read-only address range).
> >
> > Yes, those controllers are becoming pretty standard.
>
> Ya, my SoCs are not so special any more :(
>
> But, XIP_KERNEL does not seem to be mainstream either.

Part of the problem there is XIP_KERNEL doesn't work with
multi-platform. I think that is mainly due to the dependency on
run-time phys2virt patching. We should fix that such that either we
can set a default phys_offset or possibly we could do some offline
patching.

> > > Therefore, there is no need to know anything about the actually
> > > Flash that is connected, because you are never allowed to interact with
> > it
> > > (or even query it on boot).
> >
> > Okay, but these days u-boot uses DT itself. So how does u-boot know
> > how to set things up? It's going to need to know what controller and
> > flash details.
>
> That's all hand coded at the moment. As these Quad-SPI chips came on the
> market, each vendor had their own way to get in (and out) of these
> modes, and even the protocols were not the same. Sometimes even the same
> flash vendor would do things different form chip to chip. At this point,
> (at least for Renesas) I have u-boot code that at least points you in the
> right direction depending on what flash vendor you go with....but I
> can't guarantee you won't need to do some tweaking.

Seems like DT would help you there...

> > Or how does one do a flash update (in the field)?
> Well....for that there's a "special" driver that I wrote. Basically,
> going back to the ways we've done it with MCU for years: Copy code to RAM,
> shut off interrupts, jump to RAM, do your business, jump back to flash.
>
> Again, tweaking is needed depending on what SPI flash you use, so there
> is no magic 'one driver fits all'.
>
>
> > I think it would be better to have a property to say the flash is
> > already setup and just use it. Or maybe it can be done with
> > compatibles:
> >
> > spi@1234 {
> >   compatible = "vendor,soc-quadspi", "mmio-spi";
> >   flash@0 {
> >     compatible = "some-flash-part", "mtd-rom";
> >   };
> > };
> >
> > Now the problem is how to define the address range as SPI flash
> > devices are already defined to use SPI chip-select numbers. The
> > easiest option from a DT standpoint is just look at the parent reg
> > property and figure out the memory range (typically there are 2 and
> > you want the big one). Or you could have some simple driver that knows
> > which reg range to get for specific compatibles.
>
>
> I'm still confused on why I would want to do this as I want the kernel
> to not know nothing about the underlying HW so it never tries to access
> it any way.
> At the end of the day, all I want is for the kernel to do an ioremap of
> this area for me so my file system (XIP cramfs in this case) can access
> it. "mtd-rom" does this for me today.

And partition layout? If it was only what to map, we could add a
property in chosen or perhaps a reserved-memory node. But I doubt it
will remain that simple. What happens when you have clock management
and need to keep the SPI clock enabled for example.

The other option is just have your platform code instantiate an
mtd-rom device. Either describe the h/w with DT or don't use DT.

> Just FYI, early in boot, the kernel already mapped part of my QSPI into
> virtual memory since we're most likely running an XIP_KERNEL.
>
> While these XIP Linux systems seem to function quiet well, I might need
> to continue to hide some of the inner details from mainline because they
> don't always fit into the direction of the kernel systems (ie, monster
> quad core systems with lots of DDR memory).
>
> The other XIP file system that we use more often (AXFS, not in mainline)
> does not require the partitions in DT at all, so it's really only
> needed when using cramfs. So for now, maybe it would be better to just remove
> this confusing portion of the dts.

What does AXFS have that cramfs doesn't making it not need partitions?

Rob
