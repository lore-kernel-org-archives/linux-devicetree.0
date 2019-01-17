From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v5 04/14] spmi: pmic-arb: convert to v2 irq interfaces to
 support hierarchical IRQ chips
Date: Thu, 17 Jan 2019 11:22:59 +0000
Message-ID: <d2e3c91c-2a54-e130-7512-e4a65bf2794d@arm.com>
References: <20190117003234.22127-1-masneyb@onstation.org>
 <20190117003234.22127-5-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117003234.22127-5-masneyb@onstation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org
Cc: shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Brian,

On 17/01/2019 00:32, Brian Masney wrote:
> Convert the spmi-pmic-arb IRQ code to use the version 2 IRQ interface
> in order to support hierarchical IRQ chips. This is necessary so that
> spmi-gpio can be setup as a hierarchical IRQ chip with pmic-arb as the
> parent. IRQ chips in device tree should be usable from the start without
> the consumer having to make an additional call to gpio[d]_to_irq() to
> get the proper IRQ on the parent. Driver was tested on a LG Nexus 5
> (hammerhead) phone.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v4:
> - None
> 
> Changes since v3:
> - None
> 
> Changes since v2:
> - Don't move pmic_gpio_of_match block. Use device_get_match_data instead
>   of of_match_device.
> - Correct build warning on arm64: warning: cast from pointer to integer
>   of different size
> 
>  drivers/spmi/spmi-pmic-arb.c | 58 +++++++++++++++++++++++-------------
>  1 file changed, 38 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 360b8218f322..356bc3f66e22 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -666,7 +666,8 @@ static int qpnpint_get_irqchip_state(struct irq_data *d,
>  	return 0;
>  }
>  
> -static int qpnpint_irq_request_resources(struct irq_data *d)
> +static int qpnpint_irq_domain_activate(struct irq_domain *domain,
> +				       struct irq_data *d, bool reserve)
>  {
>  	struct spmi_pmic_arb *pmic_arb = irq_data_get_irq_chip_data(d);
>  	u16 periph = hwirq_to_per(d->hwirq);
> @@ -692,27 +693,25 @@ static struct irq_chip pmic_arb_irqchip = {
>  	.irq_set_type	= qpnpint_irq_set_type,
>  	.irq_set_wake	= qpnpint_irq_set_wake,
>  	.irq_get_irqchip_state	= qpnpint_get_irqchip_state,
> -	.irq_request_resources = qpnpint_irq_request_resources,
>  	.flags		= IRQCHIP_MASK_ON_SUSPEND,
>  };
>  
> -static int qpnpint_irq_domain_dt_translate(struct irq_domain *d,
> -					   struct device_node *controller,
> -					   const u32 *intspec,
> -					   unsigned int intsize,
> -					   unsigned long *out_hwirq,
> -					   unsigned int *out_type)
> +static int qpnpint_irq_domain_translate(struct irq_domain *d,
> +					struct irq_fwspec *fwspec,
> +					unsigned long *out_hwirq,
> +					unsigned int *out_type)
>  {
>  	struct spmi_pmic_arb *pmic_arb = d->host_data;
> +	u32 *intspec = fwspec->param;
>  	u16 apid, ppid;
>  	int rc;
>  
>  	dev_dbg(&pmic_arb->spmic->dev, "intspec[0] 0x%1x intspec[1] 0x%02x intspec[2] 0x%02x\n",
>  		intspec[0], intspec[1], intspec[2]);
>  
> -	if (irq_domain_get_of_node(d) != controller)
> +	if (irq_domain_get_of_node(d) != pmic_arb->spmic->dev.of_node)
>  		return -EINVAL;
> -	if (intsize != 4)
> +	if (fwspec->param_count != 4)
>  		return -EINVAL;
>  	if (intspec[0] > 0xF || intspec[1] > 0xFF || intspec[2] > 0x7)
>  		return -EINVAL;
> @@ -740,17 +739,34 @@ static int qpnpint_irq_domain_dt_translate(struct irq_domain *d,
>  	return 0;
>  }
>  
> -static int qpnpint_irq_domain_map(struct irq_domain *d,
> -				  unsigned int virq,
> -				  irq_hw_number_t hwirq)
> -{
> -	struct spmi_pmic_arb *pmic_arb = d->host_data;
>  
> +static void qpnpint_irq_domain_map(struct spmi_pmic_arb *pmic_arb,
> +				   struct irq_domain *domain, unsigned int virq,
> +				   irq_hw_number_t hwirq)
> +{
>  	dev_dbg(&pmic_arb->spmic->dev, "virq = %u, hwirq = %lu\n", virq, hwirq);
>  
> -	irq_set_chip_and_handler(virq, &pmic_arb_irqchip, handle_level_irq);
> -	irq_set_chip_data(virq, d->host_data);
> -	irq_set_noprobe(virq);
> +	irq_domain_set_info(domain, virq, hwirq, &pmic_arb_irqchip, pmic_arb,
> +			    handle_level_irq, NULL, NULL);

I understand you haven't changed the existing semantic here by always
setting the handler to handle_level_irq. But is that guaranteed to
always be the case? See below.

> +}
> +
> +static int qpnpint_irq_domain_alloc(struct irq_domain *domain,
> +				    unsigned int virq, unsigned int nr_irqs,
> +				    void *data)
> +{
> +	struct spmi_pmic_arb *pmic_arb = domain->host_data;
> +	struct irq_fwspec *fwspec = data;
> +	irq_hw_number_t hwirq;
> +	unsigned int type;
> +	int ret, i;
> +
> +	ret = qpnpint_irq_domain_translate(domain, fwspec, &hwirq, &type);

Here, you extract the trigger from DT.

> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < nr_irqs; i++)
> +		qpnpint_irq_domain_map(pmic_arb, domain, virq + i, hwirq + i);

Shouldn't you propagate it into the mapping function so that the handler
can be selected accordingly? Or does the interrupt controller convert
edge signals to level somehow?

> +
>  	return 0;
>  }
>  
> @@ -1126,8 +1142,10 @@ static const struct pmic_arb_ver_ops pmic_arb_v5 = {
>  };
>  
>  static const struct irq_domain_ops pmic_arb_irq_domain_ops = {
> -	.map	= qpnpint_irq_domain_map,
> -	.xlate	= qpnpint_irq_domain_dt_translate,
> +	.activate = qpnpint_irq_domain_activate,
> +	.alloc = qpnpint_irq_domain_alloc,
> +	.free = irq_domain_free_irqs_common,
> +	.translate = qpnpint_irq_domain_translate,
>  };
>  
>  static int spmi_pmic_arb_probe(struct platform_device *pdev)
> 

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
