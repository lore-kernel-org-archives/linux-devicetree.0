Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3207C47258
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 07:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4D082082E
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 07:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="FeY1euaz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbgEFHDK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 03:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727123AbgEFHDJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 03:03:09 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485BEC061A0F
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 00:03:09 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id f3so1149756ioj.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 00:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kNp8v77ILg0esKTUhtdtghBS9Oa/t4onJ0W3YRlQA2s=;
        b=FeY1euazNQf3RbKL1bjD/43J4EwwmimWuHqwEOZnwBz1hd1L/dc031nSE9oFG+Wg3T
         2MlLi4P3wjow8IWLNhEQw5wQzsUq1yR+pgmzkLdVVMq5F7acvzCJw8xt9tRwn4YzdTqI
         kq7B8RhWDy1Uvo/U/3HxmGo/XUghQ5rSkaM7QtRSng9YDN+DAZRzDNHwxdWW3bqi1RwX
         Xh5e60qZDatUFmTvM25J+WaTlWzSbN0N0nS7q/Emfd0rfMxf1322dnteGutZVlRQiV6j
         fm+T0G1XqnxcfRt5xUFvnQ+oI02GhWQhe3J5K8O2fEQKiuxWrHopugqtZsq2TI4F9eZL
         Ldxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kNp8v77ILg0esKTUhtdtghBS9Oa/t4onJ0W3YRlQA2s=;
        b=I9W6NrbZ2SvxJbqmf1dz0IHAYa0yIckl4W1FFKCMx4ZHIj1DRuX1WV/HRH3rNa5alE
         aRBr0RUkQjGsGVafxqFhJnJ/KmnUceSumj34tIv8JDDu2NMAEgg6W0OFRfsAC5DhIRgX
         Gnn6BnLKCQpKIy15V7eJ+Xf13BpbXGmqRWYijukN5iN6kMkcMKafpYKMO+/E0JmSNZGT
         DfRSrqsC3B3e5ZXxOwnTUd48N6OqyRdH2rx7fbiuNWFIN+xrXqKKMGRbWYuepUGvhgiB
         dSHnpEYRXtZdwV0xJ1NheGYiUPBvXAFt+7K2aDuaLTYfaFubGUvDooSAkMpLkCQ+a11s
         w/eg==
X-Gm-Message-State: AGi0PuatPfEOiBls50JvWK1yxAnciLetLMYW+HQNM+BoRaMFaYgApO48
        3uR1jylsPXSk1a+S74sHrG3jDYECP612VfozZLbY8g==
X-Google-Smtp-Source: APiQypK484RcQGROR6N++Jsg8cJZdgh7y4enPWlVzQyBROs9NdLHKNWT34OgKh5Hlj/AoF1qRVFqfpsKTSIhrMt9Np8=
X-Received: by 2002:a6b:8bd2:: with SMTP id n201mr7159413iod.131.1588748588553;
 Wed, 06 May 2020 00:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140231.16600-1-brgl@bgdev.pl> <20200505140231.16600-7-brgl@bgdev.pl>
 <20200505174709.GD224913@lunn.ch>
In-Reply-To: <20200505174709.GD224913@lunn.ch>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 6 May 2020 09:02:57 +0200
Message-ID: <CAMRc=Meob9VP83HiF4r2zAEXX0+1LduSrJGCXx=rKB1W701pnA@mail.gmail.com>
Subject: Re: [PATCH 06/11] net: ethernet: mtk-eth-mac: new driver
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Felix Fietkau <nbd@openwrt.org>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Fabien Parent <fparent@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-mediatek@lists.infradead.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Andrew,

thanks for the review.

wt., 5 maj 2020 o 19:47 Andrew Lunn <andrew@lunn.ch> napisa=C5=82(a):
>
> > +static struct net_device *mtk_mac_get_netdev(struct mtk_mac_priv *priv=
)
> > +{
> > +     char *ptr =3D (char *)priv;
> > +
> > +     return (struct net_device *)(ptr - ALIGN(sizeof(struct net_device=
),
> > +                                              NETDEV_ALIGN));
> > +}
>
> Bit of an odd way to do it. It is much more normal to just have
>
>     return priv->netdev;
>

But then you store a pointer to the starting address of the structure
in that very structure. This is actually weirder to me. :) I'd say:
let's generalize it and provide a counterpart to netdev_priv():
priv_to_netdev(), how about that?

For the other issues: I'll address them in v2.

Bart
