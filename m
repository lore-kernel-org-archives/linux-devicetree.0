Return-Path: <SRS0=+O1R=4O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86F4C4BA2C
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 22:06:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B978E21D7E
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 22:06:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HW7Kp17/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgBZWGV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Feb 2020 17:06:21 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38026 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727719AbgBZWGV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 26 Feb 2020 17:06:21 -0500
Received: by mail-pl1-f195.google.com with SMTP id p7so250375pli.5
        for <devicetree@vger.kernel.org>; Wed, 26 Feb 2020 14:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3TNg9o0AgO40tR/XDxm1MjdggfQKR3ry5wBqaugCysw=;
        b=HW7Kp17/GPFyTe4vflls40kHpqQXLpA18D3oNovP8FMTiAPBSkd8JQWPDfRXw3Gve5
         //7rGmktf4LwpKYg2tfELCpQ4CkjKlKjMA5zH3aUKCTFMm3R3jY/INNhaMUkLz0qCAy9
         ZFLXpEMjnEkwbRi64qRZS2ryjOV+lQk8kWQTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3TNg9o0AgO40tR/XDxm1MjdggfQKR3ry5wBqaugCysw=;
        b=r84GBW8QOHDABwlaMfbMD9Pm3vRutv87x72pkdLzSwyFalFdW9PSzrS3cRQvyTDeqc
         DKd1/nHT1e8VWG1t0PAX8Jo1oykwF7zSi36dqGcghXCrIaP4MR5CVxMlzyzwZKoPRkdc
         fHn9lG+WIfAcgndklNCHtkm/PyFEEUzjcPlCW/GDd1RXz2MloEntZgbbmH2I3Edtkfey
         OP3GvdPRZ8BdGq7TQjmOjuOyscFMmwpkTq8i+yObVpVheri406rmX5+d6MYY5HB+jxse
         i9TBxAX+OfXfkDpsDobNN7tCtoHGlYKCY/1lrHNotItDYUMztT/YvjfU1lQT/O633QcU
         wlbw==
X-Gm-Message-State: APjAAAUXSnFR528IHGHfN9HIH3es/a8w5Rwbh1/66PfnIdpcSOkagGV8
        0jprzYl+aP5l/EsrwF7OAoGGUg==
X-Google-Smtp-Source: APXvYqz1u/3C2eGWbNpQI9x0ZNxo1oAZ6TsJZf6r4k5t/IQsGAhNWUcdLhelHrgHR1RjLUwpaeMLFA==
X-Received: by 2002:a17:90a:d783:: with SMTP id z3mr1231245pju.3.1582754780551;
        Wed, 26 Feb 2020 14:06:20 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id b24sm3901071pfo.84.2020.02.26.14.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 14:06:20 -0800 (PST)
Date:   Wed, 26 Feb 2020 14:06:19 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: sc7180: Move venus node to the correct
 position
Message-ID: <20200226220619.GH24720@google.com>
References: <20200226130438.v2.1.I15e0f7eff0c67a2b49d4992f9d80fc1d2fdadf63@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200226130438.v2.1.I15e0f7eff0c67a2b49d4992f9d80fc1d2fdadf63@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Feb 26, 2020 at 01:04:55PM -0800, Matthias Kaehlcke wrote:
> Per convention device nodes for SC7180 should be ordered by address.
> This is currently not the case for the venus node, move it to the
> correct position.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Excuses for sending v2 so shortly after v1, it seems ok in this case
> since v1 is obviously wrong and the patch is not likely to be
> controversial otherwise.
> 
> Changes in v2:
> - insert the venus node *after* the usb@a6f8800 node, not before
> 
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 52 ++++++++++++++--------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 253274d5f04c..5f97945e16a4 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1332,6 +1332,32 @@ system-cache-controller@9200000 {
>  			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		venus: video-codec@aa00000 {
> +			compatible = "qcom,sc7180-venus";
> +			reg = <0 0x0aa00000 0 0xff000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&videocc VENUS_GDSC>,
> +					<&videocc VCODEC0_GDSC>;
> +			power-domain-names = "venus", "vcodec0";
> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +			clock-names = "core", "iface", "bus",
> +				      "vcodec0_core", "vcodec0_bus";
> +			iommus = <&apps_smmu 0x0c00 0x60>;
> +			memory-region = <&venus_mem>;
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +			};
> +		};
> +
>  		usb_1: usb@a6f8800 {
>  			compatible = "qcom,sc7180-dwc3", "qcom,dwc3";
>  			reg = <0 0x0a6f8800 0 0x400>;
> @@ -1538,32 +1564,6 @@ dispcc: clock-controller@af00000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> -		venus: video-codec@aa00000 {
> -			compatible = "qcom,sc7180-venus";
> -			reg = <0 0x0aa00000 0 0xff000>;
> -			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> -			power-domains = <&videocc VENUS_GDSC>,
> -					<&videocc VCODEC0_GDSC>;
> -			power-domain-names = "venus", "vcodec0";
> -			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> -				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> -				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> -				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> -				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> -			clock-names = "core", "iface", "bus",
> -				      "vcodec0_core", "vcodec0_bus";
> -			iommus = <&apps_smmu 0x0c00 0x60>;
> -			memory-region = <&venus_mem>;
> -
> -			video-decoder {
> -				compatible = "venus-decoder";
> -			};
> -
> -			video-encoder {
> -				compatible = "venus-encoder";
> -			};
> -		};
> -
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sc7180-pdc", "qcom,pdc";
>  			reg = <0 0x0b220000 0 0x30000>;

The patch has still the same problem, it would have helped to run
'git commit -a --amend', instead of 'git commit --amend' :(
