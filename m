Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D42BC433E4
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 23:42:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 621C0206F4
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 23:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W9vYm1Lw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgGPXmi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 19:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbgGPXmi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 19:42:38 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E41C08C5C0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 16:42:37 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k5so5477885pjg.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 16:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+CvHI04bee7ou84OwZFiCwpXnlzPN58BvC/9GjdJkKo=;
        b=W9vYm1LwlJM95d17qeGx9zV4E+nImNdan0XM+3kJtATqoAFRaD5E2hFuYOhtOaZGZ5
         FnpVe1QIyPA1FAkkVbWMvO/e13GdXRg6/mt1RnvlNZxibyhvNgjtyms/kRroqQG/LyQ8
         e6n1WYaTz4HUpHfKVbB/IilJuKEeENNnnkhfMMUm3n9pceNp2MHSX9W60WztQ583k5xS
         TEvmniXNQPKWB45FxZ7yYIvxaa6zO4hLxbR+tj2Ob0fa2OJ52akYZhEl2lsLgB4D7SOk
         5XSEMszunLvRU3c2Ju7GK4I74ue1sm4mD1QbOq9QZFS//G3gUwBsVINGUIWIS/FedzZ+
         V4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+CvHI04bee7ou84OwZFiCwpXnlzPN58BvC/9GjdJkKo=;
        b=PH72wRBxmaqett/Fr/kwzWyWQtw/hahjw+rQ9FdfA6JVBS8u8H7QimBqg2cum0UN3v
         Isisz9IE/uZhCDk+OiP+vG03Jw6el6ogDUUvyTaJfuiyRLIhZsi4sK3iUbrMknW7EQ9J
         kUMIpeoQ1FG/b2J5ks3QHxt1b2yOFWM2yQzKxGzH34u5EZbr/dySvRDwcpHzqXmza9JJ
         urZBYj/h+f5KxxjbtwrYtkBYv4GgtpeTrMVJfeRkDWncGwx3oj93sxfvnhowVy+RAfRk
         kKVxzeuQ2/QjIyhKf/b5O2e+q+BLhybtXPINjl6TVzyrBk4EpkWHZ38wKy0xrC2pWhtg
         3awA==
X-Gm-Message-State: AOAM532DlC3sNHDLcInZnd/ulaGmAS/Kjv7WsubjpaWcorVvWuov9R91
        IB6/JOcSiphVTdNSfiFkPGS5AQ==
X-Google-Smtp-Source: ABdhPJxmftRI2/TXZH5UmgckYK3a26ACKc4ckDTkV3rSoYQpJAj7FgJW2jBK5gtFwQNFFLX3lsM0pg==
X-Received: by 2002:a17:90a:c28f:: with SMTP id f15mr7340552pjt.72.1594942957244;
        Thu, 16 Jul 2020 16:42:37 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i132sm5862078pfe.9.2020.07.16.16.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 16:42:36 -0700 (PDT)
Date:   Thu, 16 Jul 2020 16:40:34 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, dianders@chromium.org,
        pillair@codeaurora.org, robh+dt@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Move the fixed-perm property
 to SoC dtsi
Message-ID: <20200716234034.GG1218486@builder.lan>
References: <20200716191746.23196-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716191746.23196-1-sibis@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu 16 Jul 12:17 PDT 2020, Sibi Sankar wrote:

> All the platforms using SC7180 SoC are expected to have the wlan firmware
> memory statically mapped by the Trusted Firmware. Hence move back the
> qcom,msa-fixed-perm property to the SoC dtsi.
> 
> Fixes: 7d484566087c0 ("arm64: dts: qcom: sc7180: Add missing properties for Wifi node")
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Thank you, applied.

> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 1 -
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 860fc4658b8b1..26cc4913d3ddc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -392,7 +392,6 @@ video-firmware {
>  
>  &wifi {
>  	status = "okay";
> -	qcom,msa-fixed-perm;
>  	vdd-0.8-cx-mx-supply = <&vreg_l9a_0p6>;
>  	vdd-1.8-xo-supply = <&vreg_l1c_1p8>;
>  	vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 126e2fce26c1a..a91d3f074625e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3233,6 +3233,7 @@ wifi: wifi@18800000 {
>  				<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH /* CE10 */>,
>  				<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH /* CE11 */>;
>  			memory-region = <&wlan_mem>;
> +			qcom,msa-fixed-perm;
>  			status = "disabled";
>  		};
>  	};
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
