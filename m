Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02B7C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 14:21:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E04B20672
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 14:21:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QTId9nlU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731590AbgF3OVu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 10:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbgF3OVt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 10:21:49 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C47C061755
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 07:21:49 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id by13so6532433edb.11
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 07:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+T79FWShEgqDoWQukYRvbRwI/5OamJjXMslVeXNvho4=;
        b=QTId9nlUZpTlkVeCnLOUUePHL6SB1+TN7LSQn/ukx86gPS640sWt3RIdy3jLEPubbE
         u3wJFycz/XY04Kn0jdOAzisTFoRDXiLaNgGABqcFrGAZIY24B0uKLjbNBT+HEc4sVYjf
         0FUNkOGtEBpKJm7JeCvDjZM+HNTq5JOrKGtFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+T79FWShEgqDoWQukYRvbRwI/5OamJjXMslVeXNvho4=;
        b=JU5MYKadNFk/DoBvjZfIZSh2uuKKpuMa4TOrxULpr4kgW3Nmp7Ho95YRmFTMblk6uc
         NTfgbwwQTPrUb5hhDORS/5saFpIoBmtmBaPHh3tpDaLCW41+A0Ux+ttBO5Xc3mT5NDDX
         xkLjSKauc3CN/fcbY6Oj7aX9iCz0ZNB5MwcqCTkvi5UsrUs7A+gjkOGsODUVWB6vi1fi
         76KOlE+cFvZLmU+tCnXnCEelYZ7AB7MOxKo/vM7NRtRIFiWuIcrhgfE5gFLNudQg+XLf
         wGR/+Dj6oENa5q9/Rpo4S+b9ZTdJ3f8f9cDO86snl2BmLqKkQECxU+iP8JgZdaZe/mlM
         UDRw==
X-Gm-Message-State: AOAM530UXabzZdRGDWu9T+PMbMx4R6Nz1CP2NrSpLs06t5oKui0lX8Zh
        nWKlG328ALoK0DUV8je4wQfSGQTDWJSIpA==
X-Google-Smtp-Source: ABdhPJwfUJSZjvtdQ0BuT0sDB8ulBZXD/cIeN+6oe0lewJeovpFRNcWZXMRrUjKw+KBw7r7TTOn1Ow==
X-Received: by 2002:aa7:d353:: with SMTP id m19mr22586184edr.75.1593526907478;
        Tue, 30 Jun 2020 07:21:47 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id v11sm2112948eja.113.2020.06.30.07.21.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:21:43 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id h5so20385221wrc.7
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 07:21:42 -0700 (PDT)
X-Received: by 2002:adf:dfcd:: with SMTP id q13mr22043827wrn.295.1593526901957;
 Tue, 30 Jun 2020 07:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com> <20200630095430.GF16711@paasikivi.fi.intel.com>
 <CAAFQd5AGeL7+qhgxDGxWYgTcOVrNGqE8P-L40WWM2JDrY=YYZQ@mail.gmail.com>
In-Reply-To: <CAAFQd5AGeL7+qhgxDGxWYgTcOVrNGqE8P-L40WWM2JDrY=YYZQ@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 30 Jun 2020 16:21:31 +0200
X-Gmail-Original-Message-ID: <CAAFQd5B0GxPpGm750rVKfPJi-gtn7w9KouFhXZc4k5OEtiKqBg@mail.gmail.com>
Message-ID: <CAAFQd5B0GxPpGm750rVKfPJi-gtn7w9KouFhXZc4k5OEtiKqBg@mail.gmail.com>
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
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

On Tue, Jun 30, 2020 at 4:19 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Tue, Jun 30, 2020 at 11:54 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Dongchun,
> >
> > Thanks for the update.
> >
> > On Tue, Jun 30, 2020 at 10:49:42AM +0800, Dongchun Zhu wrote:
> > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > >
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  MAINTAINERS                 |    1 +
> > >  drivers/media/i2c/Kconfig   |   13 +
> > >  drivers/media/i2c/Makefile  |    1 +
> > >  drivers/media/i2c/ov02a10.c | 1052 +++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 1067 insertions(+)
> > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 378c961..a6a2f8b 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -12566,6 +12566,7 @@ L:    linux-media@vger.kernel.org
> > >  S:   Maintained
> > >  T:   git git://linuxtv.org/media_tree.git
> > >  F:   Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > +F:   drivers/media/i2c/ov02a10.c
> > >
> > >  OMNIVISION OV13858 SENSOR DRIVER
> > >  M:   Sakari Ailus <sakari.ailus@linux.intel.com>
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index da11036..65519cf 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -812,6 +812,19 @@ config VIDEO_IMX355
> > >         To compile this driver as a module, choose M here: the
> > >         module will be called imx355.
> > >
> > > +config VIDEO_OV02A10
> > > +     tristate "OmniVision OV02A10 sensor support"
> > > +     depends on I2C && VIDEO_V4L2
> > > +     select MEDIA_CONTROLLER
> > > +     select VIDEO_V4L2_SUBDEV_API
> > > +     select V4L2_FWNODE
> > > +     help
> > > +       This is a Video4Linux2 sensor driver for the OmniVision
> > > +       OV02A10 camera.
> > > +
> > > +       To compile this driver as a module, choose M here: the
> > > +       module will be called ov02a10.
> > > +
> > >  config VIDEO_OV2640
> > >       tristate "OmniVision OV2640 sensor support"
> > >       depends on VIDEO_V4L2 && I2C
> > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > index 993acab..384e676 100644
> > > --- a/drivers/media/i2c/Makefile
> > > +++ b/drivers/media/i2c/Makefile
> > > @@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
> > >  obj-$(CONFIG_VIDEO_SONY_BTF_MPX) += sony-btf-mpx.o
> > >  obj-$(CONFIG_VIDEO_UPD64031A) += upd64031a.o
> > >  obj-$(CONFIG_VIDEO_UPD64083) += upd64083.o
> > > +obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
> > >  obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
> > >  obj-$(CONFIG_VIDEO_OV2680) += ov2680.o
> > >  obj-$(CONFIG_VIDEO_OV2685) += ov2685.o
> > > diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> > > new file mode 100644
> > > index 0000000..f7fd329
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/ov02a10.c
> >
> > ...
> >
> > > +     ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> >
> >
> > Shouldn't this be GPIOD_OUT_HIGH? That's the state it'll be after powering
> > the sensor off the first time. Alternatively make reset signal high in
> > runtime suspend callback.
>
> We might want to keep the signals low when the regulators are powered
> down, to reduce the leakage.

Ah, I actually recall that the reset pin was physically active low, so
we would indeed better keep it at HIGH. Sorry for the noise.

Best regards,
Tomasz
