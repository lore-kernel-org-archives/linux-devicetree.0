Return-Path: <SRS0=NYOC=62=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB95BCA90AF
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 18:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5D55206B8
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 18:17:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YYSeZS20"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbgELSRR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 May 2020 14:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730898AbgELSRO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 May 2020 14:17:14 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C6EC061A0F
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 11:17:14 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id u35so3532906pgk.6
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 11:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6CrSGhnhEIRDOHEAgI2prIXv4Zk1zSV9wY7VOCBni8I=;
        b=YYSeZS20xTAUougYB5zY2vSYEMB03k0uJE9xnJp4QDhzi1VM2/xdWhSW2y3iHDNeHQ
         wRADVYC/qWepf46o8002b/IcxRRstKthsNG0g+G+BXO2iBS95fJ2kldbzsqbrY6Y/J2U
         w5DAumzKTpDZUhn1gRet7vfU4lirJLuTNLQ7jlINeXedkagVOIuTvbiD0+etNMQr5d+i
         Zt9EmaXACsfhrA/PjVxV6PqgRx7bYUaWUP+L6HjXDOr7qS99n9uBqpCpnhHI7/iQACvY
         gO4NC8i32BqQwZlEsSAJVf/q0frig1nMcgwyBPskZwGi3KRvmYq9v2rMuDv5m3SB1Ggk
         vkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6CrSGhnhEIRDOHEAgI2prIXv4Zk1zSV9wY7VOCBni8I=;
        b=pddnVL5D5/uRlmaIG/MncUCrOuGUDXmx6sNQlMcyXyPGG4wvHpplQdUm4CI481zffW
         oUWtC/37CM3edegQsxROE6WkwUl64+JqMDs4DVgQc89y/LtW06DCxgv6Kri80vw/0K/d
         8PoeRwmNYqMeqPA9x2Vlr6Bq3SWvlyx6ROwzM9SdNCXMG13J6RMwicRahkGR+4Nsl5tJ
         WdgtGYc2gFBCv6OMlY5moEXKR+URM5DJjoEy+OHyxd6YH+PTzl3gKze69k3lEkuIXDyp
         sNYZAPa1NgEKLb/PRQ1arvk0d2KdWaiIabo7zdO2IG8Cjk9Lcur6iCNgG9VgJtzMK/mA
         Svcw==
X-Gm-Message-State: AGi0PuYjphwC7CsdVQ/0OKT8O/ah3NSqIKlcnBoSabpvBx+LZkkBwN6C
        YsWNBFwIoVeDxiu/IikPDJ3iyw==
X-Google-Smtp-Source: APiQypKMp50oOh3QS8rpe94xZ6riQXoxNPWZPNQFJ5MmaU8wkt9S0wo7gLqvmsrJQZfF5cTP7bYMBQ==
X-Received: by 2002:a63:4c1d:: with SMTP id z29mr19952848pga.243.1589307433400;
        Tue, 12 May 2020 11:17:13 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d10sm10436818pgo.10.2020.05.12.11.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 11:17:12 -0700 (PDT)
Date:   Tue, 12 May 2020 11:15:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/4] arm64: dts: qcom: msm8916: Add blsp_i2c1
Message-ID: <20200512181539.GH57962@builder.lan>
References: <20200426140642.204395-1-stephan@gerhold.net>
 <20200426140642.204395-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426140642.204395-2-stephan@gerhold.net>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun 26 Apr 07:06 PDT 2020, Stephan Gerhold wrote:

> MSM8916 has another I2C QUP controller that can be enabled on
> GPIO 2 and 3.
> 
> Add blsp_i2c1 to msm8916.dtsi and disable it by default.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> On samsung-a2015 there is an external TFA9895 speaker amplifier
> connected to blsp_i2c1. There isn't a proper mainline driver
> for it (yet?), but it's nice to have the I2C bus in mainline at least.
> ---
>  arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 24 ++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi      | 15 ++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> index 242aaea68804..b45fd12856ea 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> @@ -262,6 +262,30 @@ pinconf {
>  		};
>  	};
>  
> +	i2c1_default: i2c1_default {
> +		pinmux {
> +			function = "blsp_i2c1";
> +			pins = "gpio2", "gpio3";
> +		};
> +		pinconf {
> +			pins = "gpio2", "gpio3";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
> +	i2c1_sleep: i2c1_sleep {
> +		pinmux {
> +			function = "gpio";
> +			pins = "gpio2", "gpio3";
> +		};
> +		pinconf {
> +			pins = "gpio2", "gpio3";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
>  	i2c2_default: i2c2_default {
>  		pinmux {
>  			function = "blsp_i2c2";
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 8b429954ea29..6ab7cabde370 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -612,6 +612,21 @@ blsp_spi6: spi@78ba000 {
>  			status = "disabled";
>  		};
>  
> +		blsp_i2c1: i2c@78b5000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			reg = <0x078b5000 0x500>;
> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +				 <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&i2c1_default>;
> +			pinctrl-1 = <&i2c1_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		blsp_i2c2: i2c@78b6000 {
>  			compatible = "qcom,i2c-qup-v2.2.1";
>  			reg = <0x078b6000 0x500>;
> -- 
> 2.26.2
> 
