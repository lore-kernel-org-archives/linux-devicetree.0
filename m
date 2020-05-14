Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4F0C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 17:08:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6831206D8
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 17:08:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m1/voEXy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgENRI0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 13:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbgENRIZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 13:08:25 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B260DC061A0F
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 10:08:25 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y18so1568895pfl.9
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 10:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uUcyf9NwOhWDSsoXsAafDnpXglCvcvKACjl1qcHNAFk=;
        b=m1/voEXyUnijavkOQ2KcCoSjVH54gh9UOXPA7PAvf7E+8JFUn7g+xt6iYEALFHnLnA
         QF2divI3/3Aldqgbubwmwyp+pXVy9GbeZAOV9LSANKIBjmYqK9sNAYffdkL1GzI0IDqU
         LKofRS/Sz9SINnKubmGRLNW81UD9AqjrjY3Wm07fSjPTGjjJ77uHHyIQqeY4Itm+sc8e
         lImgcyfqOZD4/XX1a3LdUnp5EscjmX1ByO20ve6PERtwuIefl5Bmj3qsjLsPdA8U7bZL
         epydIx60tjNt9FI9WbTRy2EpfwUU92JbmjKT32P2o2JzzW9oAQiY0FS/wUhZYOorfpei
         Tk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uUcyf9NwOhWDSsoXsAafDnpXglCvcvKACjl1qcHNAFk=;
        b=bCf8XCUVbyMLLj1wskNV5bvWMmhuATjpeSuL42pL7QuoWBB1F8u4UM6Fj69ps7STfl
         bIiHt5u2aCnw2pbj8Mja0YigP0CIgd/HS+r5RGvHxTOT+hQFbzRwFrNiqpdIxNuwTfqX
         EFVAqPXvVtUjt6v+pdV2TJTvRqksSOKV0refuwy/T85yjywGBLOPUhm0g5IXD8We0DHY
         NBSSFHMM4QN7d95cmck6xf1JfORc1Rf9bpMBm6Y4XXhegaXubZqpRxYYdksKIYQQGqLM
         jxQN0Q+zplc8skDWg5WnOFOTUR2xPk1lb12diWHSot8NGgo5/v0PjdBqHSkBRMLUNN+5
         0zsg==
X-Gm-Message-State: AOAM531QtFzhlVDiqqQ93AuVAf+DseH+p+1lA7DVEnrn+0MrQPygyQEL
        2F+IPVPqM1ASBfuFVmwMNsSVIaXKDjg=
X-Google-Smtp-Source: ABdhPJzsIEv8c2T+CBe2MehVpzlYUEhQ5SEp4znGfWcviT0qA6+Uh7WohNI59SLjpioEdJ1m5ct7OQ==
X-Received: by 2002:a65:6703:: with SMTP id u3mr4771334pgf.179.1589476105048;
        Thu, 14 May 2020 10:08:25 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j186sm2754328pfb.220.2020.05.14.10.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 10:08:24 -0700 (PDT)
Date:   Thu, 14 May 2020 10:06:54 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Baolin Wang <baolin.wang7@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] hwspinlock: qcom: Allow mmio usage in addition to
 syscon
Message-ID: <20200514170654.GY2165@builder.lan>
References: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
 <20200513005441.1102586-4-bjorn.andersson@linaro.org>
 <CADBw62oF=o4xxar8yO+xwhLa3h2oD_GD_tWhFo1DDTJGgFnEjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADBw62oF=o4xxar8yO+xwhLa3h2oD_GD_tWhFo1DDTJGgFnEjg@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue 12 May 20:57 PDT 2020, Baolin Wang wrote:

> On Wed, May 13, 2020 at 8:55 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > In all modern Qualcomm platforms the mutex region of the TCSR is forked
> > off into its own block, all with a offset of 0 and stride of 4096. So
> > add support for directly memory mapping this register space, to avoid
> > the need to represent this block using a syscon.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/hwspinlock/qcom_hwspinlock.c | 72 +++++++++++++++++++++-------
> >  1 file changed, 56 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
[..]
> > +static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
> > +                                                u32 *offset, u32 *stride)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct resource *res;
> > +       void __iomem *base;
> > +
> > +       /* All modern platform has offset 0 and stride of 4k */
> > +       *offset = 0;
> > +       *stride = 0x1000;
> > +
> > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       base = devm_ioremap_resource(&pdev->dev, res);
> 
> I think you can use devm_platform_ioremap_resource(pdev, 0) to
> simplify your code, otherwise looks good to me.

You're right, I better fix this before someone with Coccinelle get the
chance ;)

> Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>
> 

Thanks,
Bjorn
