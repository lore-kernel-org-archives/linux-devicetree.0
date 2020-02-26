Return-Path: <SRS0=+O1R=4O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79515C4BA24
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 20:44:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B24424653
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 20:44:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i2P1YnEx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbgBZUoj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Feb 2020 15:44:39 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40527 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727461AbgBZUoj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 26 Feb 2020 15:44:39 -0500
Received: by mail-pf1-f194.google.com with SMTP id b185so365123pfb.7
        for <devicetree@vger.kernel.org>; Wed, 26 Feb 2020 12:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NtpPkpQDZT+pJZPdvz0AVAUgEevNc4RHJ07rwsTIU0M=;
        b=i2P1YnExsto4uvDRMuruKyZouRRovAaR9wPEPO0+u8A8n/4zbDubzGVoJ6QmMnH1IE
         O5fUObW3f9TFkJi/1rT/FrBtnytktYQgW8i1SNi0wbxW5n9FRiGmININ83Qz6J3vaelx
         8y1rVkVpT58qeAyf15iyCSzs3gzoG6Cf+AW8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NtpPkpQDZT+pJZPdvz0AVAUgEevNc4RHJ07rwsTIU0M=;
        b=d4ylyzbv6nZiUVBS5AoJk0d0uMCRFYX6v/0sE8J/p/E1x755Kvnwk+AeQy7KFRehMD
         gcCmj46Ag37la1xT9v5H88woAJzKZwQ9JGiZhQtCcc/znIF5L+3KnPiSP7Sc28vqRw4t
         Q3RzZgrxwoq5K+uhqbZZ2MpYCM9Xw1M7gBDK48E5VNMnkn7R/+XIxXi2epy2UtBKctcu
         /NKXQWOTHvFceCV+rUrC6aOnJbxq1YTvEZhy5N2GHVQpQ3Rgz2RREl/skrEuCVHuiYcu
         Oztf3xdlQplPINM05eNwi6RQqS4kJXMhTmF9AEzSOdEPk0p6f/o3YFJaLt1IyhMXDDdN
         m/pw==
X-Gm-Message-State: APjAAAVXwBAi+GWuY1TL0F+DYCG/GWXPF71mR+ydPO9yD5bggm/w/+AT
        1heNL83irE+rhG87b4BN9fBU0A==
X-Google-Smtp-Source: APXvYqwgmGRxpTLeAYtuLJ/SMdK3LWfjHffWSsiX8VSwT3RkwBv1ncv3qNpXEvr4DRbnNjELoDomGA==
X-Received: by 2002:aa7:8e85:: with SMTP id a5mr547358pfr.24.1582749878750;
        Wed, 26 Feb 2020 12:44:38 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 17sm4061627pfv.142.2020.02.26.12.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 12:44:37 -0800 (PST)
Date:   Wed, 26 Feb 2020 12:44:36 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: sc7180: Move venus node to the correct
 position
Message-ID: <20200226204436.GG24720@google.com>
References: <20200226114017.1.I15e0f7eff0c67a2b49d4992f9d80fc1d2fdadf63@changeid>
 <CAD=FV=UMptkb9ni0KFWp96BycU32kchYs9+uS-7H+Q9ounHy2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=UMptkb9ni0KFWp96BycU32kchYs9+uS-7H+Q9ounHy2g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Feb 26, 2020 at 12:40:23PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Wed, Feb 26, 2020 at 11:40 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Per convention device nodes for SC7180 should be ordered by address.
> > This is currently not the case for the venus node, move it to the
> > correct position.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 52 ++++++++++++++--------------
> >  1 file changed, 26 insertions(+), 26 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 253274d5f04c..5f97945e16a4 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -1332,6 +1332,32 @@ system-cache-controller@9200000 {
> >                         interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
> >                 };
> >
> > +               venus: video-codec@aa00000 {
> > +                       compatible = "qcom,sc7180-venus";
> > +                       reg = <0 0x0aa00000 0 0xff000>;
> > +                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > +                       power-domains = <&videocc VENUS_GDSC>,
> > +                                       <&videocc VCODEC0_GDSC>;
> > +                       power-domain-names = "venus", "vcodec0";
> > +                       clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> > +                                <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> > +                                <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> > +                                <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> > +                                <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> > +                       clock-names = "core", "iface", "bus",
> > +                                     "vcodec0_core", "vcodec0_bus";
> > +                       iommus = <&apps_smmu 0x0c00 0x60>;
> > +                       memory-region = <&venus_mem>;
> > +
> > +                       video-decoder {
> > +                               compatible = "venus-decoder";
> > +                       };
> > +
> > +                       video-encoder {
> > +                               compatible = "venus-encoder";
> > +                       };
> > +               };
> > +
> >                 usb_1: usb@a6f8800 {
> >                         compatible = "qcom,sc7180-dwc3", "qcom,dwc3";
> >                         reg = <0 0x0a6f8800 0 0x400>;
> 
> Maybe try one more time?
> 
> >>> print [hex(x) for x in sorted([0x0aa00000, 0x0a6f8800])]
> ['0xa6f8800', '0xaa00000']
> 
> ...makes me convinced that the codec should come _after_ the USB node, no?

indeed, thanks for catching it!
