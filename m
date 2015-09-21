From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v3 1/3] ARM: uniphier: add outer cache support
Date: Mon, 21 Sep 2015 20:38:22 +0100
Message-ID: <20150921193822.GV21084@n2100.arm.linux.org.uk>
References: <1442551054-2116-1-git-send-email-yamada.masahiro@socionext.com>
 <1442551054-2116-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1442551054-2116-2-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jungseung Lee <js07.lee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David S.
List-Id: devicetree@vger.kernel.org

On Fri, Sep 18, 2015 at 01:37:32PM +0900, Masahiro Yamada wrote:
> +/**
> + * __uniphier_cache_maint_common - run a queue operation for a particular level
> + *
> + * @data: cache controller specific data
> + * @start: start address of range operation (don't care for "all" operation)
> + * @size: data size of range operation (don't care for "all" operation)
> + * @operation: flags to specify the desired cache operation
> + */
> +static void __uniphier_cache_maint_common(struct uniphier_cache_data *data,
> +					  unsigned long start,
> +					  unsigned long size,
> +					  u32 operation)
> +{
> +	unsigned long flags;
> +
> +	/*
> +	 * The IRQ must be disable during this sequence because the accessor
> +	 * holds the access right of the operation queue registers.  The IRQ
> +	 * should be restored after releasing the register access right.
> +	 */
> +	local_irq_save(flags);
> +
> +	/* clear the complete notification flag */
> +	writel_relaxed(UNIPHIER_SSCOLPQS_EF, data->op_base + UNIPHIER_SSCOLPQS);
> +
> +	/*
> +	 * We do not need a spin lock here because the hardware guarantees
> +	 * this sequence is atomic, i.e. the write access is arbitrated
> +	 * and only the winner's write accesses take effect.
> +	 * After register settings, we need to check the UNIPHIER_SSCOPPQSEF to
> +	 * see if we won the arbitration or not.
> +	 * If the command was not successfully set, just try again.
> +	 */
> +	do {
> +		/* set cache operation */
> +		writel_relaxed(UNIPHIER_SSCOQM_CE | operation,
> +			       data->op_base + UNIPHIER_SSCOQM);
> +
> +		/* set address range if needed */
> +		if (likely(UNIPHIER_SSCOQM_S_IS_RANGE(operation))) {
> +			writel_relaxed(start, data->op_base + UNIPHIER_SSCOQAD);
> +			writel_relaxed(size, data->op_base + UNIPHIER_SSCOQSZ);
> +		}
> +
> +		/* set target ways if needed */
> +		if (unlikely(UNIPHIER_SSCOQM_TID_IS_WAY(operation)))
> +			writel_relaxed(data->way_locked_mask,
> +				       data->op_base + UNIPHIER_SSCOQWN);
> +	} while (unlikely(readl_relaxed(data->op_base + UNIPHIER_SSCOPPQSEF) &
> +			  (UNIPHIER_SSCOPPQSEF_FE | UNIPHIER_SSCOPPQSEF_OE)));
> +
> +	/* wait until the operation is completed */
> +	while (likely(readl_relaxed(data->op_base + UNIPHIER_SSCOLPQS) !=
> +		      UNIPHIER_SSCOLPQS_EF))
> +		cpu_relax();
> +
> +	local_irq_restore(flags);

I'm concerned about this.  We've had caches like this (ARM L220) which
require only one operation to be performed at a time.  In a SMP system,
that requires a spinlock to prevent one CPU triggering a L2 maintanence
operation while another CPU tries to operate on the L2 cache.

>From the overall series diffstat, I see that you are adding SMP support
too.  So I have to ask the obvious question: if you need to disable
local IRQs around the L2 cache operations, what happens if two CPUs
both try to perform a L2 cache operation concurrently?

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
