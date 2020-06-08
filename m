Return-Path: <SRS0=7QPV=7V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FE0C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 08:46:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A468206A4
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 08:46:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=verdurent-com.20150623.gappssmtp.com header.i=@verdurent-com.20150623.gappssmtp.com header.b="zi2NO46i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729169AbgFHIqH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 8 Jun 2020 04:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729103AbgFHIqH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 8 Jun 2020 04:46:07 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6E9C08C5C3
        for <devicetree@vger.kernel.org>; Mon,  8 Jun 2020 01:46:07 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id y123so9303967vsb.6
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2020 01:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=64A2FnXHOnhKbKX5ZY0Lwp2qInzgNJlK1yE+iCEUB2c=;
        b=zi2NO46iTKyOAoteGkDuClNVK8wCMGExYq7GvBmtTtzG6uLVPwbw3Us1c9bpCBg2F+
         ngjqCxgoJ5WBwhU1agSHUovYdgvAYC5XY0fbSgr2bX1dm21jwx3E7E2H3iCwoZLxHya6
         Gt0lSx4ZGamB3qyJLilieNM1IzXwSpf1FYxP4EVwvxysWn/Uxh7L9FmGLiCj8e548RT6
         XHV+nel8GFXvMalAbbd26NaNy9Tf7xyn3jHYyIifUbyLcAs8udRfBa+XPRp4zlMl8QS+
         9X2oCWZTErnbOG9g2APtxN6kToNbaXo2PC1dVYA5fwTuJQC4uiT0TpE+Mx8lqXfIN12A
         b56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=64A2FnXHOnhKbKX5ZY0Lwp2qInzgNJlK1yE+iCEUB2c=;
        b=PgCXyVhlplqee59TAnEvBFjDDKvqd0jLt11xWF/jyRBjhzX8UYgS0cned5CdD+BBhi
         JwqhzIyL4aF/EMPv2cgOqgWFl0ZHz1lH1ZWoWuQcpKuQ66XEEmR9Dxnw/b+TNtwiyXlZ
         tie+oixrNY15YJOHge9dZX/gmHHg0zIw71Wb8+TKtOf9qUgArLtmu0hGYm+NN+djFP99
         OsIfeOIfYsTc90cpacMVR6AD/Im7wdrdrXVT8bAxDhEbwmF3sKur+toOSlyPMuvCq3ky
         xtMp1LIWnfb+uhcvWwMYVjrfxBJpgBoC9frwEYti9vdQnIEwbjD7Kt2yT2HRT5js6dDp
         b1UQ==
X-Gm-Message-State: AOAM533gG95Dj3AUAhf45CBvnL2UP30uSAf/JUO6FB1CPwG+zFZMrYmu
        FKf9YIsUq06gOvjMcJewvMSXutZRMSFZ0StD84freA==
X-Google-Smtp-Source: ABdhPJxwdVj9H5uiCfpLfmQbrdooJN0U/2DU7ASBZQLJA1upsMZs/NFlcPLXWHvtuQJuwRdRE1T1GLAG3F+XC1ngqIU=
X-Received: by 2002:a67:ea98:: with SMTP id f24mr2449882vso.159.1591605966040;
 Mon, 08 Jun 2020 01:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org> <20200604004331.669936-4-dmitry.baryshkov@linaro.org>
In-Reply-To: <20200604004331.669936-4-dmitry.baryshkov@linaro.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Mon, 8 Jun 2020 14:15:55 +0530
Message-ID: <CAHLCerM1HN8kC7inh55Zj+bT5WPijkexheHJshKf4oKaKgRfqg@mail.gmail.com>
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm8x50: add empty thermal zone nodes
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, patches@linaro.org,
        linaro-kernel@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jun 4, 2020 at 6:13 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add empty thermal_zone nodes. They will be populated by PMIC dtsi files,
> describing thermal sensors and trip points for zones handled by PMICs.

This is unnecessary. I've already started preparing patches that add
the thermal zones for the two socs.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 3 +++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 141c21dfa68c..869a54352d77 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -857,6 +857,9 @@ cpufreq_hw: cpufreq@18323000 {
>                 };
>         };
>
> +       thermal_zones: thermal-zones {
> +       };
> +
>         timer {
>                 compatible = "arm,armv8-timer";
>                 interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 9dd27aecdfda..972d8e04c8a2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -1736,6 +1736,9 @@ cpufreq_hw: cpufreq@18591000 {
>                 };
>         };
>
> +       thermal_zones: thermal-zones {
> +       };
> +
>         timer {
>                 compatible = "arm,armv8-timer";
>                 interrupts = <GIC_PPI 13
> --
> 2.26.2
>
