Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B284C432C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 16:50:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FD08207DD
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 16:50:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E9tB3Qhf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbfK0QuA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 11:50:00 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39932 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfK0Qt7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Nov 2019 11:49:59 -0500
Received: by mail-pl1-f196.google.com with SMTP id o9so10022879plk.6
        for <devicetree@vger.kernel.org>; Wed, 27 Nov 2019 08:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XP8xQxHYdgThc9Zld1p2KHyvVQHdtDNpRupwHh4QK1c=;
        b=E9tB3Qhfa0XrmfAUm3gCKwGioDLD3EWQViXM4CPXKKihXTIM5RXvsirNPtUfcAGO2f
         Syy1YIo3f8NqeITx6v6UkzSMoJFXLq9KT7arLZmSs/hYRAqz+ODuBSK/jnptHFTW+Uvw
         f9p3FFG+1KiyyLtqO8tUMsmjJGF8m7haGeg4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XP8xQxHYdgThc9Zld1p2KHyvVQHdtDNpRupwHh4QK1c=;
        b=iHQbnsur8M6JLMHcSaIVMJ5BPAbmeyLq1mhydl+U5yk91ANHXfU8G01SSEyLjiufBQ
         dZ/mRSm9zNg8REhM6tSqhQMDhO1W1vlm7LhmSRLGgmbSIs7iHGQGLO4H59eJd/ajeAtC
         wyhsY5CH3Wp6UYNLogWdt7kvT7iMN5MLJuK+oidotlUuyrXR5I7mgi14IjYoI1M2VoQi
         ohniiw7UD1RMp9hsXuuyoZmR0xyDmTW8mmZ9UT2+lXU2upk/s3z+RStsggjx9OVpTyDb
         8zIuaDm1UaAdBIaqVjo2vCDo7hIUrd2aO395FOzesfTYA181dlOGHB444z+pfRI+8fgh
         WLPg==
X-Gm-Message-State: APjAAAX+4ZQRrPBDNfETLztwA9PwxXqArIX5hxqYbvZ0ctkLVsi8A926
        c5ngX3eXilaveDix1PPe7b/b+A==
X-Google-Smtp-Source: APXvYqxA46ZEzE7Yv0U5LCXa9yNAl9DXPjMZ1oVoUL9L8QN5BgQiB0NTSIzl+FZG32FuOR1hC6qStQ==
X-Received: by 2002:a17:902:bf0c:: with SMTP id bi12mr4773061plb.98.1574873398528;
        Wed, 27 Nov 2019 08:49:58 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id k29sm4509575pfh.104.2019.11.27.08.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2019 08:49:57 -0800 (PST)
Date:   Wed, 27 Nov 2019 08:49:56 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: sc7180: Add USB related nodes
Message-ID: <20191127164956.GF228856@google.com>
References: <1573795421-13989-1-git-send-email-sanm@codeaurora.org>
 <1573795421-13989-2-git-send-email-sanm@codeaurora.org>
 <20191122005117.GM27773@google.com>
 <0101016eac17bc4a-9bcb2dd5-bcb0-4532-84ff-c423179bfec4-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0101016eac17bc4a-9bcb2dd5-bcb0-4532-84ff-c423179bfec4-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 27, 2019 at 09:01:07AM +0000, Sandeep Maheswaram (Temp) wrote:
> Hi Matthias,
> 
> Thanks for the review.
> 
> On 11/22/2019 6:21 AM, Matthias Kaehlcke wrote:
> > Hi Sandeep,
> > 
> > On Fri, Nov 15, 2019 at 10:53:41AM +0530, Sandeep Maheswaram wrote:
> > > Add nodes for DWC3 USB controller, QMP and QUSB PHYs.
> > > 
> > > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sc7180-idp.dts |  25 ++++++++
> > >   arch/arm64/boot/dts/qcom/sc7180.dtsi    | 105 ++++++++++++++++++++++++++++++++
> > >   2 files changed, 130 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > index 666e9b9..2c7dbdc 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > 
> > > ...
> > > 
> > > +		usb_1: usb@a6f8800 {
> > > +			compatible = "qcom,sc7180-dwc3", "qcom,dwc3";
> > > +			reg = <0 0x0a6f8800 0 0x400>;
> > > +			status = "disabled";
> > > +			#address-cells = <2>;
> > > +			#size-cells = <2>;
> > > +			ranges;
> > > +			dma-ranges;
> > > +
> > > +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> > > +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> > > +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> > > +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> > > +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
> > > +			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
> > > +				      "sleep";
> > > +
> > > +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> > > +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> > > +			assigned-clock-rates = <19200000>, <150000000>;
> > > +
> > > +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "hs_phy_irq", "ss_phy_irq",
> > > +					  "dm_hs_phy_irq", "dp_hs_phy_irq";
> > > +
> > > +			power-domains = <&gcc USB30_PRIM_GDSC>;
> > > +
> > > +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> > > +
> > > +			usb_1_dwc3: dwc3@a600000 {
> > > +				compatible = "snps,dwc3";
> > > +				reg = <0 0x0a600000 0 0xe000>;
> > > +				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> > > +				iommus = <&apps_smmu 0x540 0>;
> > > +				snps,dis_u2_susphy_quirk;
> > > +				snps,dis_enblslpm_quirk;
> > > +				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> > > +				phy-names = "usb2-phy", "usb3-phy";
> > > +			};
> > I see the following message at boot:
> > 
> > [    4.248436] dwc3 a600000.dwc3: Failed to get clk 'ref': -2
> > 
> > Apparently the driver is operational regardless, however the binding lists
> > the clocks as required:
> > 
> >    Required properties:
> >     ...
> >     - clock-names: should contain "ref", "bus_early", "suspend"
> >     - clocks: list of phandle and clock specifier pairs corresponding to
> >               entries in the clock-names property.
> > 
> >    [Documentation/devicetree/bindings/usb/dwc3.txt]
> > 
> > The driver code also has a comment stating that the clocks should be
> > specified:
> > 
> >    /*
> >     * Clocks are optional, but new DT platforms should support all
> >     * clocks as required by the DT-binding.
> >     */
> > 
> >    [drivers/usb/dwc3/core.txt]
> We are implenting all the required clocks in glue driver
> drivers/usb/dwc3/dwc3-qcom.c.
> 
> Also there is exception for qcom,dwc3 in documentation
> 
> Documentation/devicetree/bindings/usb/dwc3.txt
> 
> 
> Exception for clocks:
> 
> clocks are optional if the parent node (i.e. glue-layer) is compatible to
> one of the following:
> "amlogic,meson-axg-dwc3"
> "amlogic,meson-gxl-dwc3"
> "cavium,octeon-7130-usb-uctl"
> "qcom,dwc3"
> "samsung,exynos5250-dwusb3"
> "samsung,exynos5433-dwusb3"
> "samsung,exynos7-dwusb3"
> "sprd,sc9860-dwc3"
> "st,stih407-dwc3"
> "ti,am437x-dwc3"
> "ti,dwc3"
> "ti,keystone-dwc3"
> "rockchip,rk3399-dwc3"
> "xlnx,zynqmp-dwc3"

ah, I missed this, thanks for the pointer!
