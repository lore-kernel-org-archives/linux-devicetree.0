From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH 2/3] doc: dt: add cyclone-spi binding document
Date: Mon, 10 Oct 2016 11:24:11 -0500
Message-ID: <alpine.DEB.2.02.1610101117320.28839@linuxheads99>
References: <cover.1475783742.git.stillcompiling@gmail.com> <4b4432c04b4ea92a2af814e3d7866c33f2eb12ea.1475783742.git.stillcompiling@gmail.com> <8d89e70475e8e1c3ce5117a0367c8444c11c61e3.1475783742.git.stillcompiling@gmail.com>
 <CAAtXAHeZLBT-y8xTKgG4PnZA6DH1z5=FoaM4ipC3pTEVU9KR+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHeZLBT-y8xTKgG4PnZA6DH1z5=FoaM4ipC3pTEVU9KR+Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Joshua Clayton <stillcompiling@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, 7 Oct 2016, Moritz Fischer wrote:

> > +referred to as "passive serial".
> > +The passive serial link is not technically spi, and might require extra
> > +circuits in order to play nicely with other spi slaves on the same bus.
> > +
> > +See https://www.altera.com/literature/hb/cyc/cyc_c51013.pdf
> > +
> > +Required properties:
> > +- compatible  : should contain "altr,cyclonespi-fpga-mgr"
> 
> Alan, do you guys have any input on the compat string?

We want to make it clear that this is for fpga configuration
using a specific programming method (passive serial).

How about altr,cyclone-ps-spi ?

> 
> I think generally the bindings should go before the actual usage in
> your patch series. Meaning you wanna document the binding
> before you use it. I think this patch should be [1/3].

I agree.

Thanks,
Alan

> 
> Cheers,
> 
> Moritz
> 
