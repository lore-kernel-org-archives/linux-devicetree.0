Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D3DC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 14:20:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7519D2074F
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 14:20:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fbb+OAM/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729019AbgF3OUR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 10:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728909AbgF3OUQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 10:20:16 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A44C03E979
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 07:20:15 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id z17so16407892edr.9
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 07:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K7kro9hNrZw4yDhFcFBRDmY6tQ/XNr6sZDxWZvaTmI4=;
        b=fbb+OAM/VHLXp9op4ixkqVNNxAQ+AO+wFy6+opDXTqYBpCyfnzhufpwAHCNZvaj8kg
         DJ+6uWN0mKRJ7bqj+Iv1hbIadPkNcXf/a7lA0O6qm5p1gS9JwHijs7FGKG/tUF1c/eG8
         7/dTNgZH+T8g7F1BjSSVshO7eeBQASWyG+Vd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K7kro9hNrZw4yDhFcFBRDmY6tQ/XNr6sZDxWZvaTmI4=;
        b=pDaoKMpY0qyQWJmNPqYWLREjrJCgBD/PEAKQ0bJ5Yr+O9Ls7PR5DqTZFv+CwZVdKPM
         lIpvz3g4oSMRGG3pfvR0lC4+26KVT+BrCGfpJxqbaVmNsyZ3lZ1oGshNXUVCjh/cihNs
         dtAx43bUmQyqaWFZX70cI3RkEg0tiVfDOItczp1DkDzPY9rg+tU/kzvIu0np8Dyx5PfI
         Ya2XG7nJpTnqaQgBBwdKYdaw0k4I68z5ko4iYfvPP+vUSxKpYvF8oZwKq1MsHTboIN1M
         jX0waD4C0sHcLjE/mIB3XSMIgXPCjwzzOonL/fRpVdd3YIkQL/vvqSUO60mEHNL0KqMR
         MUAg==
X-Gm-Message-State: AOAM531/fMTp2heCcSu2KiJmJCVF/cqgOt+ibmEK/wuV4IAi0rNLQ3sM
        Ol2Voi4IEBddAGvgLJ5B2PRfBJ1SkwE=
X-Google-Smtp-Source: ABdhPJwp1U/4pKbaxKlDhKzoaP9m/kDzoscTGaCc/0v9SOjLhFfjpwwd0/PiEXxae/DPiU0x4ETT9w==
X-Received: by 2002:a50:cc8a:: with SMTP id q10mr23852385edi.257.1593526813551;
        Tue, 30 Jun 2020 07:20:13 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id 36sm3142438edl.31.2020.06.30.07.20.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:20:12 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id l17so19013697wmj.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 07:20:11 -0700 (PDT)
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr22251088wmk.11.1593526811079;
 Tue, 30 Jun 2020 07:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com> <20200630095430.GF16711@paasikivi.fi.intel.com>
In-Reply-To: <20200630095430.GF16711@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 30 Jun 2020 16:19:59 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AGeL7+qhgxDGxWYgTcOVrNGqE8P-L40WWM2JDrY=YYZQ@mail.gmail.com>
Message-ID: <CAAFQd5AGeL7+qhgxDGxWYgTcOVrNGqE8P-L40WWM2JDrY=YYZQ@mail.gmail.com>
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

On Tue, Jun 30, 2020 at 11:54 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Dongchun,
>
> Thanks for the update.
>
> On Tue, Jun 30, 2020 at 10:49:42AM +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for OV02A10 image sensor.
> >
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  MAINTAINERS                 |    1 +
> >  drivers/media/i2c/Kconfig   |   13 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/ov02a10.c | 1052 +++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 1067 insertions(+)
> >  create mode 100644 drivers/media/i2c/ov02a10.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 378c961..a6a2f8b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12566,6 +12566,7 @@ L:    linux-media@vger.kernel.org
> >  S:   Maintained
> >  T:   git git://linuxtv.org/media_tree.git
> >  F:   Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > +F:   drivers/media/i2c/ov02a10.c
> >
> >  OMNIVISION OV13858 SENSOR DRIVER
> >  M:   Sakari Ailus <sakari.ailus@linux.intel.com>
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index da11036..65519cf 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -812,6 +812,19 @@ config VIDEO_IMX355
> >         To compile this driver as a module, choose M here: the
> >         module will be called imx355.
> >
> > +config VIDEO_OV02A10
> > +     tristate "OmniVision OV02A10 sensor support"
> > +     depends on I2C && VIDEO_V4L2
> > +     select MEDIA_CONTROLLER
> > +     select VIDEO_V4L2_SUBDEV_API
> > +     select V4L2_FWNODE
> > +     help
> > +       This is a Video4Linux2 sensor driver for the OmniVision
> > +       OV02A10 camera.
> > +
> > +       To compile this driver as a module, choose M here: the
> > +       module will be called ov02a10.
> > +
> >  config VIDEO_OV2640
> >       tristate "OmniVision OV2640 sensor support"
> >       depends on VIDEO_V4L2 && I2C
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index 993acab..384e676 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
> >  obj-$(CONFIG_VIDEO_SONY_BTF_MPX) += sony-btf-mpx.o
> >  obj-$(CONFIG_VIDEO_UPD64031A) += upd64031a.o
> >  obj-$(CONFIG_VIDEO_UPD64083) += upd64083.o
> > +obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
> >  obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
> >  obj-$(CONFIG_VIDEO_OV2680) += ov2680.o
> >  obj-$(CONFIG_VIDEO_OV2685) += ov2685.o
> > diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> > new file mode 100644
> > index 0000000..f7fd329
> > --- /dev/null
> > +++ b/drivers/media/i2c/ov02a10.c
>
> ...
>
> > +     ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>
>
> Shouldn't this be GPIOD_OUT_HIGH? That's the state it'll be after powering
> the sensor off the first time. Alternatively make reset signal high in
> runtime suspend callback.

We might want to keep the signals low when the regulators are powered
down, to reduce the leakage.

Best regards,
Tomasz
