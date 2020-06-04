Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5522EC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 06:01:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34839207D3
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 06:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jw555azu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgFDGBP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 02:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbgFDGBP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jun 2020 02:01:15 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4648FC05BD1E
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 23:01:15 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id 5so688997pjd.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 23:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DJZP1+gPjyfqjJmlTY4dF739S7mEj8ZIghMd/Fqdu80=;
        b=jw555azuWZRfqGjRbAZrqETcpFe69qLjc6HAcp10Lq8l+cei9/6dd/4re9SHsB/tLg
         zmerrdOs8Hp7Bfi5etD1xnqKETPEqHMKMkCEQyIDvGisT6+X1iWU/AgTLVp7bN/cMw65
         x8xucTyxc9c6CRqg3skNMXBvanEL5FCuIwHntrQ2+EZ1h7oRqTlmP74MwY4dV0RZ1gOZ
         WdFNF2+lJqgYaLnMOF0JBwa7+8dErclWczisMsKyJo76WaY972l23uBcHnj8ifvgo37o
         Y4Nn5mfySqHCcMHNbRzgrB8CkKVLg7/2SLu4NPCiG2Kfr2kXV94aPoOR3sXj0k1FiepC
         QWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DJZP1+gPjyfqjJmlTY4dF739S7mEj8ZIghMd/Fqdu80=;
        b=R+vrIdNEOHhS49mKSRzm43ek7JmBMj+NM7caLnrOn6PvOM5eJYGlGrXPGk1TEPeuwf
         oWQuaRhnNzCvlhnXhyAEjELDwBv/sqCxl2x4F7jNH+MbvmkZ0VonR6o+YWM/xKo1GyJ4
         njLWTSOWPZ3gwx0GnpfliFJXESZqsA5ccJJNY5w/r/b37qwWJtWW0c/9K2C83h53XfOA
         FdeAvZ82ICjHY28jhO1BkrkOnZNFZJ/eBOj5inwW2qlP6ncUsA0oR+DaPpWPh7wHmG00
         eFF8w6ZjcVtC35KgUoZQK4bt96i6o7yodCp+peRZnzCicPcS/3TmHu3G3wbsB1QMTuAt
         uZBw==
X-Gm-Message-State: AOAM5321gdI1qgtPn9M4hps8KgUwmd5aRyB/tSi0Os6jgOikiZ95AR1M
        LmtFWVkHVvxY1/LxpBSrCJma
X-Google-Smtp-Source: ABdhPJxVr9gAU1hoxHpoVIB4zzLy2ClMyZz/a+JNI9LxK5PD8CBLEu1faej0x9c7nPivFHLX/LjPLA==
X-Received: by 2002:a63:eb42:: with SMTP id b2mr2959148pgk.105.1591250474692;
        Wed, 03 Jun 2020 23:01:14 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e90:f3d4:c404:4d38:8396:d1ee])
        by smtp.gmail.com with ESMTPSA id k24sm3334303pfk.134.2020.06.03.23.01.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 23:01:13 -0700 (PDT)
Date:   Thu, 4 Jun 2020 11:31:06 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm8250: change spmi node label
Message-ID: <20200604060106.GB16719@Mani-XPS-13-9360>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
 <20200604004331.669936-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604004331.669936-2-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jun 04, 2020 at 03:43:26AM +0300, Dmitry Baryshkov wrote:
> PMIC dtsi files (pm8150*.dtsi) expect to have spmi_bus label, rather
> than just spmi. Rename spmi label accordingly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 1e2862bbfb11..9dd27aecdfda 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -991,7 +991,7 @@ pdc: interrupt-controller@b220000 {
>  			interrupt-controller;
>  		};
>  
> -		spmi: qcom,spmi@c440000 {
> +		spmi_bus: qcom,spmi@c440000 {
>  			compatible = "qcom,spmi-pmic-arb";
>  			reg = <0x0 0x0c440000 0x0 0x0001100>,
>  			      <0x0 0x0c600000 0x0 0x2000000>,
> -- 
> 2.26.2
> 
