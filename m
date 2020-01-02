Return-Path: <SRS0=DK2V=2X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2914CC3276C
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 21:52:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF4D321655
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 21:52:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pt+8L1kf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgABVw5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jan 2020 16:52:57 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:40993 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgABVw5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jan 2020 16:52:57 -0500
Received: by mail-ed1-f68.google.com with SMTP id c26so40227853eds.8;
        Thu, 02 Jan 2020 13:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hvu2XgZLIAybTxeXvSxciwNCDI/QTjrV4RLf06zuwtk=;
        b=pt+8L1kfxsX0Xxqv1s32vYhKZ0Ehx0enq8/6v/tV9pcIelS/duSghfq9QbBGzbWmtr
         K7ef23N6Wc1GG6zhr+FtBE1UzCgHZq33Wc4wop1pvAc0TwGWv6IyTQHw32qhdqEP0NTI
         RnZKGzNyx4U9n+jtQVCpKI7TxoG5iNG8RtI7ULvxf1ivAPLvjrDrXBBi1/FZpnmJgHsI
         5RWeO7GsrQe5v/h+OB2aOQVQYgU49ciDf8wFuizGVYTXnMFnbftDO+wSVmKi1/AUdeii
         V1F8yfXoAWRUvHuq6Q8MfmZLQ5ENJYt5dIwrFo/vJ99osCuIDlsOPQJL7iKy/RNKzMS1
         CAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hvu2XgZLIAybTxeXvSxciwNCDI/QTjrV4RLf06zuwtk=;
        b=AYeGr3qZIx31mf9/1D+6lYyfebdJ+vSK7GUc3jXfa5gaeJQW7B6ZaS5SSGh9YR13BB
         uSgcfyqaIp0w0Nes6Y4iOVuHc0zH8q5bJIwCqmKSn383UwDO/X3FIhA7ETAgPcxDDixB
         Vd/hps4755cdHl3jISKCyXOJWiY2i9xNrDEWHe1XN4pgDh1xka8sgUc4b4RMUXksKyJZ
         BWXXyyA0CJ8ULFhCNgP0HPsO9kWvojxD28MOUnbsPOu9IkKu0mIDAwTBZg9hZitNBrMv
         FeCDJwHAWhY4x2y6F1WkqePmcbdYOQvdng5K7AepVOCx5k7XwslZam3KCNRSln3abRGh
         XZSA==
X-Gm-Message-State: APjAAAXgNreoetF5FFeQ4Lny+ziJ1aoiNDdTZ1wMNO+JoeXlfX21QG78
        kQbWO8G7aS98GaW+khZRJXZ4tFv1K7BJwkIW4ANnYA==
X-Google-Smtp-Source: APXvYqyLuGqANpkEmw72e7jynDm+fNMM49TQnwz/BBk2Zt26OUL6Fve8YN1sQTqqR68Jp8kkufLSn3wjnTCMkt89RHE=
X-Received: by 2002:aa7:d6d1:: with SMTP id x17mr53418384edr.57.1578001975370;
 Thu, 02 Jan 2020 13:52:55 -0800 (PST)
MIME-Version: 1.0
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
 <1577428606-69855-5-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCD8V-Swihz+VJ780sXJtM9cXprDcGCHVuHjjCx0DEOodQ@mail.gmail.com> <d66abc21-1440-503b-3515-6c495bf0db80@amlogic.com>
In-Reply-To: <d66abc21-1440-503b-3515-6c495bf0db80@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Thu, 2 Jan 2020 22:52:44 +0100
Message-ID: <CAFBinCAEO=c+5oZrUmW=YhqD5tQkm0NUSbgwxHYqL2UgcK4c5Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-usb@vger.kernel.org, Yue Wang <yue.wang@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        devicetree@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Carlo Caione <carlo@caione.org>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello Hanjie,

On Thu, Jan 2, 2020 at 1:30 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
[...]
> >> -               if (i == USB2_OTG_PHY) {
> >> +               if (priv->soc_id == MESON_SOC_G12A && i == USB2_OTG_PHY) {
> > on GXL we have two PHYs (0 and 1), the second one is OTG capable
> > on GXM we have three PHYs (0..2), the second one is OTG capable
> > on G12A/G12B we have two PHYs (0 and 1), the second one is OTG capable
> >
> > you already wrote that there is only one USB2 PHY on the A1 SoC
> > is really only the second PHY port ("usb2-phy1" instead of
> > "usb2-phy0") used on A1?
> > if "usb2-phy0" is correct then you don't need these checks (there are
> > more checks like this below)
>
> Actually, A1 have same phys("usb2-phy0", "usb2-phy1", "usb3-phy0") and register base with G12A.
> But A1 driver is designed to support host mode with usb2-phy1 only.
OK, thank you for clarifying this interesting decision made by the HW team

...]
> >> -       usb_role_switch_unregister(priv->role_switch);
> >> +       if (priv->soc_id == MESON_SOC_G12A)
> >> +               usb_role_switch_unregister(priv->role_switch);
> > I didn't expect this because in _probe usb_role_switch_register is still called
> > on A1 we now call usb_role_switch_register() but we never call
> > usb_role_switch_unregister()
> >
>
> Actually, usb_role_switch_register() can be called only in G12A.
>
> dwc3_meson_g12a_probe()
>          ...
>          if (priv->soc_id != MESON_SOC_G12A)
>                  goto setup_pm_runtime;
I completely missed that, thank you for clarifying it

>
> Same with second suggestion, this different SoC extra logic could avoided by add constraints
> to .yaml.
> I will do this in next version.
that would be awesome if it works out!


Martin
