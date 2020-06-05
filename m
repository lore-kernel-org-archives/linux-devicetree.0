Return-Path: <SRS0=PVp5=7S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F67C433E2
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 13:02:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E779D2077D
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 13:02:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i5o+dER1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgFENCS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 5 Jun 2020 09:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726989AbgFENCR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Jun 2020 09:02:17 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FCFC08C5C3
        for <devicetree@vger.kernel.org>; Fri,  5 Jun 2020 06:02:16 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l11so9704638wru.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2020 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y3GLNe1uiEEyqomGYmE3fIeULXusz66pcaCDflcIBb4=;
        b=i5o+dER1J+4I9KjApGJUl5j8vc3AgLlhglvEfXsfp9xNaKskTKEJLqxNDa11iCBswD
         lHjCEBND3KFJe13zffeJZSFvRRMjnmD1xDuFAStUns7l00Mhdzdv/n2dDXwdUGNLjoMR
         Q8UajpX7oLNc+ArM8+h2A4JIYy6XJYGovy2B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y3GLNe1uiEEyqomGYmE3fIeULXusz66pcaCDflcIBb4=;
        b=FHcqF+z9DMgLrPGNnIpW3Wm1lH6gA1KoemVIbw41X5JZggpO4sv/akLjzBu8sEVZGI
         PGXzDv6yryr9K8eORhZLEjpRnhY9NFa2kg7e9YyxvREU92MnlnM6tuBT59sW5OUkX9ks
         44pm8rZjPzFnYQyNXejdE9yGNLRotTX5gwLWR/nNdi8QHY13cTWBSk7fh+6ZnXxJngQu
         fJk63InkbukIsX5vojxSqYHGe3riW7jHR2wqYtx/IgfVOKSSmwP9T8jr3DLE/X9PN6Ef
         ZQAomg7s9zZ4/IoD5ZPyTlvJvgAqmuPYXZh4LsPKnh/wS28Lzq+dnyXyaj3rgLZ1suUA
         AsNA==
X-Gm-Message-State: AOAM531k3pM/oFsh0BEgVpdDXHa+SSx92HK7NRwU3lA5XuMHrmRMD2Mt
        D8NxLRMM+B0TWxwXjsGfWEIwng==
X-Google-Smtp-Source: ABdhPJzbEgAdOn5Dla25twrnFWibCM+By/CY94AZjk2Mnb7Wp+Gcych9tY+BqMoYs3yiFXxox2M6aQ==
X-Received: by 2002:a05:6000:12c8:: with SMTP id l8mr9792905wrx.148.1591362134700;
        Fri, 05 Jun 2020 06:02:14 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id d5sm12890866wrb.14.2020.06.05.06.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 06:02:14 -0700 (PDT)
Date:   Fri, 5 Jun 2020 13:02:12 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mchehab@kernel.org,
        andriy.shevchenko@linux.intel.com, robh+dt@kernel.org,
        mark.rutland@arm.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200605130212.GA6303@chromium.org>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
 <20200605121459.GS16711@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605121459.GS16711@paasikivi.fi.intel.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 05, 2020 at 03:14:59PM +0300, Sakari Ailus wrote:
> Hi Dongchun,
> 
> Thank you for the update.
> 
> On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > control to set the desired focus via IIC serial interface.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  MAINTAINERS                |   1 +
> >  drivers/media/i2c/Kconfig  |  13 ++
> >  drivers/media/i2c/Makefile |   1 +
> >  drivers/media/i2c/dw9768.c | 566 +++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 581 insertions(+)
> >  create mode 100644 drivers/media/i2c/dw9768.c
[snip]
> > +static int dw9768_runtime_suspend(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct dw9768 *dw9768 = sd_to_dw9768(sd);
> > +
> > +	dw9768_release(dw9768);
> > +	regulator_bulk_disable(ARRAY_SIZE(dw9768_supply_names),
> > +			       dw9768->supplies);
> > +
> > +	return 0;
> > +}
> > +
> > +static int dw9768_runtime_resume(struct device *dev)
> 
> __maybe_unused for this and the suspend callback.
>

These are always used. If runtime PM is disabled, they are called
explicitly in probe and remove.

Best regards,
Tomasz

