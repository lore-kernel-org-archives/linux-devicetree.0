From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 06/10] mtd: brcmstb_nand: add SoC-specific support
Date: Fri, 08 May 2015 23:38:11 +0200
Message-ID: <22310765.EUWHaqSZZD@wuerfel>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com> <2213714.99tu5uLKxT@wuerfel> <20150508204725.GD32500@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150508204725.GD32500@ld-irv-0074>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Friday 08 May 2015 13:47:25 Brian Norris wrote:
> On Fri, May 08, 2015 at 09:49:02PM +0200, Arnd Bergmann wrote:
> > On Friday 08 May 2015 12:38:50 Brian Norris wrote:
> > > On Fri, May 08, 2015 at 03:41:10PM +0200, Arnd Bergmann wrote:
> [...]
> 
> > > To be clear, since I'm not sure if you're confused below:
> > > 
> > >  * Cygnus is a family of chips using the IPROC architecture, coming from
> > >    the Infrastructure/Networking Group; there are BCMxxxx numbers noted
> > >    in arch/arm/mach-bcm/Kconfig for them, but I usually just refer to
> > >    the Cygnus family or the IPROC architecture.
> > > 
> > >  * BCM63xxx is a class of DSL chips from the Broadband/Connectivity
> > >    Group.
> > 
> > Thanks for the clarification, I think that is roughly what I thought it was,
> > but I'm still not sure about brcmstb. Is that related to bcm63xxx or separate?
> 
> I think arch/arm/mach-bcm/Kconfig has the best summary. brcmstb is
> separate; BCM7xxx is generally (always?) Set-Top Box.
> 
> Another potentially confusing point: the main driver is named
> 'brcsmtb_nand' since the NAND core (and driver) originated from STB
> chips. But that core was applied to other non-STB chips, and so the
> driver has been extended.

Ok, I see.

> > > > bcm63138_nand_driver with its own probe() function that calls the
> > > > common probe function. That would make the soc specific parts
> > > > better contained and match how we normally do abstractions of
> > > > similar drivers.
> > > 
> > > OK, so I can imagine this might require changing the DT binding a bit [1]
> > > (is that your goal?). But what's the intended software difference? [2]
> > > I'll still be passing around the same sorts of callbacks from the
> > > 'iproc_nand' probe to the common probe function.
> 
> ^^ before getting bogged down on the DT details (which can be changed
> independently), I'd like to address this point.

The intended change is to make it work according to
Documentation/driver-model/design-patterns.txt

basically, by having all the shared code be a "library" module that gets
called by the actual hardware specific drivers, rather than having the
shared code be the central driver that fans out into all possible subdrivers.

> > 
> > Yes, I think this makes sense overall. Regarding the specific example, can you
> > clarify how the register areas in iproc are structured?
> > 
> > The 0xf8105408 and 0x18046f00 start addresses are not aligned to large powers
> > of two, which often indicates that they are part of some other, larger,
> > unit that might need to have a driver of its own, so before we specify
> > a binding like the one you proposed above I'd like to make sure we're not
> > getting ourselves into trouble later.
> 
> I may want the Cygnus guys to speak up here, partly for technical
> expertise and partly to know how much they care to share...
> 
> <0xf8105408 0x600>: covers a series of NAND_IDM registers. NAND has a
> few bits we don't care about (for debugging, logging, and resetting), as
> well as its interrupt enable bits. The adjacent blocks cover similar IDM
> blocks for other cores (SPI, PNOR, DDR), and they are similarly
> unaligned. Not sure why, exactly; probably just a compact layout.
> 
> <0x18046f00 0x20>: a series of 8 NAND interrupt registers, each word
> containing a single bit representing status/clear. There is nothing
> between the "nand" range and this range, and the SPI core register range
> follows.
> 
> So I think these are pretty clearly-delineated register ranges for NAND,
> and the alignment is not really missing anything. Adjacent hardware
> (e.g., SPI) is independent, though pieces look similar. For one, it has
> similar:
> 
>  * interrupt enable bits in the IDM range (0xf8106408 to 0xf8106a00);
>    and
>  * interrupt status/clear following the SPI block (0x180473a0 to
>    0x180473b8)

This would in turn indicate that we should treat these ranges as
an irqchip that handles all sorts of devices, but it really depends
on the particular register layout.

	Arnd
