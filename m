Return-Path: <SRS0=Zx7r=7O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11359C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 18:55:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1B4D20679
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 18:55:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HHXQoRKk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbgFASzy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 14:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730491AbgFASzx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 14:55:53 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B81BC061A0E
        for <devicetree@vger.kernel.org>; Mon,  1 Jun 2020 11:55:53 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id e2so10196531eje.13
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 11:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ll0Hxtpd9kUjoZ6368PBnHFjk1t/KP9A5doX0NsjS8Y=;
        b=HHXQoRKkRwnj5wx8VXlsES6HymXOV8W2MTPYDHm4YaFpj9bCVwM2Nxf2BlFpKZp3XB
         2Qh/o6KxlEKLbqinUeFXafMKslx9YzDJAaZs+8Unv53j5DBKoqiPBjGvg/IYBC7Q3JA/
         Ieg4HsYz/NKf3SaU/zciPOSrIIBePr/Z58XAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ll0Hxtpd9kUjoZ6368PBnHFjk1t/KP9A5doX0NsjS8Y=;
        b=Wr66AeKQxyeS5io1O80MAkSUbEUINITsrQuY3N/flum19NyIOcHCNXA9Cgp/7a+7pH
         txJSiK4iUGIMsQbiR+Y2iZ4OW6EoCgvkb8Cs3y8m5KDgEiLavsBbEOU1hDy4EaDxGshk
         l8LM8yVAYjNWA3mZX5VnlspMdAkdzGoQao5QX2Ak1COeN9wzMUzAgfqswxZyP1sLT5+J
         D+ZhY6S+VbtZxQrzpIv2wxHJZEF9p6COTLWiPgBcamjac3F4J7wq6VyCFrR9sK0oEGQt
         nkXQSBpB22d4KbsvuEpSbps+ggcVTd8YG88B492Q3bzZdFG/l/siLt6/xpWqqdZ7qOus
         tlrA==
X-Gm-Message-State: AOAM533yvYDLn9SXis5IdBdfer8O5iDXuAWM6OHGHi/DUU8bGi0noqpX
        Cx+U//8XwOg2DS40BUkl3meUpLhMSnMJzg==
X-Google-Smtp-Source: ABdhPJzutDuIBDk4YTTQgep/inXIFUcIH78xYEmvbjrtbtZwHdePKOCAcIsleLSiFzq+UD2GjkLhbw==
X-Received: by 2002:a17:906:f06:: with SMTP id z6mr20488659eji.105.1591037750523;
        Mon, 01 Jun 2020 11:55:50 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id e9sm153912edl.25.2020.06.01.11.55.49
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 11:55:50 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id f185so581408wmf.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 11:55:49 -0700 (PDT)
X-Received: by 2002:a7b:c622:: with SMTP id p2mr590231wmk.55.1591037285905;
 Mon, 01 Jun 2020 11:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
 <20200518132731.20855-3-dongchun.zhu@mediatek.com> <20200521195113.GC14214@chromium.org>
 <1590139561.8804.390.camel@mhfsdcap03> <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
 <1590570089.8804.453.camel@mhfsdcap03>
In-Reply-To: <1590570089.8804.453.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 1 Jun 2020 20:47:54 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Dgboh8om68546ADELX3g-0y40rdBxY+H3WsX5xAD1_FQ@mail.gmail.com>
Message-ID: <CAAFQd5Dgboh8om68546ADELX3g-0y40rdBxY+H3WsX5xAD1_FQ@mail.gmail.com>
Subject: Re: [V6, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
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

On Wed, May 27, 2020 at 11:03 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Mon, 2020-05-25 at 13:45 +0200, Tomasz Figa wrote:
> > On Fri, May 22, 2020 at 11:27 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > Thanks for the review. My replies are as below.
> > >
> > > On Thu, 2020-05-21 at 19:51 +0000, Tomasz Figa wrote:
> > > > Hi Dongchun, Sakari,
> > > >
> > > > On Mon, May 18, 2020 at 09:27:31PM +0800, Dongchun Zhu wrote:
> > [snip]
> > > > > +   pm_runtime_enable(dev);
> > > > > +   if (!pm_runtime_enabled(dev)) {
> > > > > +           ret = dw9768_runtime_resume(dev);
> > > > > +           if (ret < 0) {
> > > > > +                   dev_err(dev, "failed to power on: %d\n", ret);
> > > > > +                   goto entity_cleanup;
> > > > > +           }
> > > > > +   }
> > > > > +
> > > > > +   ret = v4l2_async_register_subdev(&dw9768->sd);
> > > > > +   if (ret < 0)
> > > > > +           goto entity_cleanup;
> > > > > +
> > > > > +   return 0;
> > > > > +
> > > > > +entity_cleanup:
> > > >
> > > > Need to power off if the code above powered on.
> > > >
> > >
> > > Thanks for the reminder.
> > > If there is something wrong with runtime PM, actuator is to be powered
> > > on via dw9768_runtime_resume() API.
> > > When actuator sub-device is powered on completely and async registered
> > > successfully, we shall power off it afterwards.
> > >
> >
> > The code above calls dw9768_runtime_resume() if
> > !pm_runtime_enabled(dev), but the clean-up code below the
> > entity_cleanup label doesn't have the corresponding
> > dw9768_runtime_suspend() call.
> >
>
> Did you mean the 'entity_cleanup' after v4l2_async_register_subdev()?

Yes.

> Actually I made some changes for OV02A V9, according to this comment.
> Could you help review that change? Thanks.

Sure, I will take a look.

Best regards,
Tomasz
