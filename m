Return-Path: <SRS0=5/ta=3R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F809C35240
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 20:32:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 736212073A
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 20:32:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fq9IgoEG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgA1UcY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jan 2020 15:32:24 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43336 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgA1UcY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jan 2020 15:32:24 -0500
Received: by mail-pf1-f196.google.com with SMTP id s1so6647929pfh.10
        for <devicetree@vger.kernel.org>; Tue, 28 Jan 2020 12:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ou5WOu7VfwZ76/Tpb4nFYplCE03cb+mvprqzOSe8BeY=;
        b=Fq9IgoEGk1XnnT33IfofL6cze71y8yseMo4RTglFvYjfOiiFEHohk3X2ZwzW6obsSQ
         JGLTF9Wwo/azBiJ72vO/K8fXg05WMJzqe89NKs9eYC5HmfjEtN8R3aty9yUewttbOA2k
         y2Z1/UBWU7klja4flHnxu2Il/S5jBz7DTgQeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ou5WOu7VfwZ76/Tpb4nFYplCE03cb+mvprqzOSe8BeY=;
        b=WXezqeKcz/B5jPxqiR8jiuIsbMyt3vt5ycmxPkmiFDQejXc5zjrYJ9BSb6JTimUDZd
         fQxfHCmmbScRfLHbvth4QRbUdLYOJZSnVsnmuN+PQItIezw5OFG85LQsRtuiGsHw+nVD
         qULYXm9Oo1XjTkqMqi42C9rddkZPcA+3JHUd6ULD+etKvzRa/gCIeEExp0J4TGiKxASn
         mMpSKkYWQ50q0F7B8ZqhAJJzK7u9YWmK0Ik9imJVqzdyHjd2WsxcTrM2WqfvgPwqwizg
         OdcCBG8zAMyD5tibZ7NFU/zBZ3KeDHd/Rxr4Dw+CQR6/K3NrRy9JTcOV2WV7XVLW+04e
         u6Cg==
X-Gm-Message-State: APjAAAWZX+CwmtBUjiKjFqPS5deDpeMDCYKnR1oxIZDcWs0Nv1hqDudM
        9P1KTKt298ca3vmM4yNQlFJwVw==
X-Google-Smtp-Source: APXvYqzk/RCeSgih6aYRRZY6EYuOxyQ3AHi0iBRGvjfg9rwaUzCUjS6yYJBDVRHFkAOT5eesEFor9A==
X-Received: by 2002:a63:d40d:: with SMTP id a13mr27443204pgh.9.1580243543869;
        Tue, 28 Jan 2020 12:32:23 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id b12sm16516982pfr.26.2020.01.28.12.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 12:32:23 -0800 (PST)
Date:   Tue, 28 Jan 2020 12:32:22 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: Re: [v4] arm64: dts: sc7180: add display dt nodes
Message-ID: <20200128203222.GD46072@google.com>
References: <1580217884-21932-1-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1580217884-21932-1-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, Jan 28, 2020 at 06:54:44PM +0530, Harigovindan P wrote:
> Add display, DSI hardware DT nodes for sc7180.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v1:
> 	-Added display DT nodes for sc7180
> Changes in v2:
> 	-Renamed node names
> 	-Corrected code alignments
> 	-Removed extra new line
> 	-Added DISP AHB clock for register access
> 	under display_subsystem node for global settings
> Changes in v3:
> 	-Modified node names
> 	-Modified hard coded values
> 	-Removed mdss reg entry
> Changes in v4:
> 	-Reverting mdp node name
> 	-Setting status to disabled in main SOC dtsi file
> 	-Replacing _ to - for node names
> 	-Adding clock dependency patch link
> 	-Splitting idp dt file to a separate patch
> 
> This patch has dependency on the below series
> https://lkml.org/lkml/2019/12/27/73
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 128 +++++++++++++++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3bc3f64..c3883af 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1184,6 +1184,134 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		mdss: mdss@ae00000 {
> +			compatible = "qcom,sc7180-mdss";
> +			reg = <0 0x0ae00000 0 0x1000>;
> +			reg-names = "mdss";
> +
> +			power-domains = <&dispcc MDSS_GDSC>;
> +
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
> +				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +			clock-names = "iface", "gcc_bus", "ahb", "core";
> +
> +			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +			assigned-clock-rates = <300000000>;
> +
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			iommus = <&apps_smmu 0x800 0x2>;
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			mdss_mdp: mdp@ae01000 {
> +				compatible = "qcom,sc7180-dpu";
> +				reg = <0 0x0ae01000 0 0x8f000>,
> +				      <0 0x0aeb0000 0 0x2008>,
> +				      <0 0x0af03000 0 0x16>;
> +				reg-names = "mdp", "vbif", "disp_cc";
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "iface", "rot", "lut", "core",
> +					      "vsync";
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <300000000>,
> +						       <19200000>;

The clock rate for DISP_CC_MDSS_MDP_CLK is already specified in the
parent node, do we really want/need to specify it twice?

