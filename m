Return-Path: <SRS0=vQ7I=74=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69382C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 12:51:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A3432074D
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 12:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FiCQlYLT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729900AbgFOMvE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 15 Jun 2020 08:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729845AbgFOMvE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Jun 2020 08:51:04 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C1FC061A0E
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 05:51:03 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id s28so9337281edw.11
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EAByj1ACF3eG5h2YQoy4Zv57kLAIJMEzK1yr/nWTV5c=;
        b=FiCQlYLTKWwhipqP9kqvJWv/A/Z+VNCbpv6u711mWSu7hINN75IBeaYV8OZikqRIEQ
         qS8wSh4Lo0ISen5u8EMoDK0Eplz1KkC3+tJaNOJKXYp2Xr39qDBp85rBkvC5EhiiCv72
         ZNgtiPOQgUSXebknUjgkXJbDKSR9U86BnGZkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EAByj1ACF3eG5h2YQoy4Zv57kLAIJMEzK1yr/nWTV5c=;
        b=DkJZARx9/nl2NudMbDUQ3PIkUQiIavDAWpCMP9DFE6kSPWEs0+nv5/0SGMm3Tgyjpl
         rtBNMR4hqStYpa46EUYY4gHUNKys3kyuJZ/jgJ3FVePSXhbCj+Iz6xRSg/llIAUerOPZ
         fQ5qjeb3w0kU7NegJ5isnAj/Z8Jg55mnumtFSNxrY36MQGdWwS9ahXYmM0A+zw87ChEU
         YoxoXkX3txU+kTB76CVaoMqZD5lPTeSHQhUUkBMeI9PFF5nWVs0gOti7RsJm8gN18XDJ
         yAzQLweRHlwF8c18i4SbJtqSK0fSszm8Zk/XQfB/XJh7z/ATWjQTxHj2nJMyvp37WDOZ
         NHkQ==
X-Gm-Message-State: AOAM533+n5Gby11cj47zMOdVX/5W+WjKZrjZZ5b4MS2LCavQjVwOX/Wj
        Ng3ly7VVLAg3CCB21gpHCeJ4+UbL4qL5xQ==
X-Google-Smtp-Source: ABdhPJwM5V+X3VdcznEGs1vBXRiOeWcL1QK4ZKs86U4tmE2mB3nFUqPshlt8PnNDEHxTmXa9lYUqWg==
X-Received: by 2002:a50:e08c:: with SMTP id f12mr23563619edl.233.1592225461907;
        Mon, 15 Jun 2020 05:51:01 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id z10sm8995049ejb.9.2020.06.15.05.51.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 05:51:01 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id l17so14530675wmj.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 05:51:01 -0700 (PDT)
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr13160873wmk.11.1592225097322;
 Mon, 15 Jun 2020 05:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-3-dongchun.zhu@mediatek.com> <20200610194455.GK201868@chromium.org>
 <1591958798.8804.660.camel@mhfsdcap03> <CAAFQd5Bcb4A+HAivA-jrczK+OMxwZk3w0GYoh-DU=6gmTZBWnQ@mail.gmail.com>
 <1592200471.8804.681.camel@mhfsdcap03>
In-Reply-To: <1592200471.8804.681.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 15 Jun 2020 14:44:46 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DvPcH-1jeeXaQ=qfxVHr82F8FBberF=QzLW4p49PZ2PA@mail.gmail.com>
Message-ID: <CAAFQd5DvPcH-1jeeXaQ=qfxVHr82F8FBberF=QzLW4p49PZ2PA@mail.gmail.com>
Subject: Re: [V9, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

Hi Dongchun,

On Mon, Jun 15, 2020 at 7:57 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Fri, 2020-06-12 at 20:39 +0200, Tomasz Figa wrote:
> > On Fri, Jun 12, 2020 at 12:49 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Wed, 2020-06-10 at 19:44 +0000, Tomasz Figa wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Sat, May 23, 2020 at 04:41:03PM +0800, Dongchun Zhu wrote:
> > > > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > > > >
> > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > ---
> > > > >  MAINTAINERS                 |    1 +
> > > > >  drivers/media/i2c/Kconfig   |   13 +
> > > > >  drivers/media/i2c/Makefile  |    1 +
> > > > >  drivers/media/i2c/ov02a10.c | 1025 +++++++++++++++++++++++++++++++++++++++++++
> > > > >  4 files changed, 1040 insertions(+)
> > > > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > > > >
> > > >
> > > > Thank you for the patch. Please see my comments inline.
> > > >
> > > > [snip]
> > > > > diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> > > > > new file mode 100644
> > > > > index 0000000..160a0b5
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/i2c/ov02a10.c
> > > > [snip]
> > > > > +static const char * const ov02a10_test_pattern_menu[] = {
> > > > > +   "Disabled",
> > > > > +   "Color Bar",
> > > >
> > > > nit: We should normalize this to one of the standard names. What is the
> > > > pattern on this sensor? Is it perhaps "Eight Vertical Colour Bars"?
> > > >
> > >
> > > Yes. It is one kind of 'Eight Vertical Colour Bars'.
> > > This pattern is called as 'MIPI color bar' per the datasheet.
> > > Can we here use 'Vertical Color Bar' or 'MIPI Color Bar'?
> > >
> >
> > We should try to stick to the names as exposed by existing drivers.
> > There was an attempt to unify the naming of some Sony sensors some
> > time ago [1]. Perhaps one of the names there matches the pattern of
> > this sensor?
> >
> > [1] https://patchwork.kernel.org/patch/10711777/
> >
>
> Sounds great.
> It is one good idea to summarize test patterns from various sensors.
> But one question plaguing me is that it seems even for the same "Eight
> Vertical Colour Bars", different sensors may have different RGB color
> map.
>
> Moreover, definition standards of color bar style may differ among
> different sensor chip vendors.
> For instance, Sony often uses "Solid Color", "Color Bars With Fade to
> Grey", "PN9" to abstract test pattern output type; while OmniVision
> adopts color bar type 1, 2, 3, 4 or "MIPI Color Bar", "ISP Color Bar"
> instead.

The test patterns are commonly very similar, just different vendors
call them with different names. There is actually a specification
called MIPI CCS [1], which standardizes many aspects of sensor
programming, including test patterns. Most of the sensors don't really
follow the entire specification yet, but often some aspects happen to
match.

In the copy of the specification that I have, the test patterns are
described in section 10 (Test modes), page 203, with pictures on
following pages. Perhaps we could standardize the names based on that,
when the pattern matches?

Sakari, what do you think?

[1] http://resources.mipi.org/camera-command-set-v1-1-download

Best regards,
Tomasz
