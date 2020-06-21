Return-Path: <SRS0=az0Z=AC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144BCC433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 07:21:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5A0F23AC9
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 07:21:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yt7zuV6i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729404AbgFUHVb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 21 Jun 2020 03:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729388AbgFUHVa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 21 Jun 2020 03:21:30 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 566CAC061795
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 00:21:30 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b7so5651746pju.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 00:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zhhnd4ooynuYp+DByQntd+/eACdv1P9A50jueK+9Jz0=;
        b=yt7zuV6i6+kuAthGmj/DlOb4D50uMszJWqg3anEKpSeMOmcg+ci2KBcvYWRChL2n1I
         uY58D9qvZmXynLUO2XjAdZje5PKshv7DEzG4kEW0GLW661dQ/3NiLnzkDD+cD5i+Lyu7
         Nepf5U5yH94YPZCd3al6F+60jUOMoMR0luaFoAF9IAiG8jJ/EwdIlsYdqFZFMQeFQNK2
         58oVfyVV+WSkes/l+iAKwUZf19DhK6tYuQcWWNDEcC2FVHHLqtNMSdfUOl0Vx9DBBZU4
         y16F1XtYEi340XdbzH1u42PWqLRbB9BzKJXBXxlNWs0xo+rt9ot93mU3mJ7hwhhKZPLm
         TOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zhhnd4ooynuYp+DByQntd+/eACdv1P9A50jueK+9Jz0=;
        b=FdNeIAck2s1pahuXli5e5O2EKK92TBCQjkiKsE8cVgxNsH85y1fS2x7cv13P6Xeowl
         7QOQ6VGhHF5SkTXrP4OjLaDvg7+dyCdYrWGyPN2F82AO9UiJCT3dcsXSPLvwCPeUHSxL
         Zd3ccj9P/SdwFMUt7syFdJinktoipfFuey/6BfzF+rM05OKj8ZxF7HaGOKO6kUkpWcS9
         cL859AbdAIzH7Rc2iNlA6fJANcz2WHk9kIAbIN8Iil7Z1+AZCcMQhlVCynF4RFV9fj+l
         n4gIn8iYTnl/Kv0FVba+SvnmPXru774zlI523hwBMdiGkixU4j2VwDPb+MIOoH9wJaDX
         67uQ==
X-Gm-Message-State: AOAM53381SAtW2C/nLidu/ZHfuCxJjGhIASJYf2Fshko/KMg2oMLbZdZ
        ykzZ2wPfZbVPI/SM80jhZdzpjg==
X-Google-Smtp-Source: ABdhPJwlGPhiIqDqP8vcOExyveA/1VsmWOgswjkutg/xCC/ADeseuuGLBVqwQm3jgUsHhE1UtCJcng==
X-Received: by 2002:a17:90a:eac8:: with SMTP id ev8mr11655642pjb.80.1592724089756;
        Sun, 21 Jun 2020 00:21:29 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e124sm10106487pfh.140.2020.06.21.00.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 00:21:28 -0700 (PDT)
Date:   Sun, 21 Jun 2020 00:18:41 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        sibis@codeaurora.org, manivannan.sadhasivam@linaro.org,
        dmitry.baryshkov@linaro.org, Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8250: Add thermal zones and
 throttling support
Message-ID: <20200621071841.GF128451@builder.lan>
References: <cover.1591684754.git.amit.kucheria@linaro.org>
 <bf5ca7777fbb6f5e2d374a9a72d1e17d485bd8ea.1591684754.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf5ca7777fbb6f5e2d374a9a72d1e17d485bd8ea.1591684754.git.amit.kucheria@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon 08 Jun 23:44 PDT 2020, Amit Kucheria wrote:

> sm8250 has 24 thermal sensors split across two tsens controllers. Add
> the thermal zones to expose them and wireup the cpus to throttle on
> crossing passive temperature thresholds.
> 
> Update the comment in the drivers to list the SoCs it supports.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 766 +++++++++++++++++++++++++++
>  drivers/thermal/qcom/tsens-v2.c      |   2 +-
>  2 files changed, 767 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index deaa8415c7b72..5cd18cd8a675b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -86,6 +87,7 @@ CPU0: cpu@0 {
>  			enable-method = "psci";
>  			next-level-cache = <&L2_0>;
>  			qcom,freq-domain = <&cpufreq_hw 0>;
> +			#cooling-cells = <2>;

This doesn't apply to linux-next.

The problem seems to be that, as pointed out when I submitted that
patch, the previously anonymous "cpufreq hardware" is now replaced by
the "EPSS" hardware block.

So we need a new driver (or update the existing one) to support this new
hardware block.

Presumably though, without this there's not much cooling anyways - which
is sad, as your patch looks good.

>  			L2_0: l2-cache {
>  			      compatible = "cache";
>  			      next-level-cache = <&L3_0>;
[..]
> diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
> index b293ed32174b5..58cac8f2a358c 100644
> --- a/drivers/thermal/qcom/tsens-v2.c
> +++ b/drivers/thermal/qcom/tsens-v2.c
> @@ -26,7 +26,7 @@
>  #define TM_TRDY_OFF			0x00e4
>  #define TM_WDOG_LOG_OFF		0x013c
>  
> -/* v2.x: 8996, 8998, sdm845 */
> +/* v2.x: 8996, 8998, sc7180, sdm845, sm8150, sm8250 */

Even though it's trivial, can you please send this through the tsens
tree instead, so we don't end up having unnecessary merge conflicts.

Regards,
Bjorn

>  
>  static struct tsens_features tsens_v2_feat = {
>  	.ver_major	= VER_2_X,
> -- 
> 2.25.1
> 
