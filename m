From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v7 08/13] ARM: unify MMU/!MMU addruart calls
Date: Mon, 18 May 2015 17:36:43 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1505181735230.4225@nanos>
References: <1431769465-26867-1-git-send-email-stefan@agner.ch> <1431769465-26867-9-git-send-email-stefan@agner.ch> <20150516205103.GO2067@n2100.arm.linux.org.uk> <alpine.DEB.2.11.1505170952060.4225@nanos>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1505170952060.4225@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Sun, 17 May 2015, Thomas Gleixner wrote:

> On Sat, 16 May 2015, Russell King - ARM Linux wrote:
> 
> > On Sat, May 16, 2015 at 11:44:20AM +0200, Stefan Agner wrote:
> > > Remove the needless differences between MMU/!MMU addruart calls.
> > > This allows to use the same addruart macro on SoC level. Useful
> > > for SoC consisting of multiple CPUs with and without MMU such as
> > > Freescale Vybrid.
> > > 
> > > Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> > 
> > Depending on the merge plan for the remainder (has tglx reviewed the IRQ
> > changes yet?  I think he needs to before this can be merged)... if it's
> > not going to go in for the next merge window, this should find its way
> > into the patch system so it can be applied anyway.
> 
> I'm going to apply the irq core and chip driver modifications to a
> separate branch later today, so you or ARM-SOC folks can pull that
> in. Will send you a mail where it can be found.

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/for-arm

That contains the first 5 patches which touch kernel/irq/ and
drivers/irqchip/

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
