From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH] irqchip: bcm2836: Use a CPU notifier enable IPIs.
Date: Sun, 2 Aug 2015 12:22:24 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1508021221370.3825@nanos>
References: <55B67C81.1010900@gmail.com> <1438027789-1637-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438027789-1637-1-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 27 Jul 2015, Eric Anholt wrote:
> +/* Unmasks the IPI on the CPU wen it's first brought online. */

when

> +static int bcm2836_arm_irqchip_cpu_notify(struct notifier_block *nfb,
> +					  unsigned long action, void *hcpu)
> +{
> +	unsigned int cpu = (unsigned long)hcpu;
> +	unsigned int int_reg = LOCAL_MAILBOX_INT_CONTROL0;
> +	unsigned int mailbox = 0;
> +
> +	if (action == CPU_STARTING || action == CPU_STARTING_FROZEN)
> +		bcm2836_arm_irqchip_unmask_per_cpu_irq(int_reg, mailbox, cpu);

Shouldn't you mask the irq on CPU_DYING?

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
