Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1308AC33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 19:13:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8F8A207FF
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 19:13:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ebxUl9dh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgAFTNZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 14:13:25 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38592 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbgAFTNZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 14:13:25 -0500
Received: by mail-pg1-f194.google.com with SMTP id a33so27289484pgm.5
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 11:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CWeF+qEiMx35B55O581zGPkQBg4u6jbLRdkEV6WWjg8=;
        b=ebxUl9dh1FKnFxAkXnwnaZCuaaW7Za3VZTOLf6eUWfhcIgGX1Xz4QDGju8SuP5ORKP
         +du3pSdkH3bQlfRjCN85Ni0pP7LTiGwkCL4usBBoPhMGs/VMDbPuDOhZXAs4jIC7YSpo
         YUZgh/lxWqemlC2IiMVH7ZifwWjV3hC1ot50I8x0NIKEM7/T7oUPFcio0crZXbwyMGRK
         USHhjFnz5ZPdh1xzGPh3VrEq2zf2esPa9ytQvLFI3zghZ9o+qrEICzfoLrWXxWgCeCUe
         84RIcJbbsECIWTdE/mUg9cmjkk21JgRELcVxW66bZElpCAa+SGdAUEXOu2hpLWdnhP+u
         hOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CWeF+qEiMx35B55O581zGPkQBg4u6jbLRdkEV6WWjg8=;
        b=pSSZwOXPwUk3wGCve0iFr4f1hHYr7hhu0RhDDRsd+Ah5gU4BKr7zIKGYIYkP8M+VFm
         S2VwcBLTxiOxs08tfDJkDtgxpjEPwWgQaXz6g6PUFA9r1kKZo6Fp1ZTEmWrT0CUK2vQk
         dFc7eR1V7ggKD/OSO9mEPmcjaXQvXfufMfxEwrxZDkC54/jLCwwWzXYrbEA+cfm00P9e
         kvycIDDGGVDNOwYeMzlP9HWA8YXgxSOEB1N5DUYGpfAbR7Hd/xjaFDpsegO72U8/wLPp
         Q1w9z+pVNv1593QRecmYO7x5obc5ehmLTzzuBA+f8pakRFsrOB6l8Yr1/fzPmjS1MQ18
         0fKQ==
X-Gm-Message-State: APjAAAWE9cZN1Aq7m86mgQ7KdXKuaTABFGMPak3oEvLe7M0rNhCXqJhK
        oAUnngti6i9xWAsUr677BlNmvw==
X-Google-Smtp-Source: APXvYqwVRgLXSzVPKren8Gq/VjMYYjdAkXhimprfkvlgbJfFMBCuRAYFriDOjImyXhnvrMbBQoyGsQ==
X-Received: by 2002:a63:eb02:: with SMTP id t2mr112827707pgh.289.1578338004229;
        Mon, 06 Jan 2020 11:13:24 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r66sm80457803pfc.74.2020.01.06.11.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 11:13:23 -0800 (PST)
Date:   Mon, 6 Jan 2020 11:13:21 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Fix venus iommu nodename error
Message-ID: <20200106191321.GU3755841@builder>
References: <20200106102305.27059-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106102305.27059-1-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon 06 Jan 02:23 PST 2020, Stanimir Varbanov wrote:

> Fix the following error/warn seen with make dtbs_check
> 
> arm,smmu-venus@d40000: $nodename:0: 'arm,smmu-venus@d40000' does not match '^iommu@[0-9a-f]*'
> arm,smmu-venus@d40000: clock-names:0: 'bus' was expected
> arm,smmu-venus@d40000: clock-names:1: 'iface' was expected
> 
> by rename nodename to "iommu".
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Thanks Stan, applied.

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 4ca2e7b44559..9bbcee31f28b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -2267,7 +2267,7 @@
>  			};
>  		};
>  
> -		venus_smmu: arm,smmu-venus@d40000 {
> +		venus_smmu: iommu@d40000 {
>  			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
>  			reg = <0xd40000 0x20000>;
>  			#global-interrupts = <1>;
> -- 
> 2.17.1
> 
