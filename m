Return-Path: <SRS0=naVA=7H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C21FC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 11:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61F9420888
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 11:45:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J7zkISA9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390242AbgEYLpX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 May 2020 07:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390236AbgEYLpX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 May 2020 07:45:23 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C91C061A0E
        for <devicetree@vger.kernel.org>; Mon, 25 May 2020 04:45:23 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id bs4so14779373edb.6
        for <devicetree@vger.kernel.org>; Mon, 25 May 2020 04:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P/cWAJl3Z7M7phJWdZ1viutRbSoAqLOTBAKufEZLlQs=;
        b=J7zkISA9IACBaVZfIy7JcdxpE2ftuH3PzvgPxwCPTVvWLm94b33+EPTzq46DDaYm2H
         tCRXLAp5upCjONBGcvqexKg7AU8Ka8ylT2X4YZPrLOUyQsXkiPls4zRxhVigqskhJ8Qc
         R2JRs8LOj+hBFPv1FWpfNKziFvgfyUK87dOXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P/cWAJl3Z7M7phJWdZ1viutRbSoAqLOTBAKufEZLlQs=;
        b=Gkq4KZtSO5tBtrYWuJcOo1CuCQH5lh+/RkD1WlTEfDaq9ozdDSZC7fnb54aOoU3+Vo
         ojzkzweCBDBsuEeZp7KrBHmo/y4FZloxLXfFMEyjk0fAmh+/kq5TBaaOqdcL7OaRyvz0
         G/VcI5XCLTpnRd0jx8JcbfdxWZs80zNgfCXPN7ZfsozNxSTnYPbOCwxzkZK5zp8TE0+H
         7sAh94gdcIqJHU5YXIEgY+6vSEiju2m0BiE0KqV8XCTvsa22GZ7a2MV9+b8cXQI9zp7L
         H5Jc0z8JZ0qdazhicHiiSaE7XcV9HBX0RYZRuAsBgcWZR5qrvO9ug61UArTGIrEBpWAg
         MORw==
X-Gm-Message-State: AOAM533EooOH7HwP4sdvJmOcxoKvCEg8LyrLQA189vYeZVVTlmF2RV2s
        HiI++KWuwDNPB0IUI7xWDB66JZzIMULV1g==
X-Google-Smtp-Source: ABdhPJzTydBfPuxx0wDSaUZF2NR9vkj0A6rg9FJPgqr1umDWOwQ1bhwaCxnIj0PoeleRctwsbBbpOA==
X-Received: by 2002:a50:a782:: with SMTP id i2mr14771785edc.33.1590407121790;
        Mon, 25 May 2020 04:45:21 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id b3sm15324542ejq.52.2020.05.25.04.45.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 04:45:21 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id q11so4659994wrp.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2020 04:45:20 -0700 (PDT)
X-Received: by 2002:adf:e543:: with SMTP id z3mr14316481wrm.385.1590407120295;
 Mon, 25 May 2020 04:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
 <20200518132731.20855-3-dongchun.zhu@mediatek.com> <20200521195113.GC14214@chromium.org>
 <1590139561.8804.390.camel@mhfsdcap03>
In-Reply-To: <1590139561.8804.390.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 25 May 2020 13:45:07 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
Message-ID: <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
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

On Fri, May 22, 2020 at 11:27 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> Thanks for the review. My replies are as below.
>
> On Thu, 2020-05-21 at 19:51 +0000, Tomasz Figa wrote:
> > Hi Dongchun, Sakari,
> >
> > On Mon, May 18, 2020 at 09:27:31PM +0800, Dongchun Zhu wrote:
[snip]
> > > +   pm_runtime_enable(dev);
> > > +   if (!pm_runtime_enabled(dev)) {
> > > +           ret = dw9768_runtime_resume(dev);
> > > +           if (ret < 0) {
> > > +                   dev_err(dev, "failed to power on: %d\n", ret);
> > > +                   goto entity_cleanup;
> > > +           }
> > > +   }
> > > +
> > > +   ret = v4l2_async_register_subdev(&dw9768->sd);
> > > +   if (ret < 0)
> > > +           goto entity_cleanup;
> > > +
> > > +   return 0;
> > > +
> > > +entity_cleanup:
> >
> > Need to power off if the code above powered on.
> >
>
> Thanks for the reminder.
> If there is something wrong with runtime PM, actuator is to be powered
> on via dw9768_runtime_resume() API.
> When actuator sub-device is powered on completely and async registered
> successfully, we shall power off it afterwards.
>

The code above calls dw9768_runtime_resume() if
!pm_runtime_enabled(dev), but the clean-up code below the
entity_cleanup label doesn't have the corresponding
dw9768_runtime_suspend() call.

Best regards,
Tomasz
