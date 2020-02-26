Return-Path: <SRS0=+O1R=4O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797EBC4BA13
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 15:58:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D8872467B
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 15:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582732701;
	bh=S72rfz4e7ofEv8qXcE2vMF6gMBDU4uQEXEeYcNVqqV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kA9SmGQaiDe/a+Vty29oeMPWlZHs75t7w/fviHv+r2gjM8MXQG9wqer8GYgxri0Fv
	 C6ZZM0fKgyk5MxpF6D0hrgws1ft9nHR1LHlmSi1j/7lulKSmtaYdmee2xRmFNub4CW
	 JXNsD4yUumEK5OARcCVMFagdAv7yWTpJTW18yplY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728968AbgBZP6R (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Feb 2020 10:58:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:45754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728551AbgBZP6R (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 26 Feb 2020 10:58:17 -0500
Received: from localhost (unknown [171.76.87.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7D30222C2;
        Wed, 26 Feb 2020 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582732696;
        bh=S72rfz4e7ofEv8qXcE2vMF6gMBDU4uQEXEeYcNVqqV4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kWq5EKgKjQr9M7KGd8TjaGP1qxy1nmbn8wwUsuIcWNPmUQ80mNhYluJz74ZUz98+M
         2m0SdrGy86ZG/S1gI6wZc02UzMotgkBtTN8bUtEfTf9JDmxI8OlwWGX/kNxDGGnN3y
         vLC9nysbnEcQDEr9iRHYDUs/acr0H0X11p60dexk=
Date:   Wed, 26 Feb 2020 21:28:08 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] dt-bindings: thermal: tsens: Add qcom,tsens-v2 to
 msm8996.dtsi compatible
Message-ID: <20200226155808.GY2618@vkoul-mobl>
References: <cover.1582705101.git.amit.kucheria@linaro.org>
 <4e337c4a4194bb15f9efec67821f38504de1704c.1582705101.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e337c4a4194bb15f9efec67821f38504de1704c.1582705101.git.amit.kucheria@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 26-02-20, 15:01, Amit Kucheria wrote:
> The qcom-tsens binding requires a SoC-specific and a TSENS
> family-specific binding to be specified in the compatible string.
> 
> Since them family-specific binding is not listed in the .dtsi file, we
> see the following warnings in 'make dtbs_check'. Fix them.
> 
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4a9000: compatible: ['qcom,msm8996-tsens'] is not valid
> under any of the given schemas (Possible causes of the failure):
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4a9000: compatible: ['qcom,msm8996-tsens'] is too short
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4a9000: compatible:0: 'qcom,msm8996-tsens' is not one of
> ['qcom,msm8916-tsens', 'qcom,msm8974-tsens']
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4a9000: compatible:0: 'qcom,msm8996-tsens' is not one of
> ['qcom,msm8976-tsens', 'qcom,qcs404-tsens']
> 
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4ad000: compatible: ['qcom,msm8996-tsens'] is not valid
> under any of the given schemas (Possible causes of the failure):
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4ad000: compatible: ['qcom,msm8996-tsens'] is too short
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4ad000: compatible:0: 'qcom,msm8996-tsens' is not one of
> ['qcom,msm8916-tsens', 'qcom,msm8974-tsens']
> /home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
> thermal-sensor@4ad000: compatible:0: 'qcom,msm8996-tsens' is not one of
> ['qcom,msm8976-tsens', 'qcom,qcs404-tsens']

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 7ae082ea14ea..f157cd4f53b4 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -446,7 +446,7 @@
>  		};
>  
>  		tsens0: thermal-sensor@4a9000 {
> -			compatible = "qcom,msm8996-tsens";
> +			compatible = "qcom,msm8996-tsens", "qcom,tsens-v2";
>  			reg = <0x004a9000 0x1000>, /* TM */
>  			      <0x004a8000 0x1000>; /* SROT */
>  			#qcom,sensors = <13>;
> @@ -457,7 +457,7 @@
>  		};
>  
>  		tsens1: thermal-sensor@4ad000 {
> -			compatible = "qcom,msm8996-tsens";
> +			compatible = "qcom,msm8996-tsens", "qcom,tsens-v2";
>  			reg = <0x004ad000 0x1000>, /* TM */
>  			      <0x004ac000 0x1000>; /* SROT */
>  			#qcom,sensors = <8>;
> -- 
> 2.20.1

-- 
~Vinod
