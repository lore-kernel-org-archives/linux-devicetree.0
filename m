From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Tue, 5 Nov 2013 09:22:01 +0100
Message-ID: <201311050922.01970.arnd@arndb.de>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org> <1704730.RnIqE1USnv@wuerfel> <527816AE.1080508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <527816AE.1080508-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 04 November 2013, Stephen Warren wrote:
> On 11/04/2013 01:43 PM, Arnd Bergmann wrote:
> > int devm_probe_gpio(struct device *dev, const struct devm_probe *probe)
> ...
> > #define DEVM_GPIO(_struct, _member, _index) {				 \
> ...
> > #define DEVM_GPIO_NAMED(_struct, _member, _name) { 			 \
> 
> Should those save the GPIO flags too? Or, do we assume that gpiod-based
> GPIOs already handle the flags inside the gpiod API?

The latter. I would certainly hope to get away with assigning just one
structure field per callback function.
 
> > /*
> >  * this lists all properties we access from the driver. The list
> >  * is interpreted by devm_probe() and can be programmatically
> >  * verified to match the binding.
> >  */
> > static const struct devm_probe foo_probe_list[] = {
> > 	DEVM_ALLOC(foo_priv),
> > 	DEVM_IOMAP(foo_priv, regs, 0, 0),
> > 	DEVM_PROP_BOOL(foo_priv, oldstyle_dma, "foo,oldstyle-dma"),
> 
> I wonder if it makes sense to handle pure data here, or whether this
> only makes sense for resources/services that are provided by some other
> device?
> 
> I guess it's nice for all resources and configuration to come through to
> probe() in the same way, but I rather wonder how we'd handle bindings
> that have large custom (driver-specific) tables of data. Would be simply
> defer such things to custom code in probe()? If so, it feels slightly
> inconsistent to handle some data in the probe_list[] and some in code in
> probe(). Still, I guess there's something to be said for keeping the
> simple cases simple.

Right, and I didn't intend to solve all cases in a completely generic way.
Thinking about it some more, a driver could actually add a custom callback
for some properties, but I don't know if that adds any value over just
interpreting them from the regular probe() function.

> > 	DEVM_DMA_SLAVE(foo_priv, rxdma, "rx");
> > 	DEVM_DMA_SLAVE(foo_priv, txdma, "tx");
> > 	DEVM_GPIO(foo_priv, gpio, 0);
> > 	DEVM_IRQ_NAMED(foo_priv, irq, foo_irq_handler, "fifo", IRQF_SHARED),
> 
> What about the case where some resources are optional, or only required
> based on the values of certain other properties? I suppose that probe()
> could call devm_probe() multiple times, with different probe_list[]s,
> based on whatever algorithm they need.

That's one open question that I haven't found the best solution for yet.
My first take on that was to add another field in struct devm_probe to
mark a property as optional, but that would increase the overall
complexity. I'd first want to do a survey of what kinds of properties
are typically optional. If it's only a few of them, we could have
something like

DEVM_DMA_SLAVE_OPTIONAL()

for the cases that need it, with a variant of the callback function.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
