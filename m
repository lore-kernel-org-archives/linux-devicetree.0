Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63E4C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 19:25:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8903C2065D
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 19:25:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zRIw/Co3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgGOTZg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 15:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgGOTZf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 15:25:35 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DDF3C08C5CE
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 12:25:35 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b92so3441455pjc.4
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 12:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3mLyoqQ65j83/RZOgZx9owU+vsrwWr+OuSAYp6RQxmA=;
        b=zRIw/Co3Fw1o91+o+iUQQE/K4wwTKqCKgl5VpQpqq31otAfcrVlN2J1oVn3x4YAysU
         S52G92YfGIVF2/Nh6+tmYP44QlElLYZtlgBsjp0SRx0ql+XNH+1xUigahsOlEu1n6Sx4
         43v6f+rywE34Vtx4iZ0aPQeTCDcYjvImvqPjRV+irZkv1jQUsOKlgSvaL6+kO5qHOOPQ
         rKm1/gZD5L8T1Oyv3YWoxO4pu7A7eAjd+1gFLu3MmnhROY2Jj4Gmfgd1I6ilUJHlObfZ
         SCkeiCq0ZrlvJGh3kfZWuTIaKIpLBfxpfKDfbfeeIQuF+E4qPwqXW0VkXVzd5uvnl0h5
         LwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3mLyoqQ65j83/RZOgZx9owU+vsrwWr+OuSAYp6RQxmA=;
        b=PpHn9f3EhpCBlGaLZ0Uyf+NVxsv8b0idkJQZ850WbtK5tY1AbE9gU1wDtyoXgZ3rDH
         JViLSlFK/ozyQKcm64vhmPQtJvgvuonjwCRIIhPpowZpUe0KPOrW6XRuns90/ByPtEmq
         ynIZrB7NV98OjeC3oIm/B4ooTkpg5Bjaqc5VBxhOGtGZ+jCvz63eI4esjuP2o/hxE82R
         zza4scqNY2qwkmGLGASDlf6zJayvxzaAH+gOz4VGWkllRhVCvWwzRTGiRMGLgDjQMC9E
         sPy0o/9V+5elpJGuoBagDWjOYsbWj6HAToERMNX0kjJUqbTRwi81njn05tHhdvlAUfoD
         D7Yw==
X-Gm-Message-State: AOAM530rDTcEYgr8o+HYEvpcWCBeMPJzvT6DCDJkMRYZ9F9gpxDastZg
        QKCE7YXFNEyZ0kgaN2t8cK6nMw==
X-Google-Smtp-Source: ABdhPJwvOHTxvlygnXVG+yH9Xt0Mzfuh5CRHWI2/ORVUGddWotKenGd/mY9jT9r/BPPrwgjGCsiJfQ==
X-Received: by 2002:a17:902:c408:: with SMTP id k8mr778463plk.279.1594841134505;
        Wed, 15 Jul 2020 12:25:34 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 82sm2719511pfz.151.2020.07.15.12.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 12:25:33 -0700 (PDT)
Date:   Wed, 15 Jul 2020 12:23:29 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rakesh Pillai <pillair@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Evan Green <evgreen@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add missing properties for
 Wifi node
Message-ID: <20200715192329.GF1218486@builder.lan>
References: <1594615586-17055-1-git-send-email-pillair@codeaurora.org>
 <CAD=FV=XtBhM_CSQM63LCiVDR0oPAAyEr5bG_FRt1tdwpw5OPKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=XtBhM_CSQM63LCiVDR0oPAAyEr5bG_FRt1tdwpw5OPKQ@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed 15 Jul 12:01 PDT 2020, Doug Anderson wrote:

> Hi,
> 
> On Sun, Jul 12, 2020 at 9:46 PM Rakesh Pillai <pillair@codeaurora.org> wrote:
> >
> > The wlan firmware memory is statically mapped in
> > the Trusted Firmware, hence the wlan driver does
> > not need to map/unmap this region dynamically.
> >
> > Hence add the property to indicate the wlan driver
> > to not map/unamp the firmware memory region
> > dynamically.
> >
> > Also add the chain1 voltage supply for wlan.
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > ---
> > Changes from v1:
> > - Add the wifi mac alias
> >
> > This patch is created on top of the change by
> > Douglas Anderson.
> > https://lkml.org/lkml/2020/6/25/817
> >
> > Also the dt-bindings for the chain1 voltage supply
> > is added by the below patch series:
> > https://patchwork.kernel.org/project/linux-wireless/list/?series=309137
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > index 472f7f4..c042d61 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > @@ -19,6 +19,7 @@
> >
> >         aliases {
> >                 bluetooth0 = &bluetooth;
> > +               wifi0 = &wifi;
> >                 hsuart0 = &uart3;
> >                 serial0 = &uart8;
> 
> Could you alphabetize?
> 

I fixed this up while applying the patch.

Thanks,
Bjorn

> >         };
> > @@ -391,10 +392,12 @@
> >
> >  &wifi {
> >         status = "okay";
> > +       qcom,msa-fixed-perm;
> >         vdd-0.8-cx-mx-supply = <&vreg_l9a_0p6>;
> >         vdd-1.8-xo-supply = <&vreg_l1c_1p8>;
> >         vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
> >         vdd-3.3-ch0-supply = <&vreg_l10c_3p3>;
> > +       vdd-3.3-ch1-supply = <&vreg_l11c_3p3>;
> >         wifi-firmware {
> >                 iommus = <&apps_smmu 0xc2 0x1>;
> >         };
> 
> Other than the alphabetical order:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
