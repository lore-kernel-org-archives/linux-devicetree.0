From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH V2 03/15] genirq: Generic chip: Move irq_reg_{readl,writel}
 accessors into generic-chip.c
Date: Thu, 30 Oct 2014 12:50:15 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1410301248120.5308@nanos>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com> <1414635488-14137-4-git-send-email-cernekee@gmail.com> <alpine.DEB.2.11.1410300941290.5308@nanos> <6552163.gt4ABVyYlA@wuerfel> <alpine.DEB.2.11.1410301103300.5308@nanos>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.11.1410301103300.5308@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kevin Cernekee <cernekee@gmail.com>, f.fainelli@gmail.com, jason@lakedaemon.net, ralf@linux-mips.org, lethal@linux-sh.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Thu, 30 Oct 2014, Thomas Gleixner wrote:
> On Thu, 30 Oct 2014, Arnd Bergmann wrote:
> > On Thursday 30 October 2014 09:43:02 Thomas Gleixner wrote:
> > > > diff --git a/include/linux/irq.h b/include/linux/irq.h
> > > > index 03f48d9..8049e93 100644
> > > > --- a/include/linux/irq.h
> > > > +++ b/include/linux/irq.h
> > > > @@ -639,13 +639,6 @@ void arch_teardown_hwirq(unsigned int irq);
> > > >  void irq_init_desc(unsigned int irq);
> > > >  #endif
> > > >  
> > > > -#ifndef irq_reg_writel
> > > > -# define irq_reg_writel(val, addr)   writel(val, addr)
> > > > -#endif
> > > > -#ifndef irq_reg_readl
> > > > -# define irq_reg_readl(addr)         readl(addr)
> > > > -#endif
> > > > -
> > > 
> > > Brilliant patch that.
> > > 
> > > # git grep -l irq_reg_readl drivers/irqchip/
> > > drivers/irqchip/irq-atmel-aic.c
> > > drivers/irqchip/irq-atmel-aic5.c
> > > drivers/irqchip/irq-sunxi-nmi.c
> > > drivers/irqchip/irq-tb10x.c
> > 
> > Patch 1/15 changes these all. I think it's still broken because patch 2/15
> > is wrong, but it's not /that/ obviously broken.
> 
> Oops. Missed that.

But looking at: drivers/irqchip/irq-sunxi-nmi.c

It's using the generic chip. So while the generic chip uses the
accessor function, the driver implementation which implements extra
functionality will use something hardcoded. While it does not break
the current setup, it's wrong nevertheless.

Thanks,

	tglx
