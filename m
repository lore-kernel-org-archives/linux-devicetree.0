From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 4/9] pinctrl: meson: allow gpio to request irq
Date: Tue, 25 Oct 2016 12:39:02 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1610251137420.4990@nanos>
References: <1476871709-8359-1-git-send-email-jbrunet@baylibre.com> <1476871709-8359-5-git-send-email-jbrunet@baylibre.com> <CACRpkdaCZPS45t3eTcjJExOu=YT_YkjNkdpg09jQqvLQOJH=Qw@mail.gmail.com> <1477040798.15560.96.camel@baylibre.com>
 <CACRpkdYUVXny57AC9rKX3VRAyooEk_2XLvqe9jOuT3rOaE75rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYUVXny57AC9rKX3VRAyooEk_2XLvqe9jOuT3rOaE75rg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 25 Oct 2016, Linus Walleij wrote:
> On Fri, Oct 21, 2016 at 11:06 AM, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> 
> >> Isn't this usecase (also as described in the cover letter) a textbook
> >> example of when you should be using hierarchical irqdomain?
> >>
> >> Please check with Marc et al on hierarchical irqdomains.
> >
> > Linus,
> > Do you mean I should create a new hierarchical irqdomains in each of
> > the two pinctrl instances we have in these SoC, these domains being
> > stacked on the one I just added for controller in irqchip ?
> >
> > I did not understand this is what you meant when I asked you the
> > question at ELCE.
> 
> Honestly, I do not understand when and where to properly use
> hierarchical irqdomain, even after Marc's talk at ELC-E.

Hierarchical irqdomains are used when you have several levels of interrupt
hardware to deliver an interrupt.

For example on x86 we have:

 device --- [IOAPIC] -- [VECTOR]

and we can have this expanded to

 device --- [IOAPIC] -- [IRQ Remapping] -- [VECTOR]

and we have more things hanging off the VECTOR domain

 device --- [IOAPIC] ---
                       |--- [VECTOR]
 device --- [PCIMSI] ---

So with irq remapping this might look like this:

 device --- [IOAPIC] ---
                       |-----------------------
 device --- [PCIMSI] ---                      |
                                              |---[VECTOR]
 device --- [IOAPIC] ---                      |
                       |--[IRQ Remapping]------
 device --- [PCIMSI] ---                      

The important part is that this hierarchy deals with a single Linux virq
and all parts of the hierarchy are required for setup and possibly for
mask/ack/eoi.

This is different from a demultiplex interrupt

 device --- [DEMUX] --- [GIC]

where the demultiplex interrupt is a different virq than the device
virq. The demux interrupt chip can have a parent relation ship, which can
be required to propagate information, e.g. wake on a device behind the
demux must keep the gic as a wake irq as well. But it's not hierarchical in
the sense of our hierarchical irq domains.

Hope that helps.

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
