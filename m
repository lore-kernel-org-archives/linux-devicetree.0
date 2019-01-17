From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] irqchip/irq-csky-mpintc: Add triger type and priority
 setting
Date: Thu, 17 Jan 2019 17:17:45 +0000
Message-ID: <9c531bec-263c-070d-fed8-d953b42aa185@arm.com>
References: <1547570199-25944-1-git-send-email-guoren@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547570199-25944-1-git-send-email-guoren@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: guoren@kernel.org, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <ren_guo@c-sky.com>
List-Id: devicetree@vger.kernel.org

Hi Guo,

On 15/01/2019 16:36, guoren@kernel.org wrote:
> From: Guo Ren <ren_guo@c-sky.com>
> 
> Support 4 triger types:
>  - IRQ_TYPE_LEVEL_HIGH
>  - IRQ_TYPE_LEVEL_LOW
>  - IRQ_TYPE_EDGE_RISING
>  - IRQ_TYPE_EDGE_FALLING
> 
> Support 0-255 priority setting for each irq.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>  .../bindings/interrupt-controller/csky,mpintc.txt  | 24 ++++++-
>  drivers/irqchip/irq-csky-mpintc.c                  | 78 +++++++++++++++++++++-
>  2 files changed, 99 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
> index ab921f1..364b789 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
> @@ -11,6 +11,14 @@ Interrupt number definition:
>   16-31  : private  irq, and we use 16 as the co-processor timer.
>   31-1024: common irq for soc ip.
>  
> +Interrupt triger mode:
> +  IRQ_TYPE_LEVEL_HIGH (default)
> +  IRQ_TYPE_LEVEL_LOW
> +  IRQ_TYPE_EDGE_RISING
> +  IRQ_TYPE_EDGE_FALLING
> +
> +Interrupt priority range: 0-255
> +
>  =============================
>  intc node bindings definition
>  =============================
> @@ -26,7 +34,7 @@ intc node bindings definition
>  	- #interrupt-cells
>  		Usage: required
>  		Value type: <u32>
> -		Definition: must be <1>
> +		Definition: could be <1> or <2>
>  	- interrupt-controller:
>  		Usage: required
>  
> @@ -35,6 +43,18 @@ Examples:
>  
>  	intc: interrupt-controller {
>  		compatible = "csky,mpintc";
> -		#interrupt-cells = <1>;
> +		#interrupt-cells = <2>;
>  		interrupt-controller;
>  	};
> +
> +	0: device-example {
> +		...
> +		interrupts = <33 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-parent = <&intc>;
> +	};
> +
> +	1: device-example {
> +		...
> +		interrupts = <34 ((priority << 4) | IRQ_TYPE_EDGE_RISING)>;
> +		interrupt-parent = <&intc>;
> +	};
> diff --git a/drivers/irqchip/irq-csky-mpintc.c b/drivers/irqchip/irq-csky-mpintc.c
> index c67c961..9edc6d3 100644
> --- a/drivers/irqchip/irq-csky-mpintc.c
> +++ b/drivers/irqchip/irq-csky-mpintc.c
> @@ -29,9 +29,12 @@ static void __iomem *INTCL_base;
>  
>  #define INTCG_ICTLR	0x0
>  #define INTCG_CICFGR	0x100
> +#define INTCG_CIPRTR	0x200
>  #define INTCG_CIDSTR	0x1000
>  
>  #define INTCL_PICTLR	0x0
> +#define INTCL_CFGR	0x14
> +#define INTCL_PRTR	0x20
>  #define INTCL_SIGR	0x60
>  #define INTCL_HPPIR	0x68
>  #define INTCL_RDYIR	0x6c
> @@ -73,6 +76,78 @@ static void csky_mpintc_eoi(struct irq_data *d)
>  	writel_relaxed(d->hwirq, reg_base + INTCL_CACR);
>  }
>  
> +static int csky_mpintc_set_type(struct irq_data *d, unsigned int type)
> +{
> +	unsigned int priority, triger;

nit: s/triger/trigger/ everywhere.

> +	unsigned int offset, bit_offset;
> +	void __iomem *reg_base;
> +
> +	/*
> +	 * type Bit field: | 32 - 12  |  11 - 4  |   3 - 0    |
> +	 *                   reserved   priority   triger type
> +	 */
> +	triger	 = type & IRQ_TYPE_SENSE_MASK;
> +	priority = (type >> 4) & 0xff;

Definitely not. The Linux API to set the trigger does not carry any
priority information, nor should it. Priorities should be set
statically, and no driver should ever be able to change it.

> +
> +	switch (triger) {
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		triger = 0;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		triger = 1;
> +		break;
> +	case IRQ_TYPE_EDGE_RISING:
> +		triger = 2;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		triger = 3;

Can you define some macros that represent these magic values?

> +		break;
> +	default:
> +		triger = 0;
> +		break;

If you get an invalid combination, you shouldn't blindly accept it, but
instead return an error.

> +	}
> +
> +	if (d->hwirq < COMM_IRQ_BASE) {
> +		reg_base = this_cpu_read(intcl_reg);

Are you guaranteed to be in a non-preemptible section here? I can see
things going wrong if not.

> +
> +		if (triger) {
> +			offset = ((d->hwirq * 2) / 32) * 4;
> +			bit_offset = (d->hwirq * 2) % 32;

This needs to be turned into a set of macros so that the non-percpu code
can reuse it.

> +
> +			writel_relaxed(triger << bit_offset,
> +				reg_base + INTCL_CFGR + offset);
> +		}
> +
> +		if (priority) {
> +			offset = ((d->hwirq * 8) / 32) * 4;
> +			bit_offset = (d->hwirq * 8) % 32;
> +
> +			writel_relaxed(priority << bit_offset,
> +				reg_base + INTCL_PRTR + offset);
> +		}

And this should only be set at boot time.

> +	} else {
> +		reg_base = INTCG_base;
> +
> +		if (triger) {
> +			offset = (((d->hwirq - COMM_IRQ_BASE) * 2) / 32) * 4;
> +			bit_offset = ((d->hwirq - COMM_IRQ_BASE) * 2) % 32;
> +
> +			writel_relaxed(triger << bit_offset,
> +				reg_base + INTCG_CICFGR + offset);
> +		}
> +
> +		if (priority) {
> +			offset = (((d->hwirq - COMM_IRQ_BASE) * 8) / 32) * 4;
> +			bit_offset = ((d->hwirq - COMM_IRQ_BASE) * 8) % 32;
> +
> +			writel_relaxed(priority << bit_offset,
> +				reg_base + INTCG_CIPRTR + offset);
> +		}
> +	}

Same as above.

> +
> +	return 0;
> +}
> +
>  #ifdef CONFIG_SMP
>  static int csky_irq_set_affinity(struct irq_data *d,
>  				 const struct cpumask *mask_val,
> @@ -105,6 +180,7 @@ static struct irq_chip csky_irq_chip = {
>  	.irq_eoi	= csky_mpintc_eoi,
>  	.irq_enable	= csky_mpintc_enable,
>  	.irq_disable	= csky_mpintc_disable,
> +	.irq_set_type	= csky_mpintc_set_type,
>  #ifdef CONFIG_SMP
>  	.irq_set_affinity = csky_irq_set_affinity,
>  #endif
> @@ -127,7 +203,7 @@ static int csky_irqdomain_map(struct irq_domain *d, unsigned int irq,
>  
>  static const struct irq_domain_ops csky_irqdomain_ops = {
>  	.map	= csky_irqdomain_map,
> -	.xlate	= irq_domain_xlate_onecell,
> +	.xlate	= irq_domain_xlate_onetwocell,
>  };
>  
>  #ifdef CONFIG_SMP
> 

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
