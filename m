From: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 05/19] irqchip/mmp: do not use of_address_to_resource() to
 get mux regs
Date: Fri, 9 Aug 2019 13:12:49 +0100
Message-ID: <16d77ca3-7ad1-3af2-650e-722cf6a931ed@kernel.org>
References: <20190809093158.7969-1-lkundrak@v3.sk>
 <20190809093158.7969-6-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809093158.7969-6-lkundrak@v3.sk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>, Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
List-Id: devicetree@vger.kernel.org

On 09/08/2019 10:31, Lubomir Rintel wrote:
> The "regs" property of the "mrvl,mmp2-mux-intc" devices are silly. They
> are offsets from intc's base, not addresses on the parent bus. At this
> point it probably can't be fixed.
> 
> On an OLPC XO-1.75 machine, the muxes are children of the intc, not the
> axi bus, and thus of_address_to_resource() won't work. We should treat
> the values as mere integers as opposed to bus addresses.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> ---
>  drivers/irqchip/irq-mmp.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-mmp.c b/drivers/irqchip/irq-mmp.c
> index 14618dc0bd396..af9cba4a51c2e 100644
> --- a/drivers/irqchip/irq-mmp.c
> +++ b/drivers/irqchip/irq-mmp.c
> @@ -424,9 +424,9 @@ IRQCHIP_DECLARE(mmp2_intc, "mrvl,mmp2-intc", mmp2_of_init);
>  static int __init mmp2_mux_of_init(struct device_node *node,
>  				   struct device_node *parent)
>  {
> -	struct resource res;
>  	int i, ret, irq, j = 0;
>  	u32 nr_irqs, mfp_irq;
> +	u32 reg[4];
>  
>  	if (!parent)
>  		return -ENODEV;
> @@ -438,18 +438,20 @@ static int __init mmp2_mux_of_init(struct device_node *node,
>  		pr_err("Not found mrvl,intc-nr-irqs property\n");
>  		return -EINVAL;
>  	}
> -	ret = of_address_to_resource(node, 0, &res);
> +
> +	/*
> +	 * For historical reasonsm, the "regs" property of the
> +	 * mrvl,mmp2-mux-intc is not a regular * "regs" property containing
> +	 * addresses on the parent bus, but offsets from the intc's base.
> +	 * That is why we can't use of_address_to_resource() here.
> +	 */
> +	ret = of_property_read_u32_array(node, "reg", reg, ARRAY_SIZE(reg));

This will return 0 even if you've read less than your expected 4 u32s.
You may want to try of_property_read_variable_u32_array instead.

>  	if (ret < 0) {
>  		pr_err("Not found reg property\n");
>  		return -EINVAL;
>  	}
> -	icu_data[i].reg_status = mmp_icu_base + res.start;
> -	ret = of_address_to_resource(node, 1, &res);
> -	if (ret < 0) {
> -		pr_err("Not found reg property\n");
> -		return -EINVAL;
> -	}
> -	icu_data[i].reg_mask = mmp_icu_base + res.start;
> +	icu_data[i].reg_status = mmp_icu_base + reg[0];
> +	icu_data[i].reg_mask = mmp_icu_base + reg[2];
>  	icu_data[i].cascade_irq = irq_of_parse_and_map(node, 0);
>  	if (!icu_data[i].cascade_irq)
>  		return -EINVAL;
> 

Thanks,

	M.
-- 
Jazz is not dead, it just smells funny...
