Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E92FC2D0D1
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 13:23:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 21B2C2146E
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 13:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ai2BHorB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbfLRNXd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 08:23:33 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44175 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726922AbfLRNXd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 08:23:33 -0500
Received: by mail-wr1-f67.google.com with SMTP id q10so2263006wrm.11
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 05:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=YeQ4SePjBedpTNW4vmpRQ+EyRFd+KTWAwguB6NVi3Qk=;
        b=Ai2BHorBDnM1Im/k2r+UldplAQlEBy2KEpm8U6lPq/GkczDrzdbc+QRxUANOtE7dE/
         D7rroLAkE+Aat15BkerQ8gtROwy+f0ZKSpl5i3+3LnyfjfogmZSgFod5J99WHEnxwQHL
         UXV4VZTZGuaINjuCSUF7nQR320W8suUiM4e4uOQLi/ir11F84nTonCLo9/lvfGpzZ+Jy
         aeHRMXg0VV13xqGrsDTu9uRpPngmwGG4oDwcr9aZ+7Q1jlVN10hzBtsQ4LUGTfv65NIT
         VBo75EcdMDoy8/I9UX27CovuzCeE2mh2F48/iD36YLk83kkS2rYXytoWJtfbeHvoSyxV
         vqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=YeQ4SePjBedpTNW4vmpRQ+EyRFd+KTWAwguB6NVi3Qk=;
        b=C+rzeot/wnBGG2bdH9nQXaIs3/FpJDH93AqiIl71a+VtNkKE7MyRX4bzMWXLvk2mGM
         RwZWjr15afowgvxbZi8PSyXV6HzNnshoaj+AThpgHTHt2zHUzk/yH2cvhdWiow/xfsNg
         IL8vHKzIcmebyOSKuDBBLKj73iWto8Hn6iKpaiNujMP0cJQypWtQXXQ/YOIEsZJ7gaXi
         Sk7dfVvnSoczNJS+ndjKACJRo+nHABjCu3HA27+1Oh6zvI3DRYX+M9KuN35gKYUKwFcy
         Sgotb/2dPZnJE+o0V9Xrx0TgCkWPEg8Vteo2g21gjQ4R6BIeuczbrIkVc41fAGA7rbKk
         fHcQ==
X-Gm-Message-State: APjAAAWB1UU/tik4nIx3OhQVINgVj8YnUAu+BSbsLQnfXVaPGi5Nc7U2
        m1h4vrGWzlY9Bep2dSmXkYYm8w==
X-Google-Smtp-Source: APXvYqyB1lvmGkWhDquZCxGWZ7+W2A0kYeuDozzm1MPyRe4IM4c5tOYYZrOlk5bg0h0+hhl6hx3bOQ==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr2976324wru.235.1576675409536;
        Wed, 18 Dec 2019 05:23:29 -0800 (PST)
Received: from [10.2.4.229] (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
        by smtp.gmail.com with ESMTPSA id c15sm2530976wrt.1.2019.12.18.05.23.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Dec 2019 05:23:28 -0800 (PST)
Subject: Re: [PATCH v2 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Yue Wang <yue.wang@amlogic.com>, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
References: <1576636944-196192-1-git-send-email-hanjie.lin@amlogic.com>
 <1576636944-196192-5-git-send-email-hanjie.lin@amlogic.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <d381f59c-1c28-d281-3218-f47df9f1e757@baylibre.com>
Date:   Wed, 18 Dec 2019 14:23:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1576636944-196192-5-git-send-email-hanjie.lin@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On 18/12/2019 03:42, Hanjie Lin wrote:
> Adds support for Amlogic A1 USB Control Glue HW.
> 
> The Amlogic A1 SoC Family embeds 1 USB Controllers:
> - a DWC3 IP configured as Host for USB2 and USB3
> 
> A glue connects the controllers to the USB2 PHY of A1 SoC.
> 
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> ---
>  drivers/usb/dwc3/dwc3-meson-g12a.c | 69 +++++++++++++++++++++++++++-----------
>  1 file changed, 49 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index 8a3ec1a..3817daf 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -107,10 +107,22 @@ static const char *phy_names[PHY_COUNT] = {
>  	"usb2-phy0", "usb2-phy1", "usb3-phy0",
>  };
>  
> +static const struct clk_bulk_data meson_g12a_clocks[] = {
> +	{ .id = NULL},
> +};
> +
> +static const struct clk_bulk_data meson_a1_clocks[] = {
> +	{ .id = "usb_ctrl"},
> +	{ .id = "usb_bus"},
> +	{ .id = "xtal_usb_phy"},
> +	{ .id = "xtal_usb_ctrl"},
> +};
> +
>  struct dwc3_meson_g12a {
>  	struct device		*dev;
>  	struct regmap		*regmap;
> -	struct clk		*clk;
> +	struct clk_bulk_data    *clks;
> +	int num_clks;
>  	struct reset_control	*reset;
>  	struct phy		*phys[PHY_COUNT];
>  	enum usb_dr_mode	otg_mode;
> @@ -151,7 +163,7 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
>  				   U2P_R0_POWER_ON_RESET,
>  				   U2P_R0_POWER_ON_RESET);
>  
> -		if (i == USB2_OTG_PHY) {
> +		if (i == USB2_OTG_PHY && priv->otg_mode != USB_DR_MODE_HOST) {

This is wrong for G12A, please use something else to exclude PULLUPP/VBUS to be updated on A1.

>  			regmap_update_bits(priv->regmap,
>  				U2P_R0 + (U2P_REG_SIZE * i),
>  				U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS,
> @@ -295,7 +307,7 @@ static int dwc3_meson_g12a_otg_mode_set(struct dwc3_meson_g12a *priv,
>  {
>  	int ret;
>  
> -	if (!priv->phys[USB2_OTG_PHY])
> +	if (!priv->phys[USB2_OTG_PHY] || priv->otg_mode == USB_DR_MODE_HOST)

Same, this is wrong on G12A since a Host port can be switched to device, use something
else to disable this for A1, like setting a "otg_supported" flag into the match data,
and using it in dwc3_meson_g12a_usb2_init(), avoiding registering usb_role_switch, the
IRQ and updating the priv->otg_mode in probe().

>  		return -EINVAL;
>  
>  	if (mode == PHY_MODE_USB_HOST)
> @@ -409,17 +421,32 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  		priv->vbus = NULL;
>  	}
>  
> -	priv->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(priv->clk))
> -		return PTR_ERR(priv->clk);
> +	priv->dev = dev;
> +
> +	if (of_device_is_compatible(np, "amlogic,meson-g12a-usb-ctrl")) {
> +		priv->clks = devm_kmemdup(dev, meson_g12a_clocks,
> +					  sizeof(meson_g12a_clocks),
> +					  GFP_KERNEL);
> +		priv->num_clks = ARRAY_SIZE(meson_g12a_clocks);
> +	} else if (of_device_is_compatible(np, "amlogic,meson-a1-usb-ctrl")) {
> +		priv->clks = devm_kmemdup(dev, meson_a1_clocks,
> +					  sizeof(meson_a1_clocks),
> +					  GFP_KERNEL);
> +		priv->num_clks = ARRAY_SIZE(meson_a1_clocks);
> +	} else {
> +		return -EINVAL;
> +	}

Like the PHY driver, please use of_device_get_match_data() and a match data for each compatible instead.

> +
> +	if (!priv->clks)
> +		return -ENOMEM;
>  
> -	ret = clk_prepare_enable(priv->clk);
> +	ret = devm_clk_bulk_get(dev, priv->num_clks, priv->clks);
>  	if (ret)
>  		return ret;
>  
> -	devm_add_action_or_reset(dev,
> -				 (void(*)(void *))clk_disable_unprepare,
> -				 priv->clk);
> +	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
> +	if (ret)
> +		return ret;
>  
>  	platform_set_drvdata(pdev, priv);
>  	priv->dev = dev;
> @@ -433,16 +460,16 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  
>  	ret = reset_control_reset(priv->reset);
>  	if (ret)
> -		return ret;
> +		goto err_disable_clks;
>  
>  	ret = dwc3_meson_g12a_get_phys(priv);
>  	if (ret)
> -		return ret;
> +		goto err_disable_clks;
>  
>  	if (priv->vbus) {
>  		ret = regulator_enable(priv->vbus);
>  		if (ret)
> -			return ret;
> +			goto err_disable_clks;
>  	}
>  
>  	/* Get dr_mode */
> @@ -458,7 +485,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  						dwc3_meson_g12a_irq_thread,
>  						IRQF_ONESHOT, pdev->name, priv);
>  		if (ret)
> -			return ret;
> +			goto err_disable_clks;
>  	}
>  
>  	dwc3_meson_g12a_usb_init(priv);
> @@ -467,7 +494,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  	for (i = 0 ; i < PHY_COUNT ; ++i) {
>  		ret = phy_init(priv->phys[i]);
>  		if (ret)
> -			return ret;
> +			goto err_disable_clks;
>  	}
>  
>  	/* Set PHY Power */
> @@ -478,10 +505,8 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = of_platform_populate(np, NULL, NULL, dev);
> -	if (ret) {
> -		clk_disable_unprepare(priv->clk);
> +	if (ret)
>  		goto err_phys_power;
> -	}
>  
>  	/* Setup OTG mode corresponding to the ID pin */
>  	if (priv->otg_mode == USB_DR_MODE_OTG) {
> @@ -518,6 +543,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  	for (i = 0 ; i < PHY_COUNT ; ++i)
>  		phy_exit(priv->phys[i]);
>  
> +err_disable_clks:
> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
> +
>  	return ret;
>  }
>  
> @@ -547,7 +575,7 @@ static int __maybe_unused dwc3_meson_g12a_runtime_suspend(struct device *dev)
>  {
>  	struct dwc3_meson_g12a	*priv = dev_get_drvdata(dev);
>  
> -	clk_disable(priv->clk);
> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
>  
>  	return 0;
>  }
> @@ -556,7 +584,7 @@ static int __maybe_unused dwc3_meson_g12a_runtime_resume(struct device *dev)
>  {
>  	struct dwc3_meson_g12a	*priv = dev_get_drvdata(dev);
>  
> -	return clk_enable(priv->clk);
> +	return clk_bulk_prepare_enable(priv->num_clks, priv->clks);
>  }
>  
>  static int __maybe_unused dwc3_meson_g12a_suspend(struct device *dev)
> @@ -620,6 +648,7 @@ static const struct dev_pm_ops dwc3_meson_g12a_dev_pm_ops = {
>  
>  static const struct of_device_id dwc3_meson_g12a_match[] = {
>  	{ .compatible = "amlogic,meson-g12a-usb-ctrl" },
> +	{ .compatible = "amlogic,meson-a1-usb-ctrl" },
>  	{ /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dwc3_meson_g12a_match);
> 


Thanks,
Neil
