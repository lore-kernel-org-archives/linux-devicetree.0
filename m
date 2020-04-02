Return-Path: <SRS0=tl9x=5S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F94C2BA17
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 23:49:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA6A920787
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 23:49:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oHNClAaV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390251AbgDBXtY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 19:49:24 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:35288 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390232AbgDBXtY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Apr 2020 19:49:24 -0400
Received: by mail-vs1-f67.google.com with SMTP id u11so3835662vsg.2
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2020 16:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2cvHKEqE410gCKmpQqv4fwxuaYQ7RFlmiPeeClrkMO8=;
        b=oHNClAaVRjBvfiIHC3meUIG6hnjnf11/sNZ/V7gNcrui28BTXX5jOIFMsGIdohMwHO
         h7PPfy7l5GWTBRcXZ4+8MeUxj5YFP+kXdRxhoLJbiUmJg6R/0pdItL6moT5PJzO0mky3
         yzMGM24MxAY5wilNoW2rYwoP90L/ZHasF5MUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2cvHKEqE410gCKmpQqv4fwxuaYQ7RFlmiPeeClrkMO8=;
        b=RSB0s8OTdq8v4qDZBNN1KOsCaepjMWttGXlcMl8GGoAhE5atwE19LTufHYBIiXGgyi
         4SkvAl+iNe81ehKhky+eqh3lRjvcfYDevOTU/MypWuEfQDkw+P1IFCOlVveCIuJ8vcli
         Mp1ANMaljd2pHIfsqh5RMBxeOychEQW286Zq4RcJom0USJPKyofi7RpXhNuBRB7jwAv4
         ijc2NTx0Y+Vt07nwgJ4SOVtZAxrulaFS44GPhaELfVxD/1rxCMTtvEE+1dFMwpq3GfQu
         RKYfS3Y1yb87Sk260cYHeNoymZomqDlRZlNe5Jh8dSD7xOLivAhKLzvuk64HrkB4gi/L
         feCg==
X-Gm-Message-State: AGi0PuYpxpPrMpMy3b7o+p8oYHk3E+IxgIHEMohxzIYA0T8fFdpE4LQp
        /S2M5N1MIfeABoP8u08EBek6zFlDv90=
X-Google-Smtp-Source: APiQypKClX4B7KUhFT/Y8AaikAvDc78KAsXGxp4R+Ponm6Dh1lQID03h3n3Ysqog92cEjX+pTjyQ/g==
X-Received: by 2002:a67:e901:: with SMTP id c1mr4168453vso.228.1585871362500;
        Thu, 02 Apr 2020 16:49:22 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id t194sm1691398vst.17.2020.04.02.16.49.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 16:49:21 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id f195so1184473vka.4
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2020 16:49:21 -0700 (PDT)
X-Received: by 2002:a05:6122:305:: with SMTP id c5mr4339170vko.40.1585871360882;
 Thu, 02 Apr 2020 16:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200402223723.7150-1-john.stultz@linaro.org> <20200402234455.75061-1-john.stultz@linaro.org>
In-Reply-To: <20200402234455.75061-1-john.stultz@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Apr 2020 16:49:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wh9_4a-cDGPdpMrXUi_HmJvS-a2Ubeyo5WG3sgwVWKKQ@mail.gmail.com>
Message-ID: <CAD=FV=Wh9_4a-cDGPdpMrXUi_HmJvS-a2Ubeyo5WG3sgwVWKKQ@mail.gmail.com>
Subject: Re: [PATCH v2] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy" compat string
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Apr 2, 2020 at 4:45 PM John Stultz <john.stultz@linaro.org> wrote:
>
> In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
> PHY support"), the change was made to add "qcom,qusb2-v2-phy"
> as a generic compat string. However the change also removed
> the "qcom,sdm845-qusb2-phy" compat string, which is documented
> in the binding and already in use.
>
> This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
> which allows the driver to continue to work with existing dts
> entries such as found on the db845c.
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Manu Gautam <mgautam@codeaurora.org>
> Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")
> Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v2: Add deprecation note on "qcom,sdm845-qusb2-phy" string
>     as suggested by Doug.
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index 3708d43b7508..393011a05b48 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -815,6 +815,13 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
>         }, {
>                 .compatible     = "qcom,msm8998-qusb2-phy",
>                 .data           = &msm8998_phy_cfg,
> +       }, {
> +               /*
> +                * Deprecated. Only here to support legacy device
> +                * trees that didn't include "qcom,qusb2-v2-phy"
> +                */
> +               .compatible     = "qcom,sdm845-qusb2-phy",
> +               .data           = &qusb2_v2_phy_cfg,

Thanks for adding the comment.  With that, I'll still grumble but I'm
OK with this if people really want it.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
