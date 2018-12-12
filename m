MIME-Version: 1.0
Date: Wed, 12 Dec 2018 11:10:24 -0600
References: <20181129130559.66732-1-chris.brandt@renesas.com>
	<20181129130559.66732-3-chris.brandt@renesas.com>
	<20181212021549.GA26333@bogus>
	<TYXPR01MB1568DD386FE18BD1F985E5178AA70@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB1568DD386FE18BD1F985E5178AA70@TYXPR01MB1568.jpnprd01.prod.outlook.com>
Message-ID: <CAL_Jsq+Ah7Xg0VnEaYyn4giFeQme9r9GyRsFDucq78BP+Cw2=A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>, Kumar Gala <kumar.gala@linaro.org>
Cc: Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

+Kumar who was just asking me about this exact problem.

On Wed, Dec 12, 2018 at 7:59 AM Chris Brandt <Chris.Brandt@renesas.com> wrote:
>
> On Tuesday, December 11, 2018, Rob Herring wrote:
> > > +   /* Cramfs XIP File System in QSPI */
> > > +   qspi@20000000 {
> >
> >
> > > +           compatible = "mtd-rom";
> >
> > This should be the actual Quad-SPI controller and then a flash device
> > underneath it. It may work as-is initially, but eventually won't you
> > need the flash details?
>
> Not really.
> The "QSPI" actually works as a memory mapped SPI (as in, the CPU sees
> the QSPI flash as a linear read-only address range).

Yes, those controllers are becoming pretty standard.

> Basically, u-boot sets up the QSPI to look like a ROM area, and that's
> it. Everything is running directly from that QSPI flash, so you can't
> make any modifications to it while running, otherwise the whole system will
> go down. Therefore, there is no need to know anything about the actually
> Flash that is connected, because you are never allowed to interact with it
> (or even query it on boot).

Okay, but these days u-boot uses DT itself. So how does u-boot know
how to set things up? It's going to need to know what controller and
flash details. Or how does one do a flash update (in the field)?

I think it would be better to have a property to say the flash is
already setup and just use it. Or maybe it can be done with
compatibles:

spi@1234 {
  compatible = "vendor,soc-quadspi", "mmio-spi";
  flash@0 {
    compatible = "some-flash-part", "mtd-rom";
  };
};

Now the problem is how to define the address range as SPI flash
devices are already defined to use SPI chip-select numbers. The
easiest option from a DT standpoint is just look at the parent reg
property and figure out the memory range (typically there are 2 and
you want the big one). Or you could have some simple driver that knows
which reg range to get for specific compatibles.

Rob
