Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630D3C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 18:45:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BEB6207F7
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 18:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bRJxS+Q2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgFLSpk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 14:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgFLSpj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 14:45:39 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C608DC03E96F
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 11:45:39 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id f7so11088243ejq.6
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 11:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P8sNBYcte/zk1gJm2YzOJRDjejnEUqN/A2ieuNyUweg=;
        b=bRJxS+Q2KQuM54a8erBJ8qt32TXVRsXhyMB8WWOq3eNmxwrN4tec98hY1I3dgRAadb
         ts7ymaPP/cxcISqUJMVR1rg0hvz0g6hLj31QBZ2Q4wp8U7XtRblQESknjGvBDfox0Z06
         uKeyun3azaUw4eFf03EUYyLAv5q0HMR3PsF8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P8sNBYcte/zk1gJm2YzOJRDjejnEUqN/A2ieuNyUweg=;
        b=ONkwvcxeHdB2EleUUva0aIDanEWgD4ZDv+Zwf1HuOG106up4JOaee2hDr0qS2zAwrQ
         yNmL2catPACqsR7TPPsU9rr0NFUuSEDUP7IWJcZIQ5TIMviilXMeDLPqOGJ/PqL23oK2
         IiRWnYQ0kkl5fXBiQsbs21VMN/ZcDeTbOgSPsxk07QJ33jVmcgyHj2nFtsfZTzO5pp/8
         g5dsxqv2kxjI9mDwiT4jpo1+P1FYcS6iRC2SRjWBbHwG+18qkDhl/MaUeapdGLs5Nij/
         53K4KlGTIPYpiEnACI5+IGVT/E8zeaTfcnG79YfPtPOBXwdqeDSoP587GJvvEp7tL9Tm
         krPQ==
X-Gm-Message-State: AOAM531P4PMlwp3AEhrx71GpC+AdcOtPX8qMq/PEvVKUyXp6LGJv1Y/7
        scN7N4elP6oD1bQXUJC78NlbgI3v08heeg==
X-Google-Smtp-Source: ABdhPJxB40oWvKauvYQp7GgS01z+ZZSXZJslOO3BxwosgT1E1lnq6U4bk4Tlud5OV2JdSPZzDhJ4vQ==
X-Received: by 2002:a17:906:d8bc:: with SMTP id qc28mr15394028ejb.167.1591987538249;
        Fri, 12 Jun 2020 11:45:38 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id ew9sm3974870ejb.121.2020.06.12.11.45.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 11:45:38 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id e1so10740023wrt.5
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 11:45:37 -0700 (PDT)
X-Received: by 2002:a1c:2e0e:: with SMTP id u14mr257126wmu.55.1591987183150;
 Fri, 12 Jun 2020 11:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-3-dongchun.zhu@mediatek.com> <20200610194455.GK201868@chromium.org>
 <1591958798.8804.660.camel@mhfsdcap03>
In-Reply-To: <1591958798.8804.660.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 12 Jun 2020 20:39:30 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Bcb4A+HAivA-jrczK+OMxwZk3w0GYoh-DU=6gmTZBWnQ@mail.gmail.com>
Message-ID: <CAAFQd5Bcb4A+HAivA-jrczK+OMxwZk3w0GYoh-DU=6gmTZBWnQ@mail.gmail.com>
Subject: Re: [V9, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 12, 2020 at 12:49 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Wed, 2020-06-10 at 19:44 +0000, Tomasz Figa wrote:
> > Hi Dongchun,
> >
> > On Sat, May 23, 2020 at 04:41:03PM +0800, Dongchun Zhu wrote:
> > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > >
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  MAINTAINERS                 |    1 +
> > >  drivers/media/i2c/Kconfig   |   13 +
> > >  drivers/media/i2c/Makefile  |    1 +
> > >  drivers/media/i2c/ov02a10.c | 1025 +++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 1040 insertions(+)
> > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > >
> >
> > Thank you for the patch. Please see my comments inline.
> >
> > [snip]
> > > diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> > > new file mode 100644
> > > index 0000000..160a0b5
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/ov02a10.c
> > [snip]
> > > +static const char * const ov02a10_test_pattern_menu[] = {
> > > +   "Disabled",
> > > +   "Color Bar",
> >
> > nit: We should normalize this to one of the standard names. What is the
> > pattern on this sensor? Is it perhaps "Eight Vertical Colour Bars"?
> >
>
> Yes. It is one kind of 'Eight Vertical Colour Bars'.
> This pattern is called as 'MIPI color bar' per the datasheet.
> Can we here use 'Vertical Color Bar' or 'MIPI Color Bar'?
>

We should try to stick to the names as exposed by existing drivers.
There was an attempt to unify the naming of some Sony sensors some
time ago [1]. Perhaps one of the names there matches the pattern of
this sensor?

[1] https://patchwork.kernel.org/patch/10711777/

Best regards,
Tomasz
