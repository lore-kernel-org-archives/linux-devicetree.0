Return-Path: <SRS0=sXX/=CB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A5FC433E4
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 16:19:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78D1C2075B
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 16:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598199562;
	bh=ZP199cApduqjUECdPTuyeuu4g86xPAkTnEJsm5MqTRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PILXBvoQ05+dx4/SBzJZBrJU1aga6f+teXc9VmAwTjQiE9wg6Q1FF8FzpPLJ6IFli
	 vYtdvgPeSYUhiGMgVnlnl7MqYmUAD5dXHxBCe+cHtvhwTPO45z+9hmlCUjOI/p45BI
	 SHamOlv+nPQ+AFBFl6QF0GgEKJQwuuf+BMivCHmE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgHWQTK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 23 Aug 2020 12:19:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:45718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728086AbgHWQQq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 23 Aug 2020 12:16:46 -0400
Received: from localhost (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E59D220767;
        Sun, 23 Aug 2020 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598199405;
        bh=ZP199cApduqjUECdPTuyeuu4g86xPAkTnEJsm5MqTRQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o5dYxX1JdDwiq9jrx+ekb4DtP1LkO0uSBgh32D5f1yyeP8ohlUSdt7tqfZ3SjVkkV
         0hgnP6TBsmlAF14KbZdg+FKtlPTCpgONbbt7UNWJ1TbZYNsSb+H0SmzTPVn4gelelS
         bDnHs6LtvlVd2tZ6fzBfoID22DyFOJkG4QF4ftfU=
Date:   Sun, 23 Aug 2020 21:46:41 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     kishon@ti.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH 2/2] phy: freescale: imx8mq-usb: add support for
 imx8mp usb phy
Message-ID: <20200823161641.GZ2639@vkoul-mobl>
References: <1598011644-6219-1-git-send-email-jun.li@nxp.com>
 <1598011644-6219-2-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598011644-6219-2-git-send-email-jun.li@nxp.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 21-08-20, 20:07, Li Jun wrote:
> Add initial support for imx8mp usb phy support, imx8mp usb has
> a silimar phy as imx8mq, which has some different customizations
> on clock and low power design when SoC integration.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 0c4833d..030bf4e 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -4,12 +4,16 @@
>  #include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> +#include <linux/delay.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/regulator/consumer.h>

keep this sorted alphabetically please

>  
>  #define PHY_CTRL0			0x0
>  #define PHY_CTRL0_REF_SSP_EN		BIT(2)
> +#define PHY_CTRL0_FSEL_MASK		GENMASK(10, 5)
> +#define PHY_CTRL0_FSEL_24M		(0x2a << 5)

use FIELD_{GET,PREP} for this?

>  
>  #define PHY_CTRL1			0x4
>  #define PHY_CTRL1_RESET			BIT(0)
> @@ -20,6 +24,11 @@
>  
>  #define PHY_CTRL2			0x8
>  #define PHY_CTRL2_TXENABLEN0		BIT(8)
> +#define PHY_CTRL2_OTG_DISABLE		BIT(9)
> +
> +#define PHY_CTRL6			0x18
> +#define PHY_CTRL6_ALT_CLK_EN		BIT(1)
> +#define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
>  
>  struct imx8mq_usb_phy {
>  	struct phy *phy;
> @@ -54,6 +63,44 @@ static int imx8mq_usb_phy_init(struct phy *phy)
>  	return 0;
>  }
>  
> +static int imx8mp_usb_phy_init(struct phy *phy)
> +{
> +	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
> +	u32 value;
> +
> +	/* USB3.0 PHY signal fsel for 24M ref */
> +	value = readl(imx_phy->base + PHY_CTRL0);
> +	value &= ~PHY_CTRL0_FSEL_MASK;
> +	value |= PHY_CTRL0_FSEL_24M;
> +	writel(value, imx_phy->base + PHY_CTRL0);
> +
> +	/* Disable alt_clk_en and use internal MPLL clocks */
> +	value = readl(imx_phy->base + PHY_CTRL6);
> +	value &= ~(PHY_CTRL6_ALT_CLK_SEL | PHY_CTRL6_ALT_CLK_EN);
> +	writel(value, imx_phy->base + PHY_CTRL6);
> +
> +	value = readl(imx_phy->base + PHY_CTRL1);
> +	value &= ~(PHY_CTRL1_VDATSRCENB0 | PHY_CTRL1_VDATDETENB0);
> +	value |= PHY_CTRL1_RESET | PHY_CTRL1_ATERESET;
> +	writel(value, imx_phy->base + PHY_CTRL1);
> +
> +	value = readl(imx_phy->base + PHY_CTRL0);
> +	value |= PHY_CTRL0_REF_SSP_EN;
> +	writel(value, imx_phy->base + PHY_CTRL0);
> +
> +	value = readl(imx_phy->base + PHY_CTRL2);
> +	value |= PHY_CTRL2_TXENABLEN0 | PHY_CTRL2_OTG_DISABLE;
> +	writel(value, imx_phy->base + PHY_CTRL2);
> +
> +	udelay(10);
> +
> +	value = readl(imx_phy->base + PHY_CTRL1);
> +	value &= ~(PHY_CTRL1_RESET | PHY_CTRL1_ATERESET);
> +	writel(value, imx_phy->base + PHY_CTRL1);
> +
> +	return 0;
> +}
> +
>  static int imx8mq_phy_power_on(struct phy *phy)
>  {
>  	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
> @@ -83,12 +130,29 @@ static struct phy_ops imx8mq_usb_phy_ops = {
>  	.owner		= THIS_MODULE,
>  };
>  
> +static struct phy_ops imx8mp_usb_phy_ops = {
> +	.init		= imx8mp_usb_phy_init,
> +	.power_on	= imx8mq_phy_power_on,
> +	.power_off	= imx8mq_phy_power_off,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct of_device_id imx8mq_usb_phy_of_match[] = {
> +	{.compatible = "fsl,imx8mq-usb-phy",
> +	 .data = &imx8mq_usb_phy_ops,},
> +	{.compatible = "fsl,imx8mp-usb-phy",
> +	 .data = &imx8mp_usb_phy_ops,},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> +
>  static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  {
>  	struct phy_provider *phy_provider;
>  	struct device *dev = &pdev->dev;
>  	struct imx8mq_usb_phy *imx_phy;
>  	struct resource *res;
> +	const struct of_device_id *of_id;
>  
>  	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
>  	if (!imx_phy)
> @@ -105,7 +169,12 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
>  
> -	imx_phy->phy = devm_phy_create(dev, NULL, &imx8mq_usb_phy_ops);
> +	of_id = of_match_device(imx8mq_usb_phy_of_match, dev);

You need of_id->data so why not get that using
of_device_get_match_data()

> +	if (!of_id)
> +		return -ENODEV;
> +
> +	imx_phy->phy = devm_phy_create(dev, NULL, (const struct phy_ops *)
> +					of_id->data);
>  	if (IS_ERR(imx_phy->phy))
>  		return PTR_ERR(imx_phy->phy);
>  
> @@ -120,12 +189,6 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>  
> -static const struct of_device_id imx8mq_usb_phy_of_match[] = {
> -	{.compatible = "fsl,imx8mq-usb-phy",},
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> -
>  static struct platform_driver imx8mq_usb_phy_driver = {
>  	.probe	= imx8mq_usb_phy_probe,
>  	.driver = {
> -- 
> 2.7.4

-- 
~Vinod
