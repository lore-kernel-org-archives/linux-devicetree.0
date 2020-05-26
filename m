Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC3D6C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 10:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A06D2088E
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 10:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731907AbgEZKkG convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 06:40:06 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38381 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728259AbgEZKkF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 06:40:05 -0400
Received: by mail-ot1-f65.google.com with SMTP id o13so15880637otl.5
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 03:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dTaB15/ZleBqDK53ohM/31ShTHP4GnhoecVhCtwiqFU=;
        b=VQnc3qCX80dv8TUbw3bfPdntazziw/WJ+L9Wa/rHcs3C61pjk2eHF38pnhpgl0cd9p
         XVsXO27O38mMrp5smnltddkK83+GY78me59EsdSrtY5fRlPBcJ8zZ39nXE788KMsZxos
         M1GncAZ1mND2A+ol2jzZgy+NHQdL9ouDyZgBl0oXb+Y5YgqOFHfclOgIMHZ6TFbOh8/a
         dx2hHzbNam6+BXxFEU4z/rg1J4gKxrrnJwNIhqgQ7dE66BxZ6CPjR3F/CRAswZaVau+t
         NyvfSnJqzf6c8KoaXWXVs5opugdw59huDc0cEufMg2tngL4OePR3tMEq1JyJVgDRX8xP
         rl7w==
X-Gm-Message-State: AOAM5326E2ORUeTccX1H73cvTomjagTkdtTvnBamIVrnBBC9gghfEEw/
        OaImUoQfJukHCogxFFQ8qIcmoNc6CaxVk6XBhVw=
X-Google-Smtp-Source: ABdhPJxkfLttUGiOUgqdiWLlHCoBdZw0pBOxG2BykOGgx3dfJ7lQPvh1Hg7DEmLz6ytyeXpXRq06Z9Je6ABlFop6tfw=
X-Received: by 2002:a05:6830:1151:: with SMTP id x17mr370069otq.250.1590489603970;
 Tue, 26 May 2020 03:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-7-ricardo.canuelo@collabora.com> <20200514015412.GF7425@pendragon.ideasonboard.com>
 <20200514093617.dwhmqaasc3z5ixy6@rcn-XPS-13-9360> <20200514152239.GG5955@pendragon.ideasonboard.com>
 <20200525074335.grnjvdjnipq5g3kf@rcn-XPS-13-9360> <20200526014444.GB6179@pendragon.ideasonboard.com>
 <CAMuHMdXinhY13us9rt9h7EvrT_8zhnQg6tmOBtA0nEQ=1G1O7Q@mail.gmail.com> <20200526101158.GA5903@pendragon.ideasonboard.com>
In-Reply-To: <20200526101158.GA5903@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 May 2020 12:39:52 +0200
Message-ID: <CAMuHMdUV+qHpfLfbYwQwPXAUsh7HXvonUNWNh-SeTC-RpHwrog@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] dt-bindings: drm: bridge: adi,adv7511.txt: convert
 to yaml
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Laurent,

On Tue, May 26, 2020 at 12:12 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, May 26, 2020 at 09:03:09AM +0200, Geert Uytterhoeven wrote:
> > On Tue, May 26, 2020 at 3:44 AM Laurent Pinchart wrote:
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
> >
> > I do my best to avoid introducing regressions when the binding conversions
> > go upstream.
>
> Please note that we're not talking about runtime regressions, as drivers
> are not updated. It's "only" dtbs_check that would produce new errors.

Exactly.  I was talking about "make dtbs_check" regressions, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
