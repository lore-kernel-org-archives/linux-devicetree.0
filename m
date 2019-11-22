Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB441C432C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 00:51:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC6792067D
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 00:51:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CogzIq+w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfKVAvU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 Nov 2019 19:51:20 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37731 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfKVAvU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 Nov 2019 19:51:20 -0500
Received: by mail-pg1-f196.google.com with SMTP id b10so2507781pgd.4
        for <devicetree@vger.kernel.org>; Thu, 21 Nov 2019 16:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F7N97syywZm5UtcsrgWnowpokxLoj9aunLFsYL+WSTs=;
        b=CogzIq+wFBM2jxtDHj5Txm6K3QcBKkvZ4jPMbK0ZKYCJFs9SyqIBRSU5VO9ypETUMh
         LX4VmFW9ktP4UthWhTRbAPyRd/xdSBcdo/Tmgk9EqNP2ZaJ/Ew5/KHSJGYWArFJtYzLX
         sqVdSoAcKrciJePGz+z1BbiLWblExMjwFgNJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F7N97syywZm5UtcsrgWnowpokxLoj9aunLFsYL+WSTs=;
        b=dv0wfsY+Go0bdQN6IF8SD1hslkSHUlF8GDnyise788zM9cJ0mSzbbY5FN7q86aaVQ8
         iUv/dBUlpOJ0TPLrOYKWXgmS+/2GFDomE0kPZRz9K/wVL70Mj5vdSoyIFLV7SOwv9VKd
         b1XAb+AktLL6kIAsulA+0ec1MKYEd1DCMTPpFXpVTE1Xhp8N/jsca0pUst0Lol1bxNFK
         R0b4Bt9iHEmITmcA5hbQHDlGV7R0RjktluuWqTkLMjr9USAmZ7tKfGunjV2tyMOYbFEF
         dZrInhR+yt2HiSLJ8iTfjpQxMH+OMTLN5s9OXv5ojOZIn6Sf3m+Nil++u7VpBzHFBhFI
         np7g==
X-Gm-Message-State: APjAAAXAjt41RgCNEIBaE/rIN3ouQVx1+IQXjNau3UaHlprzviFhXwgc
        iG1KcMmoSOaNqPwyANOqgzxIPg==
X-Google-Smtp-Source: APXvYqzRFzT70+8WTJ0V8pjwhy9ummb6K+OSh8qH+aj/aFjr9zXVCtvPqVkUI6ozTNu+aC2LaXC79A==
X-Received: by 2002:a62:6404:: with SMTP id y4mr13859910pfb.170.1574383879283;
        Thu, 21 Nov 2019 16:51:19 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id l10sm702279pjw.6.2019.11.21.16.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2019 16:51:18 -0800 (PST)
Date:   Thu, 21 Nov 2019 16:51:17 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: sc7180: Add USB related nodes
Message-ID: <20191122005117.GM27773@google.com>
References: <1573795421-13989-1-git-send-email-sanm@codeaurora.org>
 <1573795421-13989-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573795421-13989-2-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sandeep,

On Fri, Nov 15, 2019 at 10:53:41AM +0530, Sandeep Maheswaram wrote:
> Add nodes for DWC3 USB controller, QMP and QUSB PHYs.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  25 ++++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 105 ++++++++++++++++++++++++++++++++
>  2 files changed, 130 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 666e9b9..2c7dbdc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>
> ...
>
> +		usb_1: usb@a6f8800 {
> +			compatible = "qcom,sc7180-dwc3", "qcom,dwc3";
> +			reg = <0 0x0a6f8800 0 0x400>;
> +			status = "disabled";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			dma-ranges;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
> +			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
> +				      "sleep";
> +
> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <150000000>;
> +
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hs_phy_irq", "ss_phy_irq",
> +					  "dm_hs_phy_irq", "dp_hs_phy_irq";
> +
> +			power-domains = <&gcc USB30_PRIM_GDSC>;
> +
> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> +
> +			usb_1_dwc3: dwc3@a600000 {
> +				compatible = "snps,dwc3";
> +				reg = <0 0x0a600000 0 0xe000>;
> +				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +				iommus = <&apps_smmu 0x540 0>;
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_enblslpm_quirk;
> +				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +			};

I see the following message at boot:

[    4.248436] dwc3 a600000.dwc3: Failed to get clk 'ref': -2

Apparently the driver is operational regardless, however the binding lists
the clocks as required:

  Required properties:
   ...
   - clock-names: should contain "ref", "bus_early", "suspend"
   - clocks: list of phandle and clock specifier pairs corresponding to
             entries in the clock-names property.

  [Documentation/devicetree/bindings/usb/dwc3.txt]

The driver code also has a comment stating that the clocks should be
specified:

  /*
   * Clocks are optional, but new DT platforms should support all
   * clocks as required by the DT-binding.
   */

  [drivers/usb/dwc3/core.txt]
