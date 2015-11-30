From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 2/6] mfd: syscon: add a DT property to set value width
Date: Mon, 30 Nov 2015 13:00:15 -0600
Message-ID: <20151130190015.GA31006@rob-hp-laptop>
References: <1448899191-13891-1-git-send-email-damien.riegel@savoirfairelinux.com>
 <1448899191-13891-3-git-send-email-damien.riegel@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448899191-13891-3-git-send-email-damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 30, 2015 at 10:59:47AM -0500, Damien Riegel wrote:
> Currently syscon has a fixed configuration of 32 bits for register and
> values widths. In some cases, it would be desirable to be able to
> customize the value width.
> 
> For example, certain boards (like the ones manufactured by Technologic
> Systems) have a FPGA that is memory-mapped, but its registers are only
> 16-bit wide.
> 
> This patch adds an optional "reg-io-width" DT binding for syscon that
> allows to change the width for the data bus (i.e. val_bits). If this
> property is provided, it will also set the register stride to
> reg-io-width's value. If not provided, the default configuration is
> used.
> 
> Signed-off-by: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/mfd/syscon.txt |  4 ++++
>  drivers/mfd/syscon.c                             | 13 +++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
> index fe8150b..408f768 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.txt
> +++ b/Documentation/devicetree/bindings/mfd/syscon.txt
> @@ -13,6 +13,10 @@ Required properties:
>  - compatible: Should contain "syscon".
>  - reg: the register region can be accessed from syscon
>  
> +Optional property:
> +- reg-io-width: the size (in bytes) of the IO accesses that should be
> +  performed on the device.
> +
>  Examples:
>  gpr: iomuxc-gpr@020e0000 {
>  	compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index 176bf0f..b7aabee 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -47,6 +47,7 @@ static struct syscon *of_syscon_register(struct device_node *np)
>  	struct syscon *syscon;
>  	struct regmap *regmap;
>  	void __iomem *base;
> +	u32 reg_io_width;
>  	int ret;
>  	struct regmap_config syscon_config = syscon_regmap_config;
>  
> @@ -69,6 +70,18 @@ static struct syscon *of_syscon_register(struct device_node *np)
>  	 else if (of_property_read_bool(np, "little-endian"))
>  		syscon_config.val_format_endian = REGMAP_ENDIAN_LITTLE;
>  
> +	/*
> +	 * search for reg-io-width property in DT. If it is not provided,
> +	 * default to 4 bytes. regmap_init_mmio will return an error if values
> +	 * are invalid so there is no need to check them here.
> +	 */
> +	ret = of_property_read_u32(np, "reg-io-width", &reg_io_width);
> +	if (ret)
> +		reg_io_width = 4;
> +
> +	syscon_config.reg_stride = reg_io_width;
> +	syscon_config.val_bits = reg_io_width * 8;
> +
>  	regmap = regmap_init_mmio(NULL, base, &syscon_config);
>  	if (IS_ERR(regmap)) {
>  		pr_err("regmap init failed\n");
> -- 
> 2.5.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
