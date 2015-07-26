From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v2 4/4] irqchip: Add bcm2836 interrupt controller for
 Raspberry Pi 2.
Date: Sun, 26 Jul 2015 11:52:52 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1507261150500.18576@nanos>
References: <1436837718-956-1-git-send-email-eric@anholt.net> <1436837718-956-5-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436837718-956-5-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrea Merello <andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 13 Jul 2015, Eric Anholt wrote:
> +static void
> +bcm2836_arm_irqchip_smp_init(void)
> +{
> +#ifdef CONFIG_SMP
> +	int i;
> +
> +	/* unmask IPIs */
> +	for_each_possible_cpu(i) {
> +		bcm2836_arm_irqchip_unmask_per_cpu_irq(
> +			LOCAL_MAILBOX_INT_CONTROL0, 0, i);

Do you really want to enable these interrupts on all possible cpus? Why so?

Shouldn't that be done at the point where a hotplugged CPU is starting ?

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
