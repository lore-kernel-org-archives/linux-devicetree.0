Return-Path: <SRS0=DK2V=2X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE1FC2D0DE
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 00:30:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67C012085B
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 00:30:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbgABAaX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jan 2020 19:30:23 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:55997 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727393AbgABAaX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jan 2020 19:30:23 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 2 Jan
 2020 08:30:43 +0800
Subject: Re: [PATCH v3 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        <linux-usb@vger.kernel.org>, Yue Wang <yue.wang@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        <devicetree@vger.kernel.org>, Liang Yang <liang.yang@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Carlo Caione <carlo@caione.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jerome Brunet <jbrunet@baylibre.com>
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
 <1577428606-69855-5-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCD8V-Swihz+VJ780sXJtM9cXprDcGCHVuHjjCx0DEOodQ@mail.gmail.com>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <d66abc21-1440-503b-3515-6c495bf0db80@amlogic.com>
Date:   Thu, 2 Jan 2020 08:30:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCD8V-Swihz+VJ780sXJtM9cXprDcGCHVuHjjCx0DEOodQ@mail.gmail.com>
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



On 2019/12/28 0:38, Martin Blumenstingl wrote:
> Hello Hanjie,
> 
> sorry that it took me so long to look at this
> you can find my comments below
> 
> On Fri, Dec 27, 2019 at 7:37 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
> [...]
>> +static const struct clk_bulk_data meson_g12a_clocks[] = {
>> +       { .id = NULL},
>> +};
>> +
>> +static const struct clk_bulk_data meson_a1_clocks[] = {
>> +       { .id = "usb_ctrl"},
>> +       { .id = "usb_bus"},
>> +       { .id = "xtal_usb_phy"},
>> +       { .id = "xtal_usb_ctrl"},
>> +};
> nit-pick: the values in meson_g12a_clocks and meson_a1_clocks all have
> a space after the opening "{" but no space before the closing "}"
> we should be consistent here (personally I prefer the variant with
> space after "{" and before "}", but having no space in both cases is
> fine for me too)
> 

Right, I will fix it.

> [...]
>>  static void dwc3_meson_g12a_usb2_set_mode(struct dwc3_meson_g12a *priv,
>> @@ -138,10 +156,13 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
>>  {
>>         int i;
>>
>> -       if (priv->otg_mode == USB_DR_MODE_PERIPHERAL)
>> -               priv->otg_phy_mode = PHY_MODE_USB_DEVICE;
>> -       else
>> -               priv->otg_phy_mode = PHY_MODE_USB_HOST;
>> +       /* only G12A supports otg mode */
>> +       if (priv->soc_id == MESON_SOC_G12A) {
>> +               if (priv->otg_mode == USB_DR_MODE_PERIPHERAL)
>> +                       priv->otg_phy_mode = PHY_MODE_USB_DEVICE;
>> +               else
>> +                       priv->otg_phy_mode = PHY_MODE_USB_HOST;
>> +       }
> can you comment on future Amlogic SoCs and how this code will look in
> the future?
> I would like to avoid having to adjust this "if" for every new SoC,
> but I don't know if the majority of the SoCs will have OTG support
> 
> also one idea that just came to my mind:
> you could define in the .yaml binding that for A1 only dr_mode =
> "host" is allowed
> then you may not need extra logic in the driver at all
> 

Good idea this different SoC extra logic could avoided by add constraints 
to .yaml, also code will be more elegant.

I will do this in next version.

> [...]
>> -               if (i == USB2_OTG_PHY) {
>> +               if (priv->soc_id == MESON_SOC_G12A && i == USB2_OTG_PHY) {
> on GXL we have two PHYs (0 and 1), the second one is OTG capable
> on GXM we have three PHYs (0..2), the second one is OTG capable
> on G12A/G12B we have two PHYs (0 and 1), the second one is OTG capable
> 
> you already wrote that there is only one USB2 PHY on the A1 SoC
> is really only the second PHY port ("usb2-phy1" instead of
> "usb2-phy0") used on A1?
> if "usb2-phy0" is correct then you don't need these checks (there are
> more checks like this below)

Actually, A1 have same phys("usb2-phy0", "usb2-phy1", "usb3-phy0") and register base with G12A.
But A1 driver is designed to support host mode with usb2-phy1 only.

> 
> [...]
>> -       usb_role_switch_unregister(priv->role_switch);
>> +       if (priv->soc_id == MESON_SOC_G12A)
>> +               usb_role_switch_unregister(priv->role_switch);
> I didn't expect this because in _probe usb_role_switch_register is still called
> on A1 we now call usb_role_switch_register() but we never call
> usb_role_switch_unregister()
> 

Actually, usb_role_switch_register() can be called only in G12A.

dwc3_meson_g12a_probe()
         ...
         if (priv->soc_id != MESON_SOC_G12A)
                 goto setup_pm_runtime;


Same with second suggestion, this different SoC extra logic could avoided by add constraints 
to .yaml.
I will do this in next version.

Thanks,
Hanjie

> 
> Martin
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
> .
> 
