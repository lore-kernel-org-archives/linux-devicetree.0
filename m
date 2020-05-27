Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C90DC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 18:18:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47B682075A
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 18:18:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391933AbgE0SSU convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 14:18:20 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45879 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391932AbgE0SST (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 May 2020 14:18:19 -0400
Received: by mail-oi1-f195.google.com with SMTP id d191so22520201oib.12
        for <devicetree@vger.kernel.org>; Wed, 27 May 2020 11:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Var6zB7r/K27Y0hKiyg6WYBIMMgMr1FRwYS50LiCuf4=;
        b=c30cx5+bdKbxvejB3jqzehEM73oFObVtXCYdjbW43OpZEuXEN18gapU1o1+KpdsmhA
         Ht+XpoYdto1rzGK7qKXu6C0NRSLwSWI29yzdF7A8/lZEVyznFO4uHo3e4xozhoLb1veZ
         nnJxgDNAdIM82NFU4IRcN4pOcwGNFTc98TL0DPNWg5t7UaoLqRufW3jnwFhZ4rEeqkdI
         lmDFoyCjERMlnLwTnjUCQ/5/Lm4C/tPS5GIGbz9kZtO61YQH/q6Vg3k/d+qn8VPoHPMo
         LN9PKLZeAXfDVw6/C2QeVICfhg4RxbOZP0QD/ybnItWYz6V1Ao3HfbO5wQRWT+vjLtCE
         DsVA==
X-Gm-Message-State: AOAM533RURgS4Lza6jWn5M+E57dv47iKBC3On1Kkwgt4pzopPXFkFo6a
        5ulr/Sy3d7ABEDopYyEnUjZe1scIx/HnsyolELe8AA==
X-Google-Smtp-Source: ABdhPJwDA4zHg5WB5PjjdXFgYfKNq5akaZGI8EL531AovJiaDg7KWPSpYl/RVEBlXbX6o0CsK9tXlv/w5MWsVk++Glo=
X-Received: by 2002:a05:6808:1:: with SMTP id u1mr3675937oic.54.1590603498756;
 Wed, 27 May 2020 11:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-7-ricardo.canuelo@collabora.com> <20200514015412.GF7425@pendragon.ideasonboard.com>
 <20200514093617.dwhmqaasc3z5ixy6@rcn-XPS-13-9360> <20200514152239.GG5955@pendragon.ideasonboard.com>
 <20200525074335.grnjvdjnipq5g3kf@rcn-XPS-13-9360> <20200526014444.GB6179@pendragon.ideasonboard.com>
 <CAMuHMdXinhY13us9rt9h7EvrT_8zhnQg6tmOBtA0nEQ=1G1O7Q@mail.gmail.com> <CAL_JsqJgQajnKdQ1Bt6YFX04fX0VGz44Q3kBdLLR04OzhWrH5A@mail.gmail.com>
In-Reply-To: <CAL_JsqJgQajnKdQ1Bt6YFX04fX0VGz44Q3kBdLLR04OzhWrH5A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 May 2020 20:18:07 +0200
Message-ID: <CAMuHMdXQQXOcVuq7Zhfp4qGH0vmLtxp3fdCJ+7VSAMQYSdjsTg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] dt-bindings: drm: bridge: adi,adv7511.txt: convert
 to yaml
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wei Xu <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

On Wed, May 27, 2020 at 7:30 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Tue, May 26, 2020 at 1:03 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, May 26, 2020 at 3:44 AM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > > On Mon, May 25, 2020 at 09:43:35AM +0200, Ricardo Cañuelo wrote:
> > > > On jue 14-05-2020 18:22:39, Laurent Pinchart wrote:
> > > > > > If we want to be more strict and require the definition of all the
> > > > > > supplies, there will be many more DTs changes in the series, and I'm not
> > > > > > sure I'll be able to do that in a reasonable amount of time. I'm looking
> > > > > > at them and it's not always clear which regulators to use or if they are
> > > > > > even defined.
> > > > >
> > > > > We can decouple the two though (I think). The bindings should reflect
> > > > > what we consider right, and the dts files could be fixed on top.
> > > >
> > > > Do you have a suggestion on how to do this? If we decouple the two
> > > > tasks most of the work would be searching for DTs to fix and finding a
> > > > way to fix each one of them, and unless I do this _before_ the binding
> > > > conversion I'll get a lot of dtbs_check errors.
> > >
> > > Rob should answer this question as it will be his decision, but I've
> > > personally never considered non-compliant DT sources to be an obstacle
> > > to bindings conversion to YAML. The DT sources should be fixed, but I
> > > don't see it as a prerequisite (although it's a good practice).
>
> There's currently no requirement that binding schema don't introduce
> warnings in dts files. That should change when/if we get to a warning
> free state (probably per platform/family). I don't think we're close
> on any platform? (If we are, I'd like to start tracking that). It is
> good to pay attention to the warnings you get though as the schema may
> not be doing what you expect or the binding really doesn't match
> reality.

OK.

> > I do my best to avoid introducing regressions when the binding conversions
> > go upstream.
>
> Meaning you fix the dts files or massage the schema to match? If we
> just adjust schema to match, what's the point in this effort? We
> should find things wrong or ill defined.

I fix up DTS files, and fast-track those fixes, so they appear upstream before
the DT binding conversion, where possible.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
