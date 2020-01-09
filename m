Return-Path: <SRS0=GIEZ=26=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5CCC32771
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 11:51:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B9BF2075D
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 11:51:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgAILvT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 06:51:19 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:52422 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728618AbgAILvT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jan 2020 06:51:19 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 9 Jan
 2020 19:51:42 +0800
Subject: Re: [PATCH v4 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>
CC:     <devicetree@vger.kernel.org>, Victor Wan <victor.wan@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        <linux-usb@vger.kernel.org>, Yue Wang <yue.wang@amlogic.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Carlo Caione <carlo@caione.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jian Hu <jian.hu@amlogic.com>
References: <1578537045-23260-1-git-send-email-hanjie.lin@amlogic.com>
 <1578537045-23260-5-git-send-email-hanjie.lin@amlogic.com>
 <c2d45106-f564-668f-e12a-1fe4206429c0@baylibre.com>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <26becb35-3418-0ea3-a7ab-53b4a9b06b7c@amlogic.com>
Date:   Thu, 9 Jan 2020 19:51:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <c2d45106-f564-668f-e12a-1fe4206429c0@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.18.38.198]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 2020/1/9 17:13, Neil Armstrong wrote:
> Hi,
> 
> On 09/01/2020 03:30, Hanjie Lin wrote:
>> Adds support for Amlogic A1 USB Control Glue HW.
>>
>> The Amlogic A1 SoC Family embeds 1 USB Controllers:
>> - a DWC3 IP configured as Host for USB2 and USB3
>>
>> A glue connects the controllers to the USB2 PHY of A1 SoC.
>>
>> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
>> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
>> ---
>>  drivers/usb/dwc3/dwc3-meson-g12a.c | 99 +++++++++++++++++++++++++++-----------
>>  1 file changed, 71 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
>> index 8a3ec1a..957eda2 100644
>> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
>> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
>> @@ -96,6 +96,11 @@
>>  	#define USB_R5_ID_DIG_TH_MASK				GENMASK(15, 8)
>>  	#define USB_R5_ID_DIG_CNT_MASK				GENMASK(23, 16)
>>  
>> +enum meson_soc_id {
>> +	MESON_SOC_G12A = 0,
>> +	MESON_SOC_A1,
>> +};
>> +
>>  enum {
>>  	USB2_HOST_PHY = 0,
>>  	USB2_OTG_PHY,
>> @@ -107,10 +112,21 @@ static const char *phy_names[PHY_COUNT] = {
>>  	"usb2-phy0", "usb2-phy1", "usb3-phy0",
>>  };
>>  
>> +static const struct clk_bulk_data meson_g12a_clocks[] = {
>> +	{ .id = NULL },
>> +};
>> +
>> +static const struct clk_bulk_data meson_a1_clocks[] = {
>> +	{ .id = "usb_ctrl" },
>> +	{ .id = "usb_bus" },
>> +	{ .id = "xtal_usb_ctrl" },
>> +};
>> +
>>  struct dwc3_meson_g12a {
>>  	struct device		*dev;
>>  	struct regmap		*regmap;
>> -	struct clk		*clk;
>> +	struct clk_bulk_data    *clks;
>> +	int num_clks;
>>  	struct reset_control	*reset;
>>  	struct phy		*phys[PHY_COUNT];
>>  	enum usb_dr_mode	otg_mode;
>> @@ -120,6 +136,7 @@ struct dwc3_meson_g12a {
>>  	struct regulator	*vbus;
>>  	struct usb_role_switch_desc switch_desc;
>>  	struct usb_role_switch	*role_switch;
>> +	int                     soc_id;
>>  };
>>  
>>  static void dwc3_meson_g12a_usb2_set_mode(struct dwc3_meson_g12a *priv,
>> @@ -151,7 +168,7 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
>>  				   U2P_R0_POWER_ON_RESET,
>>  				   U2P_R0_POWER_ON_RESET);
>>  
>> -		if (i == USB2_OTG_PHY) {
>> +		if (priv->otg_mode == USB_DR_MODE_OTG && i == USB2_OTG_PHY) {
> 
> I as said on v2, this is wrong, we can/need/must allow switching even if the dr_mode is not USB_DR_MODE_OTG.
> 
> Please add a struct used in match data with a simple bool like "otg_switch_support" and use it here and below
> instead of using USB_DR_MODE_OTG.
> 
Hi neil, 

Right, I thought only otg dr_mode(from dts) can allow switching by mistake.

I will add a drvdata struct includes both otg_switch_supported and clock info for each SoC comaptible in next version.

Thanks,
Hanjie

>>  			regmap_update_bits(priv->regmap,
>>  				U2P_R0 + (U2P_REG_SIZE * i),
>>  				U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS,
>> @@ -295,7 +312,7 @@ static int dwc3_meson_g12a_otg_mode_set(struct dwc3_meson_g12a *priv,
>>  {
>>  	int ret;
>>  
>> -	if (!priv->phys[USB2_OTG_PHY])
>> +	if (priv->otg_mode != USB_DR_MODE_OTG || !priv->phys[USB2_OTG_PHY])
> 
> Ditto
> 
>>  		return -EINVAL;
>>  
>>  	if (mode == PHY_MODE_USB_HOST)
>> @@ -409,17 +426,32 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>>  		priv->vbus = NULL;
>>  	}
>>  
>> -	priv->clk = devm_clk_get(dev, NULL);
>> -	if (IS_ERR(priv->clk))
>> -		return PTR_ERR(priv->clk);
>> +	priv->soc_id = (enum meson_soc_id)of_device_get_match_data(&pdev->dev);
>> +
>> +	if (priv->soc_id == MESON_SOC_G12A) {
>> +		priv->clks = devm_kmemdup(dev, meson_g12a_clocks,
>> +					  sizeof(meson_g12a_clocks),
>> +					  GFP_KERNEL);
>> +		priv->num_clks = ARRAY_SIZE(meson_g12a_clocks);
>> +	} else if (priv->soc_id == MESON_SOC_A1) {
>> +		priv->clks = devm_kmemdup(dev, meson_a1_clocks,
>> +					  sizeof(meson_a1_clocks),
>> +					  GFP_KERNEL);
>> +		priv->num_clks = ARRAY_SIZE(meson_a1_clocks);
>> +	} else {
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!priv->clks)
>> +		return -ENOMEM;
>>  
>> -	ret = clk_prepare_enable(priv->clk);
>> +	ret = devm_clk_bulk_get(dev, priv->num_clks, priv->clks);
>>  	if (ret)
>>  		return ret;
>>  
>> -	devm_add_action_or_reset(dev,
>> -				 (void(*)(void *))clk_disable_unprepare,
>> -				 priv->clk);
>> +	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
>> +	if (ret)
>> +		return ret;
>>  
>>  	platform_set_drvdata(pdev, priv);
>>  	priv->dev = dev;
>> @@ -433,16 +465,16 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>>  
>>  	ret = reset_control_reset(priv->reset);
>>  	if (ret)
>> -		return ret;
>> +		goto err_disable_clks;
>>  
>>  	ret = dwc3_meson_g12a_get_phys(priv);
>>  	if (ret)
>> -		return ret;
>> +		goto err_disable_clks;
>>  
>>  	if (priv->vbus) {
>>  		ret = regulator_enable(priv->vbus);
>>  		if (ret)
>> -			return ret;
>> +			goto err_disable_clks;
>>  	}
>>  
>>  	/* Get dr_mode */
>> @@ -458,7 +490,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>>  						dwc3_meson_g12a_irq_thread,
>>  						IRQF_ONESHOT, pdev->name, priv);
>>  		if (ret)
>> -			return ret;
>> +			goto err_disable_clks;
>>  	}
>>  
>>  	dwc3_meson_g12a_usb_init(priv);
>> @@ -467,7 +499,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>>  	for (i = 0 ; i < PHY_COUNT ; ++i) {
>>  		ret = phy_init(priv->phys[i]);
>>  		if (ret)
>> -			return ret;
>> +			goto err_disable_clks;
>>  	}
>>  
>>  	/* Set PHY Power */
>> @@ -478,18 +510,17 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	ret = of_platform_populate(np, NULL, NULL, dev);
>> -	if (ret) {
>> -		clk_disable_unprepare(priv->clk);
>> +	if (ret)
>>  		goto err_phys_power;
>> -	}
>> +
>> +	if (priv->otg_mode != USB_DR_MODE_OTG)
>> +		goto setup_pm_runtime;
>>  
>>  	/* Setup OTG mode corresponding to the ID pin */
>> -	if (priv->otg_mode == USB_DR_MODE_OTG) {
>> -		otg_id = dwc3_meson_g12a_get_id(priv);
>> -		if (otg_id != priv->otg_phy_mode) {
>> -			if (dwc3_meson_g12a_otg_mode_set(priv, otg_id))
>> -				dev_warn(dev, "Failed to switch OTG mode\n");
>> -		}
>> +	otg_id = dwc3_meson_g12a_get_id(priv);
>> +	if (otg_id != priv->otg_phy_mode) {
>> +		if (dwc3_meson_g12a_otg_mode_set(priv, otg_id))
>> +			dev_warn(dev, "Failed to switch OTG mode\n");
>>  	}
>>  
>>  	/* Setup role switcher */
>> @@ -504,6 +535,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>>  	if (IS_ERR(priv->role_switch))
>>  		dev_warn(dev, "Unable to register Role Switch\n");
>>  
>> +setup_pm_runtime:
> 
> Ditto
> 
>>  	pm_runtime_set_active(dev);
>>  	pm_runtime_enable(dev);
>>  	pm_runtime_get_sync(dev);
>> @@ -518,6 +550,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>>  	for (i = 0 ; i < PHY_COUNT ; ++i)
>>  		phy_exit(priv->phys[i]);
>>  
>> +err_disable_clks:
>> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
>> +
>>  	return ret;
>>  }
>>  
>> @@ -527,7 +562,8 @@ static int dwc3_meson_g12a_remove(struct platform_device *pdev)
>>  	struct device *dev = &pdev->dev;
>>  	int i;
>>  
>> -	usb_role_switch_unregister(priv->role_switch);
>> +	if (priv->otg_mode == USB_DR_MODE_OTG)
>> +		usb_role_switch_unregister(priv->role_switch);
>>  
>>  	of_platform_depopulate(dev);
>>  
>> @@ -547,7 +583,7 @@ static int __maybe_unused dwc3_meson_g12a_runtime_suspend(struct device *dev)
>>  {
>>  	struct dwc3_meson_g12a	*priv = dev_get_drvdata(dev);
>>  
>> -	clk_disable(priv->clk);
>> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
>>  
>>  	return 0;
>>  }
>> @@ -556,7 +592,7 @@ static int __maybe_unused dwc3_meson_g12a_runtime_resume(struct device *dev)
>>  {
>>  	struct dwc3_meson_g12a	*priv = dev_get_drvdata(dev);
>>  
>> -	return clk_enable(priv->clk);
>> +	return clk_bulk_prepare_enable(priv->num_clks, priv->clks);
>>  }
>>  
>>  static int __maybe_unused dwc3_meson_g12a_suspend(struct device *dev)
>> @@ -619,7 +655,14 @@ static const struct dev_pm_ops dwc3_meson_g12a_dev_pm_ops = {
>>  };
>>  
>>  static const struct of_device_id dwc3_meson_g12a_match[] = {
>> -	{ .compatible = "amlogic,meson-g12a-usb-ctrl" },
>> +	{
>> +		.compatible = "amlogic,meson-g12a-usb-ctrl",
>> +		.data = (void *)MESON_SOC_G12A,
>> +	},
>> +	{
>> +		.compatible = "amlogic,meson-a1-usb-ctrl",
>> +		.data = (void *)MESON_SOC_A1,
>> +	},
>>  	{ /* Sentinel */ }
>>  };
>>  MODULE_DEVICE_TABLE(of, dwc3_meson_g12a_match);
>>
> 
> Neil
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
> .
> 
