From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 03/10] mtd: nand: add NAND driver for Broadcom STB NAND controller
Date: Fri, 08 May 2015 10:18:22 +0200
Message-ID: <13180385.abdHk2aIq9@wuerfel>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com> <2668469.V5VmYNtzFN@wuerfel> <20150507185211.GP32500@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150507185211.GP32500@ld-irv-0074>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>, linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thursday 07 May 2015 11:52:11 Brian Norris wrote:
> On Thu, May 07, 2015 at 11:25:29AM +0200, Arnd Bergmann wrote:
> > On Wednesday 06 May 2015 14:18:47 Ray Jui wrote:
> > > 
> > > On 5/6/2015 2:05 PM, Brian Norris wrote:
> > > > On Wed, May 06, 2015 at 09:17:36PM +0200, Arnd Bergmann wrote:
> > > >> On Wednesday 06 May 2015 10:59:47 Brian Norris wrote:
> [...]
> > There is one twist here that I forgot to mention:
> > 
> > This loop in brcmnand_read_by_pio() and the respective one in
> > brcmnand_write_by_pio():
> > 
> > +               if (likely(buf))
> > +                       for (j = 0; j < FC_WORDS; j++, buf++)
> > +                               *buf = brcmnand_read_fc(ctrl, j);
> > 
> > should be converted to use ioread32_rep().
> 
> Huh? That's completely wrong. You're assuming I have a single-register
> FIFO, when in fact, I have a memory-mapped hardware buffer. Maybe you're
> looking for memcpy_{to,from}io()? I see this is not optimized at all,
> though.

Ah, my mistake. So the brcmnand_read_fc() has to just keep using __raw_readl
here, unlike the other accessors that should (on non-MIPS) use readl_relaxed
or readl.

> 
> > There are two reasons for
> > this: 
> > 
> > a) accessing the flash data is inherently different from accessing an
> >    mmio register, and you want the bytes to end up in memory in the same
> >    order that they are in flash.
> 
> Right, which is why it's a separate helper function in my driver, and it
> will stay with __raw_{read,write}l().

Ok.

> >    ioread32_rep() uses __raw_readl()
> >    internally for this purpose, except on architectures that have a
> >    byte flipping hardware on the bus interface.
> > 
> > b) The implementation is optimized on ARM and will likely give you
> >    higher throughput than a manual loop using readl().
> 
> You suggested the wrong helper, and the "right" helper is *not*
> optimized. It even has comments saying "this needs to be optimized".

Yes, I was misreading the code and missed the fact that you implement
a memcpy, not read-from-fifo in that loop. For the fifo case, the
optimized implementation is in arch/arm/lib/io-readsl.S, while you
are right that the ARM implementation of memcpy_fromio is pessimal
by doing byte sized accesses, so don't use that. Your loop is fine.

> > 
> > > >> Also, the
> > > >> compiler can choose to split up the 32-bit word access into byte accesses,
> > > >> which on most hardware does not do what you want.
> > > > 
> > > > Huh? Wouldn't that break just about every driver in existence? And how
> > > > is writel() any different than __raw_writel() in that regard? From
> > > > include/asm-generic/io.h:
> > > > 
> > > > static inline void writel(u32 value, volatile void __iomem *addr)
> > > > {
> > > >         __raw_writel(__cpu_to_le32(value), addr);
> > > > }
> > > > 
> > > > And BTW, splitting isn't possible on ARM. From
> > > > arch/arm/include/asm/io.h:
> > > > 
> > > > static inline void __raw_writel(u32 val, volatile void __iomem *addr)
> > > > {
> > > >         asm volatile("str %1, %0"
> > > >                      : "+Qo" (*(volatile u32 __force *)addr)
> > > >                      : "r" (val));
> > > > }
> > > > 
> > 
> > Ah right, we changed that one to simplify KVM support. It used to just
> > do a volatile store for __raw_* but use an assembly for writel_relaxed().
> 
> While the ARM case is rock-solid in my favor, I would appreciate an
> answer to the asm-generic case too; do you really expect that any sane
> compiler would break up word-aligned volatile stores into smaller (e.g.,
> 8-bit) stores? As I said, I think that means every driver written in C
> is broken, not just the ones using your pet enemies,
> __raw_{read,write}l().

Yes, we've had actual bugs in the past where it broke from one gcc
release to the next. The reason it broke there was that the pointer
was assigned (in violation of the C standard) from a pointer of smaller
alignment. If you have code that does:


	char __iomem *p1 = ...;
	void __iomem *p2 = p1;
	int __iomem *p3 = p2;
	u32 data = __raw_readl(p3);

then gcc may decide that it is not safe to do 32-bit aligned accesses
because it does not know the alignment of p1.

	Arnd
