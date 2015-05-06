From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 03/10] mtd: nand: add NAND driver for Broadcom STB
 NAND controller
Date: Wed, 6 May 2015 14:05:34 -0700
Message-ID: <20150506210534.GK32500@ld-irv-0074>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <1430935194-7579-4-git-send-email-computersforpeace@gmail.com>
 <2114576.uWbXPVDdyI@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2114576.uWbXPVDdyI@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 06, 2015 at 09:17:36PM +0200, Arnd Bergmann wrote:
> On Wednesday 06 May 2015 10:59:47 Brian Norris wrote:
> > +
> > +static inline u32 nand_readreg(struct brcmnand_controller *ctrl, u32 offs)
> > +{
> > +       return __raw_readl(ctrl->nand_base + offs);
> > +}
> > +
> > +static inline void nand_writereg(struct brcmnand_controller *ctrl, u32 offs,
> > +                                u32 val)
> > +{
> > +       __raw_writel(val, ctrl->nand_base + offs);
> > +}
> > +
> > 
> 
> You had mentioned previously that there might be an endianess issue in this
> driver.

Might. I have a patch already, but I failed to boot a BE kernel, so I
kept it out for now. If you don't mind, I'd prefer patching something
like this once it's testable on ARM BE. This *is*, however, extensively
tested on MIPS (LE and BE) and ARM (LE).

> I think this won't work on big-endian architectures other than MIPS,
> so it would be good to either list in the DT the endianess of the device
> and use appropriate accessors here, or hardcode it based on the architecture
> (using ioread32_be in big-endian mips, but readl elsewhere).

I suspect we wouldn't need a DT property but could just special-case
MIPS BE, as you note.

> Using __raw_writel has another problem regarding the DMA capability of this
> driver, as it will not flush any write buffers or synchronize caches before
> sending data off to the device, so you risk data corruption.

We use mb() before kicking off DMA or other commands.

> Also, the
> compiler can choose to split up the 32-bit word access into byte accesses,
> which on most hardware does not do what you want.

Huh? Wouldn't that break just about every driver in existence? And how
is writel() any different than __raw_writel() in that regard? From
include/asm-generic/io.h:

static inline void writel(u32 value, volatile void __iomem *addr)
{
        __raw_writel(__cpu_to_le32(value), addr);
}

And BTW, splitting isn't possible on ARM. From
arch/arm/include/asm/io.h:

static inline void __raw_writel(u32 val, volatile void __iomem *addr)
{
        asm volatile("str %1, %0"
                     : "+Qo" (*(volatile u32 __force *)addr)
                     : "r" (val));
}

Brian
