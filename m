Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D07C47247
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 15:56:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 684212084D
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 15:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20150623.gappssmtp.com header.i=@nexus-software-ie.20150623.gappssmtp.com header.b="Nx3LC3Ib"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgEGP4m (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 11:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727067AbgEGP4m (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 11:56:42 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 550E0C05BD43
        for <devicetree@vger.kernel.org>; Thu,  7 May 2020 08:56:42 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j5so7025918wrq.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2020 08:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9nd2a3PO/+LDgm1Vu9n0q5s4h9DVCpLpJzPVuCZ63KU=;
        b=Nx3LC3IbvKtNTVEmAzQ/KFOqYYpw/GP1+cD1yxWaXF9ZN50dmGcN+FwQzWUJHf2SiJ
         HYOLhybnWiXpx+N6hpWSUtUUpne2o1FQunmFR88u7qw4m//q3YwjbfOeIl4v4Kd1WP1M
         sQ1JUR9bi7Qr/c0rwFj1q7QG0YR52asMBJJ/Njqs7ZuKSnAIwWru6sdJinpKQ1IU2Hd0
         bGT0DumcFKjKO5xedyLSFcC++pEDuhORe4ydAlnY3JwOAg731Zz3BV3xOToURDMTj8lA
         Sk0Kc4rfad7Mav3BaoCGj4zJt6I0gBbPPqhsC6tC1ZBMMf/h/geoZwSDg+35zO1uk6sk
         QzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9nd2a3PO/+LDgm1Vu9n0q5s4h9DVCpLpJzPVuCZ63KU=;
        b=Ke8rENFWiE4IBtWzwahmsxOfQw89dlV1W7gfzpQgW+8HQ5WSbu83OYMThZy0uMUFax
         9jexnQfSX/r30qSMFNdWSoyDAGtxbXK3P8Qy1VXZ7gtVFcE9q/ggTLS1KtPU6gE8St+G
         lv2VFTZ90+FRNFzpwPZe5yDISObhworESOCHeHCevi5TzOZYnlOl9Nj+L+Xr1iiIhI5u
         dZ6MdFRi3pacGAsZnSYY1yRgPphbzUJOScdJp+mhbmeuEAYh2IemdEnd4N4HkQxTDUMh
         ru28B1LDSXLCKwRlbDcNSqFqALsiC/ryhf68LY5MUrHRMSJcy66cq6cQxuZFV+TBCOwa
         1Y1w==
X-Gm-Message-State: AGi0PuaevylXpZvGcgXv+njhgwFb4CHZoFT8lCi2ZI3YVg0JXQ+OXSuI
        i04sFxDqVQ1huoM/e4irUA141A==
X-Google-Smtp-Source: APiQypLmKMr8r52sf+RwYWYfNgMHo75Wmz7UYlWGQpE7tOtOW43JsiTpxSwbqhBRyIHt2soCkzEApA==
X-Received: by 2002:a5d:42cf:: with SMTP id t15mr15963353wrr.354.1588867001109;
        Thu, 07 May 2020 08:56:41 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c17sm8835844wrn.59.2020.05.07.08.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 08:56:40 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] Add Qualcomm MSM8939 GCC binding and driver
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Konrad Dybcio <konradybcio@gmail.com>
References: <20200423103406.481289-1-bryan.odonoghue@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
Message-ID: <e9d181a9-938c-a69b-8325-2aabeefd0934@nexus-software.ie>
Date:   Thu, 7 May 2020 16:57:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200423103406.481289-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 23/04/2020 11:34, Bryan O'Donoghue wrote:
> V3:
> This update removes the old clock name arrays which I forgot to prune in
> the previous V2.
> 
> git diff bod/clk-next+msm8939 bod/clk-next+msm8939-v2.1

I should have mentioned.

If you want to test this you'll need to do the following to your 
msm8939.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi 
b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 996425a70014..2d54ad7f99b6 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -673,6 +673,10 @@ gcc: clock-controller@1800000 {
                         reg = <0x1800000 0x80000>;
+                       clock-names = "xo",
+                                     "sleep_clk";
+                       clocks = <&xo_board>,
+                                <&sleep_clk>;
                 };

"xo" and "sleep_clk" names can be resolved.

---
bod
