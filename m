Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66427C433E2
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 07:03:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AFA8207CB
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 07:03:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731540AbgEZHDX convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 03:03:23 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36621 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731493AbgEZHDW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 03:03:22 -0400
Received: by mail-oi1-f194.google.com with SMTP id x23so17822303oic.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 00:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eylea4IzybGIW6tKiP757miyZUnIcYAn0TGjr5EpQeg=;
        b=S0IJtpph/upvtMLQUGWXplryKGMhWCr/yD77lmcB4BgfglQiRKdV28bNULNSlERInz
         tEnYgG/jwqeXgfIBAaEsw0UPA+F3++N6kfQB9Iq7JUeKGLeZsZmevj7O5ULPzFcquopO
         1JqSjS9i0MCtKuXqH7ZBNsI/QO+Uh5gnrr9KBvy0RxKizl3KliOxDt7L/BS6Iieq9o+7
         3CLAAfY9E2Ockc+loSDZBuz+rk7+jXApuUBNS4mcL/UXhO8xon1qHLpRxSphPooJDSdm
         UZlBaLyVglS9PiHJnZIeXb2z2WxEMbsZOmw+33HYltNmJPtSehalR7aIxRE2965eYbLt
         yfIQ==
X-Gm-Message-State: AOAM532JyJWAdu/IORR3KJ9qx6AiNkK8bxfNzjz9S0eZEHJoWm/qrU4/
        68uioP9KV7cnCFuiBr6PRi8yH2XhNYP1HNlCqWNdJg==
X-Google-Smtp-Source: ABdhPJwoTDU5wULf7eq9/btuEuJSHCIUmidUX0Z2hIGssT3qq1UQVdPUrc1BWTuhuTqVAkLXFujdyBtKyRuneHegSIQ=
X-Received: by 2002:aca:210a:: with SMTP id 10mr12785206oiz.153.1590476601417;
 Tue, 26 May 2020 00:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-7-ricardo.canuelo@collabora.com> <20200514015412.GF7425@pendragon.ideasonboard.com>
 <20200514093617.dwhmqaasc3z5ixy6@rcn-XPS-13-9360> <20200514152239.GG5955@pendragon.ideasonboard.com>
 <20200525074335.grnjvdjnipq5g3kf@rcn-XPS-13-9360> <20200526014444.GB6179@pendragon.ideasonboard.com>
In-Reply-To: <20200526014444.GB6179@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 May 2020 09:03:09 +0200
Message-ID: <CAMuHMdXinhY13us9rt9h7EvrT_8zhnQg6tmOBtA0nEQ=1G1O7Q@mail.gmail.com>
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

On Tue, May 26, 2020 at 3:44 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, May 25, 2020 at 09:43:35AM +0200, Ricardo Cañuelo wrote:
> > On jue 14-05-2020 18:22:39, Laurent Pinchart wrote:
> > > > If we want to be more strict and require the definition of all the
> > > > supplies, there will be many more DTs changes in the series, and I'm not
> > > > sure I'll be able to do that in a reasonable amount of time. I'm looking
> > > > at them and it's not always clear which regulators to use or if they are
> > > > even defined.
> > >
> > > We can decouple the two though (I think). The bindings should reflect
> > > what we consider right, and the dts files could be fixed on top.
> >
> > Do you have a suggestion on how to do this? If we decouple the two
> > tasks most of the work would be searching for DTs to fix and finding a
> > way to fix each one of them, and unless I do this _before_ the binding
> > conversion I'll get a lot of dtbs_check errors.
>
> Rob should answer this question as it will be his decision, but I've
> personally never considered non-compliant DT sources to be an obstacle
> to bindings conversion to YAML. The DT sources should be fixed, but I
> don't see it as a prerequisite (although it's a good practice).

I do my best to avoid introducing regressions when the binding conversions
go upstream.

FTR, hence patches 1-3 are already in v5.7-rc7.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
