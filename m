Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D30C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 18:49:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02881206DC
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 18:49:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m2KD82iv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgFLStT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 14:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgFLStS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 14:49:18 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051A2C03E96F
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 11:49:17 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id d15so7135612edm.10
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 11:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nRDVrwu4nmGYq+4H/l+Rfcgr3AzgWNw91u+JyocBvfM=;
        b=m2KD82ivlXUUePVUWot71c6WcaxeJlCXcnih6WkWsEDIJ2gD3qUd/7EVIU4njM4fLA
         MTs+s5Qv/pTww8Rd4mWtfwyDe9R3f17Zg1HzZGaeKrK/Nmx6HPYjlQAKmNhms7lmkWiJ
         raCqRd6ECYIDOUN6A2CwJIAex+onNYl/jvZXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nRDVrwu4nmGYq+4H/l+Rfcgr3AzgWNw91u+JyocBvfM=;
        b=lDh4BtoNqc0MsM8Ki4q1j7cqVWN0hgtvdA+3e0HGaknWbjUraR2WAee+o+mf7W9o34
         heH4Szey6Y8FukEFoPk7kw/xn+ucMvDJGspZkf/DxCsowdEBhDSIgtzmVJhKQnWHxUlW
         uVEMF54KIUeqmxoWmjWK4iGzGWVUtY64JkL2b6d1FZ2zak0rjcozmlBH6PIuY1AtN1Fy
         Jy8d8Y/GEQkc5RZI38tzmRg6uQGjJl8EHPwhr/rLDpkX5cXv8l8I/oZ65xBLVkrlFGwt
         FPUkLCnPUd2rr06ogl/mIMMAE2WEn+kfAy2oIOIGDfMyhTc//YRmh9DYmEJ6gKJx06lh
         +qEg==
X-Gm-Message-State: AOAM530cfULANwfQV8J76c5XBgMQIiCbN1c6Xmp6RZ9Z1J2DIX9tw13P
        +5r6OmRuUsU70UdBoWNQ35+pIcVDs/Zfjg==
X-Google-Smtp-Source: ABdhPJxvYs0DKO1XgdhfyEg1/9mgFKaJlGIZ3w0l5hYhZ0C3SE3Z7n5j3n43jXWdFXGI3cPOvMrG5A==
X-Received: by 2002:a05:6402:7d4:: with SMTP id u20mr12821703edy.30.1591987755339;
        Fri, 12 Jun 2020 11:49:15 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id s2sm3925046ejm.50.2020.06.12.11.49.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 11:49:14 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id l11so10754756wru.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 11:49:14 -0700 (PDT)
X-Received: by 2002:adf:9c12:: with SMTP id f18mr17605374wrc.105.1591987753743;
 Fri, 12 Jun 2020 11:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-3-dongchun.zhu@mediatek.com> <20200521193204.GA14214@chromium.org>
 <1590209415.8804.431.camel@mhfsdcap03> <20200610183600.GI201868@chromium.org> <1591954266.8804.646.camel@mhfsdcap03>
In-Reply-To: <1591954266.8804.646.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 12 Jun 2020 20:49:01 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CboZ9aFhUyKPES_2oO_AKAOh3Pg8D+9YpfmzJ8v-yFHw@mail.gmail.com>
Message-ID: <CAAFQd5CboZ9aFhUyKPES_2oO_AKAOh3Pg8D+9YpfmzJ8v-yFHw@mail.gmail.com>
Subject: Re: [V8, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
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

On Fri, Jun 12, 2020 at 11:33 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Wed, 2020-06-10 at 18:36 +0000, Tomasz Figa wrote:
> > On Sat, May 23, 2020 at 12:50:15PM +0800, Dongchun Zhu wrote:
> > > Hi Tomasz,
> > >
> > > Thanks for the review. My replies are as below.
> > >
> > > On Thu, 2020-05-21 at 19:32 +0000, Tomasz Figa wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Sat, May 09, 2020 at 04:06:27PM +0800, Dongchun Zhu wrote:
> > [snip]
> > > > > +{
> > > > > +       struct i2c_client *client = to_i2c_client(dev);
> > > > > +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > > +       struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > > +       int ret;
> > > > > +
> > > > > +       gpiod_set_value_cansleep(ov02a10->n_rst_gpio, 0);
> > > > > +       gpiod_set_value_cansleep(ov02a10->pd_gpio, 0);
> > > > > +
> > > > > +       ret = clk_prepare_enable(ov02a10->eclk);
> > > > > +       if (ret < 0) {
> > > > > +               dev_err(dev, "failed to enable eclk\n");
> > > > > +               return ret;
> > > > > +       }
> > > > > +
> > > > > +       ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > > > +       if (ret < 0) {
> > > > > +               dev_err(dev, "failed to enable regulators\n");
> > > > > +               goto disable_clk;
> > > > > +       }
> > > > > +       usleep_range(5000, 6000);
> > > > > +
> > > > > +       gpiod_set_value_cansleep(ov02a10->pd_gpio, 1);
> > > >
> > > > This is a "powerdown" GPIO. It must be set to 0 if the sensor is to be
> > > > powered on.
> > > >
> > >
> > > The value set by gpiod_set_value_cansleep() API actually depends upon
> > > GPIO polarity defined in DT.
> > > Since I set GPIO_ACTIVE_LOW to powerdown,
> > > gpiod_set_value_cansleep(gpio_desc, value) would set !value to
> > > gpio_desc.
> > > Thus here powerdown would be low-state when sensor is powered on.
> > > For GPIO polarity, I also post a comment to the binding patch.
> > >
> >
> > That's true. However, this makes the driver really confusing. If someone
> > reads this code and compares with the datasheet, it looks incorrect,
> > because in the datasheet the powerdown GPIO needs to be configured low
> > for the sensor to operate.
> >
> > I'd recommend defining the binding in a way that makes it clear in the driver code
> > that it implementes the power sequencing as per the datasheet.
> >
>
> Uh-huh...
> But it all depends on how we look at the powerdown GPIO.
> Or where should we define the active low or active high, the driver or
> DT?
>
> My initial idea is using DT GPIO polarity to describe sensor active
> polarity according to the datasheet.
> As an active low shutdown signal is equivalent to an active high enable
> signal.
>

Okay, I discussed this offline with Laurent and Sakari and we also
found the guidelines of the Linux GPIO subsystem on this [1].

The conclusion is that the pin names in the driver or DT must not
contain any negation prefixes and the driver needs to care only about
the logical function of the pin, such as "powerdown" or "reset". In
case of this driver, we should call the pins "rst" and "pd" and
setting them to 1 would trigger the reset and power down respectively.
The physical signal polarity must be configured in DT using the
polarity flags.

[1] https://www.kernel.org/doc/html/latest/driver-api/gpio/consumer.html#the-active-low-and-open-drain-semantics

Best regards,
Tomasz
