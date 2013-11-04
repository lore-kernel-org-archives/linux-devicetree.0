From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Mon, 4 Nov 2013 15:21:35 -0700
Message-ID: <20131104222135.GA10711@obsidianresearch.com>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org>
 <2443024.JdDKnfkC18@wuerfel>
 <5277CD33.6030003@wwwdotorg.org>
 <1704730.RnIqE1USnv@wuerfel>
 <20131104212930.GB9638@obsidianresearch.com>
 <527814E4.9050204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <527814E4.9050204-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 04, 2013 at 02:43:00PM -0700, Stephen Warren wrote:
> On 11/04/2013 02:29 PM, Jason Gunthorpe wrote:
> > On Mon, Nov 04, 2013 at 09:43:22PM +0100, Arnd Bergmann wrote:
> > 
> >> /*
> >>  * this lists all properties we access from the driver. The list
> >>  * is interpreted by devm_probe() and can be programmatically
> >>  * verified to match the binding.
> >>  */
> >> static const struct devm_probe foo_probe_list[] = {
> >> 	DEVM_ALLOC(foo_priv),
> >> 	DEVM_IOMAP(foo_priv, regs, 0, 0),
> >> 	DEVM_PROP_BOOL(foo_priv, oldstyle_dma, "foo,oldstyle-dma"),
> >> 	DEVM_DMA_SLAVE(foo_priv, rxdma, "rx");
> >> 	DEVM_DMA_SLAVE(foo_priv, txdma, "tx");
> >> 	DEVM_GPIO(foo_priv, gpio, 0);
> >> 	DEVM_IRQ_NAMED(foo_priv, irq, foo_irq_handler, "fifo", IRQF_SHARED),
> >> 	{},
> >> };
> > 
> > Drivers are required to gain control of, and disable the device before
> > they bind and enable things like DMA or interrupts.
> > 
> > At the very least the action list above needs an explicit callback to
> > do that step..
> 
> For IRQs, it looks like Arnd's code was simply parsing the IRQ
> specifier, and converting it to the Linux-internal number. The actual
> request of the IRQ was presumably left to probe(). I think theren's no
> issue here.

The handler is an argument to DEMV_IRQ_* so it can be passed to
request_irq..

int devm_probe_irq(struct device *dev, const struct devm_probe *probe)
{
[..]
	return devm_request_irq(dev, irq, probe->arg, probe->flags, name, probe->dev);
}

Which is nice because it gives a chance to centralize the error
handling printks as well.

> For DMA, it does look like Arnd's code was requesting it too, but that
> should also be fine; as long as no transactions are actually issued
> against that DMA slave channel, then the HW state shouldn't matter?

TBH, I'm not really familiar with how the DMA slave API works.

As long as the API and HW guarantees that the channel cannot do any
DMAs no matter what the connected IP does, it is obviously fine..

But not all DMA is like that, eg bus master DMA in PCI requires
drivers to call pci_enable_device only after they disable DMA in the
device, which is why I mentioned it..

It would be nice to see a general API like this unambiguously make
clear the steps required:

- Gain access to registers
- Gain control of the device
- Enable DMA, bind interrupts, etc
- Finalize device setup
- Make the device visible to the rest of the system

I've seen lots of drivers where the above is just not done right.

Regards,
Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
