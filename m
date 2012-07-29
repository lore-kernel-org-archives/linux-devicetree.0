From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] gpio: Add Avionic Design N-bit GPIO expander support
Date: Sun, 29 Jul 2012 20:27:33 +0000
Message-ID: <201207292027.34157.arnd@arndb.de>
References: <1343044770-6591-1-git-send-email-thierry.reding@avionic-design.de> <CACRpkdaZcUvcJMUZTqCEU5FQYhE3EvSSfUEnEx0dYRt-6x5Nig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaZcUvcJMUZTqCEU5FQYhE3EvSSfUEnEx0dYRt-6x5Nig@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@avionic-design.de>, Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Linus Walleij <linus.walleij@stericsson.com>, Rob Herring <rob.herring@calxeda.com>, Wolfram Sang <w.sang@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Sunday 29 July 2012, Linus Walleij wrote:
> > +- #interrupt-cells: Should be 2. The first cell contains the GPIO number,
> > +  whereas the second cell is used to specify flags:
> > +    bits[3:0] trigger type and level flags
> > +      1 = low-to-high edge triggered
> > +      2 = high-to-low edge triggered
> > +      4 = active high level-sensitive
> > +      8 = active low level-sensitive
> 
> Why on earth would a bunch of flags be an "interrupt cell"?
> 
> Maybe there is something about DT bindings I don't get so
> please educate me.
> 
> I can see that OMAP is doing this, but is it a good idea?
> I really need Rob/Grant to comment on this.

It is in fact a good idea, and it's very common to have it. The point is that
the interrupt controller requires this setting in order to configure that IRQ
for use, so putting it into a property of the device that triggers the IRQ
is the right place to have it.

> > +- interrupt-controller: Marks the device as an interrupt controller.
> > +- nr-gpios: The number of pins supported by the controller.
> 
> These two last things look very generic, like something every GPIO
> driver could want to expose.
> 
> I'd really like to have Grant's word on GPIO DT bindings and how these
> should look, I had some discussion with Wolfram (the I2C maintainer)
> about bindings turning out less generic than they ought to be, so we
> need some discussion on this.
> 
> Arnd recently consolidated some MMC props, maybe we need to do
> the same for GPIO drivers.

The "interrupt-controller" property is standardized by IEEE. Not sure 
about what specifies the "nr-gpios" one, but it seems to be a good idea
to have everyone do the same thing here.

	Arnd
