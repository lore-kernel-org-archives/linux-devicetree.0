Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C52CC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 14:40:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA567206BE
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 14:40:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kHiITqAE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730969AbgF3Ok1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 10:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728636AbgF3Ok1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 10:40:27 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F28DC061755
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 07:40:26 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id p20so20868345ejd.13
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 07:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5dm/rjfkAYeOKvGlUu0DpeagoQTdzbRa2RO8YsK1yDA=;
        b=kHiITqAEixH3gwtr3H907V2DiU+kxfWWD2Qw8bDRxPeYz3lrIuItsoM9Pv99DTsoWC
         UhqasAV1O8djAZGDZ+JytGCbb0A+zV9G/V20uuQDQ4QvgsDLx2aviX735++seHJYVbqa
         DPKky1AG/J1s7hSlUY6Y/XOMx5rtU0odTX47Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5dm/rjfkAYeOKvGlUu0DpeagoQTdzbRa2RO8YsK1yDA=;
        b=hWEKMS1hISMjicCP/8sEw5BFqBtXENQMRGrpz7w66FklwNyEmfD0M9BsyENOM6w10I
         /ffDtDPmkJBYEqATJCG2BiCvNQrWHOcdLLheZAkqss6rBta4BDhSXBroRLLoPzEhmZsR
         1s2t8S181Ca4uCxoVp1tM4xWXGnErHvDXixw96B89YbKdgrbLVpUOQJE7PTeAPDflpzt
         iCmSocbzEvEol0YLFOLwuF0CGBCcBUSgjMEtrdUL6YSBZ93sV3vTO9jKf5lz68lFJPK9
         N5I1tlCZwrDzxvCYLmGBk+qvgfU3ntxnrHl95yI35zwhTbxr1hLgkyIbU1R5ZcGQbfx4
         9toA==
X-Gm-Message-State: AOAM530o1JqOsb6qaz9nEvsW0M7I4CHr4bUyY6CP7GJDEJdi/vfYDunA
        I2A3pU3pj5NPJ9Et8nZAmPK10uhmhEdmVA==
X-Google-Smtp-Source: ABdhPJwCJ550S7/w0Jrr1VxRYIMJpAJKdXDkrcC0nAZO9n4muyItkbPtQnFFd0jjX9l+UfQG0bJnLA==
X-Received: by 2002:a17:906:364a:: with SMTP id r10mr18283432ejb.122.1593528025176;
        Tue, 30 Jun 2020 07:40:25 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id w8sm3002894eds.41.2020.06.30.07.40.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:40:24 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id r12so20401215wrj.13
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 07:40:23 -0700 (PDT)
X-Received: by 2002:adf:80e6:: with SMTP id 93mr21491180wrl.17.1593528023050;
 Tue, 30 Jun 2020 07:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com> <20200630095430.GF16711@paasikivi.fi.intel.com>
 <CAAFQd5AGeL7+qhgxDGxWYgTcOVrNGqE8P-L40WWM2JDrY=YYZQ@mail.gmail.com>
 <CAAFQd5B0GxPpGm750rVKfPJi-gtn7w9KouFhXZc4k5OEtiKqBg@mail.gmail.com> <20200630143705.GW3703480@smile.fi.intel.com>
In-Reply-To: <20200630143705.GW3703480@smile.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 30 Jun 2020 16:40:12 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CwwLzGKiCPdd_EzipmXPA2aYBrk0QRPv6Bacy++tXrHA@mail.gmail.com>
Message-ID: <CAAFQd5CwwLzGKiCPdd_EzipmXPA2aYBrk0QRPv6Bacy++tXrHA@mail.gmail.com>
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Tue, Jun 30, 2020 at 4:37 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jun 30, 2020 at 04:21:31PM +0200, Tomasz Figa wrote:
> > On Tue, Jun 30, 2020 at 4:19 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > > On Tue, Jun 30, 2020 at 11:54 AM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
>
> ...
>
> > > > > +     ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > > >
> > > >
> > > > Shouldn't this be GPIOD_OUT_HIGH? That's the state it'll be after powering
> > > > the sensor off the first time. Alternatively make reset signal high in
> > > > runtime suspend callback.
> > >
> > > We might want to keep the signals low when the regulators are powered
> > > down, to reduce the leakage.
> >
> > Ah, I actually recall that the reset pin was physically active low, so
> > we would indeed better keep it at HIGH. Sorry for the noise.
>
> Here HIGH means "asserted", so in the code above it's LOW, means "deasserted",
> i.o.w. non-reset state. I dunno what is better, it depends to the firmware /
> driver expectations of the device configuration (from the power point of view,
> HIGH makes sense here, and not LOW, i.o.w. asserted reset line).
>
> And nice of the logical state that it doesn't depend to the active low / high
> (the latter just transparent to the user).

Yeah, after reading through the GPIO subsystem documentation and
discussing with a bunch of people on how to interpret it, we concluded
that the driver needs to deal only with the logical state of the
signal.

Actually, I later realized that the problem of leakage should likely
be solved by pinctrl suspend settings, based on given hardware
conditions, rather than the driver explicitly.

Best regards,
Tomasz
