From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 05/15] genirq: Generic chip: Add big endian I/O accessors
Date: Thu, 30 Oct 2014 10:21:12 +0100
Message-ID: <14243833.KJsSScVrGS@wuerfel>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com> <1414635488-14137-6-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414635488-14137-6-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, lethal@linux-sh.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Wednesday 29 October 2014 19:17:58 Kevin Cernekee wrote:
>  static LIST_HEAD(gc_list);
>  static DEFINE_RAW_SPINLOCK(gc_lock);
>  
> +static int is_big_endian(struct irq_chip_generic *gc)
> +{
> +       return !!(gc->domain->gc->gc_flags & IRQ_GC_BE_IO);
> +}
> +
>  static void irq_reg_writel(struct irq_chip_generic *gc,
>                            u32 val, int reg_offset)
>  {
> -       writel(val, gc->reg_base + reg_offset);
> +       if (is_big_endian(gc))
> +               iowrite32be(val, gc->reg_base + reg_offset);
> +       else
> +               writel(val, gc->reg_base + reg_offset);
>  }
>  

What I had in mind was to use indirect function calls instead, like

#ifndef irq_reg_writel
static inline void irq_reg_writel_le(u32 val, void __iomem *addr)
{
	return writel(val, addr);
}
#endif

#ifndef irq_reg_writel_be
static inline void irq_reg_writel_be(u32 val, void __iomem *addr)
{
	return iowrite32_be(val, addr);
}
#endif


static inline void irq_reg_writel(struct irq_chip_generic *gc, u32 val, int reg_offset)
{
       if (IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP) &&
           !IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP_BE))
		return irq_reg_writel_le(val, gc->reg_base + reg_offset);

       if (IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP) &&
           !IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP_BE))
		return irq_reg_writel_be(val, gc->reg_base + reg_offset);

	return gc->writel(val, gc->reg_base + reg_offset);
}

This would take the condition out of the callers.

	Arnd
