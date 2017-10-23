From: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH v2 2/2] phy: add combo phy driver for HiSilicon STB SoCs
Date: Mon, 23 Oct 2017 19:42:32 +0800
Message-ID: <0ccecbc3-68fe-e134-36e0-6075f723d384@hisilicon.com>
References: <1508757968-22729-1-git-send-email-shawnguo@kernel.org>
 <1508757968-22729-3-git-send-email-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508757968-22729-3-git-send-email-shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: hermit.wangheming-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pengcheng Li <lpc.li-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 2017/10/23 19:26, Shawn Guo wrote:
> From: Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> 
> Add combo phy driver for HiSilicon STB SoCs. This phy can be
> used as pcie-phy, sata-phy or usb-phy.
> 
> Signed-off-by: Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/phy/hisilicon/Kconfig             |   9 ++
>  drivers/phy/hisilicon/Makefile            |   1 +
>  drivers/phy/hisilicon/phy-histb-combphy.c | 253 ++++++++++++++++++++++++++++++
>  3 files changed, 263 insertions(+)
>  create mode 100644 drivers/phy/hisilicon/phy-histb-combphy.c
> 
> diff --git a/drivers/phy/hisilicon/Kconfig b/drivers/phy/hisilicon/Kconfig
> index 6164c4cd0f65..d9afe2b12827 100644
> --- a/drivers/phy/hisilicon/Kconfig
> +++ b/drivers/phy/hisilicon/Kconfig
> @@ -11,6 +11,15 @@ config PHY_HI6220_USB
>  
>  	  To compile this driver as a module, choose M here.
>  
> +config PHY_HISTB_COMBPHY
> +	tristate "HiSilicon STB SoCs COMBPHY support"
> +	depends on (ARCH_HISI && ARM64) || COMPILE_TEST
> +	select GENERIC_PHY
> +	select MFD_SYSCON
> +	help
> +	  Enable this to support the HISILICON STB SoCs COMBPHY.
> +	  If unsure, say N.
> +
>  config PHY_HIX5HD2_SATA
>  	tristate "HIX5HD2 SATA PHY Driver"
>  	depends on ARCH_HIX5HD2 && OF && HAS_IOMEM
> diff --git a/drivers/phy/hisilicon/Makefile b/drivers/phy/hisilicon/Makefile
> index 541b348187a8..5e8e2dfa8c37 100644
> --- a/drivers/phy/hisilicon/Makefile
> +++ b/drivers/phy/hisilicon/Makefile
> @@ -1,2 +1,3 @@
>  obj-$(CONFIG_PHY_HI6220_USB)		+= phy-hi6220-usb.o
> +obj-$(CONFIG_PHY_HISTB_COMBPHY)		+= phy-histb-combphy.o
>  obj-$(CONFIG_PHY_HIX5HD2_SATA)		+= phy-hix5hd2-sata.o
> diff --git a/drivers/phy/hisilicon/phy-histb-combphy.c b/drivers/phy/hisilicon/phy-histb-combphy.c
> new file mode 100644
> index 000000000000..59685c98b0de
> --- /dev/null
> +++ b/drivers/phy/hisilicon/phy-histb-combphy.c
> @@ -0,0 +1,253 @@
> +/*
> + * COMBPHY driver for HiSilicon STB SoCs
> + *
> + * Copyright (C) 2016-2017 HiSilicon Co., Ltd. http://www.hisilicon.com
> + *
> + * Authors: Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +

[snip]
> +
> +static int histb_pcie_phy_init(struct histb_combphy_priv *priv)
> +{
> +	struct regmap *peri = priv->peri;
> +	int ret;
> +
> +	/* set to pcie mode */
> +	regmap_update_bits(peri, PERI_CTRL, COMBPHY1_MODE_MASK,
> +			    COMBPHY_MODE_PCIE << COMBPHY_MODE_SHIFT);
> +
> +	regmap_update_bits(peri, PERI_COMBPHY1_CFG,
> +			    COMBPHY1_BYPASS_CODEC_MASK,
> +			    ~COMBPHY1_BYPASS_CODEC_VAL);
> +
> +	ret = clk_prepare_enable(priv->ref);
> +	if (ret) {
> +		dev_err(&priv->phy->dev, "clk_prepare_enable fail!\n");
> +		return ret;
> +	}
> +
> +	reset_control_deassert(priv->por);
> +
> +	regmap_update_bits(peri, PERI_COMBPHY1_CFG,
> +			    COMBPHY1_CLKREF_OUT_OEN_MASK,
> +			    COMBPHY1_CLKREF_OUT_OEN_VAL);
> +
> +	/* need to wait for EP clk stable */
> +	mdelay(5);
> +
> +	nano_register_write(peri, PERI_COMBPHY1_CFG, 0x1, 0x8);
> +	nano_register_write(peri, PERI_COMBPHY1_CFG, 0xc, 0x9);
> +	nano_register_write(peri, PERI_COMBPHY1_CFG, 0x1a, 0x4);
> +
> +	return 0;
> +}
> +
> +static int histb_pcie_phy_exit(struct histb_combphy_priv *priv)
> +{
> +	regmap_update_bits(priv->peri, PERI_COMBPHY1_CFG,
> +				COMBPHY1_CLKREF_OUT_OEN_MASK,
> +				~COMBPHY1_CLKREF_OUT_OEN_VAL);
> +	reset_control_deassert(priv->por);
> +	clk_disable_unprepare(priv->ref);
> +
> +	return 0;
> +}
> +
> +static int histb_usb_phy_init(struct histb_combphy_priv *priv)
> +{
> +	int ret;
> +
I think the work mode should be set to usb3 first as histb_pcie_phy_init does.
The current one may be not usb3.

> +	ret = clk_prepare_enable(priv->ref);
> +	if (ret) {
> +		dev_err(&priv->phy->dev, "clk_prepare_enable fail!\n");
> +		return ret;
> +	}
> +	reset_control_deassert(priv->por);
> +	mdelay(1);
> +
> +	return 0;
> +}
> +
> +static int histb_usb_phy_exit(struct histb_combphy_priv *priv)
> +{
> +	reset_control_deassert(priv->por);
> +	clk_disable_unprepare(priv->ref);
> +
> +	return 0;
> +}
> +
[snip]

Regards,
Jiancheng

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
