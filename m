From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 4/4] irqchip: Add bcm2836 interrupt controller for
 Raspberry Pi 2.
Date: Tue, 21 Jul 2015 20:09:27 -0600
Message-ID: <55AEFB57.6030902@wwwdotorg.org>
References: <1436837718-956-1-git-send-email-eric@anholt.net> <1436837718-956-5-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436837718-956-5-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrea Merello <andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/13/2015 07:35 PM, Eric Anholt wrote:
> This interrupt controller is the new root interrupt controller with
> the timer, PMU events, and IPIs, and the bcm2835's interrupt
> controller is chained off of it to handle the peripherals.

> diff --git a/drivers/irqchip/irq-bcm2836.c b/drivers/irqchip/irq-bcm2836.c

> +static void bcm2836_arm_irqchip_mask_pmu_irq(struct irq_data *d)
> +{
> +	pr_err("%d: mask PMU\n", smp_processor_id());
> +	writel(1 << smp_processor_id(), intc.base + LOCAL_PM_ROUTING_CLR);
> +}
> +
> +static void bcm2836_arm_irqchip_unmask_pmu_irq(struct irq_data *d)
> +{
> +	pr_err("%d: unmask PMU\n", smp_processor_id());
> +	writel(1 << smp_processor_id(), intc.base + LOCAL_PM_ROUTING_SET);
> +}

Are those pr_err() calls left-over debug, or is there some reason it's
an error to call those functions?

Aside from this and the other minor comment, the series,
Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
