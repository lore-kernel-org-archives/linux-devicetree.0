From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/5] pintrl: meson: add interrupts to pinctrl data
Date: Thu, 11 May 2017 18:08:06 +0200
Message-ID: <1494518886.2375.15.camel@baylibre.com>
References: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com>
         <3b4990ef-bfb4-c62c-f823-431adedc17f1@gmail.com>
         <CACRpkdYx0j4Sjv8MhXRSuiF1TyW2Ht47r0+G1ga8mXW5LC7c=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYx0j4Sjv8MhXRSuiF1TyW2Ht47r0+G1ga8mXW5LC7c=g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2017-05-11 at 16:50 +0200, Linus Walleij wrote:
> On Sun, May 7, 2017 at 6:34 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> 
> > From: Jerome Brunet <jbrunet@baylibre.com>
> > Add GPIO interrupt information to pinctrl data. Added to the original
> > version from Jerome was data for Meson GXL.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> So what this does is:
> 
> > diff --git a/drivers/pinctrl/meson/pinctrl-meson.h
> > b/drivers/pinctrl/meson/pinctrl-meson.h
> > index 1aa871d5..890f296f 100644
> > --- a/drivers/pinctrl/meson/pinctrl-meson.h
> > +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> > @@ -81,6 +81,7 @@ enum meson_reg_type {
> >   * @name:      bank name
> >   * @first:     first pin of the bank
> >   * @last:      last pin of the bank
> > + * @irq:       hwirq base number of the bank
> >   * @regs:      array of register descriptors
> >   *
> >   * A bank represents a set of pins controlled by a contiguous set of
> > @@ -92,6 +93,8 @@ struct meson_bank {
> >         const char *name;
> >         unsigned int first;
> >         unsigned int last;
> > +       int irq_first;
> > +       int irq_last;
> >         struct meson_reg_desc regs[NUM_REG];
> >  };
> 
> ... adds a per-bank parent IRQ.

Hi Linus,

It does not add a per-bank parent IRQ. The meson gpio irq is an IP independent
of the gpio/pinctrl subsystem. In a nutshell, we have 8 interrupts on the GIC
and we can route the signal of almost any pin of any bank to these parent irqs.
The fact that there 1 gpio-irq controller and several gpio controller make the
design a bit tricky

We already talked about this IP, here is the discussion :https://patchwork.ozlab
s.org/patch/684208/

At the time, the problem was that I was creating the mapping within the
gpio_to_irq callback, which is wrong.

irq_first, irq_last were introduced because there is no way to have direct
mapping between the gpio number and the hw interrupt number. (details are in our
previous discussion). If a more generic solution can be used for this, it would
be nice :)

While I think having a irqdomain in the gpio driver and using the
request_resources callback to create the mapping in the underlying domain might
be a solution to ressouce allocation problem we had, I think the meson-gpio-irq
should be implemented has an independent driver because  it is an independent
device. Eventually, this device should be the parent irq controller of the gpio
controller.

I not sure that there is a reason for using syscon here, or if it is a good idea
to have the data of this controller as globals for the gpio driver ... 


> 
> I am just discussing with Thierry that I would like to see some code
> in the gpiolib core to deal with this mapping so we don't have to do a
> whole lot of custom back mapping between parent IRQs and cascaded
> IRQ in every driver that has a multiple-bank concept.
> 
> Please contribute to the discission, see thread subject:
> "[PATCH v2] gpio: Add Tegra186 support"
> 
> Yours,
> Linus Walleij
