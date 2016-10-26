From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 4/9] pinctrl: meson: allow gpio to request irq
Date: Wed, 26 Oct 2016 16:22:46 +0200
Message-ID: <1477491766.2482.159.camel@baylibre.com>
References: <1476871709-8359-1-git-send-email-jbrunet@baylibre.com>
         <1476871709-8359-5-git-send-email-jbrunet@baylibre.com>
         <CACRpkdaCZPS45t3eTcjJExOu=YT_YkjNkdpg09jQqvLQOJH=Qw@mail.gmail.com>
         <1477040798.15560.96.camel@baylibre.com>
         <CACRpkdYUVXny57AC9rKX3VRAyooEk_2XLvqe9jOuT3rOaE75rg@mail.gmail.com>
         <ec7c6cc5-cf9a-9c75-4b07-e337064c7d6e@arm.com>
         <1477400900.2482.51.camel@baylibre.com>
         <dee26f0b-e175-f8a0-2b73-08e8e324841c@arm.com>
         <1477405332.2482.87.camel@baylibre.com>
         <bbc268c8-35c3-206a-46b1-62cebef174b2@arm.com>
         <1477409478.2482.113.camel@baylibre.com>
         <CACRpkdbGo4BJOdzkgBrE9jT-rKodd4zssCnOtOuGS+OqV-Uc6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbGo4BJOdzkgBrE9jT-rKodd4zssCnOtOuGS+OqV-Uc6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2016-10-25 at 20:20 +0200, Linus Walleij wrote:
> On Tue, Oct 25, 2016 at 5:31 PM, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> wrote:
> > 
> > On Tue, 2016-10-25 at 15:47 +0100, Marc Zyngier wrote:
> 
> > 
> > > 
> > > Is gpio_to_irq() supposed to allocate an interrupt? Or merely to
> > > report the existence of a mapping?
> 
> It should provide an IRQ corresponding to the gpio line, if possible.
> 
> However the semantic is such, that it is not necessary to call
> to_irq()
> before using an IRQ: the irqchip and gpiochip abstractions should be
> orthogonal.

Linus,

They are orthogonal. You can request an irq from the irqchip controller
without the gpiochip, like any other irq controller.

> 
> This goes especially when using device tree or ACPI, where you
> may reference an IRQ from something modeled as irqchip, which
> is simultaneously a gpiochip.
> 
> > 
> > Linus, please correct me if I'm wrong,
> > .to_irq gets the linux gpio number and returns the linux virtual
> > irq
> > numbers, 0 if there is no interrupt.
> 
> Yes. But it may *or may not* be called before using the IRQ.
> 
> So it should look up or try to create a mapping on request, but not
> assume to have been called before using some line as IRQ.
> 
> The only thing you should assume to be called before an interrupt
> is put to use is the stuff in irqchip. So you have to do your
> dynamic irqdomain mapping elsewhere than .to_irq().

irq_create_mapping (and irq_create_fwspec_mapping) internally calls
irq_find_mapping. So if the mapping already exist (the irq is already
used before calling to_irq), the existing mapping will be returned. The
mapping will be actually created only if needed. It seems to be in line
with your explanation, no ?

There is really a *lot* of gpio drivers which use irq_create_mapping in
the to_irq callback, are these all wrong ?
If this should not be used, what should we all do instead ? 

> 
> Yours,
> Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
