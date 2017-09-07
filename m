From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v4 2/6] irqdomain: clear trigger type in
 irq_domain_push_irq()
Date: Thu, 7 Sep 2017 13:25:03 +0100
Message-ID: <a3e38f20-007b-1065-7999-95e2264f2155@arm.com>
References: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
 <1504784522-26841-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1504784522-26841-3-git-send-email-yamada.masahiro@socionext.com>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Masami Hiramatsu <mhiramat@kernel.org>, David Daney <david.daney@cavium.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/09/17 12:41, Masahiro Yamada wrote:
> Prior to the addition of irq_domain_push_irq(), the hierarchy
> IRQ domain always allocates IRQs from the outer-most domain.
> Each irqchip usually calls irq_domain_alloc_irqs_parent(),
> ascending the topology up to the root irqchip.
> 
> The brand-new function irq_domain_push_irq() allows us to allocate
> IRQs for parent domain first, then add a child irq_data to the
> tail of the chain.
> 
> For the new use-case, if the parent sets a temporary trigger type,
> it may differ from the type requested to the outer-most irqchip,
> then irq_create_fwspec_mapping() warns "type mismatch, failed to map..."
> 
> Clear the trigger type when a new irq_data is connected to the chain.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v4:
>   - Newly added
> 
> 
>  kernel/irq/irqdomain.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index da3e0b6..18d11b9 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -1532,6 +1532,9 @@ int irq_domain_push_irq(struct irq_domain *domain, int virq, void *arg)
>  	tail_irq_data->chip = NULL;
>  	tail_irq_data->chip_data = NULL;
>  
> +	/* clear the trigger type to avoid "type mismatch" error */
> +	irqd_set_trigger_type(tail_irq_data, IRQ_TYPE_NONE);
> +

This feels wrong. The initial interrupt hierarchy does have a set
trigger, because it has been configured already, and switching it to
NONE is hiding the fact that you're setting it to another, conflicting
value.

Your new fwspec should have a type that is really compatible with with
the underlying interrupt, however "temporary". If it is not, you have a
problem.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
