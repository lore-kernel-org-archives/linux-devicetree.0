Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B50C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 21:03:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25B76206F1
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 21:03:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GryIZOgw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731153AbgF2VDG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 17:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731145AbgF2TMs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 15:12:48 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBDDC008608
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 03:22:29 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id n2so3335263edr.5
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 03:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PhguteWn+BNL2rOz+hmBG6LMc95B72qiCMa6M5a1mog=;
        b=GryIZOgwWXWQdlINYt+x/02V6RsfowLZwhA3TrXCr0kgs/XolUBKkiYBVjZIeZVq6U
         B0A+U5FpFXsT10NBtK+1s80jnmBYvKFrjgCI6zXkQLKW1c9oDO0LQ4FLIsfYd0rfHVAx
         jfAXF26rS6rgbwq+ioEFJHVIJaG2W8rmmHqW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PhguteWn+BNL2rOz+hmBG6LMc95B72qiCMa6M5a1mog=;
        b=lZQTlUwvxv2umpyK/3Qde7DNRcW3qQBtuhVdpZTETIRrQCCl1LrXrrh1qngi0NTpAO
         OapXQelB+0DCcdrWtr0u5i0/5DeIKcnE0lCrXefU4E7Mza/KcMCAmH4sOssSIb4LvDN8
         Sz6KiL+hMItUBfen5doiyFgFc6cFfn7E98bM1wHC74yJpSnKCDUIuaQFOKUim8hsE57s
         1iZhvu0wG8w/zOT4EMB1NKw7iEDR9+FIr4mEWoYxaIDomoz4bQwiRbdr4WYofkISUWDY
         hPtoE43kMmOOrEp8bo+dBxB8UPCBXijMGQfgZRK/rp6e1I6+U5Wvyssdx3T8VT83sQ69
         EBQg==
X-Gm-Message-State: AOAM532Er1ck/PGcUzZ6zfZcwfeiRyRO8Ym8CkANt1t5fc5OJmfiATDc
        WDrT5h/QYvtMIFaLGI81ymXeaznIcbqxZw==
X-Google-Smtp-Source: ABdhPJzGj/AQkmntAyNr8QfhzRpRAJxWDW0z42PBwEBwOvncNus8ljIorMdv/eMryCnKKro0BtxNcA==
X-Received: by 2002:a50:e604:: with SMTP id y4mr16131595edm.373.1593426147787;
        Mon, 29 Jun 2020 03:22:27 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id y11sm8118710ejw.63.2020.06.29.03.22.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 03:22:26 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id o11so15960689wrv.9
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 03:22:26 -0700 (PDT)
X-Received: by 2002:adf:80e6:: with SMTP id 93mr15866385wrl.17.1593426145911;
 Mon, 29 Jun 2020 03:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
 <20200615122937.18965-3-dongchun.zhu@mediatek.com> <20200618191026.GA73379@chromium.org>
 <1592639284.8804.712.camel@mhfsdcap03> <20200622152350.GB260716@chromium.org> <1593412218.17166.3.camel@mhfsdcap03>
In-Reply-To: <1593412218.17166.3.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 29 Jun 2020 12:22:14 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Bi+Dh85Wz5q4RMGQvKw3aHFWWgypKsNukg_MwF4_ceCw@mail.gmail.com>
Message-ID: <CAAFQd5Bi+Dh85Wz5q4RMGQvKw3aHFWWgypKsNukg_MwF4_ceCw@mail.gmail.com>
Subject: Re: [PATCH V10 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
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

On Mon, Jun 29, 2020 at 8:30 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> Thanks for the review.
>
> On Mon, 2020-06-22 at 15:23 +0000, Tomasz Figa wrote:
> > On Sat, Jun 20, 2020 at 03:48:04PM +0800, Dongchun Zhu wrote:
> > > Hi Tomasz,
> > >
> > > Thanks for the review.
> > >
> > > On Thu, 2020-06-18 at 19:10 +0000, Tomasz Figa wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Mon, Jun 15, 2020 at 08:29:37PM +0800, Dongchun Zhu wrote:
> > > > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > > > >
> > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > ---
> > > > >  MAINTAINERS                 |    1 +
> > > > >  drivers/media/i2c/Kconfig   |   13 +
> > > > >  drivers/media/i2c/Makefile  |    1 +
> > > > >  drivers/media/i2c/ov02a10.c | 1042 +++++++++++++++++++++++++++++++++++++++++++
> > > > >  4 files changed, 1057 insertions(+)
> > > > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > > > >
> > > >
> > > > Thank you for the patch. Please see my comments inline.
> > > >
> > > > [snip]
> > > > > +static int ov02a10_set_fmt(struct v4l2_subdev *sd,
> > > > > +                          struct v4l2_subdev_pad_config *cfg,
> > > > > +                          struct v4l2_subdev_format *fmt)
> > > > > +{
> > > > > +       struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > > +       struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > > > > +
> > > > > +       mutex_lock(&ov02a10->mutex);
> > > > > +
> > > > > +       if (ov02a10->streaming) {
> > > > > +               mutex_unlock(&ov02a10->mutex);
> > > > > +               return -EBUSY;
> > > > > +       }
> > > > > +
> > > > > +       /* Only one sensor mode supported */
> > > > > +       mbus_fmt->code = ov02a10->fmt.code;
> > > > > +       ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > > > > +       ov02a10->fmt = fmt->format;
> > > > > +
> > > > > +       if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > > > > +               *v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> > > >
> > > > If fmt->which is V4L2_SUBDEV_FORMAT_TRY, the internal driver state must not
> > > > be affected. It also should not depend on whether the sensor is streaming
> > > > or not. Basically it should be considered a special "candidate" format,
> > > > which isn't programmed to the hardware, but just stored aside.
> > > >
> > >
> > > Hmm. Maybe we shall use FORMAT_TRY like this:
> > > struct v4l2_mbus_framefmt *frame_fmt;
> > > ...
> > > if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > >     frame_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
> > > else
> > >     frame_fmt = &ov02a10->fmt;
> > >
> > > *frame_fmt = *mbus_fmt;
> > >
> > > (Remove 'ov02a10->fmt = fmt->format;' above)
> > >
> >
> > Yes, I guess that should work. Also the ov02a10->streaming condition
> > shouldn't be checked if fmt->which is V4L2_SUBDEV_FORMAT_TRY).
> >
>
> Maybe we shall use more strict condition to check streaming state:
> 'if (ov02a10->streaming)' --> 'if (ov02a10->streaming && fmt->which ==
> V4L2_SUBDEV_FORMAT_ACTIVE)'

Yes, that should work.

Best regards,
Tomasz
