From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH 3/3] gpio: mcp23s08: Add option to configure IRQ as active high
Date: Thu, 27 Nov 2014 15:36:39 +0100
Message-ID: <3020714.NCVpEFcdBT@ws-stein>
References: <1416213491-9775-1-git-send-email-alexander.stein@systec-electronic.com> <1416213491-9775-3-git-send-email-alexander.stein@systec-electronic.com> <CACRpkdZCA7Zxs0HDpFZSmFmg5hYYAHmeNySFpM-Xq3G322mmbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZCA7Zxs0HDpFZSmFmg5hYYAHmeNySFpM-Xq3G322mmbw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thursday 27 November 2014 14:58:39, Linus Walleij wrote:
> On Mon, Nov 17, 2014 at 9:38 AM, Alexander Stein
> <alexander.stein@systec-electronic.com> wrote:
> 
> > Default is active low, but if property is specified in DT set INTPOL flag.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> > ---
> >  .../devicetree/bindings/gpio/gpio-mcp23s08.txt     |  2 ++
> >  drivers/gpio/gpio-mcp23s08.c                       | 30 +++++++++++++++++-----
> >  2 files changed, 25 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt b/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
> > index c306a2d0..47dab72 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
> > @@ -57,6 +57,8 @@ Optional device specific properties:
> >          occurred on. If it is not set, the interrupt are only generated for the
> >          bank they belong to.
> >          On devices with only one interrupt output this property is useless.
> > +- microchip,irq-active-high: Sets the INTPOL flag in the IOCON register. This
> > +        configures the IRQ output as active high.
> 
> I don't understand this AT ALL.
> 
> The normal way is that the *client* using the resource specify the
> polarity.
> 
> #include <dt-bindings/interrupt-controller/irq.h>
> 
> interrupts = <0 60 IRQ_TYPE_LEVEL_LOW>;
> 
> This will then result in .set_type() being called on the irqchip.
> 
> I suspect the real change you want to do is to support
> IRQ_TYPE_LEVEL_HIGH and IRQ_TYPE_LEVEL_LOW
> in the .set_type() callback or something, or just switch all
> clients from rising to falling edge or vice versa.
> 
> And it says is "configures the IRQ output", this seems more like
> an input trigger?
> 
> Sorry too confused by this, can you explain?

Sure. Until now ODR is cleared as reset default while INTPOL explicitly gets cleared. So the INT output pin on the MCP23S17 is an active-low output pin which will trigger an active-low interrupt. While this is useually great, as most interrupt pins are active low, our board design requires an active-high output. This is done that the voltage level shift required for the interrupt pin can be done by a simple transistor.
So, setting IRQ_TYPE_LEVEL_HIGH is simply wrong and this still won't work either as no interrupt will ever arive at the controller. What I need to do, is to change the interrupt polarity (to active high) at MCP23S17 while retaining the interrupt polarity on the controller as active-low.
So I configure the chip to set the interrupt line as high upon IRQ, thus IRQF_TRIGGER_HIGH has to be passed to request_*irq.
You might wonder why I then also changed IRQF_TRIGGER_LOW to IRQF_TRIGGER_HIGH for my board the interrupt line is actually active low. This is due the fact that GIC only supports active high-interrupts (any other flag results in request fail) but the microcontroller has a feature to inverse these interrupt triggers.
I don't know if there is a feature to inverse interrupt polarity individually due to board designs.
I hope this makes things a bit more clear.

Best regards,
Alexander

