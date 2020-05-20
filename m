Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F243EC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 15:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2B6F20671
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 15:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="el2iAQUk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgETP4l (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 11:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgETP4l (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 11:56:41 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB0F1C061A0E
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 08:56:40 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id 5so1507659pjd.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 08:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hOwD4KDmO4c54eHC+Ps5e7+C9BlvcIc1+wZ5clo9GBI=;
        b=el2iAQUkBGchfrlbgxzUCLqjga7+Ob0EEoW20tub+n9btv1zPGHLURO13+XF+P9/HC
         aN+914Hwt6YrWpA3iI2e+NVuOdYIy1bAs3i2iwIWSVsdz1p3dU0q2VssY5514UEwlTWn
         VC5OIcKBaQGkQidMaUyPFd7b0i7h/5cs11KjD5FrYuBfHm6IxW1HYgw1vsHTNcGpI1hd
         uSYsIni/J1PhCfznnYnCMDnkuMLK3cm+SKZLfEu157InBY30/jk8ZHb2e6Va+TRL5GvP
         zgasJCyxJyAyPYR1usWzAMHCBo0mGgyPdvggYsEV8LCMF1AnwnV/Vub9UAifR1tLLEIn
         hoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hOwD4KDmO4c54eHC+Ps5e7+C9BlvcIc1+wZ5clo9GBI=;
        b=R854sF2xLUxj+ILxqyMfTseJw/m2NPj9/yIt4Oi6C14UcEKFOlbTNZ4SAp0us/GC+h
         80gk4mRy5baB0aMOc2wUNvMHfyUJQqisEvclSphz6s7iDWpb/dLQQuRgExuynrGyD6Ww
         PyumxelBwy8RVsVFL79fad6YqKyjvEliODj6j9h8XROnP8359VSr0DWMf0JoGZ0kH679
         r3Wr4T4htFCmLMOOIpnIZm+Ia9EsYZciASTa4/9yUFWUDc+rwc1fq+CQLzrztXvEHbL+
         by8FK+O2Jsv2Qno6UFYlTRVux/JBLIdOHya4J25/I7/RuHgFckzyoNyLJHJPxjKo4F5M
         phwA==
X-Gm-Message-State: AOAM5308gZvAgI/Tp/XWlzxYItKsKQeB0EYHtZ7mbqGL6I2oX6m+MMlV
        QwHEFGZhijJknKpR0NYPbS4=
X-Google-Smtp-Source: ABdhPJwEo2UcjRjR81rH/5WnV+UzjCPf8Krxexr6Grt7MJHVm0iEcnG4e4+TfhxI6Ptd1DKhH6nU7g==
X-Received: by 2002:a17:90a:db0c:: with SMTP id g12mr6058124pjv.5.1589990200391;
        Wed, 20 May 2020 08:56:40 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x62sm2450278pfc.46.2020.05.20.08.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 08:56:39 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: bcm: HR2: Fix PPI interrupt types
To:     Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
        robh+dt@kernel.org, rjui@broadcom.com, sbranden@broadcom.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20200520043042.7281-1-hamish.martin@alliedtelesis.co.nz>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <685f412c-5c52-ef56-bf9d-e42b72b3b993@gmail.com>
Date:   Wed, 20 May 2020 08:56:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520043042.7281-1-hamish.martin@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 5/19/2020 9:30 PM, Hamish Martin wrote:
> These error messages are output when booting on a BCM HR2 system:
>     GIC: PPI11 is secure or misconfigured
>     GIC: PPI13 is secure or misconfigured
> 
> Per ARM documentation these interrupts are triggered on a rising edge.
> See ARM Cortex A-9 MPCore Technical Reference Manual, Revision r4p1,
> Section 3.3.8 Interrupt Configuration Registers.
> 
> The same issue was resolved for NSP systems in commit 5f1aa51c7a1e
> ("ARM: dts: NSP: Fix PPI interrupt types").
> 
> Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>

Thanks Hamish, this should also have a:

Fixes: b9099ec754b5 ("ARM: dts: Add Broadcom Hurricane 2 DTS include file")

I will take care of adding it while applying, thanks!

> ---
>  arch/arm/boot/dts/bcm-hr2.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/bcm-hr2.dtsi b/arch/arm/boot/dts/bcm-hr2.dtsi
> index 6142c672811e..5e5f5ca3c86f 100644
> --- a/arch/arm/boot/dts/bcm-hr2.dtsi
> +++ b/arch/arm/boot/dts/bcm-hr2.dtsi
> @@ -75,7 +75,7 @@ a9pll: arm_clk@0 {
>  		timer@20200 {
>  			compatible = "arm,cortex-a9-global-timer";
>  			reg = <0x20200 0x100>;
> -			interrupts = <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <GIC_PPI 11 IRQ_TYPE_EDGE_RISING>;
>  			clocks = <&periph_clk>;
>  		};
>  
> @@ -83,7 +83,7 @@ twd-timer@20600 {
>  			compatible = "arm,cortex-a9-twd-timer";
>  			reg = <0x20600 0x20>;
>  			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) |
> -						  IRQ_TYPE_LEVEL_HIGH)>;
> +						  IRQ_TYPE_EDGE_RISING)>;
>  			clocks = <&periph_clk>;
>  		};
>  
> @@ -91,7 +91,7 @@ twd-watchdog@20620 {
>  			compatible = "arm,cortex-a9-twd-wdt";
>  			reg = <0x20620 0x20>;
>  			interrupts = <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) |
> -						  IRQ_TYPE_LEVEL_HIGH)>;
> +						  IRQ_TYPE_EDGE_RISING)>;
>  			clocks = <&periph_clk>;
>  		};
>  
> 

-- 
Florian
