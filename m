Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6F3C432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 22:11:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA62F21781
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 22:11:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nItiA9dR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfK1WL3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 17:11:29 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33256 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbfK1WL3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 17:11:29 -0500
Received: by mail-pl1-f193.google.com with SMTP id ay6so12094601plb.0
        for <devicetree@vger.kernel.org>; Thu, 28 Nov 2019 14:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F3WzSYZCBNAQFMfIpxWit/sBfadcU2TF991j5V0uaMY=;
        b=nItiA9dRdSrhU4TLi5SiflxS30nTBx3tdVqwK6eOPCMGU1IgMlwfRTMDuhcpJ7a78/
         I7laejhdh4EJM4NgHe6stsW+nqMykAaZ2J414fetIQOyiD/uqCQa88LVQSgaR8jNenXh
         obObZSLXWmFor/Mc9GXwo8GI3NC/oUB/5pk26s3lHpwSvjAgaP+JJ/eK+aqOwatIkqvl
         /drBO6I6927SI1/nsbFrkqBZ09LO1/AZKISNBFsa4stwkhxcoM3cljvGUuB/aacRjiEu
         hxzQ5G7x44OKqR4ay+FYLGNsrDUdNdA/xDSy5LSq/GHrClGgE1fjNpsRF35HvbXkTK+0
         g6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F3WzSYZCBNAQFMfIpxWit/sBfadcU2TF991j5V0uaMY=;
        b=jPVJFwHBGEVM+nHkjVEGhBZ4qNsI3NuAayrrXUqexEUBv6gd+Yjh+vcCuaGjUpX3El
         yCSkZ/bzLbqN03qjXw0rXSzfxPY4edToo0NvZNersMknVad2aE0UztyAibEsE75GuERl
         zDBZfgyNY1Fa5YQQ5P1mnuPaGP2EHmdfIHr7TAmQtFuT5foX3AEG39rotAxHaXUgZWsZ
         zIJG1JMSDplitfPTO5OkuDLNvUNw0OSNFvTe/jCbBokdT7rr9F1h420bsshTVAvAmm3P
         sOlMqn7zmPVRum3enA2QOIomJD2DZwcb+qmlwA8wEwE/dU7pdo6iXcVcfBp8L2y6ykVC
         tTCA==
X-Gm-Message-State: APjAAAUUtpBwVZZ1BQAOiP/5IYyKFu1r9XOiBByXcn5Ibp+2yRZVajqp
        Ud+73IMHqftTjQ2uTFejZCOxug==
X-Google-Smtp-Source: APXvYqzYIIkSZ8Dv3KYh63pRf7BIWCuo2+7nUUHj+s7Q/KYBwVMm2qSbAGosbfKiJuCnT/K58DMmbA==
X-Received: by 2002:a17:902:6904:: with SMTP id j4mr11241058plk.49.1574979088106;
        Thu, 28 Nov 2019 14:11:28 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s18sm22092805pfm.27.2019.11.28.14.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 14:11:27 -0800 (PST)
Date:   Thu, 28 Nov 2019 14:11:24 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: sc7180: Add USB related nodes
Message-ID: <20191128221124.GM82109@yoga>
References: <1573795421-13989-1-git-send-email-sanm@codeaurora.org>
 <1573795421-13989-2-git-send-email-sanm@codeaurora.org>
 <20191122005117.GM27773@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122005117.GM27773@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu 21 Nov 16:51 PST 2019, Matthias Kaehlcke wrote:

> Hi Sandeep,
> 
> On Fri, Nov 15, 2019 at 10:53:41AM +0530, Sandeep Maheswaram wrote:
> > Add nodes for DWC3 USB controller, QMP and QUSB PHYs.
> > 
> > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  25 ++++++++
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 105 ++++++++++++++++++++++++++++++++
> >  2 files changed, 130 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 666e9b9..2c7dbdc 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> >
> > ...
> >
> > +		usb_1: usb@a6f8800 {
> > +			compatible = "qcom,sc7180-dwc3", "qcom,dwc3";
> > +			reg = <0 0x0a6f8800 0 0x400>;
> > +			status = "disabled";
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			ranges;
> > +			dma-ranges;
> > +
> > +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> > +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> > +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> > +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> > +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
> > +			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
> > +				      "sleep";
> > +
> > +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> > +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> > +			assigned-clock-rates = <19200000>, <150000000>;
> > +
> > +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "hs_phy_irq", "ss_phy_irq",
> > +					  "dm_hs_phy_irq", "dp_hs_phy_irq";
> > +
> > +			power-domains = <&gcc USB30_PRIM_GDSC>;
> > +
> > +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> > +
> > +			usb_1_dwc3: dwc3@a600000 {
> > +				compatible = "snps,dwc3";
> > +				reg = <0 0x0a600000 0 0xe000>;
> > +				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> > +				iommus = <&apps_smmu 0x540 0>;
> > +				snps,dis_u2_susphy_quirk;
> > +				snps,dis_enblslpm_quirk;
> > +				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> > +				phy-names = "usb2-phy", "usb3-phy";
> > +			};
> 
> I see the following message at boot:
> 
> [    4.248436] dwc3 a600000.dwc3: Failed to get clk 'ref': -2
> 

dwc3-qcom picks up the clocks per the names of the binding, but then
dwc3 tries to pick up the same clocks based on the generic names.

At some point it would be nice to figure out how to have these two play
nice with each other, but for now it's a "harmless" error print - which
has consumed many hours of unnecessary debugging by various people...

Regards,
Bjorn
