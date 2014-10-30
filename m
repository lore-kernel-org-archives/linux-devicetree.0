From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 06/15] genirq: Generic chip: Optimize for fixed-endian systems
Date: Thu, 30 Oct 2014 10:04:24 +0100
Message-ID: <2089348.fa41ONzNz9@wuerfel>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com> <1414635488-14137-7-git-send-email-cernekee@gmail.com> <20141030041658.GB29070@brian-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141030041658.GB29070@brian-ubuntu>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>, f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, lethal@linux-sh.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Wednesday 29 October 2014 21:16:58 Brian Norris wrote:
> >  static int is_big_endian(struct irq_chip_generic *gc)
> >  {
> > -     return !!(gc->domain->gc->gc_flags & IRQ_GC_BE_IO);
> > +     if (IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP) &&
> > +         !IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP_BE))
> > +             return 0;
> > +     else if (IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP_BE) &&
> > +              !IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP))
> > +             return 1;
> 
> Would XOR make this any easier to read? e.g.:
> 
>         if (IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP) ^
>             IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP_BE))
>                 return IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP_BE);
>         else
>                 ...
> 

I think that would only be easier to read for the compiler, not for
for a human. ;-)

	Arnd
