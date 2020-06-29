Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA6DC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 20:42:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C332C20672
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 20:42:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lx3CXAeD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389633AbgF2UmP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 16:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731652AbgF2TOE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 15:14:04 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50523C008612
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 03:27:42 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id dg28so12364991edb.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 03:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dyroAN44J2OM/AhTWy0pxzrNp1szrmJqs4ojQ9k1drM=;
        b=Lx3CXAeD23+wZge0roPuQ06+3bFnks98aupHyP/952olcUbmZ2dGTSHxJzw5EIsGUz
         uvmG4nB45dVQbnkuBckzCSHvrW6zVQknmXJgYHoxX9RTQxR9W989Dk2c+DFBEIzUtvdl
         dZiHdHK9D7RHwsK8Co1GH/0nYKIPbjqHYwn5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dyroAN44J2OM/AhTWy0pxzrNp1szrmJqs4ojQ9k1drM=;
        b=TzkT0nXUK+VLCJtnZgYUM2ILRHg+tOH3pvVIGWvJ7uBldppH3LuzG3rWA6iJIMz/F8
         7qw6hgoB6NEyszG2j96nAl5Lnv80xLbaH5s4qHhwQQgurpjwC2+/Z418kY12N2El+6zj
         IYRAmtszCpVzIj0siPXWkSWmQGdzwBzUMXq/b5s0xJevIXZSz9FpMzyMukG1L5FFjlwb
         Oy7JhiPvUR6I54gIJCN+2wpXnDww/uHAPqoIzcok3vJt5VwkwysVArFex/CP6TlQN2OO
         QxnQgJu9Fn/fH5LETiZM3IFdMY+3ZvFSkT4T4cMwAScRyTTdIp+kSRhoxPA4dXeG+l0i
         +SQg==
X-Gm-Message-State: AOAM533qwM9JcvBzMqgXhGAGrjziVbcmUSPSfbFqQ2EpQakIPgM9tDLM
        U55jshRiE+dRoqjLahZzt066xazYXBqtFw==
X-Google-Smtp-Source: ABdhPJwtEXzYmEy5UMQoXLicEFeHmvS7tle7i5FeBP12xnc+2Ta0wC6eze8PtwJUhErguq2Ex5nGeQ==
X-Received: by 2002:a50:eb02:: with SMTP id y2mr14195838edp.281.1593426460847;
        Mon, 29 Jun 2020 03:27:40 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id dm1sm25528084ejc.99.2020.06.29.03.27.39
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 03:27:40 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id f18so15586512wml.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 03:27:39 -0700 (PDT)
X-Received: by 2002:a1c:4303:: with SMTP id q3mr16649103wma.134.1593426459341;
 Mon, 29 Jun 2020 03:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
 <20200615122937.18965-3-dongchun.zhu@mediatek.com> <20200618191026.GA73379@chromium.org>
 <1593417224.17166.10.camel@mhfsdcap03>
In-Reply-To: <1593417224.17166.10.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 29 Jun 2020 12:27:28 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DAbGDp=e-b2K89ydyK_bft5D2grpFfGDtX6hC__n-L-g@mail.gmail.com>
Message-ID: <CAAFQd5DAbGDp=e-b2K89ydyK_bft5D2grpFfGDtX6hC__n-L-g@mail.gmail.com>
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

On Mon, Jun 29, 2020 at 9:54 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Thu, 2020-06-18 at 19:10 +0000, Tomasz Figa wrote:
> > Hi Dongchun,
> >
> > On Mon, Jun 15, 2020 at 08:29:37PM +0800, Dongchun Zhu wrote:
> > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > >
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  MAINTAINERS                 |    1 +
> > >  drivers/media/i2c/Kconfig   |   13 +
> > >  drivers/media/i2c/Makefile  |    1 +
> > >  drivers/media/i2c/ov02a10.c | 1042 +++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 1057 insertions(+)
> > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > >
> >
> > Thank you for the patch. Please see my comments inline.
> >
>
> [snip]
>
> > > +static int ov02a10_probe(struct i2c_client *client)
> > > +{
> > > +   struct device *dev = &client->dev;
> > > +   struct ov02a10 *ov02a10;
> > > +   unsigned int rotation;
> > > +   unsigned int clock_lane_tx_speed;
> > > +   unsigned int i;
> > > +   int ret;
> > > +
> > > +   ov02a10 = devm_kzalloc(dev, sizeof(*ov02a10), GFP_KERNEL);
> > > +   if (!ov02a10)
> > > +           return -ENOMEM;
> > > +
> > > +   ret = ov02a10_check_hwcfg(dev, ov02a10);
> > > +   if (ret) {
> > > +           dev_err(dev, "failed to check HW configuration: %d", ret);
> > > +           return ret;
> > > +   }
> > > +
> > > +   v4l2_i2c_subdev_init(&ov02a10->subdev, client, &ov02a10_subdev_ops);
> > > +   ov02a10->mipi_clock_tx_speed = OV02A10_MIPI_TX_SPEED_DEFAULT;
> > > +   ov02a10->fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > > +
> > > +   /* Optional indication of physical rotation of sensor */
> > > +   ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);
> > > +   if (!ret && rotation == 180) {
> > > +           ov02a10->upside_down = true;
> > > +           ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> > > +   }
> > > +
> > > +   /* Optional indication of mipi TX speed */
> > > +   ret = fwnode_property_read_u32(dev_fwnode(dev), "ovti,mipi-tx-speed",
> > > +                                  &clock_lane_tx_speed);
> > > +
> > > +   if (!ret)
> > > +           ov02a10->mipi_clock_tx_speed = clock_lane_tx_speed;
> > > +
> > > +   /* Get system clock (eclk) */
> > > +   ov02a10->eclk = devm_clk_get(dev, "eclk");
> > > +   if (IS_ERR(ov02a10->eclk)) {
> > > +           ret = PTR_ERR(ov02a10->eclk);
> > > +           dev_err(dev, "failed to get eclk %d\n", ret);
> > > +           return ret;
> > > +   }
> > > +
> > > +   ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> > > +                                  &ov02a10->eclk_freq);
> > > +   if (ret) {
> > > +           dev_err(dev, "failed to get eclk frequency\n");
> > > +           return ret;
> > > +   }
> > > +
> > > +   ret = clk_set_rate(ov02a10->eclk, ov02a10->eclk_freq);
> > > +   if (ret) {
> > > +           dev_err(dev, "failed to set eclk frequency (24MHz)\n");
> > > +           return ret;
> > > +   }
> > > +
> > > +   if (clk_get_rate(ov02a10->eclk) != OV02A10_ECLK_FREQ) {
> > > +           dev_warn(dev, "wrong eclk frequency %d Hz, expected: %d Hz\n",
> > > +                    ov02a10->eclk_freq, OV02A10_ECLK_FREQ);
> > > +           return -EINVAL;
> > > +   }
> > > +
> > > +   ov02a10->pd_gpio = devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
> > > +   if (IS_ERR(ov02a10->pd_gpio)) {
> > > +           ret = PTR_ERR(ov02a10->pd_gpio);
> > > +           dev_err(dev, "failed to get powerdown-gpios %d\n", ret);
> > > +           return ret;
> > > +   }
> > > +
> > > +   ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > > +   if (IS_ERR(ov02a10->rst_gpio)) {
> > > +           ret = PTR_ERR(ov02a10->rst_gpio);
> > > +           dev_err(dev, "failed to get reset-gpios %d\n", ret);
> > > +           return ret;
> > > +   }
> > > +
> > > +   for (i = 0; i < ARRAY_SIZE(ov02a10_supply_names); i++)
> > > +           ov02a10->supplies[i].supply = ov02a10_supply_names[i];
> > > +
> > > +   ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov02a10_supply_names),
> > > +                                 ov02a10->supplies);
> > > +   if (ret) {
> > > +           dev_err(dev, "failed to get regulators\n");
> > > +           return ret;
> > > +   }
> > > +
> > > +   mutex_init(&ov02a10->mutex);
> > > +   ov02a10->cur_mode = &supported_modes[0];
> > > +   ret = ov02a10_initialize_controls(ov02a10);
> > > +   if (ret) {
> > > +           dev_err(dev, "failed to initialize controls\n");
> > > +           goto err_destroy_mutex;
> > > +   }
> > > +
> > > +   ov02a10->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > +   ov02a10->subdev.entity.ops = &ov02a10_subdev_entity_ops;
> > > +   ov02a10->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > +   ov02a10->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > +   ret = media_entity_pads_init(&ov02a10->subdev.entity, 1, &ov02a10->pad);
> > > +   if (ret < 0) {
> > > +           dev_err(dev, "failed to init entity pads: %d", ret);
> > > +           goto err_free_handler;
> > > +   }
> > > +
> > > +   pm_runtime_enable(dev);
> > > +   if (!pm_runtime_enabled(dev)) {
> > > +           ret = ov02a10_power_on(dev);
> > > +           if (ret < 0) {
> > > +                   dev_err(dev, "failed to power on: %d\n", ret);
> > > +                   goto err_clean_entity;
> > > +           }
> > > +   }
> > > +
> > > +   ret = v4l2_async_register_subdev(&ov02a10->subdev);
> > > +   if (ret) {
> > > +           dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> > > +           goto err_power_off;
> > > +   }
> > > +
> > > +   return 0;
> > > +
> > > +err_power_off:
> > > +   pm_runtime_disable(dev);
> > > +   if (!pm_runtime_enabled(dev))
> >
> > This would be always true, resulting in unbalanced power off. Moving
> > pm_runtime_disable() after this if should work better.
> >
>
> Pardon, do you mean that we shall use like this:
> err_power_off:
>         if (!pm_runtime_enabled(dev)) {
>                 pm_runtime_disable(dev);
>                 if (!pm_runtime_status_suspended(dev)
>                         ov02a10_power_off(dev);
>         }

Hmm, that wouldn't really work, because there is no reason to disable
runtime PM if it's disabled already. I also noticed that we don't need
to check pm_runtime_status_suspended() in the error path in probe,
because we only ever attempt to power it on when runtime PM is
disabled in kernel config. This would make the end result as:

         if (pm_runtime_enabled(dev))
                 pm_runtime_disable(dev);
         else
                 ov02a10_power_off(dev);

Best regards,
Tomasz
