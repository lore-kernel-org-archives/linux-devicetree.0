Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5FAC432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 19:34:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C9BDF2071F
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 19:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cNSJzEsY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfKVTeu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 Nov 2019 14:34:50 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39273 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfKVTeu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 Nov 2019 14:34:50 -0500
Received: by mail-oi1-f193.google.com with SMTP id v138so7519221oif.6
        for <devicetree@vger.kernel.org>; Fri, 22 Nov 2019 11:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w5kE9sNVKHOR5v+8eWGC0h9VJree9L481GT6fR4KPH0=;
        b=cNSJzEsYJOJ4JEfhHWKXS7c10BorqhgrC+2FVDwki+JScCqyN8zUk/KqFNLNedcZQA
         aWfNbvyBmvnc2TbeuMGD3It7wRwSS0nLUUAN/eDrE04HeLS+bBmMPB0vTdlLW0CTJM7c
         LcwTId1iCmlFIbM1Sd1USPHSHF1mLFesM5WLGDEwTkIB8kfGLkJSyRcCjYi1L+vNNR8N
         yFs9aOq/72jZLwUehCwSDhYwh6FoIHY2g+bIK3J++l4SPr0nvyhv+NuKJygYzbv1kv8w
         /JR92Xm9IjO1GyFe3o36WV/1A8F5iQK0oLJYXsGbyIzvj55bLxY5hqzri0Vpj5nMEmUJ
         24PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w5kE9sNVKHOR5v+8eWGC0h9VJree9L481GT6fR4KPH0=;
        b=k8FUbbpKeIn9ehANud+xAOM3csocIqvngv3HGwbeMDEjREDo5TKE7QU8kM1H5S6DbZ
         D0gDpZ9GK4QZdZvD1+muGGAy78YGBDEjqKCKK4Emr+BgL264BZEPdCnlk/IdLKpZGx0Y
         SkP8Nzoorf9UgIugV850SH90RzVeQgGYTwADYRzB/dwznfVSvlDK1XjR+NomQ4+pUu/S
         DCLIzWX11UTthZIIflJkEqboXH+ykoJrA0PgRk614DlvNGZ0RCIU8Fl9/mMgtYuN5Fr0
         6vqFaYOCR02B0xTYXKKUYZQ3FfTUFUzlB+cOQiBsqqWmHYjWCMzL7bXN5lGnqtsd1leA
         G6GA==
X-Gm-Message-State: APjAAAXcOSx0VLEKBlazA37cIcx5kbtLtuiQgU9tqKvjlmXCVMgF8fgK
        l4OXxNaiSpp9FugjS+mVBEAb9m2I9NhZmY1EEe/5jA==
X-Google-Smtp-Source: APXvYqz/Naepaa05m0UegYvu9ibAIK831NoOs0CkB2kmS1+o8jOvL8/p6bYQtj8WJWlr+Wd7682etAeIX5iYV2KXnjo=
X-Received: by 2002:aca:d558:: with SMTP id m85mr13142937oig.43.1574451288921;
 Fri, 22 Nov 2019 11:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20191120071302.227777-1-saravanak@google.com> <CAL_Jsq+f1+xRv36z0o--u4SskTG-WxUdssJ-CP32RUZbtVuQ3w@mail.gmail.com>
In-Reply-To: <CAL_Jsq+f1+xRv36z0o--u4SskTG-WxUdssJ-CP32RUZbtVuQ3w@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 22 Nov 2019 11:34:13 -0800
Message-ID: <CAGETcx-GV1kTAVbqcCLGVPoN16RpSrDw4gcxSgAVqWCb1NOzXA@mail.gmail.com>
Subject: Re: [PATCH] of: property: Add device link support for
 interrupt-parent, dmas and -gpio(s)
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 22, 2019 at 5:35 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Nov 20, 2019 at 1:13 AM Saravana Kannan <saravanak@google.com> wrote:
> >
> > Add support for creating device links out of more DT properties.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  drivers/of/property.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > index 0fa04692e3cc..dedbf82da838 100644
> > --- a/drivers/of/property.c
> > +++ b/drivers/of/property.c
> > @@ -1188,7 +1188,11 @@ DEFINE_SIMPLE_PROP(interconnects, "interconnects", "#interconnect-cells")
> >  DEFINE_SIMPLE_PROP(iommus, "iommus", "#iommu-cells")
> >  DEFINE_SIMPLE_PROP(mboxes, "mboxes", "#mbox-cells")
> >  DEFINE_SIMPLE_PROP(io_channels, "io-channel", "#io-channel-cells")
> > +DEFINE_SIMPLE_PROP(interrupt_parent, "interrupt-parent", NULL)
>
> This one is not going to work most of the time (ignoring the fact that
> the primary controller doesn't have a struct device) because the
> interrupt-parent is typically in a parent node.

Just to make sure, I'm not parsing this property incorrectly, right?

Are you saying it's listed at the parent of a bunch of devices and the
interrupt-parent is inherited and won't really create device links for
those child devices?
I mainly added this to make sure IRQ controllers are probed in the
right order. Also, if this delays the parent device probe, by the time
the child devices are added, the interrupt parent most likely would
already be probed.

> You could make it work
> by specifying 'interrupt-parent' in every node, but that's not a
> pattern I want to encourage.

I'm trying to take care of the basic per-device properties first.
Adding support for inherited properties isn't too difficult, I just
need to get to those at some point. Also, for inherited properties, we
can't really block probing because the child device might not depend
on that resource. Inherited properties are mainly relevant only for
sync_state() callbacks.

> There's also all the other ways the
> parent can be determined. Any parent node with 'interrupt-controller'
> or 'interrupt-map' property is the parent. And there's
> 'interrupts-extended' too.

Now I'm confused. Not sure if you are referring to actual device
parent now or if you are talking about an "interrupt supplier".

-Saravana

>
> > +DEFINE_SIMPLE_PROP(dmas, "dmas", "#dma-cells")
> >  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
> > +DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> > +DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
> >
> >  static const struct supplier_bindings of_supplier_bindings[] = {
> >         { .parse_prop = parse_clocks, },
> > @@ -1196,7 +1200,11 @@ static const struct supplier_bindings of_supplier_bindings[] = {
> >         { .parse_prop = parse_iommus, },
> >         { .parse_prop = parse_mboxes, },
> >         { .parse_prop = parse_io_channels, },
> > +       { .parse_prop = parse_interrupt_parent, },
> > +       { .parse_prop = parse_dmas, },
> >         { .parse_prop = parse_regulators, },
> > +       { .parse_prop = parse_gpio, },
> > +       { .parse_prop = parse_gpios, },
> >         {}
> >  };
> >
> > --
> > 2.24.0.432.g9d3f5f5b63-goog
> >
