From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 1/5] clk: sunxi: Add support for USB
 clock-register reset bits
Date: Fri, 07 Feb 2014 17:27:32 +0100
Message-ID: <1391790452.5442.0.camel@pizza.hi.pengutronix.de>
References: <1391786513-20780-1-git-send-email-hdegoede@redhat.com>
	 <1391786513-20780-2-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCLMRFWKZAIBBAET2SLQKGQEMV2YAWQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1391786513-20780-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, den 07.02.2014, 16:21 +0100 schrieb Hans de Goede:
> The usb-clk register is special in that it not only contains clk gate bits,
> but also has a few reset bits. This commit adds support for this by allowing
> gates type sunxi clks to also register a reset controller.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

> ---
>  drivers/clk/sunxi/clk-sunxi.c | 71 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index 64bda21..1e15e4c 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -18,6 +18,7 @@
>  #include <linux/clkdev.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/reset-controller.h>
>  
>  #include "clk-factors.h"
>  
> @@ -838,6 +839,59 @@ static void __init sunxi_divider_clk_setup(struct device_node *node,
>  
> 
>  /**
> + * sunxi_gates_reset... - reset bits in leaf gate clk registers handling
> + */
> +
> +struct gates_reset_data {
> +	void __iomem			*reg;
> +	spinlock_t			*lock;
> +	struct reset_controller_dev	rcdev;
> +};
> +
> +static int sunxi_gates_reset_assert(struct reset_controller_dev *rcdev,
> +			      unsigned long id)
> +{
> +	struct gates_reset_data *data = container_of(rcdev,
> +						     struct gates_reset_data,
> +						     rcdev);
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(data->lock, flags);
> +
> +	reg = readl(data->reg);
> +	writel(reg & ~BIT(id), data->reg);
> +
> +	spin_unlock_irqrestore(data->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int sunxi_gates_reset_deassert(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	struct gates_reset_data *data = container_of(rcdev,
> +						     struct gates_reset_data,
> +						     rcdev);
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(data->lock, flags);
> +
> +	reg = readl(data->reg);
> +	writel(reg | BIT(id), data->reg);
> +
> +	spin_unlock_irqrestore(data->lock, flags);
> +
> +	return 0;
> +}
> +
> +static struct reset_control_ops sunxi_gates_reset_ops = {
> +	.assert		= sunxi_gates_reset_assert,
> +	.deassert	= sunxi_gates_reset_deassert,
> +};
> +
> +/**
>   * sunxi_gates_clk_setup() - Setup function for leaf gates on clocks
>   */
>  
> @@ -845,6 +899,7 @@ static void __init sunxi_divider_clk_setup(struct device_node *node,
>  
>  struct gates_data {
>  	DECLARE_BITMAP(mask, SUNXI_GATES_MAX_SIZE);
> +	u32 reset_mask;
>  };
>  
>  static const struct gates_data sun4i_axi_gates_data __initconst = {
> @@ -915,6 +970,7 @@ static void __init sunxi_gates_clk_setup(struct device_node *node,
>  					 struct gates_data *data)
>  {
>  	struct clk_onecell_data *clk_data;
> +	struct gates_reset_data *reset_data;
>  	const char *clk_parent;
>  	const char *clk_name;
>  	void *reg;
> @@ -958,6 +1014,21 @@ static void __init sunxi_gates_clk_setup(struct device_node *node,
>  	clk_data->clk_num = i;
>  
>  	of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +
> +	/* Register a reset controler for gates with reset bits */
> +	if (data->reset_mask == 0)
> +		return;
> +
> +	reset_data = kzalloc(sizeof(*reset_data), GFP_KERNEL);
> +	if (!reset_data)
> +		return;
> +
> +	reset_data->reg = reg;
> +	reset_data->lock = &clk_lock;
> +	reset_data->rcdev.nr_resets = __fls(data->reset_mask) + 1;
> +	reset_data->rcdev.ops = &sunxi_gates_reset_ops;
> +	reset_data->rcdev.of_node = node;
> +	reset_controller_register(&reset_data->rcdev);
>  }
>  
> 
