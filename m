From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Date: Fri, 08 May 2015 21:49:02 +0200
Message-ID: <2213714.99tu5uLKxT@wuerfel>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com> <2731660.FLCdTmWWOZ@wuerfel> <20150508193850.GB32500@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150508193850.GB32500@ld-irv-0074>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Friday 08 May 2015 12:38:50 Brian Norris wrote:
> On Fri, May 08, 2015 at 03:41:10PM +0200, Arnd Bergmann wrote:
> > On Thursday 07 May 2015 11:42:46 Brian Norris wrote:
> > > On Thu, May 07, 2015 at 12:01:02PM +0200, Arnd Bergmann wrote:
> > > > The bus configuration would just involve writing
> > > > a constant value in some register, right?
> > > 
> > > I'm not an expert on the Cygnus/iProc chips, but I believe the answer is
> > > no: we *must* reconfigure the bus before and after each data
> > > transaction, because it affects the rest of the core too. Others on the
> > > CC list can probably elaborate.
> > 
> > That would not be a problem I think: the irqchip driver would always
> > get initialized first, because the main driver would get an -EPROBE_DEFER
> > when requesting the interrupt line otherwise.
> 
> Huh? I wasn't worried about initialization order. I was worried about
> the fact that the "NAND" and "SoC" portions are very integrated when
> handling the data path. And I think you agreed that this means we can't
> do a straight-up irqchip.

Sorry, I missed the part about "each data transaction", got it now.
 
> > > > Doing that in the irqchip
> > > > is also a bit ugly, but may still be better overall than doing it the
> > > > way you have above.
> > > 
> > > Well, the Cygnus/iProc case is more complicated as I mention. But I
> > > agree that other cases could be nicer, like bcm63138 (which only has
> > > separate interrupt status/enable registers). Do you expect a new irqchip
> > > driver for every arrangement of registers like this? There are a few
> > > similar chips that have status/enable registers in different orders, and
> > > some that combine them into a single word. Do we really need a new
> > > irqchip driver for each one? I might have done that for bcm63138 and
> > > bcm3384, except that I thought I'd have to fall back to this extra
> > > per-SoC support driver for Cygnus anyway.
> > 
> > I assumed this one was the only odd one.
> 
> Yes, the Cygnus/iProc are the oddest. The others (BCM33xx (not yet
> supported) and BCM63xxx) just have separate one-off interrupt register
> blocks.
> 
> To be clear, since I'm not sure if you're confused below:
> 
>  * Cygnus is a family of chips using the IPROC architecture, coming from
>    the Infrastructure/Networking Group; there are BCMxxxx numbers noted
>    in arch/arm/mach-bcm/Kconfig for them, but I usually just refer to
>    the Cygnus family or the IPROC architecture.
> 
>  * BCM63xxx is a class of DSL chips from the Broadband/Connectivity
>    Group.

Thanks for the clarification, I think that is roughly what I thought it was,
but I'm still not sure about brcmstb. Is that related to bcm63xxx or separate?

> > > > > > We recently merged nested irqdomain support as well, which might help here,
> > > > > > or might not be needed.
> > > > > 
> > > > > I'm not familiar with nested irqdomains. Do they address anything like
> > > > > the above problem?
> > > > 
> > > > The problem that nested irqdomains address is when an interrupt is handled
> > > > by two irqchips, in particular when one irqchip handles a virtual interrupt
> > > > number that was claimed by another irqchip already.
> > > 
> > > I'll do some reading on that, but it definitely doesn't address the main
> > > problem here.
> > 
> > Ok, back to the drawing board then: How about turning the probe order around
> > and splitting the SoC-specific part out into its own platform_driver:
> > 
> > Instead of bus_prepare/bus_unprepare for bcm63138, you'd get a
> 
> bcm63138 does not need the bus_{,un}prepare. That's for IPROC/Cygnus.

Ok.

> > bcm63138_nand_driver with its own probe() function that calls the
> > common probe function. That would make the soc specific parts
> > better contained and match how we normally do abstractions of
> > similar drivers.
> 
> OK, so I can imagine this might require changing the DT binding a bit [1]
> (is that your goal?). But what's the intended software difference? [2]
> I'll still be passing around the same sorts of callbacks from the
> 'iproc_nand' probe to the common probe function.
> 
> Brian
> 
> [1] e.g.:
> 
>        nand: nand@18046000 {
>                compatible = "brcm,iproc-nand", "brcm,brcmnand-v6.1", "brcm,brcmnand";
>                reg = <0x18046000 0x600>, <0xf8105408 0x600>, <0x18046f00 0x20>;
>                reg-names = "nand", "iproc-idm", "iproc-ext";
>                interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> 
>                #address-cells = <1>;
>                #size-cells = <0>;
> 
>                brcm,nand-has-wp;
>        };
> 
> This captures the extra "iproc-*" register ranges. Then we could have
> the iproc_nand driver bind against "brcm,iproc-nand", then call into the
> common probe, which would then accept/reject based on
> "brcm,brcmnand-vX.Y".
> 
> [2] The DT structure from [1] could actually accommodate either driver
> structure just fine. So maybe that means it's a better hardware
> description?

Yes, I think this makes sense overall. Regarding the specific example, can you
clarify how the register areas in iproc are structured?

The 0xf8105408 and 0x18046f00 start addresses are not aligned to large powers
of two, which often indicates that they are part of some other, larger,
unit that might need to have a driver of its own, so before we specify
a binding like the one you proposed above I'd like to make sure we're not
getting ourselves into trouble later.

	Arnd
