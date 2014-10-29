From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 05/11] irqchip: bcm7120-l2: Make sure all register accesses use base+offset
Date: Wed, 29 Oct 2014 08:46 +0100
Message-ID: <12783106.5y3em8Tzu2@wuerfel>
References: <1414555138-6500-1-git-send-email-cernekee@gmail.com> <1414555138-6500-5-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414555138-6500-5-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Tuesday 28 October 2014 20:58:52 Kevin Cernekee wrote:
> 
>         irq_gc_lock(gc);
>         /* Save the current mask and the interrupt forward mask */
> -       b->saved_mask = __raw_readl(b->base) | b->irq_fwd_mask;
> +       b->saved_mask = __raw_readl(b->base + IRQEN) | b->irq_fwd_mask;
>         if (b->can_wake) {
>                 reg = b->saved_mask | gc->wake_active;
> -               __raw_writel(reg, b->base);
> +               __raw_writel(reg, b->base + IRQEN);
>         }
>         irq_gc_unlock(gc);
>  }
> @@ -81,7 +81,7 @@ static void bcm7120_l2_intc_resume(struct irq_data *d)
>  
>         /* Restore the saved mask */
>         irq_gc_lock(gc);
> -       __raw_writel(b->saved_mask, b->base);
> +       __raw_writel(b->saved_mask, b->base + IRQEN);
>         irq_gc_unlock(gc);
> 

You should really change this one too, to use fixed-endian accessors.
__raw_writel can't safely be used in drivers, and it will break
big-endian kernels running on ARM BRCMSTB.

	Arnd
