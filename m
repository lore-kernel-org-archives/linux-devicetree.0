Return-Path: <SRS0=8VFN=6H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEDAC2BA19
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Apr 2020 05:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA1982168B
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Apr 2020 05:11:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HYR8W91Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgDWFLi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Apr 2020 01:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726659AbgDWFLh (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 23 Apr 2020 01:11:37 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC3FC03C1AE
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 22:11:37 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x3so2349131pfp.7
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 22:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Yc32X/aAdo81NM2Ng9MB4yytdXrsHIlLZZkusOtg3Cs=;
        b=HYR8W91YkdfQ9BEpxvoJ5lEIoU1HlVsx791SaNb8KhkRjX5eUuy9Pd2WX1d3OmH97O
         /vCcw8DQ4uN1FVcJ6eiXVfi0UcZuAF4vYq+rlKq6Lt1tg2PDkc4xoz1lPJBy/K3YUJ8I
         a6dAPtHj/hGnN1ZrsqZt1HIBFvuUFsXvGYRDmHIsGi6wTXnrxdCYiCRFRJk0I5F+mPLW
         jUpzwIhX7M+uqTdIp2OwsVghV6fP0stzWOvj8iwnAIuyGIsj07OwIvqab8w3P+bu8f4C
         jlNTqVVIB621Al0poCevGGza6pg7o5sEFwsFqSX3zXEO17HkSUm570gpQhGFS5A5HX2A
         8fZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yc32X/aAdo81NM2Ng9MB4yytdXrsHIlLZZkusOtg3Cs=;
        b=V4tvcU0g6h/i8iXd0iMzVzvR+aDzgaadRE3PzuSyvyZ0MBckwVUFFmBK5ePn4jVMHx
         IMBnPXVHm4tYcw0UvNpK+mFrlxEh7v9Kt8AS9dl+epol8JRnD8RDq1lQ6tAm0atluLur
         JuS3+pnGpg98IAsl1PJteGVp2JLiGAwOhiKE+F6Tmjnlb6PRG+0zP2ere0Mr5NY0xMPI
         Hd4gUzl60WidlTkf7ApEXrC003AedaLS1W9bMEpdsXdlhjTBdpC5jB0Cvo3HOFX8Y+Am
         RemBBR3kkxOon7eqEOe5X7vx2Bta5eN27qIS/cxtFVIJ+SxMkvmplO4AVH/AVq1x6Mur
         z0aA==
X-Gm-Message-State: AGi0PuZU1uwsJzJ7MSj5SV4wIn0O+23mybsdEcdpSirGOdmqaw4mD3jc
        iS9Q+TG8hnYalU6kPtmOty13Lk5RYaM=
X-Google-Smtp-Source: APiQypLLlBRF6h5e5tqeCuF1xkPBkYwn9ONGOEDPFznQbi6y+fM664bxJYpObA+MQw707I67sCzrUA==
X-Received: by 2002:aa7:9d90:: with SMTP id f16mr2201897pfq.48.1587618697014;
        Wed, 22 Apr 2020 22:11:37 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r26sm1344769pfq.75.2020.04.22.22.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 22:11:36 -0700 (PDT)
Date:   Wed, 22 Apr 2020 22:12:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        coresight@lists.linaro.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com
Subject: Re: [PATCH] dt-bindings: qcom: Add CTI options for qcom msm8916
Message-ID: <20200423051203.GA2166963@builder.lan>
References: <20200415201230.15766-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415201230.15766-1-mike.leach@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed 15 Apr 13:12 PDT 2020, Mike Leach wrote:

> Adds system and CPU bound CTI definitions for Qualcom msm8916 platform
> (Dragonboard DB410C).
> System CTIs 2-11 are omitted as no information available at present.
> 
> Tested on Linux 5.7-rc1.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks Mike, I adjusted subject and have applied the patch towards 5.8.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 85 +++++++++++++++++++++++++--
>  1 file changed, 81 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index a88a15f2352b..194d5e45f4e5 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/reset/qcom,gcc-msm8916.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/arm/coresight-cti-dt.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -1424,7 +1425,7 @@
>  			cpu = <&CPU3>;
>  		};
>  
> -		etm@85c000 {
> +		etm0: etm@85c000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0x85c000 0x1000>;
>  
> @@ -1443,7 +1444,7 @@
>  			};
>  		};
>  
> -		etm@85d000 {
> +		etm1: etm@85d000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0x85d000 0x1000>;
>  
> @@ -1462,7 +1463,7 @@
>  			};
>  		};
>  
> -		etm@85e000 {
> +		etm2: etm@85e000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0x85e000 0x1000>;
>  
> @@ -1481,7 +1482,7 @@
>  			};
>  		};
>  
> -		etm@85f000 {
> +		etm3: etm@85f000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0x85f000 0x1000>;
>  
> @@ -1500,6 +1501,82 @@
>  			};
>  		};
>  
> +		/* System CTIs */
> +		/* CTI 0 - TMC connections */
> +		cti@810000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x810000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		/* CTI 1 - TPIU connections */
> +		cti@811000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x811000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		/* CTIs 2-11 - no information - not instantiated */
> +
> +		/* Core CTIs; CTIs 12-15 */
> +		/* CTI - CPU-0 */
> +		cti@858000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0x858000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&CPU0>;
> +			arm,cs-dev-assoc = <&etm0>;
> +
> +		};
> +
> +		/* CTI - CPU-1 */
> +		cti@859000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0x859000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&CPU1>;
> +			arm,cs-dev-assoc = <&etm1>;
> +		};
> +
> +		/* CTI - CPU-2 */
> +		cti@85a000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0x85a000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&CPU2>;
> +			arm,cs-dev-assoc = <&etm2>;
> +		};
> +
> +		/* CTI - CPU-3 */
> +		cti@85b000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0x85b000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&CPU3>;
> +			arm,cs-dev-assoc = <&etm3>;
> +		};
> +
> +
>  		venus: video-codec@1d00000 {
>  			compatible = "qcom,msm8916-venus";
>  			reg = <0x01d00000 0xff000>;
> -- 
> 2.17.1
> 
