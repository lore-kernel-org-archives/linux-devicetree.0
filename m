From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 4/9] pinctrl: meson: allow gpio to request irq
Date: Fri, 21 Oct 2016 11:06:38 +0200
Message-ID: <1477040798.15560.96.camel@baylibre.com>
References: <1476871709-8359-1-git-send-email-jbrunet@baylibre.com>
         <1476871709-8359-5-git-send-email-jbrunet@baylibre.com>
         <CACRpkdaCZPS45t3eTcjJExOu=YT_YkjNkdpg09jQqvLQOJH=Qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaCZPS45t3eTcjJExOu=YT_YkjNkdpg09jQqvLQOJH=Qw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

On Thu, 2016-10-20 at 21:21 +0200, Linus Walleij wrote:
> On Wed, Oct 19, 2016 at 12:08 PM, Jerome Brunet <jbrunet@baylibre.com
> > wrote:
> 
> > 
> > Add the ability for gpio to request irq from the gpio interrupt
> > controller
> > if present. We have to specificaly that the parent interrupt
> > controller is
> > the gpio interrupt controller because gpio on meson SoCs can't
> > generate
> > interrupt directly on the GIC.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> (...)
> > 
> > +       select IRQ_DOMAIN
> >         select OF_GPIO
> > +       select OF_IRQ
> (...)
> > 
> > +static int meson_gpio_to_hwirq(struct meson_bank *bank, unsigned
> > int offset)
> > +{
> > +       unsigned int hwirq;
> > +
> > +       if (bank->irq_first < 0)
> > +               /* this bank cannot generate irqs */
> > +               return -1;
> > +
> > +       hwirq = offset - bank->first + bank->irq_first;
> > +
> > +       if (hwirq > bank->irq_last)
> > +               /* this pin cannot generate irqs */
> > +               return -1;
> > +
> > +       return hwirq;
> > +}
> 
> This is reimplementing irqdomain.
> 
> > 
> > +static int meson_gpio_to_irq(struct gpio_chip *chip, unsigned int
> > offset)
> > +{
> (...)
> > 
> > +       hwirq = meson_gpio_to_hwirq(bank, offset);
> > +       if (hwirq < 0) {
> > +               dev_dbg(pc->dev, "no interrupt for pin %u\n",
> > offset);
> > +               return 0;
> > +       }
> 
> Isn't this usecase (also as described in the cover letter) a textbook
> example of when you should be using hierarchical irqdomain?
> 
> Please check with Marc et al on hierarchical irqdomains.

Linus,
Do you mean I should create a new hierarchical irqdomains in each of
the two pinctrl instances we have in these SoC, these domains being
stacked on the one I just added for controller in irqchip ?

I did not understand this is what you meant when I asked you the
question at ELCE.

> 
> Yours,
> Linus Walleij
