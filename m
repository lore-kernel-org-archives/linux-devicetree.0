Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD548C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 03:10:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82B0B20758
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 03:10:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kl4pD4LM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgESDKc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 23:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbgESDKb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 23:10:31 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4103C05BD09
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 20:10:31 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id f23so5750391pgj.4
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 20:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AJxG9LIE63AA33BzMkyehOfcgbB6kvICbFoJNIUf4Tw=;
        b=Kl4pD4LMdzo9os2+abZgtSkZC7fcWbzdYwu4Fm7c+1F4IQcZtEx9AntsNG+EimbU9S
         eOGnGp4ftBlWjUPXRKaO6I+1et3f+ph2LWlWnRhnJqyTk2r7BsI1ufE7Tk8SrGFxrC/u
         eDvyJ4yyYaoCZX/q/LL1zLU2VfDcExQUc9ABO4okrxFoOz4BflJa5w25O6Hf3bsgCOtC
         DXXkYPw9AXqChdqW/U1W244ROvX5lPfx0ERxYl5E0eu8uoiz7py/EFb3pwu48dC/3XCJ
         KkvyDUw60z7Ebxqh93Nq3Lp2EtyLs3scBigOay+8AVDDIthPr6kS8hsNlTtFS4T46JVC
         eVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AJxG9LIE63AA33BzMkyehOfcgbB6kvICbFoJNIUf4Tw=;
        b=TDM148VNWKvbtnaUJoBAH53M9TkGTIG5zmz79GfYPeVjnDCCr8FxrSnpFBe95S6Qna
         aFcjO07EZDoU2vLkhp/sMqeInyEoiD56BOm3MbL2lbkXIGzog9MPocnvA+JOXIBuBN8Q
         Ydjmyztdg1fVaWHkdnBesHi36uOmbQOI7l/Z62jcC/smt76+VpdwJH1zS7bGHFBXhycZ
         qNwM/sFAH2o88zqHT82lJ4wp+34xDvBDROkcGlC4M11xezAf2Sb90GLfqrGu8uD9GQg8
         lkUi5BEoK4VZAS/YrfDmZALAa6PAsDZhm7S05bHHWJAM+I+I41rZIwky1IBIVKR+WR+P
         YCKQ==
X-Gm-Message-State: AOAM530YHkJBNVzrRousdOKYvGqK5nzyqAqti7CHdw5FiwidKiZnzycD
        SjY1PUEJtJBz0KrgJ8jdPqlT2A==
X-Google-Smtp-Source: ABdhPJzYhnuTz/HQUgu7y0Y6OzdvrkIUvjfOQflASZSrZpZ3z/W1HtJirR07oMROAXIZpgpgY5IVHA==
X-Received: by 2002:a63:f925:: with SMTP id h37mr18652292pgi.112.1589857831106;
        Mon, 18 May 2020 20:10:31 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n23sm742545pjq.18.2020.05.18.20.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 20:10:30 -0700 (PDT)
Date:   Mon, 18 May 2020 20:09:08 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org, mka@chromium.org,
        swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Correct the pdc interrupt
 ranges
Message-ID: <20200519030908.GW2165@builder.lan>
References: <1589804402-27130-1-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589804402-27130-1-git-send-email-mkshah@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon 18 May 05:20 PDT 2020, Maulik Shah wrote:

> Few PDC interrupts do not map to respective parent GIC interrupt.
> Fix this by correcting the pdc interrupt map.
> 
> Fixes: 22f185ee81d2 ("arm64: dts: qcom: sc7180: Add pdc interrupt controller")
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

Applied

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index f1280e0..f6b4ee8 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2308,8 +2308,7 @@
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sc7180-pdc", "qcom,pdc";
>  			reg = <0 0x0b220000 0 0x30000>;
> -			qcom,pdc-ranges = <0 480 15>, <17 497 98>,
> -					  <119 634 4>, <124 639 1>;
> +			qcom,pdc-ranges = <0 480 94>, <94 609 31>, <125 63 1>;
>  			#interrupt-cells = <2>;
>  			interrupt-parent = <&intc>;
>  			interrupt-controller;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
