From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Date: Fri, 8 May 2015 13:47:25 -0700
Message-ID: <20150508204725.GD32500@ld-irv-0074>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <2731660.FLCdTmWWOZ@wuerfel>
 <20150508193850.GB32500@ld-irv-0074>
 <2213714.99tu5uLKxT@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2213714.99tu5uLKxT@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 08, 2015 at 09:49:02PM +0200, Arnd Bergmann wrote:
> On Friday 08 May 2015 12:38:50 Brian Norris wrote:
> > On Fri, May 08, 2015 at 03:41:10PM +0200, Arnd Bergmann wrote:
[...]

> > To be clear, since I'm not sure if you're confused below:
> > 
> >  * Cygnus is a family of chips using the IPROC architecture, coming from
> >    the Infrastructure/Networking Group; there are BCMxxxx numbers noted
> >    in arch/arm/mach-bcm/Kconfig for them, but I usually just refer to
> >    the Cygnus family or the IPROC architecture.
> > 
> >  * BCM63xxx is a class of DSL chips from the Broadband/Connectivity
> >    Group.
> 
> Thanks for the clarification, I think that is roughly what I thought it was,
> but I'm still not sure about brcmstb. Is that related to bcm63xxx or separate?

I think arch/arm/mach-bcm/Kconfig has the best summary. brcmstb is
separate; BCM7xxx is generally (always?) Set-Top Box.

Another potentially confusing point: the main driver is named
'brcsmtb_nand' since the NAND core (and driver) originated from STB
chips. But that core was applied to other non-STB chips, and so the
driver has been extended.

> > > bcm63138_nand_driver with its own probe() function that calls the
> > > common probe function. That would make the soc specific parts
> > > better contained and match how we normally do abstractions of
> > > similar drivers.
> > 
> > OK, so I can imagine this might require changing the DT binding a bit [1]
> > (is that your goal?). But what's the intended software difference? [2]
> > I'll still be passing around the same sorts of callbacks from the
> > 'iproc_nand' probe to the common probe function.

^^ before getting bogged down on the DT details (which can be changed
independently), I'd like to address this point.

> > Brian
> > 
> > [1] e.g.:
> > 
> >        nand: nand@18046000 {
> >                compatible = "brcm,iproc-nand", "brcm,brcmnand-v6.1", "brcm,brcmnand";
> >                reg = <0x18046000 0x600>, <0xf8105408 0x600>, <0x18046f00 0x20>;
> >                reg-names = "nand", "iproc-idm", "iproc-ext";
> >                interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> > 
> >                #address-cells = <1>;
> >                #size-cells = <0>;
> > 
> >                brcm,nand-has-wp;
> >        };
> > 
> > This captures the extra "iproc-*" register ranges. Then we could have
> > the iproc_nand driver bind against "brcm,iproc-nand", then call into the
> > common probe, which would then accept/reject based on
> > "brcm,brcmnand-vX.Y".
> > 
> > [2] The DT structure from [1] could actually accommodate either driver
> > structure just fine. So maybe that means it's a better hardware
> > description?
> 
> Yes, I think this makes sense overall. Regarding the specific example, can you
> clarify how the register areas in iproc are structured?
> 
> The 0xf8105408 and 0x18046f00 start addresses are not aligned to large powers
> of two, which often indicates that they are part of some other, larger,
> unit that might need to have a driver of its own, so before we specify
> a binding like the one you proposed above I'd like to make sure we're not
> getting ourselves into trouble later.

I may want the Cygnus guys to speak up here, partly for technical
expertise and partly to know how much they care to share...

<0xf8105408 0x600>: covers a series of NAND_IDM registers. NAND has a
few bits we don't care about (for debugging, logging, and resetting), as
well as its interrupt enable bits. The adjacent blocks cover similar IDM
blocks for other cores (SPI, PNOR, DDR), and they are similarly
unaligned. Not sure why, exactly; probably just a compact layout.

<0x18046f00 0x20>: a series of 8 NAND interrupt registers, each word
containing a single bit representing status/clear. There is nothing
between the "nand" range and this range, and the SPI core register range
follows.

So I think these are pretty clearly-delineated register ranges for NAND,
and the alignment is not really missing anything. Adjacent hardware
(e.g., SPI) is independent, though pieces look similar. For one, it has
similar:

 * interrupt enable bits in the IDM range (0xf8106408 to 0xf8106a00);
   and
 * interrupt status/clear following the SPI block (0x180473a0 to
   0x180473b8)

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
