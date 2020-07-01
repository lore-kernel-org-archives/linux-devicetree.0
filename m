Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54798C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 10:56:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31EDB20702
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 10:56:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aYHAkQYk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730126AbgGAK4Q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 06:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729791AbgGAK4P (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jul 2020 06:56:15 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE857C061755
        for <devicetree@vger.kernel.org>; Wed,  1 Jul 2020 03:56:15 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id j11so17546999oiw.12
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2020 03:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9R1819T+AMdAOtCQQNpTxAKlBNbGEf7KSfYXQ+RjODU=;
        b=aYHAkQYkS6JUqmaJPF5BVtaNalhoghvq/swOD0R3FZXxx7mUsV4ECOXfnvppWngu+R
         9Z9Dh5k1WLPz7Vyk8L3ruAXXX1rV75XEYzFQHi0sHv353WD+DOUSpmHnPS0pc/gsVvEd
         KYRrv7z57XqyisydWQUOZ5+OhtMmpXmrRbxqYuSrGyAWygKr5tFar35r1uEzWGQD9+KB
         kSViPFnIiFmZ1beM9Cd69yd8pkLuOU4fSnFXKJwtHT45bP/6WVgEUxfOCy4Oopso12yO
         6Ie1EjRAbSYb2AUj59lbogW+A4ezR3M9NEhRW7yiOHKcQG8o9RbCRNdHx9pXxmBJcg3/
         3U/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9R1819T+AMdAOtCQQNpTxAKlBNbGEf7KSfYXQ+RjODU=;
        b=bTpwxTmCjKE0nOvMmNT01jWUU+Tj/5UEi0THTXB+esPqFqjMseejCBVeUZwUN0L6bo
         pG+sKkoy3k1tRAFwboEbXEzhjhXi4g3JYUUrH3F+oB5be2HNKOX6/SX/LIqmOYg+Xizp
         tNJEB39rLB+gj7prLnEcktNXptpdWAI3s0GGSkL1tA1rjyiriQbQ30Rs0CXlBaODd+Jx
         p4zGHu0lhV9XAz9heWyoueYtRGQ44QAQ4y6sq4YbNJgf643IDt2JkIwkSeqYR/lNeHPe
         P3sp4BjANRkqZiU6qMKFgfBsJJrrh2atobK86EaWyH6PBZO36shgqWUAGOJcwe1AF6FZ
         67hQ==
X-Gm-Message-State: AOAM531WjqiwctwaeQBtLn2/3Vdj3OljihxAH0w3W+u9jaLu1NL8s0hm
        JKBJEIuCI21f5Fqfax8v3pUkm/fx3YOr5nTxEfPOLQ==
X-Google-Smtp-Source: ABdhPJwiMZdnEdNGjW368fqv2h6n7DhHfnsnINvnj5udm0TiFLaMmVcbKkxd2ebZrlhbN1BozXl0HotXeXWCkUe0k78=
X-Received: by 2002:a54:4399:: with SMTP id u25mr20479018oiv.177.1593600975413;
 Wed, 01 Jul 2020 03:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200621193549.2070434-1-dmitry.baryshkov@linaro.org>
 <20200621193549.2070434-6-dmitry.baryshkov@linaro.org> <CAHLCerOqWWr3i32tRgGfep12YfDufw-WU80VWUsUNpDDZ13D-w@mail.gmail.com>
 <CAA8EJppAQgmS7VVCjVe8QST2RQU46mXO2jtUPFY30mH9sVu_rQ@mail.gmail.com> <CAHLCerM8KwUhpossD=vyhU4q22FnrZse_zhiS0ZobZM0J9X8PA@mail.gmail.com>
In-Reply-To: <CAHLCerM8KwUhpossD=vyhU4q22FnrZse_zhiS0ZobZM0J9X8PA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 1 Jul 2020 13:56:03 +0300
Message-ID: <CAA8EJprc4hET7MoTSj80==OdE-o-iho6vcrGgSPAQFaOLfFi2w@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: sm8250-dts: add thermal zones using
 pmic's adc-tm5
To:     Amit Kucheria <amit.kucheria@verdurent.com>
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

On Wed, 1 Jul 2020 at 09:06, Amit Kucheria <amit.kucheria@verdurent.com> wrote:
>
> On Tue, Jun 30, 2020 at 5:40 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Hi,
> >
> > On Tue, 30 Jun 2020 at 08:06, Amit Kucheria <amit.kucheria@verdurent.com> wrote:
> > > On Mon, Jun 22, 2020 at 1:06 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > Port thermal zones definitions from msm-4.19 tree. Enable and add
> > > > channel configuration to PMIC's ADC-TM definitions. Declare thermal
> > > > zones and respective trip points.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 237 ++++++++++++++++++++++++
> > > >  1 file changed, 237 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> > >
> > > IMO, this should be separated in the pmic dts file like we do for
> > > other QC platforms since the PMICs tend to be used in multiple
> > > platforms.
> >
> > Unlike other PMIC/tsens thermal zones, these definitions are quite
> > specific to the board from my point of view.
>
> How so? Can you describe what is different about this PMIC?

It is not about this PMIC, but rather about particular thermistors
being placed up in different places on the board itself.

> > > > index aa37eb112d85..78f0cf582a9a 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> > > > @@ -24,6 +24,104 @@ chosen {
> > > >                 stdout-path = "serial0:115200n8";
> > > >         };
> > > >
> > > > +       thermal-zones {
> > > > +               xo-therm {
> > > > +                       polling-delay-passive = <0>;
> > > > +                       polling-delay = <0>;
> > > > +                       thermal-sensors = <&pm8150_adc_tm 0>;
> > > > +                       trips {
> > > > +                               active-config0 {
> > > > +                                       temperature = <125000>;
> > > > +                                       hysteresis = <1000>;
> > > > +                                       type = "passive";
> > > > +                               };
> > > > +                       };
> > > > +               };
> > > > +



-- 
With best wishes
Dmitry
