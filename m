From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v6 2/9] irqchip/sunxi-nmi: add support for the NMI in A64
 R_INTC
Date: Mon, 22 May 2017 10:39:22 +0100
Message-ID: <ed99d87b-86eb-cf8a-8614-51d59fa00c8c@arm.com>
References: <20170518071653.36561-1-icenowy@aosc.io>
 <20170518071653.36561-3-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170518071653.36561-3-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 18/05/17 08:16, Icenowy Zheng wrote:
> Add support for the newly imported compatible for the A64 R_INTC in
> irq-sunxi-nmi driver.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> Changes in v5:
> - Fix A64 R_INTC compatible.
> 
>  drivers/irqchip/irq-sunxi-nmi.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
> index 668730c5cb66..5559c1d593bf 100644
> --- a/drivers/irqchip/irq-sunxi-nmi.c
> +++ b/drivers/irqchip/irq-sunxi-nmi.c
> @@ -56,6 +56,12 @@ static struct sunxi_sc_nmi_reg_offs sun9i_reg_offs = {
>  	.enable	= 0x04,
>  };
>  
> +static struct sunxi_sc_nmi_reg_offs sun50i_reg_offs = {
> +	.ctrl	= 0x0c,
> +	.pend	= 0x10,
> +	.enable	= 0x40,
> +};
> +

Magic values? Even if no #define is provided, a pointer to the
corresponding documentation would be appreciated (assuming documentation
exists).

>  static inline void sunxi_sc_nmi_write(struct irq_chip_generic *gc, u32 off,
>  				      u32 val)
>  {
> @@ -220,3 +226,10 @@ static int __init sun9i_nmi_irq_init(struct device_node *node,
>  	return sunxi_sc_nmi_irq_init(node, &sun9i_reg_offs);
>  }
>  IRQCHIP_DECLARE(sun9i_nmi, "allwinner,sun9i-a80-nmi", sun9i_nmi_irq_init);
> +
> +static int __init sun50i_nmi_irq_init(struct device_node *node,
> +				     struct device_node *parent)
> +{
> +	return sunxi_sc_nmi_irq_init(node, &sun50i_reg_offs);
> +}
> +IRQCHIP_DECLARE(sun50i_nmi, "allwinner,sun50i-a64-r-intc", sun50i_nmi_irq_init);
> 

Apart from the above:

Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>

Let me know how you want this to be merged.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
