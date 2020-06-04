Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1D2C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 06:09:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8E9E2072E
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 06:09:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oufxK46S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgFDGJy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 02:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgFDGJy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jun 2020 02:09:54 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E69C03E96D
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 23:09:53 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id n9so1782249plk.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 23:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=caQqv9S8b8cCOYSCHeKAinsXoZMFcS096zEYFbBlNgA=;
        b=oufxK46SCdMr2NwRRhoFlgS903NCFRlcGP6HCu94kPp3Y8TzL7Gs6xueBEQJP9FWBC
         RjsEXvENgRz1B47jcl6M1AYyjMKfDn+qtuEwRelzCikbSpQ12fYrdXMJN5Xm0SCPM9xE
         NckZFul9iPmRNKlYTe1mZpLTM9tChjpbW53Jqp51O1uRF40g1l3rPROHRrKohsSwa3Rd
         RivOapi1wIMCbnfpqgHEs8j0q5o+u0vmAzCYEDg3Hx/y3sHmmI21m78uALjMnye74ZmE
         FiSFEnVm1SW1CQWz4A/8EpUXI/y90K4wfBw8INb8os9bSS1bq1XsyNbibC8+kLJeA5Tb
         ABVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=caQqv9S8b8cCOYSCHeKAinsXoZMFcS096zEYFbBlNgA=;
        b=s8NgmarZSP0sTJu2O+I71CGpXnlUD7ROskX0dizwO0SDYfihq2LDKua0GaaOiml9F8
         7hp9Wnmczct59j1YPa6jx15aoUclo3teFAeujlqJ0RCf23li1dZJqckHLdCf1KDgJlBg
         yfz2oU3f3zc58Tdf5YopgMPBXsK2XtTpURjNNHethC67Ncsf8BW9ehAuILIGE+COOSmq
         E085oe0GlXa5a8Wtu3EUVTvkjw7xLvS9EEHwnu1boEmbaIyt/PjPyUPzHe2nSeQMQlEy
         MBzJNPeJh/UF59zjcJWp7omCmFjfB700tPnP6ePaF+ThoeROU7MSKoou/e0eTPXaBET2
         8Tgw==
X-Gm-Message-State: AOAM533RByMqeMIr5ea9tFPeEoFun7FfYCc/2XP0SYuWdftHUAOgLeLc
        ef/0sADOt5em6S6qJi6ph1qTYZ/tvg==
X-Google-Smtp-Source: ABdhPJxnjnbt2tgWfRunhBGV1HDUgmUd9z0HDkHgXt/Qzbmh7wYmlGEyPaZQXYYUFcnVYb+28/eoXA==
X-Received: by 2002:a17:90a:20a2:: with SMTP id f31mr4379257pjg.34.1591250992468;
        Wed, 03 Jun 2020 23:09:52 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e90:f3d4:c404:4d38:8396:d1ee])
        by smtp.gmail.com with ESMTPSA id e127sm3469337pfe.45.2020.06.03.23.09.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 23:09:51 -0700 (PDT)
Date:   Thu, 4 Jun 2020 11:39:44 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: pm8150: enable rtc device
Message-ID: <20200604060944.GE16719@Mani-XPS-13-9360>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
 <20200604004331.669936-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604004331.669936-6-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jun 04, 2020 at 03:43:30AM +0300, Dmitry Baryshkov wrote:
> Enable rtc device provided by the pmic.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm64/boot/dts/qcom/pm8150.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> index fee2db42f4cb..762fb902db81 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> @@ -71,8 +71,6 @@ rtc@6000 {
>  			reg = <0x6000>;
>  			reg-names = "rtc", "alarm";
>  			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
> -
> -			status = "disabled";
>  		};
>  
>  		pm8150_gpios: gpio@c000 {
> -- 
> 2.26.2
> 
