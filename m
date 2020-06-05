Return-Path: <SRS0=PVp5=7S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D980C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 14:38:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1569A2077D
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 14:38:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SRwmWgMx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgFEOiH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 5 Jun 2020 10:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbgFEOiH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Jun 2020 10:38:07 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C99C08C5C3
        for <devicetree@vger.kernel.org>; Fri,  5 Jun 2020 07:38:07 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id e5so7745575ote.11
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2020 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A+OB10W2CaV6t6N6JaU5zy1XJv7tjxdyLrdhOyng/2E=;
        b=SRwmWgMxUFeppgdZq354pQ61S0xZF7Qqv46jP4rQFAxhyC0o7wbgDUxhIwiholkPw9
         ovPQgKZQ/l50wiGYxbAV1sqGN/35IuoM7GiJtn+HpWLNgrUlfY+lPXFzhFemC2wV/MR2
         Vkayj8rhfqsDD/8smWNYghfe1JHzGGAKXcmX5SRBW2e4ouWfbUt4yXLRg2BSMDaG3rHM
         YuJzi/Ngv3SMIGvsEAHctHmXz+XpHIS7ZQ65iDR6bHLFj9RJV+YTiwVFkaiqVM6Wb+ow
         iLHcQDHLfpCIM+DooeijKk1kC63X2wA1bHJHH1cNGySOYWKDnmw6WI97p75z574Wh3KB
         bXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A+OB10W2CaV6t6N6JaU5zy1XJv7tjxdyLrdhOyng/2E=;
        b=Gbm4SYDDaKyiDzjslv4Cn8zb/ajlGen5uCqrjy7D1/HwdWco+xaur9NprT8UnsNWYZ
         SxNMtt1CCW+cZveai7U5rQWPRXs8UzWMfELECYFFtSE5BHbWOztgx/2ANI6rSi/W4A9v
         3QPbKkdWDjc5rkLu/6rT+0b6N7R2YvyJjBSWCFZwVfZad5/OHx1y0Ws9D9XAe1riZvC1
         ziwuOKdtnWwPJBUYSy9zrADe4r57u8T/KVA9P9mUGnZ3BXU9n1Y7OvgW9ICXpmg302fx
         dJlIVjeWr1oTj4fD98BlbhTxsmpHtu95rbwtQYRIqSds0CqMvs5yVXohURMCatf7sQSV
         QLLA==
X-Gm-Message-State: AOAM533/D3k4VALMcdTE3J2UeTxTfgmX6XVOIicoIKsOKnUpKfEIBxQj
        K+kwf0mXjX0QTwl72u4FULWjvJdIPx35u0+2n5t6Zw==
X-Google-Smtp-Source: ABdhPJz1bXcYrT5I716R8D3/WRRZ1Ia8a5cpyngYb1x11O+qdW71tPq+kiv5YGMfY26UCBDhdO4H2NS0ZXdC+U0UykA=
X-Received: by 2002:a05:6830:1082:: with SMTP id y2mr7624352oto.368.1591367886559;
 Fri, 05 Jun 2020 07:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
 <20200604004331.669936-5-dmitry.baryshkov@linaro.org> <20200604104701.GG3521@vkoul-mobl>
 <8df3fe11-867f-b6a3-fe29-5a8ab988e006@linaro.org> <20200605043955.GJ3521@vkoul-mobl>
In-Reply-To: <20200605043955.GJ3521@vkoul-mobl>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 5 Jun 2020 17:37:55 +0300
Message-ID: <CAA8EJppWY-OBzbDTsLTZasYzi4Nju-XBxhYbYx+eM-3EAwv5hw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: pm8150x: add thermal alarms and
 thermal zones
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Patch Tracking <patches@linaro.org>,
        linaro-kernel@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

On Fri, 5 Jun 2020 at 07:40, Vinod Koul <vkoul@kernel.org> wrote:
>
>
> Sorry missed ccing Amit, done now.
>
> On 04-06-20, 18:03, Dmitry Baryshkov wrote:
> > On 04/06/2020 13:47, Vinod Koul wrote:
> > > On 04-06-20, 03:43, Dmitry Baryshkov wrote:
>
> > > >                   pm8150_adc: adc@3100 {
> > > >                           compatible = "qcom,spmi-adc5";
> > > >                           reg = <0x3100>;
> > > > @@ -38,8 +47,6 @@ pm8150_adc: adc@3100 {
> > > >                           #io-channel-cells = <1>;
> > > >                           interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> > > > -                 status = "disabled";
> > > > -
> > >
> > > This should not be removed, rather than this please add enabled in you
> > > board dts file

Compare this with pm8998.dtsi. It has all nodes enabled by default.

> > > > +&thermal_zones {
> > > > + pm8150_temp {
> > > > +         polling-delay-passive = <0>;
> > > > +         polling-delay = <0>;
> > > > +
> > > > +         thermal-sensors = <&pm8150_temp>;
> > > > +
> > > > +         trips {
> > > > +                 trip0 {
> > > > +                         temperature = <95000>;
> > > > +                         hysteresis = <0>;
> > > > +                         type = "passive";
> > > > +                 };
> > > > +
> > > > +                 trip1 {
> > > > +                         temperature = <115000>;
> > > > +                         hysteresis = <0>;
> > > > +                         type = "passive";
> > > > +                 };
> > > > +
> > > > +                 trip2 {
> > > > +                         temperature = <145000>;
> > > > +                         hysteresis = <0>;
> > > > +                         type = "passive";
> > > > +                 };
> > > > +         };
> > > > +
> > > > + };
> > >
> > > Not sure about this, Amit..? Should this also not be in board dts?
> > >
> > > Similar comments on similar ones for rest of the patch as well..
> >
> > I'm not so sure. This part of the configuration seems generic to me. Unlike
> > adc-tm config, which definitely goes to the board file.
>
> I think the temperature values may be board specific, Amit can confirm
> that. If that is the case then this belongs to board dts, otherwise here :)

Again, pm8998 has these thermal values in the dtsi file. In V2 I will
update these three files to follow pm8998.dtsi.

-- 
With best wishes
Dmitry
