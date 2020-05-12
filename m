Return-Path: <SRS0=NYOC=62=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8753C2D0F7
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 20:26:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9650620747
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 20:26:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QoxeALWt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbgELU0P (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 May 2020 16:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725950AbgELU0O (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 May 2020 16:26:14 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4BBC05BD0D
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 13:26:13 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id a4so6712373pgc.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hf8u/FwaVvgqSOEmZzk2sCNjlpK0lHpr3UPDWazaR2Y=;
        b=QoxeALWt+Phg1Y5xvPvc+yC7kf1URW8QNGvYGTgTMMk4y+joJOQE4ELuLbGz/AH6Wx
         qyMEEw/soOeEyWq/iR9/lTFpmGOAM5E4u8JIG8A0y9so1cosGrif3WovUtsasZ1xgtUu
         oDLD6aEF7Fz4y/PlZVTNm7Jr6PrDzNzYyiErKAqJulvMkw1tMvxrHCP2xHmjd3IPu+Ft
         OffkO1M6BYxqWTwoLBAwVM6U/15XwO/YMM+LXMZAsew1ZO7e5apTnqnhdYN4Iqo4jwSE
         aeWfJ0rg5hcJnDmeW4Rb7UKX66yFSrcvN+hzLIXwXlEThvrYsBAjS5kOJwhaBlC1brr+
         YyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hf8u/FwaVvgqSOEmZzk2sCNjlpK0lHpr3UPDWazaR2Y=;
        b=phR8pPVduTN/i890XIL1kcscaMu6QyOohY7yJkseaXc9cCKE5SlgRBOnML35wvFWXL
         mcxWWmKkCK5kGwrmSIDIVV6TyHW1v5Bmf5huz4/fLm5Lv71Xb3Xb4iDKsqtUrff7DhA7
         1Btw4hzQQSX2+UJcotq6B92TiwQOR/Xf2adtdf46oAuLEwVcyxQEAM/GXbdfuXVMDxSF
         O6r6XQIbzjdKQZUgXpV3oSx6e7u3R14bamZSdISlpZLo2aQ+ihdt+0xdVphQiqM5uyxk
         dZeSam7xNk8Ng+BSgU4CDG6x2nZNmw4xGxpq/8AG1mocqhMC6+gxG+E5V13WIjDUx6Fy
         QHsg==
X-Gm-Message-State: AGi0PuYA6a7yoHPyMS1sF8gxRpuwy3Q19mNcveuFKuVaYiiEb9K2t2TL
        zTnA54z/3CD4AgJta8CHZYy6hQ==
X-Google-Smtp-Source: APiQypKvP4JTRPU10Z/QlH/qaxqh9uVfwanejPjs00mSq7UCRg1PX40Nu6fqh0g8byS2KINrwXw8Tg==
X-Received: by 2002:a63:180a:: with SMTP id y10mr22641316pgl.204.1589315172346;
        Tue, 12 May 2020 13:26:12 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r26sm13066527pfq.75.2020.05.12.13.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 13:26:11 -0700 (PDT)
Date:   Tue, 12 May 2020 13:24:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 8/8] arm64: dts: ipq6018: Add a53 pll and apcs clock
Message-ID: <20200512202439.GK2165@builder.lan>
References: <1588573224-3038-1-git-send-email-sivaprak@codeaurora.org>
 <1588573224-3038-9-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588573224-3038-9-git-send-email-sivaprak@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun 03 May 23:20 PDT 2020, Sivaprakash Murugesan wrote:

> add support for apps pll and apcs clock.
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 1aa8d85..af2ceeb 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -294,12 +294,22 @@
>  		};
>  
>  		apcs_glb: mailbox@b111000 {
> -			compatible = "qcom,ipq8074-apcs-apps-global";
> -			reg = <0x0b111000 0xc>;
> -
> +			compatible = "qcom,ipq6018-apcs-apps-global";
> +			reg = <0x0b111000 0x1000>;

My documentation states that IPQ8074 indeed has this block at
0x0b111000, but IPQ6018 it's at 0x6b111000. Can you confirm this is
correct? Same with the pll below.

Apart from that the patch looks good.

Regards,
Bjorn

> +			#clock-cells = <1>;
> +			clocks = <&apsspll>, <&xo>;
> +			clock-names = "pll", "xo";
>  			#mbox-cells = <1>;
>  		};
>  
> +		apsspll: clock@b116000 {
> +			compatible = "qcom,ipq-apss-pll";
> +			reg = <0x0b116000 0x40>;
> +			#clock-cells = <0>;
> +			clocks = <&xo>;
> +			clock-names = "xo";
> +		};
> +
>  		timer {
>  			compatible = "arm,armv8-timer";
>  			interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -- 
> 2.7.4
> 
