From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 2/9] genirq: introduce irq_domain_translate_twocell
Date: Wed, 30 Jan 2019 13:54:39 +0000
Message-ID: <8eb0a45e-4bcf-5042-2c16-369854267d80@arm.com>
References: <20190125162302.14036-1-masneyb@onstation.org>
 <20190125162302.14036-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125162302.14036-3-masneyb@onstation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, lee.jones@linaro.org
Cc: tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Brian,

On 25/01/2019 16:22, Brian Masney wrote:
> Add a new function irq_domain_translate_twocell() that is to be used as
> the translate function in struct irq_domain_ops for v2 IRQ interfaces.
> This is based on irq_domain_xlate_twocell().
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  include/linux/irqdomain.h |  5 +++++
>  kernel/irq/irqdomain.c    | 21 +++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index 35965f41d7be..fcefe0c7263f 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -419,6 +419,11 @@ int irq_domain_xlate_onetwocell(struct irq_domain *d, struct device_node *ctrlr,
>  			const u32 *intspec, unsigned int intsize,
>  			irq_hw_number_t *out_hwirq, unsigned int *out_type);
>  
> +int irq_domain_translate_twocell(struct irq_domain *d,
> +				 struct irq_fwspec *fwspec,
> +				 unsigned long *out_hwirq,
> +				 unsigned int *out_type);
> +
>  /* IPI functions */
>  int irq_reserve_ipi(struct irq_domain *domain, const struct cpumask *dest);
>  int irq_destroy_ipi(unsigned int irq, const struct cpumask *dest);
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index 8b0be4bd6565..15c2a291aa3c 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -968,6 +968,27 @@ const struct irq_domain_ops irq_domain_simple_ops = {
>  };
>  EXPORT_SYMBOL_GPL(irq_domain_simple_ops);
>  
> +/**
> + * irq_domain_translate_twocell() - Generic translate for direct two cell
> + * bindings
> + *
> + * Device Tree IRQ specifier translation function which works with two cell
> + * bindings where the cell values map directly to the hwirq number
> + * and linux irq flags.
> + */
> +int irq_domain_translate_twocell(struct irq_domain *d,
> +				 struct irq_fwspec *fwspec,
> +				 unsigned long *out_hwirq,
> +				 unsigned int *out_type)
> +{
> +	if (WARN_ON(fwspec->param_count < 2))
> +		return -EINVAL;
> +	*out_hwirq = fwspec->param[0];
> +	*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(irq_domain_translate_twocell);
> +
>  int irq_domain_alloc_descs(int virq, unsigned int cnt, irq_hw_number_t hwirq,
>  			   int node, const struct irq_affinity_desc *affinity)
>  {
> 

So why not bite the bullet and rewrite irq_domain_xlate_twocell() in
terms of irq_domain_translate_twocell()? Something like this (untested):

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 3366d11c3e02..76d5bc11eea6 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -729,16 +729,18 @@ static int irq_domain_translate(struct irq_domain *d,
 	return 0;
 }
 
-static void of_phandle_args_to_fwspec(struct of_phandle_args *irq_data,
+static void of_phandle_args_to_fwspec(struct device_node *np,
+				      const u32 *args,
+				      unsigned int count,
 				      struct irq_fwspec *fwspec)
 {
 	int i;
 
-	fwspec->fwnode = irq_data->np ? &irq_data->np->fwnode : NULL;
-	fwspec->param_count = irq_data->args_count;
+	fwspec->fwnode = np ? &np->fwnode : NULL;
+	fwspec->param_count = count;
 
-	for (i = 0; i < irq_data->args_count; i++)
-		fwspec->param[i] = irq_data->args[i];
+	for (i = 0; i < count; i++)
+		fwspec->param[i] = args[i];
 }
 
 unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
@@ -836,7 +838,8 @@ unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data)
 {
 	struct irq_fwspec fwspec;
 
-	of_phandle_args_to_fwspec(irq_data, &fwspec);
+	of_phandle_args_to_fwspec(irq_data->np, irq_data->args,
+				  irq_data->args_count, &fwspec);
 	return irq_create_fwspec_mapping(&fwspec);
 }
 EXPORT_SYMBOL_GPL(irq_create_of_mapping);
@@ -928,11 +931,10 @@ int irq_domain_xlate_twocell(struct irq_domain *d, struct device_node *ctrlr,
 			const u32 *intspec, unsigned int intsize,
 			irq_hw_number_t *out_hwirq, unsigned int *out_type)
 {
-	if (WARN_ON(intsize < 2))
-		return -EINVAL;
-	*out_hwirq = intspec[0];
-	*out_type = intspec[1] & IRQ_TYPE_SENSE_MASK;
-	return 0;
+	struct irq_fwspec fwspec;
+
+	of_phandle_args_to_fwspec(ctrlr, intspec, intsize, &fwspec);
+	return irq_domain_translate_twocell(d, &fwspec, out_irq, out_type);
 }
 EXPORT_SYMBOL_GPL(irq_domain_xlate_twocell);
 
I find this more palatable, as it shows the direction of travel for the API.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
