From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V2 06/15] genirq: Generic chip: Optimize for fixed-endian
 systems
Date: Wed, 29 Oct 2014 21:16:58 -0700
Message-ID: <20141030041658.GB29070@brian-ubuntu>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com>
 <1414635488-14137-7-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1414635488-14137-7-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: arnd@arndb.de, f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, lethal@linux-sh.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 29, 2014 at 07:17:59PM -0700, Kevin Cernekee wrote:
> @@ -19,7 +20,14 @@ static DEFINE_RAW_SPINLOCK(gc_lock);
>  
>  static int is_big_endian(struct irq_chip_generic *gc)
>  {
> -	return !!(gc->domain->gc->gc_flags & IRQ_GC_BE_IO);
> +	if (IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP) &&
> +	    !IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP_BE))
> +		return 0;
> +	else if (IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP_BE) &&
> +		 !IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP))
> +		return 1;

Would XOR make this any easier to read? e.g.:

	if (IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP) ^
	    IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP_BE))
		return IS_ENABLED(CONFIG_GENERIC_IRQ_CHIP_BE);
	else
		...

> +	else
> +		return !!(gc->domain->gc->gc_flags & IRQ_GC_BE_IO);
>  }
>  
>  static void irq_reg_writel(struct irq_chip_generic *gc,

Brian
