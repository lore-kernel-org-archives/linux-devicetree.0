Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7C2C2D0C1
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 09:47:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35FFD206D8
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 09:47:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfLSJr5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 04:47:57 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:25753 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbfLSJr5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 04:47:57 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 19 Dec
 2019 17:48:32 +0800
Subject: Re: [PATCH v2 3/6] phy: amlogic: Add Amlogic A1 USB2 PHY Driver
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
 <1576636944-196192-4-git-send-email-hanjie.lin@amlogic.com>
 <4cbc4216-4f1b-dab2-fccd-4ece7cfedb77@baylibre.com>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <da372dff-4467-5d04-c8ae-055f89a5b11b@amlogic.com>
Date:   Thu, 19 Dec 2019 17:48:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <4cbc4216-4f1b-dab2-fccd-4ece7cfedb77@baylibre.com>
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



On 2019/12/18 21:17, Neil Armstrong wrote:
> Hi,
> 
> On 18/12/2019 03:42, Hanjie Lin wrote:
>> This adds support for the USB2 PHY found in the Amlogic A1 SoC Family.
>>
>> It supports host mode only.
>>
>> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
>> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
>> ---
>>  drivers/phy/amlogic/phy-meson-g12a-usb2.c | 102 ++++++++++++++++++++++--------
>>  1 file changed, 74 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
>> index 9065ffc..2c242d3 100644
>> --- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
>> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
>> @@ -146,11 +146,18 @@
>>  #define RESET_COMPLETE_TIME					1000
>>  #define PLL_RESET_COMPLETE_TIME					100
>>  
>> +enum {
>> +	MESON_USB2_PHY_VERSION_10 = 0,
>> +	MESON_USB2_PHY_VERSION_11,
> 
> Are these the real "versions" of the phy or it's made up ?
> 

This version is made up and only for distinguish a1 and g12a.

>> +	MESON_USB2_PHY_VERSION_COUNT,
>> +};
>> +
>>  struct phy_meson_g12a_usb2_priv {
>>  	struct device		*dev;
>>  	struct regmap		*regmap;
>>  	struct clk		*clk;
>>  	struct reset_control	*reset;
>> +	int phy_version;
>>  };
>>  
>>  static const struct regmap_config phy_meson_g12a_usb2_regmap_conf = {
>> @@ -192,18 +199,33 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>>  		     FIELD_PREP(PHY_CTRL_R17_MPLL_FILTER_PVT2, 2) |
>>  		     FIELD_PREP(PHY_CTRL_R17_MPLL_FILTER_PVT1, 9));
>>  
>> -	regmap_write(priv->regmap, PHY_CTRL_R18,
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_LKW_SEL, 1) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_W, 9) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_S, 0x27) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_PFD_GAIN, 1) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_ROU, 7) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_DATA_SEL, 3) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_BIAS_ADJ, 1) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_BB_MODE, 0) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_ALPHA, 3) |
>> -		     FIELD_PREP(PHY_CTRL_R18_MPLL_ADJ_LDO, 1) |
>> -		     PHY_CTRL_R18_MPLL_ACG_RANGE);
>> +	if (priv->phy_version == MESON_USB2_PHY_VERSION_10)
>> +		regmap_write(priv->regmap, PHY_CTRL_R18,
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_LKW_SEL, 1) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_W, 9) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_S, 0x27) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_PFD_GAIN, 1) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_ROU, 7) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_DATA_SEL, 3) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_BIAS_ADJ, 1) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_BB_MODE, 0) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_ALPHA, 3) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_ADJ_LDO, 1) |
>> +			     PHY_CTRL_R18_MPLL_ACG_RANGE);
>> +	else if (priv->phy_version == MESON_USB2_PHY_VERSION_11)
>> +		regmap_write(priv->regmap, PHY_CTRL_R18,
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_LKW_SEL, 1) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_W, 9) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_LK_S, 0x27) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_PFD_GAIN, 1) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_ROU, 7) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_DATA_SEL, 3) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_BIAS_ADJ, 1) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_BB_MODE, 0) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_ALPHA, 3) |
>> +			     FIELD_PREP(PHY_CTRL_R18_MPLL_ADJ_LDO, 1) |
>> +			     PHY_CTRL_R18_MPLL_ACG_RANGE |
>> +			     PHY_CTRL_R18_MPLL_DCO_CLK_SEL);
> 
> The only difference is PHY_CTRL_R18_MPLL_ACG_RANGE | PHY_CTRL_R18_MPLL_DCO_CLK_SEL,
> you can easily simplify the code here by using a temp variable.
> 

Yes, it will looks more clearly.

>>  
>>  	udelay(PLL_RESET_COMPLETE_TIME);
>>  
>> @@ -227,13 +249,24 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>>  		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_VREF_4_0, 0) |
>>  		     FIELD_PREP(PHY_CTRL_R20_USB2_BGR_DBG_1_0, 0));
>>  
>> -	regmap_write(priv->regmap, PHY_CTRL_R4,
>> -		     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_7_0, 0xf) |
>> -		     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_15_8, 0xf) |
>> -		     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_23_16, 0xf) |
>> -		     PHY_CTRL_R4_TEST_BYPASS_MODE_EN |
>> -		     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_1_0, 0) |
>> -		     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_3_2, 0));
>> +	if (priv->phy_version == MESON_USB2_PHY_VERSION_10)
>> +		regmap_write(priv->regmap, PHY_CTRL_R4,
>> +			     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_7_0, 0xf) |
>> +			     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_15_8, 0xf) |
>> +			     FIELD_PREP(PHY_CTRL_R4_CALIB_CODE_23_16, 0xf) |
>> +			     PHY_CTRL_R4_TEST_BYPASS_MODE_EN |
>> +			     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_1_0, 0) |
>> +			     FIELD_PREP(PHY_CTRL_R4_I_C2L_BIAS_TRIM_3_2, 0));
>> +	else if (priv->phy_version == MESON_USB2_PHY_VERSION_11) {
>> +		regmap_write(priv->regmap, PHY_CTRL_R21,
>> +			     PHY_CTRL_R21_USB2_CAL_ACK_EN |
>> +			     PHY_CTRL_R21_USB2_TX_STRG_PD |
>> +			     FIELD_PREP(PHY_CTRL_R21_USB2_OTG_ACA_TRIM_1_0, 2));
>> +
>> +		/* Analog Settings */
>> +		regmap_write(priv->regmap, PHY_CTRL_R13,
>> +			     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
>> +	}
>>  
>>  	/* Tuning Disconnect Threshold */
>>  	regmap_write(priv->regmap, PHY_CTRL_R3,
>> @@ -241,11 +274,13 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>>  		     FIELD_PREP(PHY_CTRL_R3_HSDIC_REF, 1) |
>>  		     FIELD_PREP(PHY_CTRL_R3_DISC_THRESH, 3));
>>  
>> -	/* Analog Settings */
>> -	regmap_write(priv->regmap, PHY_CTRL_R14, 0);
>> -	regmap_write(priv->regmap, PHY_CTRL_R13,
>> -		     PHY_CTRL_R13_UPDATE_PMA_SIGNALS |
>> -		     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
>> +	if (priv->phy_version == MESON_USB2_PHY_VERSION_10) {
>> +		/* Analog Settings */
>> +		regmap_write(priv->regmap, PHY_CTRL_R14, 0);
>> +		regmap_write(priv->regmap, PHY_CTRL_R13,
>> +			     PHY_CTRL_R13_UPDATE_PMA_SIGNALS |
>> +			     FIELD_PREP(PHY_CTRL_R13_MIN_COUNT_FOR_SYNC_DET, 7));
>> +	}
>>  
>>  	return 0;
>>  }
>> @@ -271,6 +306,7 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
>>  	struct resource *res;
>>  	struct phy_meson_g12a_usb2_priv *priv;
>>  	struct phy *phy;
>> +	struct device_node *np = dev->of_node;
>>  	void __iomem *base;
>>  	int ret;
>>  
>> @@ -286,14 +322,23 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
>>  	if (IS_ERR(base))
>>  		return PTR_ERR(base);
>>  
>> +	if (of_device_is_compatible(np, "amlogic,g12a-usb2-phy"))
>> +		priv->phy_version = MESON_USB2_PHY_VERSION_10;
>> +	else if (of_device_is_compatible(np, "amlogic,a1-usb2-phy"))
>> +		priv->phy_version = MESON_USB2_PHY_VERSION_11;
>> +	else
>> +		return -EINVAL;
> 
> Please use of_device_get_match_data() and a match data for each compatible instead.
> 

OK, I will fix it in next version.

>> +
>>  	priv->regmap = devm_regmap_init_mmio(dev, base,
>>  					     &phy_meson_g12a_usb2_regmap_conf);
>>  	if (IS_ERR(priv->regmap))
>>  		return PTR_ERR(priv->regmap);
>>  
>> -	priv->clk = devm_clk_get(dev, "xtal");
>> -	if (IS_ERR(priv->clk))
>> -		return PTR_ERR(priv->clk);
>> +	if (priv->phy_version == MESON_USB2_PHY_VERSION_10) {
>> +		priv->clk = devm_clk_get(dev, "xtal");
>> +		if (IS_ERR(priv->clk))
>> +			return PTR_ERR(priv->clk);
>> +	}
>>  
>>  	priv->reset = devm_reset_control_get(dev, "phy");
>>  	if (IS_ERR(priv->reset))
>> @@ -322,7 +367,8 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
>>  
>>  static const struct of_device_id phy_meson_g12a_usb2_of_match[] = {
>>  	{ .compatible = "amlogic,g12a-usb2-phy", },
>> -	{ },
>> +	{ .compatible = "amlogic,a1-usb2-phy", },
>> +	{ /* Sentinel */ }
>>  };
>>  MODULE_DEVICE_TABLE(of, phy_meson_g12a_usb2_of_match);
>>  
>>
> 
> Thanks,
> Neil
> 
> .
> 

Thanks,
Hanjie.Lin
