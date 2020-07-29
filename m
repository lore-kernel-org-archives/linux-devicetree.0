Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032FEC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 11:59:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5D2E20829
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 11:59:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Onozl2Pv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgG2L7W (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 07:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgG2L7W (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 07:59:22 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45278C0619D2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 04:59:20 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id di22so10010603edb.12
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 04:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5QRWy1YBlieNCizCX79fYi5/kvniVQ9BIqFKoJ+v6lY=;
        b=Onozl2PvdryGi9YD+CsC7unot6+rdgNl73NAR/I++XEkM/ICfb2X5HUb9upkVoQ5lR
         LWcTDVhZzlficsyzPt23J8l8HKMfciLClrRJ+X8j5F+jNX7PG89SmCaJQcmujDl47pw5
         hALGlMtR8EwQKPcr6wEtumEdIBpNGCaL8QebI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5QRWy1YBlieNCizCX79fYi5/kvniVQ9BIqFKoJ+v6lY=;
        b=r8/5T6try21xwfK2EwIy0bWqGM1xzHk3samwGo9HY4VglmZl17hBakT7E221sWxCkx
         i2zwZPnoCIQJ0oNcqwAqioSvYL8C6KDE4ZByCp8PtJHTm57B/vVLnDup+AqeGsh278v9
         EhzqyLpLuIuq5tWpifwKo3cdTCbzIdWeJabz5gxBMQ7th2aDnwEh726WhRvWLiOJ3C+a
         4EdiQUs/U3KhPsZfYIyZYzrBE37e1hyapx/NR7HFq4fmVKxOnTVtCYlewIzfiN/sXXAr
         y/4SqKQTjzRGAcYWLNDAAeGGIlKZViAJrt8nOvU6O79eM6g8A9uSN3DyLU1F0uIWCV1/
         m6Rg==
X-Gm-Message-State: AOAM5317aMf8GEB09QkHqluF5tP3HVMGj2AbYngTifqrjTqX//+rciSU
        sCwtqRq6m9auPsxqAYLMAFC8rsLuruZL4/ymKtpNFQ==
X-Google-Smtp-Source: ABdhPJxJTqL+yv4XQZ+e0Yu1p1dYX4jQwhJQ/xCQBLuR5o92WBnb1MdF57usX1MRal33FHuF6Ysjh0ffW2dn1NvjC0w=
X-Received: by 2002:a05:6402:c86:: with SMTP id cm6mr12777305edb.205.1596023958843;
 Wed, 29 Jul 2020 04:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200723090210.41201-1-jagan@amarulasolutions.com> <20200723155028.GA427258@bogus>
In-Reply-To: <20200723155028.GA427258@bogus>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 29 Jul 2020 17:29:07 +0530
Message-ID: <CAMty3ZDgrxeLxshKMMjXgg6wgDsan8mJeLr9d+YC9F=5uLPMqw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: rockchip: Update ROCKPi 4 binding
To:     Rob Herring <robh@kernel.org>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 23, 2020 at 9:20 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Jul 23, 2020 at 02:32:07PM +0530, Jagan Teki wrote:
> > ROCKPi 4 has 3 variants of hardware platforms called
> > ROCKPi 4A, 4B, and 4C.
> >
> > - ROCKPi 4A has no Wif/BT.
> > - ROCKPi 4B has AP6256 Wifi/BT, PoE.
> > - ROCKPi 4C has AP6256 Wifi/BT, PoE, miniDP, USB Host enabled
> >   GPIO pin change compared to 4B, 4C
> >
> > So, update the existing ROCKPi 4 binding to support
> > ROCKPi 4A/B/C hardware platforms.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v3:
> > - new patch
> >
> >  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > index db2e35796795..e6f656b0bd56 100644
> > --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> > +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > @@ -430,8 +430,12 @@ properties:
> >            - const: radxa,rock
> >            - const: rockchip,rk3188
> >
> > -      - description: Radxa ROCK Pi 4
> > +      - description: Radxa ROCK Pi 4A/B/C
> >          items:
> > +          - enum:
> > +              - const: radxa,rockpi4a
> > +              - const: radxa,rockpi4b
> > +              - const: radxa,rockpi4c
> >            - const: radxa,rockpi4
>
> radxa,rockpi4 already meant 'ROCKPi 4A' and should continue to do so.
> Just add 4B and 4C strings. It's up to you if they should be backwards
> compatible with 'radxa,rockpi4' (meaning 4A), but I'd guess not unless
> it's just a board pop option.

At-least from dts nodes enablement point of view the existing dts
(with radxa,rockpi4) is 4B since it has wifi/bt enabled. 4A is the
real name of the board so having a compatible with radxa,rockpi4a is
meaningful as I understood.

So, based on the above statements the respective binding look like

      - description: Radxa ROCK Pi 4A/B/C
        items:
          - enum:
              - radxa,rockpi4a
              - radxa,rockpi4b
              - radxa,rockpi4c
          - const: radxa,rockpi4
          - const: rockchip,rk3399

Comments, please?

Jagan.
