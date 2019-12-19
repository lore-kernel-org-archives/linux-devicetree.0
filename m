Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03849C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 09:51:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8F14206D8
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 09:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfLSJvC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 04:51:02 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:30763 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbfLSJvB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 04:51:01 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 19 Dec
 2019 17:51:38 +0800
Subject: Re: [PATCH v2 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>
CC:     Yue Wang <yue.wang@amlogic.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Carlo Caione <carlo@caione.org>,
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
 <d381f59c-1c28-d281-3218-f47df9f1e757@baylibre.com>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <a0922e0f-7783-433a-8e88-6f9260b2227d@amlogic.com>
Date:   Thu, 19 Dec 2019 17:51:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d381f59c-1c28-d281-3218-f47df9f1e757@baylibre.com>
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



On 2019/12/18 21:23, Neil Armstrong wrote:
> Hi,
> 
> On 18/12/2019 03:42, Hanjie Lin wrote:
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
>>  drivers/usb/dwc3/dwc3-meson-g12a.c | 69 +++++++++++++++++++++++++++-----------
>>  1 file changed, 49 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
>> index 8a3ec1a..3817daf 100644
>> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
>> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
>> @@ -107,10 +107,22 @@ static const char *phy_names[PHY_COUNT] = {
>>  	"usb2-phy0", "usb2-phy1", "usb3-phy0",
>>  };
>>  
>> +static const struct clk_bulk_data meson_g12a_clocks[] = {
>> +	{ .id = NULL},
>> +};
>> +
>> +static const struct clk_bulk_data meson_a1_clocks[] = {
>> +	{ .id = "usb_ctrl"},
>> +	{ .id = "usb_bus"},
>> +	{ .id = "xtal_usb_phy"},
>> +	{ .id = "xtal_usb_ctrl"},
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
>> @@ -151,7 +163,7 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
>>  				   U2P_R0_POWER_ON_RESET,
>>  				   U2P_R0_POWER_ON_RESET);
>>  
>> -		if (i == USB2_OTG_PHY) {
>> +		if (i == USB2_OTG_PHY && priv->otg_mode != USB_DR_MODE_HOST) {
> 
> This is wrong for G12A, please use something else to exclude PULLUPP/VBUS to be updated on A1.
> 

Yes, it's a mistake.
I will try to fix it in next version.

>>  			regmap_update_bits(priv->regmap,
>>  				U2P_R0 + (U2P_REG_SIZE * i),
>>  				U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS,
>> @@ -295,7 +307,7 @@ static int dwc3_meson_g12a_otg_mode_set(struct dwc3_meson_g12a *priv,
>>  {
>>  	int ret;
>>  
>> -	if (!priv->phys[USB2_OTG_PHY])
>> +	if (!priv->phys[USB2_OTG_PHY] || priv->otg_mode == USB_DR_MODE_HOST)
> 
> Same, this is wrong on G12A since a Host port can be switched to device, use something
> else to disable this for A1, like setting a "otg_supported" flag into the match data,
> and using it in dwc3_meson_g12a_usb2_init(), avoiding registering usb_role_switch, the
> IRQ and updating the priv->otg_mode in probe().
> 

Yes, thanks.

>>  		return -EINVAL;
>>  
>>  	if (mode == PHY_MODE_USB_HOST)
>> @@ -409,17 +421,32 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>>  		priv->vbus = NULL;
>>  	}
>>  
>> -	priv->clk = devm_clk_get(dev, NULL);
>> -	if (IS_ERR(priv->clk))
>> -		return PTR_ERR(priv->clk);
>> +	priv->dev = dev;
>> +
>> +	if (of_device_is_compatible(np, "amlogic,meson-g12a-usb-ctrl")) {
>> +		priv->clks = devm_kmemdup(dev, meson_g12a_clocks,
>> +					  sizeof(meson_g12a_clocks),
>> +					  GFP_KERNEL);
>> +		priv->num_clks = ARRAY_SIZE(meson_g12a_clocks);
>> +	} else if (of_device_is_compatible(np, "amlogic,meson-a1-usb-ctrl")) {
>> +		priv->clks = devm_kmemdup(dev, meson_a1_clocks,
>> +					  sizeof(meson_a1_clocks),
>> +					  GFP_KERNEL);
>> +		priv->num_clks = ARRAY_SIZE(meson_a1_clocks);
>> +	} else {
>> +		return -EINVAL;
>> +	}
> 
> Like the PHY driver, please use of_device_get_match_data() and a match data for each compatible instead.
> 

OK.

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
>> @@ -433,16 +460,16 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
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
>> @@ -458,7 +485,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>>  						dwc3_meson_g12a_irq_thread,
>>  						IRQF_ONESHOT, pdev->name, priv);
>>  		if (ret)
>> -			return ret;
>> +			goto err_disable_clks;
>>  	}
>>  
>>  	dwc3_meson_g12a_usb_init(priv);
>> @@ -467,7 +494,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>>  	for (i = 0 ; i < PHY_COUNT ; ++i) {
>>  		ret = phy_init(priv->phys[i]);
>>  		if (ret)
>> -			return ret;
>> +			goto err_disable_clks;
>>  	}
>>  
>>  	/* Set PHY Power */
>> @@ -478,10 +505,8 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	ret = of_platform_populate(np, NULL, NULL, dev);
>> -	if (ret) {
>> -		clk_disable_unprepare(priv->clk);
>> +	if (ret)
>>  		goto err_phys_power;
>> -	}
>>  
>>  	/* Setup OTG mode corresponding to the ID pin */
>>  	if (priv->otg_mode == USB_DR_MODE_OTG) {
>> @@ -518,6 +543,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>>  	for (i = 0 ; i < PHY_COUNT ; ++i)
>>  		phy_exit(priv->phys[i]);
>>  
>> +err_disable_clks:
>> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
>> +
>>  	return ret;
>>  }
>>  
>> @@ -547,7 +575,7 @@ static int __maybe_unused dwc3_meson_g12a_runtime_suspend(struct device *dev)
>>  {
>>  	struct dwc3_meson_g12a	*priv = dev_get_drvdata(dev);
>>  
>> -	clk_disable(priv->clk);
>> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
>>  
>>  	return 0;
>>  }
>> @@ -556,7 +584,7 @@ static int __maybe_unused dwc3_meson_g12a_runtime_resume(struct device *dev)
>>  {
>>  	struct dwc3_meson_g12a	*priv = dev_get_drvdata(dev);
>>  
>> -	return clk_enable(priv->clk);
>> +	return clk_bulk_prepare_enable(priv->num_clks, priv->clks);
>>  }
>>  
>>  static int __maybe_unused dwc3_meson_g12a_suspend(struct device *dev)
>> @@ -620,6 +648,7 @@ static const struct dev_pm_ops dwc3_meson_g12a_dev_pm_ops = {
>>  
>>  static const struct of_device_id dwc3_meson_g12a_match[] = {
>>  	{ .compatible = "amlogic,meson-g12a-usb-ctrl" },
>> +	{ .compatible = "amlogic,meson-a1-usb-ctrl" },
>>  	{ /* Sentinel */ }
>>  };
>>  MODULE_DEVICE_TABLE(of, dwc3_meson_g12a_match);
>>
> 
> 
> Thanks,
> Neil
> 
> .
>

Thanks,
Hanjie.Lin
 
