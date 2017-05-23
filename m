From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 6/6] pintrl: meson: add support for GPIO interrupts
Date: Tue, 23 May 2017 10:38:10 +0200
Message-ID: <1495528690.2344.10.camel@baylibre.com>
References: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
         <dc23b800-fe69-8143-6367-d3cd801cd6db@gmail.com>
         <5e6d39fa-8f40-8233-6480-cb8306a4427a@baylibre.com>
         <64a10dd2-a969-0251-b92f-3a1c40533373@gmail.com>
         <4954c4b6-3cb7-3f2e-49dd-9a92359ae6e3@baylibre.com>
         <fbaf536e-3416-3c4a-4902-05b56783f9c2@gmail.com>
         <1494976589.2728.6.camel@baylibre.com>
         <3dccae17-f811-bc26-e125-7ff3f0bffa7d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3dccae17-f811-bc26-e125-7ff3f0bffa7d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-05-17 at 22:36 +0200, Heiner Kallweit wrote:
> Am 17.05.2017 um 01:16 schrieb Jerome Brunet:
> > On Tue, 2017-05-16 at 20:31 +0200, Heiner Kallweit wrote:

[snip]

> > 
> > Maybe you missed it in our previous discussion with Linus but, no you can't
> > create mapping in gpio_to_irq. This callback is fast and creating mappings
> > might
> > sleep because of the irq_domain mutex
> > 
> > https://patchwork.ozlabs.org/patch/684208/
> > 
> 
> My comment was misunderstandable. What I meant was that a driver doesn't have
> to
> use gpio_to_irq to request an interrupt, this can also be done via DT.
> 

If you don't provide gpio_to_irq, you won't support the drivers which only
request a gpio through DT (because they need to read the pin state) and later
request an irq from it (to get an event and avoid polling)

That's a fairly common use-case. IMHO, this callback should be implemented by
the gpio controller, when it is an interrupt controller.

[snip]

> > > I think you are onto something. As I told you previously, the problem was
> > > to
> > create the mappings in pinctrl w/o allocating the parent. I struggled with
> > that
> > back in November and I had no time to really get back to it since.
> > 
> > Creating domains in each gpio controller, w/ all the mapping created at
> > startup,
> >   stacked to the domain provided by the driver/irqchip would solve the
> > problem.
> > 
> > We would just have to call find_mapping in gpio_to_irq, which is fine and
> > allocate the parent irq in the request_ressource callback.
> > 
> 
> In request_resource we don't know the irq type yet (and therefore whether we
> need
> one or wo parent interrupts). IMHO we can't get completely rid of allocating
> parents in set_type.

Yes you can. The HW does *not* support IRQ_BOTH on an irq line. You are trying
to come up with a SW workaround to get this feature. W/O this workaround, there
no reason to allocate a parent irq in set_type.
At this point, no one has come up with a clean solution to add this feature to
the meson-gpio-irq device.
Maybe evolutions in the irq framework will allow this cleanly in the future, I
don't think this is the case right now. 

[snip]
> 
> > > And all I had to do is implementing one irq_chip and changing one line in
> > > the
> > > existing
> > > pinctrl driver.
> > > Whilst I have to admit that e.g. calling request_irq for a parent irq from
> > > the
> > > irq_set_type
> > > callback may be something people find ugly and hacky.
> > > 
> > 
> > The fact is that the HW does not directly support IRQ_EDGE_BOTH. Yes, it
> > would
> > be nice to find a way to support it anyway. There two possibilities for it:
> > * Change the change the edge type depending on the next expected edge: Marc
> > already stated that he is firmly against that. It is indeed not very robust
> > * Allocate and deallocate additional parent irq to get secondary irq in
> > set_type: This indeed looks hacky, I'd like to get the view of irq
> > maintainers
> > on this.
> > 
> 
> Support for IRQ_TYPE_EDGE_BOTH I'd consider a mandatory feature. It's needed
> e.g. by the SD card detection (drivers/mmc/slot-gpio.c).
> 
"You'd consider" maybe, but the fact is that it is not mandatory. Having irq
based card detect (or buttons, or jack insert, or whatever) is probably more
elegant, but the polled version also works well. Elegant and mandatory are not
the same things



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
