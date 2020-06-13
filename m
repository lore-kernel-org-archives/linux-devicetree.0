Return-Path: <SRS0=mubR=72=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A174BC433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 13 Jun 2020 20:23:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77096207DD
	for <linux-devicetree@archiver.kernel.org>; Sat, 13 Jun 2020 20:23:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z7nYoDyM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgFMUXa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 13 Jun 2020 16:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgFMUX0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 13 Jun 2020 16:23:26 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9961C03E96F
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2020 13:23:25 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id c15so4365500uar.9
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2020 13:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8F8rDggZZb6P87zVlxWd51Hiut+wbH0vXk4GSdYwO64=;
        b=Z7nYoDyM1Dq+80bZyzkS/Cw7kiHinBMBLzwXfWmZF1H7dX2P2PrEdepadxnIlVRfxu
         zKZrzsSZbeQVqRi5Bnekc/N80nYXhDPN+NZD7hL3u+gzmmkZIiUw4ZdxBRNoSuee276j
         s4dTOeEa3dioV6eUFMQqyOvp4DJqnMqzkFSHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8F8rDggZZb6P87zVlxWd51Hiut+wbH0vXk4GSdYwO64=;
        b=k7f6RHOayEemx/hs1yK6KsyAtm3fAXg3SyGYcyJAePOyj+lbLPyyRs872CasvZ/AC9
         CBvmeWk+LveKlD9h0XHwI7XmBlSfEMrKf3BM7u2eOk1xsYGDwM9SxJ4KuXqe7WZfefqV
         Zhuj6djJNA9CBGydaqvJcuD1bC7algtVQkop6eIOxiIZeSuWcRADySAbQh4i/BUu5GKv
         p7uEtd4AOE+HnKR59eQI/T8BIz+sdoMOPf+LNEUWo8wGVjflZITvfq9xhnF0MHbSOD0Y
         hhSjxsCY7RcnjlYCqRbEjvpbfFYMC88qkbkzqyfQjOFPvxyfaTRVzD3yizm4sCUqA4TE
         zY/Q==
X-Gm-Message-State: AOAM532U/+ZYilCJ68eAEXCirqKQx/8O3kVJMUuIO3Le4MEIgkJlFq1K
        5+hVAbcoJS/NvV51L9OQvjqnWV3CYx4=
X-Google-Smtp-Source: ABdhPJywAxSfbaemX2bxw+BJX0xVVlptOwMF0aerE9NhKlMm00ov8cAPVFFr3/beFDxO1lcaqx1CDg==
X-Received: by 2002:a9f:2e09:: with SMTP id t9mr14191224uaj.118.1592079802540;
        Sat, 13 Jun 2020 13:23:22 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id t2sm1596618vka.28.2020.06.13.13.23.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2020 13:23:21 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id y123so7243042vsb.6
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2020 13:23:21 -0700 (PDT)
X-Received: by 2002:a67:8881:: with SMTP id k123mr14750073vsd.198.1592079801068;
 Sat, 13 Jun 2020 13:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <1591868882-16553-1-git-send-email-rbokka@codeaurora.org> <1591868882-16553-4-git-send-email-rbokka@codeaurora.org>
In-Reply-To: <1591868882-16553-4-git-send-email-rbokka@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Sat, 13 Jun 2020 13:23:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBbm_kGBdkhf5Hx5pDFEsYeX4o-SL=a5rPt-R_8FjNqg@mail.gmail.com>
Message-ID: <CAD=FV=XBbm_kGBdkhf5Hx5pDFEsYeX4o-SL=a5rPt-R_8FjNqg@mail.gmail.com>
Subject: Re: [RFC v2 3/3] arm64: dts: qcom: sc7180: Add qfprom-efuse
To:     Ravi Kumar Bokka <rbokka@codeaurora.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        dhavalp@codeaurora.org, mturney@codeaurora.org,
        sparate@codeaurora.org, c_rbokka@codeaurora.org,
        mkurumel@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Jun 11, 2020 at 2:49 AM Ravi Kumar Bokka <rbokka@codeaurora.org> wrote:
>
> This patch adds device tree node for qfprom-efuse controller.
>
> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  4 ++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 10 ++++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 4e9149d..2a9224e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -287,6 +287,10 @@
>         };
>  };
>
> +&qfprom {
> +       vcc-supply = <&vreg_l11a_1p8>;
> +};
> +
>  &qspi {
>         status = "okay";
>         pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 31b9217..20f3480 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -498,9 +498,15 @@
>                         #power-domain-cells = <1>;
>                 };
>
> -               qfprom@784000 {
> +               qfprom: qfprom@780000 {

The dt schema checker claims that your node should actually be called:

eeprom|efuse|nvram

So you probably want the above to actually be:

qfprom: efuse@780000

The label to the side doesn't matter and so it can stay qfprom--just
the node name itself is what the checker cares about.


>                         compatible = "qcom,qfprom";

As per my response in the bindings, this should be:

  "qcom,sc7180-qfprom", "qcom,qfprom"

...even if the driver only ever makes use of "qcom,qfprom" this
future-proofs us a bit.


> -                       reg = <0 0x00784000 0 0x8ff>;
> +                       reg = <0 0x00780000 0 0x7a0>,
> +                             <0 0x00782000 0 0x100>,
> +                             <0 0x00784000 0 0x8ff>;
> +                       reg-names = "raw", "conf", "corrected";

As per my response in the bindings, reg-names is discouraged so you
should remove and make it so that the driver doesn't need.


> +

It's hard to tell in email, but checkpatch yells above the above line:

    ERROR: trailing whitespace
    #53: FILE: arch/arm64/boot/dts/qcom/sc7180.dtsi:512:
    +^I^I^I$



> +                       clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
> +                       clock-names = "secclk";

As per the binding spec, clock name shouldn't end in "clk".

For your edification, I provided a patch to fix all my review feedback at:

https://crrev.com/c/2244933

Feel free to squash it into your next version.


-Doug
