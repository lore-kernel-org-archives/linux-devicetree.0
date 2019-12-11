Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34169C2D0C6
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 19:25:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B9A12173E
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 19:25:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ov2+zkYx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfLKTZi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 14:25:38 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:46293 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfLKTZi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 14:25:38 -0500
Received: by mail-il1-f195.google.com with SMTP id t17so20424224ilm.13
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 11:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AuPspogaaJ+YoXMUXjj634J3GCNOXTkD4GxSk/Fu5dA=;
        b=Ov2+zkYxARX/4G2CFUTDrTcWVYed0ALV7FAdS21qi5jU0vfvH/ZWc6qkFyMVL/CgBS
         +ER5AJeTdE2I8ujQ4UsDX4voFpXv0+pzIzsxksN+QOO5l1nU9CKKyJSKVKsZifYCWudi
         aNB4asF6dcNFFMM2FGpYupn60GCY0GLjGLUsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AuPspogaaJ+YoXMUXjj634J3GCNOXTkD4GxSk/Fu5dA=;
        b=sltOlXdTMND8AYae2Zc9A6mWUN+9JyM6J7eB+fFIFOke9OY7FX/AYACuD+ZEChSB8R
         knA626ZTrlmFw8en9833lhefs7toF13gExkRlj+o4qcD6iQhNxx1g3wVslndoY7uYOp/
         mdeGFHqOVYzuEejHcmWGCCWYqDLRdM2EpvAh27BBdUl3lVYHEHqAjjgVdoblpEUsRmpJ
         N1AQP2/0RSiGTPK4rP3BC2mucjhJ2Dc/p7QnsH5bQdC5e2tRUcVXEYAUg5DsXalEi7lK
         +WnpBnq9YbJ5E8oojkUa9qdDTwonD8i0ls+Sf+ufxgWFCPp9hPM2XCVRJQ3LfRoIkKdy
         6mqw==
X-Gm-Message-State: APjAAAX5Iwf6JCeI5YBHzXAhrE+bTwxrOnzqfUOp22By6eirVi8FFFUT
        JXLSrQUvP7QkhC1xwcaehvi/j4Q8vyc=
X-Google-Smtp-Source: APXvYqwMpqBMDfRQmH3gtTuJIQF27t4zgsoMRfIDzifUQHTpKTuvMTbSmhkoFCAovX4dwEr+TiO0wg==
X-Received: by 2002:a92:3583:: with SMTP id c3mr3203814ilf.248.1576092337153;
        Wed, 11 Dec 2019 11:25:37 -0800 (PST)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id l15sm719959iom.81.2019.12.11.11.25.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 11:25:36 -0800 (PST)
Received: by mail-il1-f181.google.com with SMTP id n1so5927904ilm.6
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 11:25:36 -0800 (PST)
X-Received: by 2002:a92:d581:: with SMTP id a1mr4302609iln.218.1576092336013;
 Wed, 11 Dec 2019 11:25:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576037078.git.saiprakash.ranjan@codeaurora.org> <0101016ef3391ded-57772416-f32d-40e8-acb5-5dd1b6064f73-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ef3391ded-57772416-f32d-40e8-acb5-5dd1b6064f73-000000@us-west-2.amazonses.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 11:25:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X3Akg07hetQOgd0P_wTVWs3QpuCNQ8O6qQ5LK2ZeWSaQ@mail.gmail.com>
Message-ID: <CAD=FV=X3Akg07hetQOgd0P_wTVWs3QpuCNQ8O6qQ5LK2ZeWSaQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc7180: Add APSS watchdog node
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Sai,

On Tue, Dec 10, 2019 at 8:30 PM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Add APSS (Application Processor Subsystem) watchdog
> DT node for SC7180 SoC.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 666e9b92c7ad..a6773ad3738b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1038,6 +1038,12 @@
>                         };
>                 };
>
> +               watchdog@17c10000 {
> +                       compatible = "qcom,apss-wdt-sc7180", "qcom,kpss-wdt";

If you haven't already done it (I couldn't find it), can you please
add this to "Documentation/devicetree/bindings/watchdog/qcom-wdt.txt"?
 Presumably at the same time it would be good to change the format of
that file to .yaml.


Unrelated to sc7180, but it also feels like something is awfully
screwy here in terms of the various Qualcomm device tree files
referring to watchdog timers.  It feels wrong, but perhaps you can
educate me on how it works and I'll see the light.  Specifically:

1. It seems like the same node is used for two things on other Qualcomm SoCs

If I grep the bindings for "qcom,kpss-timer" or "qcom,scss-timer", I
get two hits:

Documentation/devicetree/bindings/timer/qcom,msm-timer.txt
Documentation/devicetree/bindings/watchdog/qcom-wdt.txt

...and, in fact, there appear to be two drivers claiming compatibility here:

drivers/clocksource/timer-qcom.c
drivers/watchdog/qcom-wdt.c

That seems super odd to me.  Is that really right?  We have two
drivers probing against the same device tree nodes?  ...and that's OK?
 If so, why does only one of the bindings list the SoC-specific
bindings names?


2. The actual nodes look really wonky.  A few examples below:

2a) arch/arm/boot/dts/qcom-apq8064.dtsi:
compatible = "qcom,kpss-timer", "qcom,kpss-wdt-apq8064", "qcom,msm-timer";

...why is the SoC-specific compatible string in the middle?  The
SoC-specific one should be first.

2b) arch/arm/boot/dts/qcom-ipq4019.dtsi:
compatible = "qcom,kpss-wdt", "qcom,kpss-wdt-ipq4019";

...same question, but in this case there is no "msm-timer" at the end?

2c) arch/arm64/boot/dts/qcom/qcs404.dtsi
compatible = "qcom,kpss-wdt";

...no SoC-specific string at all?


Thanks!

-Doug
