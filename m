Return-Path: <SRS0=a2/f=7Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFA1C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 09:58:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C026A207C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 09:58:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ljWu6Ln7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgFKJ6A (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 11 Jun 2020 05:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbgFKJ57 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Jun 2020 05:57:59 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB89EC08C5C1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 02:57:58 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id gl26so5796233ejb.11
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sEeSSXzDo0aNfT8RCtgk710cFUXelBPKlbjMwXGCKwA=;
        b=ljWu6Ln7hmjbcBaRzZlHWsT0AjYarwzwjH9o3tH1WN6ZGm20b3T8IO8qH00SIhGaSU
         2FAGvqeoH1s9Mkt3AjDMPdJEdCN+ef7x2NyJi4pptkj2GqINEjaofwFp3hdrggRXxemL
         kK+WFn4bsOTCeP3MWFAGQgep+fdXOtmjey0EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sEeSSXzDo0aNfT8RCtgk710cFUXelBPKlbjMwXGCKwA=;
        b=O2VbXWoD843z+oaGXuExULy3O95WhYcojPtYztmeYD7aZptlkpZDin4rB2CuItnNun
         EhSC0ZvNTilTnhV63vpZo5pIdg0Z0JdYAZphKO2KKuUI30nXig6D6i0/l/7X62LacgVp
         v3FDKKUzAC4i0Xvn0SzqdWmutmztDvyztiXVWyBFB6W03Tu4ILz3WnskOQrMdMa5f3uV
         7B31D+C9K2IaMq66QW2JhIeYojUdc8fvcfRLt3/uPmgne3Bxnkvpdn0efgcOJHxhh4B1
         YUOrnDEdb/echESt9BQXuawHDPVow2zrgwBN02bFaCOaA7nVSY0NPLqjoDRWVwemRlI2
         Tghw==
X-Gm-Message-State: AOAM5313sf7b4Nf36dltGhh08naKRSEP4NnaeumEccss6wpmbOTot7zQ
        OTrckHvyr8bvsvdLwYWUp0L4Zuxqt9DIMw==
X-Google-Smtp-Source: ABdhPJw/LyAIBvmpTlakvUZF1JcEVu+a3ZUh3arZpvmGCfofdesW6PFEwSURt4ic2LNMsNTsVLBPPg==
X-Received: by 2002:a17:906:178c:: with SMTP id t12mr7311211eje.464.1591869477158;
        Thu, 11 Jun 2020 02:57:57 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id i21sm1282760edr.68.2020.06.11.02.57.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2020 02:57:56 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id e1so5487672wrt.5
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 02:57:55 -0700 (PDT)
X-Received: by 2002:adf:e2ce:: with SMTP id d14mr8780636wrj.415.1591869474948;
 Thu, 11 Jun 2020 02:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-3-dongchun.zhu@mediatek.com> <20200610194455.GK201868@chromium.org>
 <20200611095333.GK16711@paasikivi.fi.intel.com>
In-Reply-To: <20200611095333.GK16711@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 11 Jun 2020 11:57:43 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BBxBEs=gCohOzOGzkTDNkL1yyu7dtEY26K52=CmFAWnA@mail.gmail.com>
Message-ID: <CAAFQd5BBxBEs=gCohOzOGzkTDNkL1yyu7dtEY26K52=CmFAWnA@mail.gmail.com>
Subject: Re: [V9, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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

On Thu, Jun 11, 2020 at 11:53 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Tomasz,
>
> On Wed, Jun 10, 2020 at 07:44:55PM +0000, Tomasz Figa wrote:
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
> > > +};
> > [snip]
> > > +static int ov02a10_set_fmt(struct v4l2_subdev *sd,
> > > +                      struct v4l2_subdev_pad_config *cfg,
> > > +                      struct v4l2_subdev_format *fmt)
> > > +{
> > > +   struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > +   struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > > +
> > > +   mutex_lock(&ov02a10->mutex);
> > > +
> >
> >
> > Don't we need to handle the case when fmt->which is V4L2_SUBDEV_FORMAT_TRY,
> > which is used for trying the format, but not applying it to the hardware?
>
> Yes.
>
> >
> > > +   if (ov02a10->streaming) {
> > > +           mutex_unlock(&ov02a10->mutex);
> > > +           return -EBUSY;
> > > +   }
> > > +
> > > +   /* Only one sensor mode supported */
> > > +   mbus_fmt->code = ov02a10->fmt.code;
> > > +   ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > > +   ov02a10->fmt = fmt->format;
> > > +
> > > +   mutex_unlock(&ov02a10->mutex);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int ov02a10_get_fmt(struct v4l2_subdev *sd,
> > > +                      struct v4l2_subdev_pad_config *cfg,
> > > +                      struct v4l2_subdev_format *fmt)
> > > +{
> > > +   struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > +   struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > > +
> > > +   mutex_lock(&ov02a10->mutex);
> > > +
> > > +   fmt->format = ov02a10->fmt;
> >
> > Ditto.
> >
> > > +   mbus_fmt->code = ov02a10->fmt.code;
> > > +   ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > > +
> > > +   mutex_unlock(&ov02a10->mutex);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int ov02a10_enum_mbus_code(struct v4l2_subdev *sd,
> > > +                             struct v4l2_subdev_pad_config *cfg,
> > > +                             struct v4l2_subdev_mbus_code_enum *code)
> > > +{
> > > +   struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > +
> > > +   if (code->index >= ARRAY_SIZE(supported_modes))
> > > +           return -EINVAL;
> >
> > Hmm, supported_modes[] doesn't seem to hold the information about mbus
> > codes. Should this just perhaps be "!= 0"?
> >
> > > +
> > > +   code->code = ov02a10->fmt.code;
> > > +
> > > +   return 0;
> > > +}
> > [snip]
> > > +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> > > +                              struct v4l2_subdev_pad_config *cfg)
> > > +{
> > > +   struct v4l2_subdev_format fmt = {
> > > +           .which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE,
> > > +           .format = {
> > > +                   .width = 1600,
> > > +                   .height = 1200,
> > > +           }
> > > +   };
> > > +
> > > +   ov02a10_set_fmt(sd, cfg, &fmt);
> > > +
> > > +   return 0;
> > > +}
> > > +
> >
> > I'm not familiar with this init_cfg operation and the documentation is very
> > sparse about it. Sakari, is this a correct implementation?
>
> The purpose is to initialise a pad configuration (format and selection
> rectangles) to the device defaults. As there seem to be no selection
> rectangles, this seems fine to me.

Thanks. I traced the code and could only see one place where the
callback is being called and that was with cfg != NULL. Still, the
code above uses "cfg ?" as a check to determine whether TRY or ACTIVE
should be passed to which. Is that also correct?

Best regards,
Tomasz
