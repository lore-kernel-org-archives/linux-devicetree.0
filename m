Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5470AC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 17:30:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E14A2089D
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 17:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590600605;
	bh=AYuJ67xsI+CFY7fGg0P0jYxtF43oU5VTBcAFmEh+qxc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=cY6xAsj0yp/CUBceqD2IQIGc7wBxjdzg3GTANeyNDWKerPmqxOJyudxL+EUuzDjxj
	 EXwVxo4IhX3CWr5ckQdZXPZVyA00CUWJzrYTsOzbcrYYbtgbwKjYwo/I52XHhJ+omc
	 DXASlVrUq77jD/hUZnnOgLfc8lzY4HeKGeZlQ0nU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgE0RaE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 13:30:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:34346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbgE0RaE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 May 2020 13:30:04 -0400
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D5922089D
        for <devicetree@vger.kernel.org>; Wed, 27 May 2020 17:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590600603;
        bh=AYuJ67xsI+CFY7fGg0P0jYxtF43oU5VTBcAFmEh+qxc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EJWWhLbk5Lz6+Rnb8QcUPDoQATBQVp2Iy6kvhQD7FufGToEqZw0WNmKoEZY+OeWoD
         4rrHCNZGyQtw7/B8k5ncP5E/pc9LDYXrZg2pq9TIrd9nknM4w/xTPrhulgOkCsTMPa
         pFSZ0noNeWbaxVUSiUxAum/0PU6fIzcy/VTy7wWw=
Received: by mail-oi1-f180.google.com with SMTP id l6so22417688oic.9
        for <devicetree@vger.kernel.org>; Wed, 27 May 2020 10:30:03 -0700 (PDT)
X-Gm-Message-State: AOAM531VwHapx6JMz2cbX8GsCLZpEmgMMlg6kJ+xNAPhVyTF3Y2w8iYf
        SRr7MijRssBHjqMZX5i3O+/MYRITp70HS0KS2g==
X-Google-Smtp-Source: ABdhPJw6llfBTCOQ2yPHWqoilVklcwSd7RUIwXqOE8eWot1HvhdFljn/0QocEk0zHloG/X0FBFCjJl7CKzBHAp2PxaU=
X-Received: by 2002:aca:d4d5:: with SMTP id l204mr3572243oig.147.1590600602702;
 Wed, 27 May 2020 10:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-7-ricardo.canuelo@collabora.com> <20200514015412.GF7425@pendragon.ideasonboard.com>
 <20200514093617.dwhmqaasc3z5ixy6@rcn-XPS-13-9360> <20200514152239.GG5955@pendragon.ideasonboard.com>
 <20200525074335.grnjvdjnipq5g3kf@rcn-XPS-13-9360> <20200526014444.GB6179@pendragon.ideasonboard.com>
 <CAMuHMdXinhY13us9rt9h7EvrT_8zhnQg6tmOBtA0nEQ=1G1O7Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXinhY13us9rt9h7EvrT_8zhnQg6tmOBtA0nEQ=1G1O7Q@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 27 May 2020 11:29:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJgQajnKdQ1Bt6YFX04fX0VGz44Q3kBdLLR04OzhWrH5A@mail.gmail.com>
Message-ID: <CAL_JsqJgQajnKdQ1Bt6YFX04fX0VGz44Q3kBdLLR04OzhWrH5A@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] dt-bindings: drm: bridge: adi,adv7511.txt: convert
 to yaml
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wei Xu <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, May 26, 2020 at 1:03 AM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
>
> Hi Laurent,
>
> On Tue, May 26, 2020 at 3:44 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Mon, May 25, 2020 at 09:43:35AM +0200, Ricardo Ca=C3=B1uelo wrote:
> > > On jue 14-05-2020 18:22:39, Laurent Pinchart wrote:
> > > > > If we want to be more strict and require the definition of all th=
e
> > > > > supplies, there will be many more DTs changes in the series, and =
I'm not
> > > > > sure I'll be able to do that in a reasonable amount of time. I'm =
looking
> > > > > at them and it's not always clear which regulators to use or if t=
hey are
> > > > > even defined.
> > > >
> > > > We can decouple the two though (I think). The bindings should refle=
ct
> > > > what we consider right, and the dts files could be fixed on top.
> > >
> > > Do you have a suggestion on how to do this? If we decouple the two
> > > tasks most of the work would be searching for DTs to fix and finding =
a
> > > way to fix each one of them, and unless I do this _before_ the bindin=
g
> > > conversion I'll get a lot of dtbs_check errors.
> >
> > Rob should answer this question as it will be his decision, but I've
> > personally never considered non-compliant DT sources to be an obstacle
> > to bindings conversion to YAML. The DT sources should be fixed, but I
> > don't see it as a prerequisite (although it's a good practice).

There's currently no requirement that binding schema don't introduce
warnings in dts files. That should change when/if we get to a warning
free state (probably per platform/family). I don't think we're close
on any platform? (If we are, I'd like to start tracking that). It is
good to pay attention to the warnings you get though as the schema may
not be doing what you expect or the binding really doesn't match
reality.

> I do my best to avoid introducing regressions when the binding conversion=
s
> go upstream.

Meaning you fix the dts files or massage the schema to match? If we
just adjust schema to match, what's the point in this effort? We
should find things wrong or ill defined.

Rob
