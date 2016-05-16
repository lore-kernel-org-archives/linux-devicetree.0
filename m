From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpio: dt-bindings: add ibm,ppc4xx-gpio binding
Date: Mon, 16 May 2016 11:56:18 -0500
Message-ID: <20160516165618.GA29776@rob-hp-laptop>
References: <c7b118c342c161954126e2e82cf1a0a6a127b4c2.1463002267.git.chunkeey@googlemail.com>
 <20160516152746.GA13649@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160516152746.GA13649@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Alistair Popple <alistair@popple.id.au>, Matt Porter <mporter@kernel.crashing.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 16, 2016 at 10:27:46AM -0500, Rob Herring wrote:
> On Thu, May 12, 2016 at 12:07:48AM +0200, Christian Lamparter wrote:
> > This patch adds binding information for IBM/AMCC/APM GPIO
> > Controllers of the PowerPC 4XX series and compatible SoCs.
> > 
> > The "PowerPC 405EP Embedded Processor Data Sheet" has the
> > following to say about the GPIO controllers: "
> > 
> >  - Controller functions and GPIO registers are programmed
> >    and accessed via memory-mapped OPB bus master accesses
> > 
> >  - All GPIOs are pin-shared with other functions. DCRs control
> >    whether a particular pin that has GPIO capabilities acts
> >    as a GPIO or is used for another purpose.
> > 
> >  - Each GPIO outputs is separately programmable to emulate
> >    an open-drain driver (i.e. drives to zero, threestated if
> >    output bit is 1)
> > 
> > "
> > The ppc4xx_gpio.c driver is part of the platform/sysdev drivers
> > in arch/powerpc/sysdev.
> > 
> > Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
> > ---
> > I looked into arch/powerpc/sysdev/ppc4xx_gpio.c driver and
> > it doesn't have support for the tri-state logic (open drain
> > is disabled), but the hardware would support it.
> > (the #gpio-cells description suffers because of this, since
> > the high-z option isn't there).
> > 
> > Also there's another problem: There's no DCR pinmux driver?!
> > So sadly, there's not much information on how to use the DCRs
> > to control the which pin is muxed to the GPIO or to a SoC
> > function like the i2c.
> > 
> > This was all the valuable information I could find about the
> > hardware, so it is included it in the binding text, even
> > though there's no support for it... Is there anything else
> > to add?
> > ---
> >  .../devicetree/bindings/gpio/ibm,ppc4xx-gpio.txt   | 24 ++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/ibm,ppc4xx-gpio.txt
> 
> Normally, we don't allow wildcards for compatible strings, but given 
> this is an established binding it is okay.
> 
> Acked-by: Rob Herring <robh@kernel.org>

As this is just a binding doc, I've applied it.

Rob
