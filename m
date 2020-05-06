Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32026C4724C
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 06:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CAF5206E6
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 06:40:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="Kr5jrMX/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbgEFGj7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 02:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726843AbgEFGj7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 02:39:59 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F96C061A0F
        for <devicetree@vger.kernel.org>; Tue,  5 May 2020 23:39:58 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id c16so729910ilr.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2020 23:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PsWFEGMVJXcSSkAjwrVFH6KJLf0s0b6ByKNGvxglslg=;
        b=Kr5jrMX/+PcTSTiywlXvOb8Kl6wEWgrrE0EqA30uFVzGqFsiZXfp945Iq9nxoAburZ
         7Rs3ERUy82Zma/rH7oPkI8imeqGVZ7htwpQI0s4j1XgCEJxdreiWmrbw37k7528UOLIb
         7GJUXVP8ogrq5C8xkXS6xCpM36TXREVn7F0WZt3t9xRUw/yl4d3x6F8m2ATmEFJrdnky
         +kODoPK5I9u3PytnmWA3652DueJnRefdk+JoJCaJkUIaZaZRfFWw27b/ikrzoVD7PlH4
         /1E2pniM3AM9nVvVC2/+EKPtYlz0RGBckD9orVy5059umC2zzj9Zk+RB8+BROBCqRXGm
         TyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PsWFEGMVJXcSSkAjwrVFH6KJLf0s0b6ByKNGvxglslg=;
        b=Sh6epp0Tq2NmxlgesKZx0xLP8H/BnPXHwGbzU76mW2v0ow22cGykcHj6vRp/ZB+4aX
         IROYM5fUXel7yGTQxtDMSs4jniO5m8p6tta6Ol9sbyoHkQY/QpEepA9bKIrkvNrCwUrd
         AOpBR3IS5nZWnh+atluakkyKBzi/E7qB/hUUK0YBwLKkFGPc1yTg/g7V7iBWISPyVaQA
         qsHBU1o2KjqpaZBz4UZ7dcSOHImS8TfSLk42fULiAKDJWZ/TYFQaUJZuaHoqTbMxuist
         Hx0eOHdUWa2jS7ZuOEKEI864rzZs4PzDkIAlIaZsQPs+Ezk9wUKrZWZdVnK46yfljI20
         GjBw==
X-Gm-Message-State: AGi0PubgpSrr887Uaxs2BBolfR6Xr+MkfjQVLziNQXceVPB2IdjqLvwD
        EnX7ErfJFV7myWs3DXM/Y6Hp6YwpCIvzqJiHbR95dQ==
X-Google-Smtp-Source: APiQypKqtjH4SAI/hXBWX3+KWPEY3bw3Ls+I33LVzGThbfZA9NOr8ifN8iSwMhFGSis6GvXv/BqSn8GW32PMwFDzUQw=
X-Received: by 2002:a92:dac8:: with SMTP id o8mr7207819ilq.189.1588747198311;
 Tue, 05 May 2020 23:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140231.16600-1-brgl@bgdev.pl> <20200505140231.16600-6-brgl@bgdev.pl>
 <20200505103105.1c8b0ce3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200505103105.1c8b0ce3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 6 May 2020 08:39:47 +0200
Message-ID: <CAMRc=Mf0ipaeLKhHCZaq2YeZKzi=QBAse7bEz2hHxXN5OL=ptg@mail.gmail.com>
Subject: Re: [PATCH 05/11] net: core: provide devm_register_netdev()
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Felix Fietkau <nbd@openwrt.org>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Fabien Parent <fparent@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

wt., 5 maj 2020 o 19:31 Jakub Kicinski <kuba@kernel.org> napisa=C5=82(a):
>
> On Tue,  5 May 2020 16:02:25 +0200 Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Provide devm_register_netdev() - a device resource managed variant
> > of register_netdev(). This new helper will only work for net_device
> > structs that have a parent device assigned and are devres managed too.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index 522288177bbd..99db537c9468 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -9519,6 +9519,54 @@ int register_netdev(struct net_device *dev)
> >  }
> >  EXPORT_SYMBOL(register_netdev);
> >
> > +struct netdevice_devres {
> > +     struct net_device *ndev;
> > +};
>
> Is there really a need to define a structure if we only need a pointer?
>

There is no need for that, but it really is more readable this way.
Also: using a pointer directly doesn't save us any memory nor code
here.

Bart
