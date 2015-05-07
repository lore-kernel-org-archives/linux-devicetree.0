From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 03/10] mtd: nand: add NAND driver for Broadcom STB
 NAND controller
Date: Thu, 7 May 2015 11:52:11 -0700
Message-ID: <20150507185211.GP32500@ld-irv-0074>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <20150506210534.GK32500@ld-irv-0074>
 <554A8537.8050404@broadcom.com>
 <2668469.V5VmYNtzFN@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2668469.V5VmYNtzFN@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ray Jui <rjui@broadcom.com>, linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 07, 2015 at 11:25:29AM +0200, Arnd Bergmann wrote:
> On Wednesday 06 May 2015 14:18:47 Ray Jui wrote:
> > 
> > On 5/6/2015 2:05 PM, Brian Norris wrote:
> > > On Wed, May 06, 2015 at 09:17:36PM +0200, Arnd Bergmann wrote:
> > >> On Wednesday 06 May 2015 10:59:47 Brian Norris wrote:
[...]
> There is one twist here that I forgot to mention:
> 
> This loop in brcmnand_read_by_pio() and the respective one in
> brcmnand_write_by_pio():
> 
> +               if (likely(buf))
> +                       for (j = 0; j < FC_WORDS; j++, buf++)
> +                               *buf = brcmnand_read_fc(ctrl, j);
> 
> should be converted to use ioread32_rep().

Huh? That's completely wrong. You're assuming I have a single-register
FIFO, when in fact, I have a memory-mapped hardware buffer. Maybe you're
looking for memcpy_{to,from}io()? I see this is not optimized at all,
though.

> There are two reasons for
> this: 
> 
> a) accessing the flash data is inherently different from accessing an
>    mmio register, and you want the bytes to end up in memory in the same
>    order that they are in flash.

Right, which is why it's a separate helper function in my driver, and it
will stay with __raw_{read,write}l().

>    ioread32_rep() uses __raw_readl()
>    internally for this purpose, except on architectures that have a
>    byte flipping hardware on the bus interface.
> 
> b) The implementation is optimized on ARM and will likely give you
>    higher throughput than a manual loop using readl().

You suggested the wrong helper, and the "right" helper is *not*
optimized. It even has comments saying "this needs to be optimized".

> > >> Using __raw_writel has another problem regarding the DMA capability of this
> > >> driver, as it will not flush any write buffers or synchronize caches before
> > >> sending data off to the device, so you risk data corruption.
> > > 
> > > We use mb() before kicking off DMA or other commands.
> 
> Ok, that should work, but will be a stronger barrier than necessary on some
> architectures. On ARM, mb() is 'dsb(); outer_sync();', while readl only
> needs a 'dsb()' and writel() can use dsb(st) that is slightly weaker than
> a full dsb().
> 
> > >> Also, the
> > >> compiler can choose to split up the 32-bit word access into byte accesses,
> > >> which on most hardware does not do what you want.
> > > 
> > > Huh? Wouldn't that break just about every driver in existence? And how
> > > is writel() any different than __raw_writel() in that regard? From
> > > include/asm-generic/io.h:
> > > 
> > > static inline void writel(u32 value, volatile void __iomem *addr)
> > > {
> > >         __raw_writel(__cpu_to_le32(value), addr);
> > > }
> > > 
> > > And BTW, splitting isn't possible on ARM. From
> > > arch/arm/include/asm/io.h:
> > > 
> > > static inline void __raw_writel(u32 val, volatile void __iomem *addr)
> > > {
> > >         asm volatile("str %1, %0"
> > >                      : "+Qo" (*(volatile u32 __force *)addr)
> > >                      : "r" (val));
> > > }
> > > 
> 
> Ah right, we changed that one to simplify KVM support. It used to just
> do a volatile store for __raw_* but use an assembly for writel_relaxed().

While the ARM case is rock-solid in my favor, I would appreciate an
answer to the asm-generic case too; do you really expect that any sane
compiler would break up word-aligned volatile stores into smaller (e.g.,
8-bit) stores? As I said, I think that means every driver written in C
is broken, not just the ones using your pet enemies,
__raw_{read,write}l().

Brian
