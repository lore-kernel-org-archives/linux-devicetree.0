From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Date: Fri, 08 May 2015 15:41:10 +0200
Message-ID: <2731660.FLCdTmWWOZ@wuerfel>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com> <20781942.cIPodTiNzG@wuerfel> <20150507184246.GO32500@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150507184246.GO32500@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 07 May 2015 11:42:46 Brian Norris wrote:
> On Thu, May 07, 2015 at 12:01:02PM +0200, Arnd Bergmann wrote:
> > On Wednesday 06 May 2015 13:49:10 Brian Norris wrote:
> > > On Wed, May 06, 2015 at 09:12:43PM +0200, Arnd Bergmann wrote:
> > > > It looks to me like this should be handled as a nested irqchip, so the node
> > > > you look up gets used as the "interrupt-parent" instead, making the behavior
> > > > of this SoC transparent to the nand driver.
> > > 
> > > You snipped the rest of the patch, which involves more than just IRQ
> > > handling. The same registers touch both interrupts and data bus endian
> > > configuration, so it can't possibly be done transparently to the NAND
> > > driver.
> > 
> > Anything else in there?
> 
> Looks like miscellaneous NAND-related control bits. AXI and APB endian
> configuration; several interrupt-enable bits (we only use one for now);
> a clock-enable; and some timing test mode bits.

I see. Describing that as an irqchip would indeed be too much of a stretch.

> > The bus configuration would just involve writing
> > a constant value in some register, right?
> 
> I'm not an expert on the Cygnus/iProc chips, but I believe the answer is
> no: we *must* reconfigure the bus before and after each data
> transaction, because it affects the rest of the core too. Others on the
> CC list can probably elaborate.

That would not be a problem I think: the irqchip driver would always
get initialized first, because the main driver would get an -EPROBE_DEFER
when requesting the interrupt line otherwise.

> > Doing that in the irqchip
> > is also a bit ugly, but may still be better overall than doing it the
> > way you have above.
> 
> Well, the Cygnus/iProc case is more complicated as I mention. But I
> agree that other cases could be nicer, like bcm63138 (which only has
> separate interrupt status/enable registers). Do you expect a new irqchip
> driver for every arrangement of registers like this? There are a few
> similar chips that have status/enable registers in different orders, and
> some that combine them into a single word. Do we really need a new
> irqchip driver for each one? I might have done that for bcm63138 and
> bcm3384, except that I thought I'd have to fall back to this extra
> per-SoC support driver for Cygnus anyway.

I assumed this one was the only odd one.

> > > > We recently merged nested irqdomain support as well, which might help here,
> > > > or might not be needed.
> > > 
> > > I'm not familiar with nested irqdomains. Do they address anything like
> > > the above problem?
> > 
> > The problem that nested irqdomains address is when an interrupt is handled
> > by two irqchips, in particular when one irqchip handles a virtual interrupt
> > number that was claimed by another irqchip already.
> 
> I'll do some reading on that, but it definitely doesn't address the main
> problem here.

Ok, back to the drawing board then: How about turning the probe order around
and splitting the SoC-specific part out into its own platform_driver:

Instead of bus_prepare/bus_unprepare for bcm63138, you'd get a
bcm63138_nand_driver with its own probe() function that calls the
common probe function. That would make the soc specific parts
better contained and match how we normally do abstractions of
similar drivers.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
