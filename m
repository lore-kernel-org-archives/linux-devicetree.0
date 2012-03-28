From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v7 2/4] MIPS: Octeon: Setup irq_domains for interrupts.
Date: Wed, 28 Mar 2012 16:31:55 -0600
Message-ID: <20120328223155.AD0A63E0DAA@localhost>
References: <1332790281-9648-1-git-send-email-ddaney.cavm@gmail.com> <1332790281-9648-3-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1332790281-9648-3-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On Mon, 26 Mar 2012 12:31:19 -0700, David Daney <ddaney.cavm@gmail.com> wrote:
> From: David Daney <david.daney@cavium.com>
> 
> Create two domains.  One for the GPIO lines, and the other for on-chip
> sources.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>
> ---
[...]
> +struct octeon_irq_gpio_domain_data {
> +	unsigned int base_hwirq;
> +};

Hmmm...

> +static int octeon_irq_gpio_xlat(struct irq_domain *d,
> +				struct device_node *node,
> +				const u32 *intspec,
> +				unsigned int intsize,
> +				unsigned long *out_hwirq,
> +				unsigned int *out_type)
> +{
[...]
> +	*out_hwirq = gpiod->base_hwirq + pin;

...base_hwirq is only used here...

[...]
> +		gpiod = kzalloc(sizeof (*gpiod), GFP_KERNEL);
> +		if (gpiod) {
> +			/* gpio domain host_data is the base hwirq number. */
> +			gpiod->base_hwirq = 16;
> +			irq_domain_add_linear(gpio_node, 16, &octeon_irq_domain_gpio_ops, gpiod);

... and it is unconditionally set to 16.  It looks to me like
base_hwirq and the associated kzalloc() is unnecessary.

g.
