Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8482C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 03:41:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C26D920721
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 03:41:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OEbOSBMc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437390AbgE2DlK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 23:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437360AbgE2DlH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 23:41:07 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C52FC08C5C6
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 20:41:07 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q24so560982pjd.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 20:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=999gs+HXYwpU12XXE29LCP7xw0Rr+GSPVkv6l3joNHI=;
        b=OEbOSBMcyAqAaFWxdLCJZsfFrcbZJr0sQGO2J2CjporekEVvF5X7mzULzs7TSTtRwR
         pAPmJ8xn1A+ty3MA9pb8nEQ949qYK9UQxQZ8JLAyKa+MjvL0N4kb+Fm+DWMBRNMnXnTc
         WHP/SCewSDEXbsUiNWBopr5EvOx+e0ZZazAqezsivBz8pPlBi4gWkbQab73kZCH7tSPp
         qAEw8OKBxMioj2E1tjtTIIh4fpqH+jyCh3NcbAEfLTnZX7up1jzgGaOaobssuVIpdJuh
         vMsPNDFLc1/eIIMk816gh4LXgzOLZWaMDdS3m4AYd4NVf1yGDDb5NlMEWpzHcjYsSwrk
         KgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=999gs+HXYwpU12XXE29LCP7xw0Rr+GSPVkv6l3joNHI=;
        b=MN6MM476YdSJXW7yFAGP6xRVI7TlbDzcoFTlZhzF7bJU4kbqImNVGIZviADy+Qk/l7
         T8Eo2Ac5qr7BG9633ARGh4Cr36UXXTe8YAAwH0NCR++VtuVOv1+ONPkjwTNWQorHex9/
         pWlbWaWrDFDEsNxR7ipARJDB4SQdpxd95aOoo78Pyx5PMfwhb6ybabSn8Al/JtPXhiO5
         XYLtDjh24f8hkHVzaqXCqCY/N8ZuwZyavUS1cM0fxkhPRRU/t0JICmAZoZC/EPfSXrDh
         rh5fx5+rcs4Hjun//eMYlL0wDoPGYe/B1w3wAY5pyxBTGKo2p7vFPNYz35c7r6F8ACkL
         tRSA==
X-Gm-Message-State: AOAM533GWO7cCwb26V6sOILf/NXjrQOxAHibPfmUgRZMgIOlu7V3imb0
        cwEW69CdJjQGoQZXSeDhIO70iA==
X-Google-Smtp-Source: ABdhPJz5sSdQ9afx5tCPSwgn9gtn9PQD5Wp2idGU0wVC7QGrS/Ny6KqMhKojMFs+bym4EdybjebViw==
X-Received: by 2002:a17:90a:d181:: with SMTP id fu1mr7620991pjb.147.1590723666572;
        Thu, 28 May 2020 20:41:06 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x193sm5874324pfd.149.2020.05.28.20.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 20:41:05 -0700 (PDT)
Date:   Thu, 28 May 2020 20:40:00 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: change ufs node name to ufshc
Message-ID: <20200529034000.GF279327@builder.lan>
References: <20200523175232.13721-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200523175232.13721-1-jonathan@marek.ca>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat 23 May 10:52 PDT 2020, Jonathan Marek wrote:

> The ufs-qcom driver checks that the name matches the androidboot.bootdevice
> parameter provided by the bootloader, which uses the name ufshc. Without
> this change UFS fails to probe.
> 

Seems I only tested with UFS built as module, thanks for spotting this.

> I think this is broken behavior from the ufs-qcom driver, but using the
> name ufshc is consistent with dts for sdm845/sm8150/etc.
> 

I agree. Patch applied...

Thanks,
Bjorn

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index e0344d3ba159..3bdce658c08a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -309,7 +309,7 @@ uart2: serial@a90000 {
>  			};
>  		};
>  
> -		ufs_mem_hc: ufs@1d84000 {
> +		ufs_mem_hc: ufshc@1d84000 {
>  			compatible = "qcom,sm8250-ufshc", "qcom,ufshc",
>  				     "jedec,ufs-2.0";
>  			reg = <0 0x01d84000 0 0x3000>;
> -- 
> 2.26.1
> 
