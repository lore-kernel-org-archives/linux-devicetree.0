From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/9] mfd: pm8xxx: convert to v2 irq interfaces to support
 hierarchical IRQ chips
Date: Wed, 30 Jan 2019 13:27:39 +0000
Message-ID: <20190130132739.GE4701@dell>
References: <20190125162302.14036-1-masneyb@onstation.org>
 <20190125162302.14036-4-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190125162302.14036-4-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com, tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 25 Jan 2019, Brian Masney wrote:

> Convert the PM8XXX IRQ code to use the version 2 IRQ interface in order
> to support hierarchical IRQ chips. This is necessary so that ssbi-gpio
> can be setup as a hierarchical IRQ chip with PM8xxx as the parent. IRQ
> chips in device tree should be usable from the start without the
> having to make an additional call to gpio[d]_to_irq() to get the proper
> IRQ on the parent.
> 
> The IRQ handler was hardcoded as handle_level_irq and this patch
> properly sets the handler to either handle_edge_irq or handle_level_irq
> depending on the IRQ type.
> 
> pm8821_irq_domain_ops and pm8821_irq_domain_map are removed by this
> patch since the irq_chip is now contained in the pm_irq_data struct, and
> that allows us to use a common IRQ mapping function.
> 
> This change was not tested on any actual hardware, however the same
> change was made to spmi-gpio and tested on a LG Nexus 5 (hammerhead)
> phone.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  drivers/mfd/qcom-pm8xxx.c | 86 +++++++++++++++++++++++----------------
>  1 file changed, 50 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
> index e6e8d81c15fd..a976890c4019 100644
> --- a/drivers/mfd/qcom-pm8xxx.c
> +++ b/drivers/mfd/qcom-pm8xxx.c
> @@ -70,20 +70,20 @@
>  #define PM8XXX_NR_IRQS		256
>  #define PM8821_NR_IRQS		112
>  
> +struct pm_irq_data {
> +	int num_irqs;
> +	struct irq_chip *irq_chip;
> +	void (*irq_handler)(struct irq_desc *desc);
> +};
> +
>  struct pm_irq_chip {
>  	struct regmap		*regmap;
>  	spinlock_t		pm_irq_lock;
>  	struct irq_domain	*irqdomain;
> -	unsigned int		num_irqs;
>  	unsigned int		num_blocks;
>  	unsigned int		num_masters;
>  	u8			config[0];
> -};
> -
> -struct pm_irq_data {
> -	int num_irqs;
> -	const struct irq_domain_ops  *irq_domain_ops;
> -	void (*irq_handler)(struct irq_desc *desc);
> +	const struct pm_irq_data *pm_irq_data;
>  };
>  
>  static int pm8xxx_read_block_irq(struct pm_irq_chip *chip, unsigned int bp,
> @@ -303,6 +303,7 @@ static int pm8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
>  {
>  	struct pm_irq_chip *chip = irq_data_get_irq_chip_data(d);
>  	unsigned int pmirq = irqd_to_hwirq(d);
> +	irq_flow_handler_t flow_handler;
>  	int irq_bit;
>  	u8 block, config;
>  
> @@ -316,6 +317,8 @@ static int pm8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
>  			chip->config[pmirq] &= ~PM_IRQF_MASK_RE;
>  		if (flow_type & IRQF_TRIGGER_FALLING)
>  			chip->config[pmirq] &= ~PM_IRQF_MASK_FE;
> +
> +		flow_handler = handle_edge_irq;
>  	} else {
>  		chip->config[pmirq] |= PM_IRQF_LVL_SEL;
>  
> @@ -323,8 +326,12 @@ static int pm8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
>  			chip->config[pmirq] &= ~PM_IRQF_MASK_RE;
>  		else
>  			chip->config[pmirq] &= ~PM_IRQF_MASK_FE;
> +
> +		flow_handler = handle_level_irq;
>  	}
>  
> +	irq_set_handler_locked(d, flow_handler);
> +

Why don't you save yourself 3 lines of code and a variable and just
call irq_set_handler_locked() where you set flow_handler?

Apart from that nit, the code looks good to me.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
