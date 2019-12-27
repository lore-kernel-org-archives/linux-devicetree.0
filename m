Return-Path: <SRS0=sOYF=2R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF478C2D0C6
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 16:38:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C23C420882
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 16:38:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rCb6yLvY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfL0QiU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Dec 2019 11:38:20 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:40499 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfL0QiU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Dec 2019 11:38:20 -0500
Received: by mail-ed1-f68.google.com with SMTP id b8so25721610edx.7;
        Fri, 27 Dec 2019 08:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6YTB1fNIm79m/hiZxeT3tYKFD5H8aAnuxvQfJh9UTTA=;
        b=rCb6yLvYVvl/bhWTiHwA3cx/pPDMQSYDZjENCpcrW46hTqEU+37cxTsRfQbFZWgxnQ
         8lAZ3VnOW6o4VNL4GLpbT+x7T62C1KAFCX6q78uC1Jqr2tffxf0f3GWDIYdHlOmMn6c0
         D2gFJ28f+y57Us0+szO7vgqbXxMi15owj96gWUV2Vsc826+PMIOSLSe3X9FX6RzD8LA9
         VHlwek/F+/vnefGNtzo/32g1LnHSVG9grbquv7p1Qafnn7SenyEgVHxIWNyfaCLBR8LU
         uWOlhhWEOQpoGiItymVbpilrcKbra+UJRHiyIzE1CTuloR4yCh+mMaQiU/deAi2BA+j7
         72Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6YTB1fNIm79m/hiZxeT3tYKFD5H8aAnuxvQfJh9UTTA=;
        b=qvaHCbLG5LYoXZaNdS8Ncx6xRv+Rxe5uZt/GX8GgeBnzHg49bEyOEsyQ/xRrzZDglj
         LFm4iv6v7UQDagL/STCnoBcGTTl95Qr5bOnN+pMfLvYP0bHLKplUOmveW5WYZC3RbDpM
         ZGKkgLy5LiAhtXB/UQsEz2yJR49KSbAC5sPok0QREqdrMxDd2H8u9JBwyVn88yBtSGid
         3xrp5r3ey4nHWD4AO6GkbNrXDrQehpnSEN65V2m4yQNVrKLp4FRHdWijIZQOB0Z3xwG6
         FZ1Xi3Td4CfAUIXAODewHWUjleykuYVvxjVENB6JghDRgI0/l6m1BZUh08brjO/T53aD
         DeQg==
X-Gm-Message-State: APjAAAW8DGR5vpMvw2aIrB/AuMxvR0mPFpI6dcOqVle2hDV95Wh2S54x
        qO0bcQ3jUV+w3Iqj3LDiKueIdhDIJ01pRbbKDRY=
X-Google-Smtp-Source: APXvYqzXINFtgDqMBlIV6U4EBXznckvgHZpZ4LhokGGqjDtkp3WySsLLrOwjy/HccteQFMutQpmQt9YGz45Q+BIy3TM=
X-Received: by 2002:a17:906:e219:: with SMTP id gf25mr54733718ejb.51.1577464697886;
 Fri, 27 Dec 2019 08:38:17 -0800 (PST)
MIME-Version: 1.0
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com> <1577428606-69855-5-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1577428606-69855-5-git-send-email-hanjie.lin@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Fri, 27 Dec 2019 17:38:07 +0100
Message-ID: <CAFBinCD8V-Swihz+VJ780sXJtM9cXprDcGCHVuHjjCx0DEOodQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello Hanjie,

sorry that it took me so long to look at this
you can find my comments below

On Fri, Dec 27, 2019 at 7:37 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
[...]
> +static const struct clk_bulk_data meson_g12a_clocks[] = {
> +       { .id = NULL},
> +};
> +
> +static const struct clk_bulk_data meson_a1_clocks[] = {
> +       { .id = "usb_ctrl"},
> +       { .id = "usb_bus"},
> +       { .id = "xtal_usb_phy"},
> +       { .id = "xtal_usb_ctrl"},
> +};
nit-pick: the values in meson_g12a_clocks and meson_a1_clocks all have
a space after the opening "{" but no space before the closing "}"
we should be consistent here (personally I prefer the variant with
space after "{" and before "}", but having no space in both cases is
fine for me too)

[...]
>  static void dwc3_meson_g12a_usb2_set_mode(struct dwc3_meson_g12a *priv,
> @@ -138,10 +156,13 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
>  {
>         int i;
>
> -       if (priv->otg_mode == USB_DR_MODE_PERIPHERAL)
> -               priv->otg_phy_mode = PHY_MODE_USB_DEVICE;
> -       else
> -               priv->otg_phy_mode = PHY_MODE_USB_HOST;
> +       /* only G12A supports otg mode */
> +       if (priv->soc_id == MESON_SOC_G12A) {
> +               if (priv->otg_mode == USB_DR_MODE_PERIPHERAL)
> +                       priv->otg_phy_mode = PHY_MODE_USB_DEVICE;
> +               else
> +                       priv->otg_phy_mode = PHY_MODE_USB_HOST;
> +       }
can you comment on future Amlogic SoCs and how this code will look in
the future?
I would like to avoid having to adjust this "if" for every new SoC,
but I don't know if the majority of the SoCs will have OTG support

also one idea that just came to my mind:
you could define in the .yaml binding that for A1 only dr_mode =
"host" is allowed
then you may not need extra logic in the driver at all

[...]
> -               if (i == USB2_OTG_PHY) {
> +               if (priv->soc_id == MESON_SOC_G12A && i == USB2_OTG_PHY) {
on GXL we have two PHYs (0 and 1), the second one is OTG capable
on GXM we have three PHYs (0..2), the second one is OTG capable
on G12A/G12B we have two PHYs (0 and 1), the second one is OTG capable

you already wrote that there is only one USB2 PHY on the A1 SoC
is really only the second PHY port ("usb2-phy1" instead of
"usb2-phy0") used on A1?
if "usb2-phy0" is correct then you don't need these checks (there are
more checks like this below)

[...]
> -       usb_role_switch_unregister(priv->role_switch);
> +       if (priv->soc_id == MESON_SOC_G12A)
> +               usb_role_switch_unregister(priv->role_switch);
I didn't expect this because in _probe usb_role_switch_register is still called
on A1 we now call usb_role_switch_register() but we never call
usb_role_switch_unregister()


Martin
