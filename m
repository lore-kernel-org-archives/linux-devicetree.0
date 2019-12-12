Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F891C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 16:09:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F1B2822527
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 16:09:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fWA8oi4B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729749AbfLLQJY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 11:09:24 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:38641 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729709AbfLLQJY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 11:09:24 -0500
Received: by mail-io1-f66.google.com with SMTP id v3so3360666ioj.5
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 08:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZSuulaHZP7wrCDMhvr1mBj+rW2++SNmugkVI+athuy0=;
        b=fWA8oi4BNyT1AqiAexpCYnMadFV+cK60+9u4U1OnYTHAl/RMEBEZ1qUyJVXYWlq3AK
         1leJZGQkxQSsY3/UJ2F5h18b+SaKi1Ry6fQ3COI85Vg+fxU9oDxBY1qGfUS0JTTufQJq
         47xWja5YZkpXtzKA6w1TMeZbU4DNqk5ccNV54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZSuulaHZP7wrCDMhvr1mBj+rW2++SNmugkVI+athuy0=;
        b=pwjazzXmVUMYA9JAqNglffuLlzzCn1X7+5dIJx6Eq51vXznJkcxdADMIlIRb8ze7nE
         sLqP2ocOwm78trrV11V0CAdESPtzOP/r0iK/ZfKsGKDqitcahwrQt6Ko4ESi2aC9zyv+
         J8oGDTsHbe40TUs/o6TK2B3vu2dceHuQNrlt3qzO2TjFuxSuoO29vtumU92mxoZUvGtO
         rhheMCMtmILPB2DdB6f9NA1UyTGGEpQF7OeCmdJoOKZ20NOtOimX6KdaL7ge1duJRE5V
         hRbMQ83Ypt46irwDemSYCbhW7Ok2+K9Kx5IjuQhNtOuGRWPTtiZ8xigcWuELVsexU0cO
         DmcQ==
X-Gm-Message-State: APjAAAVBY/vywHKvZliaL7BUr1KEbDXpZm8wgimRZNyJnXNNHZ8P5hKd
        MPZvF7aI7CnHP02/R9FnfIKNKn5MewQ=
X-Google-Smtp-Source: APXvYqwQvhtGY4DB3GekCJhEBq0uk6slqkxbbHXB3Y3L1WecZ0d/i9bG8/3Ilagfc/AUFkgKGFNYTw==
X-Received: by 2002:a5e:850e:: with SMTP id i14mr3839327ioj.226.1576166963131;
        Thu, 12 Dec 2019 08:09:23 -0800 (PST)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id k1sm332154ioa.26.2019.12.12.08.09.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 08:09:21 -0800 (PST)
Received: by mail-io1-f50.google.com with SMTP id a22so3379942ios.3
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 08:09:21 -0800 (PST)
X-Received: by 2002:a02:2385:: with SMTP id u127mr8799499jau.127.1576166960582;
 Thu, 12 Dec 2019 08:09:20 -0800 (PST)
MIME-Version: 1.0
References: <1574934847-30372-1-git-send-email-rkambl@codeaurora.org>
 <1574934847-30372-2-git-send-email-rkambl@codeaurora.org> <CAHLCerOVH1xLjMmDNFVx=YYYTA3MipaOhHZ-AYtxEnDFgRbSJg@mail.gmail.com>
In-Reply-To: <CAHLCerOVH1xLjMmDNFVx=YYYTA3MipaOhHZ-AYtxEnDFgRbSJg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 12 Dec 2019 08:09:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UDGcnLLkBiTBr5GgrzNH20qf9pDQW8wdoqsbO4832M4Q@mail.gmail.com>
Message-ID: <CAD=FV=UDGcnLLkBiTBr5GgrzNH20qf9pDQW8wdoqsbO4832M4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: sc7180: Add device node support
 for TSENS in SC7180
To:     Amit Kucheria <amit.kucheria@verdurent.com>
Cc:     Rajeshwari <rkambl@codeaurora.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        sivaa@codeaurora.org, sanm@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Dec 12, 2019 at 3:00 AM Amit Kucheria
<amit.kucheria@verdurent.com> wrote:
>
> Hi Rajeshwari,
>
> On Thu, Nov 28, 2019 at 3:25 PM Rajeshwari <rkambl@codeaurora.org> wrote:
> >
> > Add TSENS node and user thermal zone for TSENS sensors in SC7180.
> >
> > Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 527 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 527 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 666e9b9..6656ffc 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -911,6 +911,26 @@
> >                         status = "disabled";
> >                 };
> >
> > +               tsens0: thermal-sensor@c263000 {
> > +                       compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
> > +                       reg = <0 0x0c263000 0 0x1ff>, /* TM */
> > +                               <0 0x0c222000 0 0x1ff>; /* SROT */
> > +                       #qcom,sensors = <15>;
> > +                       interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
> > +                       interrupt-names = "uplow";
> > +                       #thermal-sensor-cells = <1>;
> > +               };
> > +
> > +               tsens1: thermal-sensor@c265000 {
> > +                       compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
> > +                       reg = <0 0x0c265000 0 0x1ff>, /* TM */
> > +                               <0 0x0c223000 0 0x1ff>; /* SROT */
> > +                       #qcom,sensors = <10>;
> > +                       interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
> > +                       interrupt-names = "uplow";
> > +                       #thermal-sensor-cells = <1>;
> > +               };
> > +
> >                 spmi_bus: spmi@c440000 {
> >                         compatible = "qcom,spmi-pmic-arb";
> >                         reg = <0 0x0c440000 0 0x1100>,
> > @@ -1121,6 +1141,513 @@
> >                 };
> >         };
> >
> > +       thermal-zones {
> > +               cpu0-thermal {
> > +                       polling-delay-passive = <250>;
> > +                       polling-delay = <1000>;
> > +
> > +                       thermal-sensors = <&tsens0 1>;
> > +
> > +                       trips {
> > +                               cpu0_alert0: trip-point0 {
> > +                                       temperature = <90000>;
> > +                                       hysteresis = <2000>;
> > +                                       type = "passive";
> > +                               };
> > +
> > +                               cpu0_alert1: trip-point1 {
> > +                                       temperature = <95000>;
> > +                                       hysteresis = <2000>;
> > +                                       type = "passive";
> > +                               };
> > +
> > +                               cpu0_crit: cpu_crit {
> > +                                       temperature = <110000>;
> > +                                       hysteresis = <1000>;
> > +                                       type = "critical";
> > +                               };
>
> Where are the cooling maps for all the cpu thermal zones? A passive
> trip point w/o a cooling map is not of much use. If you are waiting
> for cpufreq support to land before adding them, then remove the
> passive trip points for now and add them along with the cooling maps
> when you have cooling devices.

I will note that cpufreq support has landed in the qcom tree::

https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=86899d8235ea0d3d7c293404fb43a6fabff866e6

...so I guess the right thing is to send a patch adding the cooling
maps for the cpu thermal zones?

-Doug
