From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] of: irq: Pass trigger type in IRQ resource flags
Date: Fri, 04 Oct 2013 18:42:19 +0100
Message-ID: <20131004174219.4EAA3C427FD@trevor.secretlab.ca>
References: <1380390771-4620-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1380390771-4620-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sat, 28 Sep 2013 19:52:51 +0200, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Some drivers might rely on availability of trigger flags in IRQ
> resource, for example to configure the hardware for particular interrupt
> type. However current code creating IRQ resources from data in device
> tree does not configure trigger flags in resulting resources.
> 
> This patch tries to solve the problem, based on the fact that
> irq_of_parse_and_map() configures the trigger based on DT interrupt
> specifier and IRQD_TRIGGER_* flags are consistent with IORESOURCE_IRQ_*,
> and we can get correct trigger flags by calling irqd_get_trigger_type()
> after mapping the interrupt.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

Applied, thanks.

g.

> ---
>  drivers/of/irq.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 1752988..12742d0 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -356,6 +356,16 @@ int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
>  		r->start = r->end = irq;
>  		r->flags = IORESOURCE_IRQ;
>  		r->name = name ? name : dev->full_name;
> +
> +		/*
> +		 * Some drivers might rely on availability of trigger flags
> +		 * in IRQ resource. Since irq_of_parse_and_map() configures the
> +		 * trigger based on interrupt specifier and IRQD_TRIGGER_*
> +		 * flags are consistent with IORESOURCE_IRQ_*, we can get
> +		 * trigger type that was just set and pass it through resource
> +		 * flags as well.
> +		 */
> +		r->flags |= irqd_get_trigger_type(irq_get_irq_data(irq));
>  	}
>  
>  	return irq;
> -- 
> 1.8.3.2
> 
