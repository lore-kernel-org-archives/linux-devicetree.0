From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Date: Fri, 8 May 2015 12:38:50 -0700
Message-ID: <20150508193850.GB32500@ld-irv-0074>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <20781942.cIPodTiNzG@wuerfel>
 <20150507184246.GO32500@ld-irv-0074>
 <2731660.FLCdTmWWOZ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2731660.FLCdTmWWOZ@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 08, 2015 at 03:41:10PM +0200, Arnd Bergmann wrote:
> On Thursday 07 May 2015 11:42:46 Brian Norris wrote:
> > On Thu, May 07, 2015 at 12:01:02PM +0200, Arnd Bergmann wrote:
> > > The bus configuration would just involve writing
> > > a constant value in some register, right?
> > 
> > I'm not an expert on the Cygnus/iProc chips, but I believe the answer is
> > no: we *must* reconfigure the bus before and after each data
> > transaction, because it affects the rest of the core too. Others on the
> > CC list can probably elaborate.
> 
> That would not be a problem I think: the irqchip driver would always
> get initialized first, because the main driver would get an -EPROBE_DEFER
> when requesting the interrupt line otherwise.

Huh? I wasn't worried about initialization order. I was worried about
the fact that the "NAND" and "SoC" portions are very integrated when
handling the data path. And I think you agreed that this means we can't
do a straight-up irqchip.

FWIW, I agree that -EPROBE_DEFER can handle initialization ordering
issues...

> > > Doing that in the irqchip
> > > is also a bit ugly, but may still be better overall than doing it the
> > > way you have above.
> > 
> > Well, the Cygnus/iProc case is more complicated as I mention. But I
> > agree that other cases could be nicer, like bcm63138 (which only has
> > separate interrupt status/enable registers). Do you expect a new irqchip
> > driver for every arrangement of registers like this? There are a few
> > similar chips that have status/enable registers in different orders, and
> > some that combine them into a single word. Do we really need a new
> > irqchip driver for each one? I might have done that for bcm63138 and
> > bcm3384, except that I thought I'd have to fall back to this extra
> > per-SoC support driver for Cygnus anyway.
> 
> I assumed this one was the only odd one.

Yes, the Cygnus/iProc are the oddest. The others (BCM33xx (not yet
supported) and BCM63xxx) just have separate one-off interrupt register
blocks.

To be clear, since I'm not sure if you're confused below:

 * Cygnus is a family of chips using the IPROC architecture, coming from
   the Infrastructure/Networking Group; there are BCMxxxx numbers noted
   in arch/arm/mach-bcm/Kconfig for them, but I usually just refer to
   the Cygnus family or the IPROC architecture.

 * BCM63xxx is a class of DSL chips from the Broadband/Connectivity
   Group.

> > > > > We recently merged nested irqdomain support as well, which might help here,
> > > > > or might not be needed.
> > > > 
> > > > I'm not familiar with nested irqdomains. Do they address anything like
> > > > the above problem?
> > > 
> > > The problem that nested irqdomains address is when an interrupt is handled
> > > by two irqchips, in particular when one irqchip handles a virtual interrupt
> > > number that was claimed by another irqchip already.
> > 
> > I'll do some reading on that, but it definitely doesn't address the main
> > problem here.
> 
> Ok, back to the drawing board then: How about turning the probe order around
> and splitting the SoC-specific part out into its own platform_driver:
> 
> Instead of bus_prepare/bus_unprepare for bcm63138, you'd get a

bcm63138 does not need the bus_{,un}prepare. That's for IPROC/Cygnus.

> bcm63138_nand_driver with its own probe() function that calls the
> common probe function. That would make the soc specific parts
> better contained and match how we normally do abstractions of
> similar drivers.

OK, so I can imagine this might require changing the DT binding a bit [1]
(is that your goal?). But what's the intended software difference? [2]
I'll still be passing around the same sorts of callbacks from the
'iproc_nand' probe to the common probe function.

Brian

[1] e.g.:

       nand: nand@18046000 {
               compatible = "brcm,iproc-nand", "brcm,brcmnand-v6.1", "brcm,brcmnand";
               reg = <0x18046000 0x600>, <0xf8105408 0x600>, <0x18046f00 0x20>;
               reg-names = "nand", "iproc-idm", "iproc-ext";
               interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;

               #address-cells = <1>;
               #size-cells = <0>;

               brcm,nand-has-wp;
       };

This captures the extra "iproc-*" register ranges. Then we could have
the iproc_nand driver bind against "brcm,iproc-nand", then call into the
common probe, which would then accept/reject based on
"brcm,brcmnand-vX.Y".

[2] The DT structure from [1] could actually accommodate either driver
structure just fine. So maybe that means it's a better hardware
description?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
