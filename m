From: Jon Loeliger <jdl@jdl.com>
Subject: Re: [PATCH 04/11] x86/dtb: add irq host abstraction
Date: Thu, 25 Nov 2010 13:30:27 -0600
Message-ID: <E1PLhWV-0004y7-44@jdl.com>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de> <1290706801-7323-5-git-send-email-bigeasy@linutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1290706801-7323-5-git-send-email-bigeasy@linutronix.de> 
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, sodaville@linutronix.de, x86@kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

> The here introduced irq_host abstraction represents a generic irq_host.
> The xlate callback is resposible to parse irq informations like irq type
> and number and returns the hardware irq number which is reported by the
> hardware as active.

> [...]

> diff --git a/arch/x86/include/asm/irq_controller.h b/arch/x86/include/asm/irq
> _controller.h
> new file mode 100644
> index 0000000..1cbbfd0
> --- /dev/null
> +++ b/arch/x86/include/asm/irq_controller.h
> @@ -0,0 +1,12 @@
> +#ifndef __IRQ_CONTROLLER__
> +#define __IRQ_CONTROLLER__
> +
> +struct irq_host {
> +	int (*xlate)(struct irq_host *h, const u32 *intspec, u32 intsize,
> +			u32 *out_hwirq, u32 *out_type);
> +	void *priv;
> +	struct device_node *controller;
> +	struct list_head l;
> +};

I thought there was an intent and desire to rename the irq_host
as irq_domain.

jdl
