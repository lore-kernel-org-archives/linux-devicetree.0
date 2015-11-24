From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 3/5] pinctrl: meson: enable GPIO IRQs
Date: Tue, 24 Nov 2015 08:28:01 +0000
Message-ID: <20151124082801.09139a93@arm.com>
References: <1448273816-11290-1-git-send-email-carlo@caione.org>
	<1448273816-11290-4-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448273816-11290-4-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 23 Nov 2015 11:16:54 +0100
Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> wrote:

> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> 
> On Meson8 and Meson8b SoCs there are 8 independent filtered GPIO
> interrupt modules that can be programmed to use any of the GPIOs in the
> chip as an interrupt source.
> 
> For each GPIO IRQ we have:
> 
> GPIOs --> [mux]--> [polarity]--> [filter]--> [edge select]--> GIC
> 
> The eight GPIO interrupts respond to mask/unmask/clear/etc.. just like
> any other interrupt in the chip. The difference for the GPIO interrupts
> is that they can be filtered and conditioned.
> 
> This patch adds support for the external GPIOs interrupts and enables
> them for Meson8 and Meson8b SoCs.
> 
> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> ---

[...]

> +	for (i = 0; i < pc->num_gic_irqs; i++) {
> +		struct of_phandle_args oirq;
> +
> +		of_irq_parse_one(node, i, &oirq);
> +		irq_of_phandle_args_to_fwspec(&oirq, &pc->gic_irqs[i]);
> +
> +		pc->irq_map[i] = IRQ_FREE;
> +	}

The whole thing feels weird. Why do you need to keep a set of fwspecs?
All you need is a range of interrupts that would be conveniently
represented by a bitmap (assuming your interrupts space is a mostly
contiguous range).

Overall, this patch is quite hard to review. Can you please split the
GPIO management from the irqchip side?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
