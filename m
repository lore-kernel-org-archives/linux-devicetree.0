From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 5/5] clk: mediatek: Add USB clock support in MT8173
 APMIXEDSYS
Date: Tue, 26 May 2015 10:05:16 +0200
Message-ID: <20150526080516.GG6325@pengutronix.de>
References: <1432192376-6712-1-git-send-email-jamesjj.liao@mediatek.com>
 <1432192376-6712-6-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432192376-6712-6-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 03:12:56PM +0800, James Liao wrote:
> Add REF2USB_TX clock support into MT8173 APMIXEDSYS. This clock
> is needed by USB 3.0.
> 
> +
> +static struct clk *mtk_clk_register_ref2usb_tx(const char *name,
> +			void __iomem *reg)
> +{
> +	struct mtk_ref2usb_tx *tx;
> +	struct clk_init_data init = {};
> +	struct clk *clk;
> +	const char *parent_name = "clk26m";
> +
> +	tx = kzalloc(sizeof(*tx), GFP_KERNEL);
> +	if (!tx)
> +		return ERR_PTR(-ENOMEM);
> +
> +	tx->base_addr = reg;
> +	tx->hw.init = &init;
> +
> +	init.name = name;
> +	init.ops = &mtk_ref2usb_tx_ops;
> +	init.parent_names = &parent_name;
> +	init.num_parents = 1;
> +
> +	clk = clk_register(NULL, &tx->hw);
> +
> +	if (IS_ERR(clk)) {
> +		pr_err("Failed to register clk %s: %ld\n", name, PTR_ERR(clk));
> +		kfree(tx);
> +	}
> +
> +	return clk;
> +}
> +
> +static void __init mtk_clk_register_apmixedsys_special(struct device_node *node,
> +			struct clk_onecell_data *clk_data)
> +{
> +	void __iomem *base;
> +	struct clk *clk;
> +
> +	base = of_iomap(node, 0);
> +	if (!base) {
> +		pr_err("%s(): ioremap failed\n", __func__);
> +		return;
> +	}
> +
> +	clk = mtk_clk_register_ref2usb_tx("ref2usb_tx", base + 0x8);

The function seems to be for one special clock only. Why do you pass the
name to it? They will never be called with another name, right?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
