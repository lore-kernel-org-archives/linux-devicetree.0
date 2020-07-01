Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4D2C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 06:06:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AF1A2074D
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 06:06:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=verdurent-com.20150623.gappssmtp.com header.i=@verdurent-com.20150623.gappssmtp.com header.b="R8g/FGm1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgGAGGL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 02:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbgGAGGJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jul 2020 02:06:09 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2ACBC03E97A
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 23:06:08 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id e3so7338646uan.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 23:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QlAVndFTQSyDLHMBObLaphwylvj91OJ+ZG/+4hBUq2U=;
        b=R8g/FGm1exwsXXqZdZONmVu9Gsg1coRo6Ha/j73IUWoR6p6F6htou6M6xm4DT3Y41z
         JhQvxzhXo0AiV7R/DLh51C7aujewYAT0/mxobXVwT13ZuOGbhWPUV4/1+k1WPBwDgisj
         r0r1AePr1ixOTfhkxyHEhC1LHuNFc+mqt+ZpO84W524n+p82CVnYy0KYLE+/IYc8pZvk
         AM0vMmgwAB/+9BL+7iZoQwMNT0bDXY41e3/uxmg78ECzrWLbkqggeL8Yi5j6Z4gyDu55
         5uke7CfqsWOVwVMViM3Dl9eo4ZSW/Ynxoyd3rtSfvnYrtKGCr/QoKlG5ylMmq+ScA/w8
         vMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QlAVndFTQSyDLHMBObLaphwylvj91OJ+ZG/+4hBUq2U=;
        b=lXgySZd4+7sLVWY87ObnL3fix2MNytbSsx3LWmxYsJVe5OR3OZIyoESpUAJWv6JlEV
         aa6Fk/8U6B3Z67EtlurGBaosNPh5ZDiKiChDv05hVBqASM4egk4Ar4+HPzwOiPR3G3NH
         Q3ydyOsBWme3lG/nkEWspAEI+n5jqaQ4Kf/6zktR+3D1bxAe61uG2blDHzg6A7RSSDFv
         0pUxes3dYtjogXT4RCoLODUpHX9BDy9W/dSIq2yqrb0nh+pM+Ff+nzShaTq47dS1ZNBO
         //IIm9QjLUHQL+AlClk6f17NRFja9HstElThKfUc48yG2fDfVfyCUkh2jkUEgL1Iff0t
         /XpQ==
X-Gm-Message-State: AOAM530mEdN501KA5odcN//q/PGJQ90BLIRpKz4sCnAe+5UO9mnumpQb
        AI1HUZZ1+WVs360gI1qeUe2J3EK1l4dMzPhPKXzZiw==
X-Google-Smtp-Source: ABdhPJwlUYtAuuGOocORy/hw8rvM8jnxT5xv3HDRCgeYljriIwoh0+tU0DVYJ9VcvzZYWuAKIXYNWmuh4hBPO1RRgFE=
X-Received: by 2002:ab0:7056:: with SMTP id v22mr10319965ual.67.1593583567791;
 Tue, 30 Jun 2020 23:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200621193549.2070434-1-dmitry.baryshkov@linaro.org>
 <20200621193549.2070434-6-dmitry.baryshkov@linaro.org> <CAHLCerOqWWr3i32tRgGfep12YfDufw-WU80VWUsUNpDDZ13D-w@mail.gmail.com>
 <CAA8EJppAQgmS7VVCjVe8QST2RQU46mXO2jtUPFY30mH9sVu_rQ@mail.gmail.com>
In-Reply-To: <CAA8EJppAQgmS7VVCjVe8QST2RQU46mXO2jtUPFY30mH9sVu_rQ@mail.gmail.com>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Wed, 1 Jul 2020 11:35:56 +0530
Message-ID: <CAHLCerM8KwUhpossD=vyhU4q22FnrZse_zhiS0ZobZM0J9X8PA@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: sm8250-dts: add thermal zones using
 pmic's adc-tm5
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 30, 2020 at 5:40 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi,
>
> On Tue, 30 Jun 2020 at 08:06, Amit Kucheria <amit.kucheria@verdurent.com> wrote:
> > On Mon, Jun 22, 2020 at 1:06 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > Port thermal zones definitions from msm-4.19 tree. Enable and add
> > > channel configuration to PMIC's ADC-TM definitions. Declare thermal
> > > zones and respective trip points.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 237 ++++++++++++++++++++++++
> > >  1 file changed, 237 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> >
> > IMO, this should be separated in the pmic dts file like we do for
> > other QC platforms since the PMICs tend to be used in multiple
> > platforms.
>
> Unlike other PMIC/tsens thermal zones, these definitions are quite
> specific to the board from my point of view.

How so? Can you describe what is different about this PMIC?

> > > index aa37eb112d85..78f0cf582a9a 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> > > @@ -24,6 +24,104 @@ chosen {
> > >                 stdout-path = "serial0:115200n8";
> > >         };
> > >
> > > +       thermal-zones {
> > > +               xo-therm {
> > > +                       polling-delay-passive = <0>;
> > > +                       polling-delay = <0>;
> > > +                       thermal-sensors = <&pm8150_adc_tm 0>;
> > > +                       trips {
> > > +                               active-config0 {
> > > +                                       temperature = <125000>;
> > > +                                       hysteresis = <1000>;
> > > +                                       type = "passive";
> > > +                               };
> > > +                       };
> > > +               };
> > > +
