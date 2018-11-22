From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH v3 05/17] irqchip/sun4i: add support for
 suniv interrupt controller
Date: Thu, 22 Nov 2018 09:35:47 +0100
Message-ID: <20181122083547.srnopylueqx6p2qj@flea>
References: <cover.1542824904.git.mesihkilinc@gmail.com>
 <08b40429e46626f4caf8e4d2287b5c4d354e3b7f.1542824904.git.mesihkilinc@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ecrjc4ssrumvdhdn"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB3WU3HPQKGQE2LGZCMQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <08b40429e46626f4caf8e4d2287b5c4d354e3b7f.1542824904.git.mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ecrjc4ssrumvdhdn
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi Mesih,

On Wed, Nov 21, 2018 at 09:30:38PM +0300, Mesih Kilinc wrote:
> The new F-series SoCs (suniv) from Allwinner use an stripped version of
> the interrupt controller in A10/A13
> 
> Add support for it in irq-sun4i driver.
> 
> Signed-off-by: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/irqchip/irq-sun4i.c | 104 +++++++++++++++++++++++++++++++-------------
>  1 file changed, 74 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-sun4i.c b/drivers/irqchip/irq-sun4i.c
> index e3e5b91..7ca4a4d 100644
> --- a/drivers/irqchip/irq-sun4i.c
> +++ b/drivers/irqchip/irq-sun4i.c
> @@ -28,11 +28,21 @@
>  #define SUN4I_IRQ_NMI_CTRL_REG		0x0c
>  #define SUN4I_IRQ_PENDING_REG(x)	(0x10 + 0x4 * x)
>  #define SUN4I_IRQ_FIQ_PENDING_REG(x)	(0x20 + 0x4 * x)
> -#define SUN4I_IRQ_ENABLE_REG(x)		(0x40 + 0x4 * x)
> -#define SUN4I_IRQ_MASK_REG(x)		(0x50 + 0x4 * x)
> +#define SUN4I_IRQ_ENABLE_REG(x)		(irq_ic_data->enable_req_offset + 0x4 * x)
> +#define SUN4I_IRQ_MASK_REG(x)		(irq_ic_data->mask_req_offset + 0x4 * x)

You shouldn't have all the values you use passed as argument, so
irq_ic_data should be one of them here.

> +#define SUN4I_IRQ_ENABLE_REG_OFFSET	0x40
> +#define SUN4I_IRQ_MASK_REG_OFFSET	0x50
> +#define SUNIV_IRQ_ENABLE_REG_OFFSET	0x20
> +#define SUNIV_IRQ_MASK_REG_OFFSET	0x30
> +
> +struct sunxi_irq_chip_data{
                             ^ a space here

> +	void __iomem *irq_base;
> +	struct irq_domain *irq_domain;
> +	u32 enable_req_offset;
> +	u32 mask_req_offset;

s/req/reg/ ?

> +};
>
> -static void __iomem *sun4i_irq_base;
> -static struct irq_domain *sun4i_irq_domain;
> +static struct sunxi_irq_chip_data *irq_ic_data;

This is a very welcome change, but you should do it in two patches:
one to convert the existing code to that structure (with only the
domain and base), and then a second patch to add the register offsets.

(also the structure should be prefixed with sun4i, for consistency
with the rest of the driver).

>  
>  static void __exception_irq_entry sun4i_handle_irq(struct pt_regs *regs);
>  
> @@ -43,7 +53,7 @@ static void sun4i_irq_ack(struct irq_data *irqd)
>  	if (irq != 0)
>  		return; /* Only IRQ 0 / the ENMI needs to be acked */
>  
> -	writel(BIT(0), sun4i_irq_base + SUN4I_IRQ_PENDING_REG(0));
> +	writel(BIT(0), irq_ic_data->irq_base + SUN4I_IRQ_PENDING_REG(0));
>  }
>  
>  static void sun4i_irq_mask(struct irq_data *irqd)
> @@ -53,9 +63,9 @@ static void sun4i_irq_mask(struct irq_data *irqd)
>  	int reg = irq / 32;
>  	u32 val;
>  
> -	val = readl(sun4i_irq_base + SUN4I_IRQ_ENABLE_REG(reg));
> +	val = readl(irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(reg));
>  	writel(val & ~(1 << irq_off),
> -	       sun4i_irq_base + SUN4I_IRQ_ENABLE_REG(reg));
> +	       irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(reg));
>  }
>  
>  static void sun4i_irq_unmask(struct irq_data *irqd)
> @@ -65,9 +75,9 @@ static void sun4i_irq_unmask(struct irq_data *irqd)
>  	int reg = irq / 32;
>  	u32 val;
>  
> -	val = readl(sun4i_irq_base + SUN4I_IRQ_ENABLE_REG(reg));
> +	val = readl(irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(reg));
>  	writel(val | (1 << irq_off),
> -	       sun4i_irq_base + SUN4I_IRQ_ENABLE_REG(reg));
> +	       irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(reg));
>  }
>  
>  static struct irq_chip sun4i_irq_chip = {
> @@ -95,42 +105,76 @@ static const struct irq_domain_ops sun4i_irq_ops = {
>  static int __init sun4i_of_init(struct device_node *node,
>  				struct device_node *parent)
>  {
> -	sun4i_irq_base = of_iomap(node, 0);
> -	if (!sun4i_irq_base)
> +	irq_ic_data->irq_base = of_iomap(node, 0);
> +	if (!irq_ic_data->irq_base)
>  		panic("%pOF: unable to map IC registers\n",
>  			node);
>  
>  	/* Disable all interrupts */
> -	writel(0, sun4i_irq_base + SUN4I_IRQ_ENABLE_REG(0));
> -	writel(0, sun4i_irq_base + SUN4I_IRQ_ENABLE_REG(1));
> -	writel(0, sun4i_irq_base + SUN4I_IRQ_ENABLE_REG(2));
> +	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(0));
> +	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(1));
> +	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(2));
>  
>  	/* Unmask all the interrupts, ENABLE_REG(x) is used for masking */
> -	writel(0, sun4i_irq_base + SUN4I_IRQ_MASK_REG(0));
> -	writel(0, sun4i_irq_base + SUN4I_IRQ_MASK_REG(1));
> -	writel(0, sun4i_irq_base + SUN4I_IRQ_MASK_REG(2));
> +	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_MASK_REG(0));
> +	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_MASK_REG(1));
> +	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_MASK_REG(2));
>  
>  	/* Clear all the pending interrupts */
> -	writel(0xffffffff, sun4i_irq_base + SUN4I_IRQ_PENDING_REG(0));
> -	writel(0xffffffff, sun4i_irq_base + SUN4I_IRQ_PENDING_REG(1));
> -	writel(0xffffffff, sun4i_irq_base + SUN4I_IRQ_PENDING_REG(2));
> +	writel(0xffffffff, irq_ic_data->irq_base + SUN4I_IRQ_PENDING_REG(0));
> +	writel(0xffffffff, irq_ic_data->irq_base + SUN4I_IRQ_PENDING_REG(1));
> +	writel(0xffffffff, irq_ic_data->irq_base + SUN4I_IRQ_PENDING_REG(2));
>  
> -	/* Enable protection mode */
> -	writel(0x01, sun4i_irq_base + SUN4I_IRQ_PROTECTION_REG);
> +	/* Enable protection mode (not available in suniv) */
> +	if (of_device_is_compatible(node, "allwinner,sun4i-a10-ic"))
> +		writel(0x01, irq_ic_data->irq_base + SUN4I_IRQ_PROTECTION_REG);
>  
>  	/* Configure the external interrupt source type */
> -	writel(0x00, sun4i_irq_base + SUN4I_IRQ_NMI_CTRL_REG);
> +	writel(0x00, irq_ic_data->irq_base + SUN4I_IRQ_NMI_CTRL_REG);
>  
> -	sun4i_irq_domain = irq_domain_add_linear(node, 3 * 32,
> +	irq_ic_data->irq_domain = irq_domain_add_linear(node, 3 * 32,
>  						 &sun4i_irq_ops, NULL);
> -	if (!sun4i_irq_domain)
> +	if (!irq_ic_data->irq_domain)
>  		panic("%pOF: unable to create IRQ domain\n", node);
>  
>  	set_handle_irq(sun4i_handle_irq);
>  
>  	return 0;
>  }
> -IRQCHIP_DECLARE(allwinner_sun4i_ic, "allwinner,sun4i-a10-ic", sun4i_of_init);
> +
> +static int __init sun4i_ic_of_init(struct device_node *node,
> +				   struct device_node *parent)
> +{
> +	irq_ic_data = kzalloc(sizeof(struct sunxi_irq_chip_data), GFP_KERNEL);
> +	if (!irq_ic_data) {
> +		pr_err("kzalloc failed!\n");
> +		return -ENOMEM;
> +	}
> +
> +	irq_ic_data->enable_req_offset = SUN4I_IRQ_ENABLE_REG_OFFSET;
> +	irq_ic_data->mask_req_offset = SUN4I_IRQ_MASK_REG_OFFSET;
> +
> +	return sun4i_of_init(node, parent);
> +}
> +
> +IRQCHIP_DECLARE(allwinner_sun4i_ic, "allwinner,sun4i-a10-ic", sun4i_ic_of_init);
> +
> +static int __init suniv_ic_of_init(struct device_node *node,
> +				   struct device_node *parent)
> +{
> +	irq_ic_data = kzalloc(sizeof(struct sunxi_irq_chip_data), GFP_KERNEL);
> +	if (!irq_ic_data) {
> +		pr_err("kzalloc failed!\n");
> +		return -ENOMEM;
> +	}
> +
> +	irq_ic_data->enable_req_offset = SUNIV_IRQ_ENABLE_REG_OFFSET;
> +	irq_ic_data->mask_req_offset = SUNIV_IRQ_MASK_REG_OFFSET;
> +
> +	return sun4i_of_init(node, parent);
> +}
> +
> +IRQCHIP_DECLARE(allwinner_sunvi_ic, "allwinner,suniv-f1c100s-ic", suniv_ic_of_init);

You can even split that addition to a new patch as well.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--ecrjc4ssrumvdhdn--
