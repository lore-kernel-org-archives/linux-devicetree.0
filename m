Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FB1C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 02:44:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B89C0207BC
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 02:44:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lB2+x1nm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731697AbgFWCoB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 22:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731557AbgFWCoB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 22:44:01 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171E2C061573
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 19:44:01 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id j12so7156084pfn.10
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 19:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8HZme+4yoYk/0IIihuaQK25ly6wubdQhFQnW5CQJpwQ=;
        b=lB2+x1nmphDRMaiyajc3MjdPsv6wxTxxEQRuPpfVZRFxgaLOH212DQg4vTDdiWgo7p
         iKSmyDf/u9/wFaGA2QV6Qfifwx4V4WcH5AbwwZmG/H6OcSRYIlNxRAz+LW8BEQJO9HFK
         TLtwymzwJa9lkkpJNwZwB/WxvfRNJdiyaETTcLcBW1lm1M6GeJrdTCYUfGoBSAbU0fIi
         ABZGjmlXpYsPB7GGKm1BQBn2oJdt+T09dWBivCUMzSF539X3wvbWGdYzvFY/o8nqytE3
         7CExUz2qA8PZS/6Q/aUBBb+jZKBjEpzflVXlglv5KIldIu0Vc8ynPFLJUbIluQKlkv9M
         XCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8HZme+4yoYk/0IIihuaQK25ly6wubdQhFQnW5CQJpwQ=;
        b=HDxwy4FrLfHukYa/MefZVzk1QY7UM7w34VoKozPd996KzaWq6lXSuw2kbWZI31jQce
         Fr+v++tDu0a0ZGBy8V7MXE4yc3yQr6Jhl55LDBgWLVpEERVwr9AXVsHans81pHpaKAlP
         zS9uVJosvPHAzezlICNMrvyjsAiqKodPujOW+Rr9jcFZQ/jAHb7VqGv4K6rUMnvH6lgl
         owjWNMKZRnmcJA9R6keTevKUyUfNSxscIEhY704XpI7n7CZheP/CBl/koCOURY3oXeYg
         soIxjb87x9gvuyGzvSXiwEEdO/5VQqQf+V63x2Pu34FnBU1OE/P9edc0OJwhVYD7+hhl
         Da1g==
X-Gm-Message-State: AOAM533CRAlO4z/xmxIPWf+xQg0AMMi8a9/5bV6lQG+4YV+Onu3U1DKy
        JQJ68jODi0rxfIVIpXPBhg8G
X-Google-Smtp-Source: ABdhPJyXU1fbfPSMRmxqKjkespCChz+D6aeP9471It6Hdk5H3/tuDKr4c3qP6XD8FFCk5wtGj6Lv2Q==
X-Received: by 2002:a62:1b82:: with SMTP id b124mr22691966pfb.172.1592880240481;
        Mon, 22 Jun 2020 19:44:00 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:609d:7d26:e4ff:f0b0:edd6:2484])
        by smtp.gmail.com with ESMTPSA id x4sm14546059pfx.87.2020.06.22.19.43.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 19:43:59 -0700 (PDT)
Date:   Tue, 23 Jun 2020 08:13:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8250: Add IPCC
Message-ID: <20200623024352.GB11093@Mani-XPS-13-9360>
References: <20200622222747.717306-1-bjorn.andersson@linaro.org>
 <20200622222747.717306-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622222747.717306-3-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jun 22, 2020 at 03:27:43PM -0700, Bjorn Andersson wrote:
> Add the IPCC node, used to send and receive IPC signals with
> remoteprocs.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index e583a01cbcf1..74a7ca96177e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-sm8250.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  
> @@ -329,6 +330,15 @@ gcc: clock-controller@100000 {
>  			clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
>  		};
>  
> +		ipcc: interrupt-controller@408000 {

ipcc: mailbox@408000

Other than this,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> +			compatible = "qcom,sm8250-ipcc", "qcom,ipcc";
> +			reg = <0 0x00408000 0 0x1000>;
> +			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			#mbox-cells = <2>;
> +		};
> +
>  		qupv3_id_2: geniqup@8c0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0x008c0000 0x0 0x6000>;
> -- 
> 2.26.2
> 
