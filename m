From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v7 08/13] ARM: unify MMU/!MMU addruart calls
Date: Tue, 19 May 2015 11:16:15 +0100
Message-ID: <20150519101615.GA2067@n2100.arm.linux.org.uk>
References: <1431769465-26867-1-git-send-email-stefan@agner.ch>
 <1431769465-26867-9-git-send-email-stefan@agner.ch>
 <20150516205103.GO2067@n2100.arm.linux.org.uk>
 <alpine.DEB.2.11.1505170952060.4225@nanos>
 <alpine.DEB.2.11.1505181735230.4225@nanos>
 <20150519053503.GP1071@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150519053503.GP1071@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 19, 2015 at 01:35:03PM +0800, Shawn Guo wrote:
> On Mon, May 18, 2015 at 05:36:43PM +0200, Thomas Gleixner wrote:
> > On Sun, 17 May 2015, Thomas Gleixner wrote:
> > > On Sat, 16 May 2015, Russell King - ARM Linux wrote:
> > > > On Sat, May 16, 2015 at 11:44:20AM +0200, Stefan Agner wrote:
> > > > > Remove the needless differences between MMU/!MMU addruart calls.
> > > > > This allows to use the same addruart macro on SoC level. Useful
> > > > > for SoC consisting of multiple CPUs with and without MMU such as
> > > > > Freescale Vybrid.
> > > > > 
> > > > > Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> > > > 
> > > > Depending on the merge plan for the remainder (has tglx reviewed the IRQ
> > > > changes yet?  I think he needs to before this can be merged)... if it's
> > > > not going to go in for the next merge window, this should find its way
> > > > into the patch system so it can be applied anyway.
> > > 
> > > I'm going to apply the irq core and chip driver modifications to a
> > > separate branch later today, so you or ARM-SOC folks can pull that
> > > in. Will send you a mail where it can be found.
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/for-arm
> > 
> > That contains the first 5 patches which touch kernel/irq/ and
> > drivers/irqchip/
> 
> Russell, Arnd,
> 
> I guess the easiest way to merge rest of the series is to have them go
> via i.MX tree with your nods?

I don't know, I've not looked at the remainder of the patches.  Having
looked briefly at them, it looks like they touch EFM32 as well, so I'm
not sure having them all go through iMX is the right approach either.

Looking at the EFM32 patch, it looks like we've adopted my suggestion
(discussed with Arnd in the previous month) wrt noMMU, so I'll post a
couple of patches in a moment which fix Integrator for this as well.
Integrator is independent of this series, and it fixes real problems
caused by the single zImage stuff for noMMU there.

It makes sense for these to all go through arm-soc - but the question
is how do we get them all into arm-soc...

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
