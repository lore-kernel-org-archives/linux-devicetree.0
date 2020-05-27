Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322FEC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 11:49:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1163220888
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 11:49:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="idCOZA7J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbgE0LtL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 07:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgE0LtJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 May 2020 07:49:09 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7802AC03E979
        for <devicetree@vger.kernel.org>; Wed, 27 May 2020 04:49:09 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id 17so23672267ilj.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2020 04:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P8PTwzFzeBrMUylfPlK6w5QdgJqQqN0ShMTZV+S777s=;
        b=idCOZA7Jer7/khj6oT5n+RXA3MUeC4xabBa2DnpNqo4bRw4q5FfizSKagPdtLXaGt2
         +cLFBmH6D73ncH5MHDbLo7dLii+KP9GYujT8xVp+8Qtf+Q+43pOg1Kpk5JlqGNGFFOK3
         Or8Ok8yZ5v53V2VrvqfyG3Zvf9UlXR7742SY0ob9QdAZ6WAvxD6qJQ4sgwlRrL5wM+Gk
         WrbeD47V5MtrNgv1E0hgvh0Bo6zbre9MXmdv8fPgr3I+v/D3R0Un0MmKj+nw73OgONnv
         uOhkecfpiu8P+4anG7oFMWDnDG9C3C0Ccod44fhP+jaMXsL9zDvmvftECD8HlNht6Gr2
         V7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P8PTwzFzeBrMUylfPlK6w5QdgJqQqN0ShMTZV+S777s=;
        b=ufILNP+m0HWvYtEmcGSMzgAX0fsdjFVj+nmvitWEfxnZmUA61o9o6hEwvGJFeDzi5I
         JEAuBdzofxjl7ttsYTLJ/1AFu25CfQajW/FWjdYXtZwgL4LUYw6YQMi4xloAuw+SukP3
         3G7bMyB1bH9e0xd3yrqvNFFh7rYMEqFpkaJncQ/seWT6dbh38V2LW8i7lBBUAGtO4AWS
         CZayC9jzV55HFLmI8bau+XN6UbL+IAyidHsG1bfyl/dJLfDyA41jEW1qqfVuzyZZ9aIv
         A4/9JNhaKhxcP5lN14k0nnxsQ1ZfYMf1Jtwcg2hbK/dg0Lv1gk8dj+0wiQl8AJrVnc04
         r0/w==
X-Gm-Message-State: AOAM531798cMMi9tjSDip9s2GFNLnUz7n3vJSd/Jc3QFWM76iHtVgiky
        qwT8RC4dke55E2uOde1PDuXlXXMCju+FBH/NQxDidw==
X-Google-Smtp-Source: ABdhPJzOr8AK3ftkfELinUKS0OcMPJwZ5irSDBy6AtSymxKhk9eJ8/5fPkT1KSwP9yyzC0KfwMBGAIvKmGDKk2XSqvw=
X-Received: by 2002:a92:de10:: with SMTP id x16mr2425173ilm.6.1590580148751;
 Wed, 27 May 2020 04:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200522120700.838-1-brgl@bgdev.pl> <20200522120700.838-7-brgl@bgdev.pl>
 <20200527073150.GA3384158@ubuntu-s3-xlarge-x86> <CAMRc=MevVsYZFDQif+8Zyv41sSkbS8XqWbKGdCvHooneXz88hg@mail.gmail.com>
 <CAK8P3a3WXGZpeX0E8Kyuo5Rkv5acdkZN6_HNS61Y1=Jh+G+pRQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3WXGZpeX0E8Kyuo5Rkv5acdkZN6_HNS61Y1=Jh+G+pRQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 27 May 2020 13:48:57 +0200
Message-ID: <CAMRc=Md1w_6+dU9gCwiiB5R+dMcYMPFLPrA++RBkKp5zaY6Riw@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] net: ethernet: mtk-star-emac: new driver
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Fabien Parent <fparent@baylibre.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Edwin Peer <edwin.peer@broadcom.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Andrew Perepech <andrew.perepech@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

=C5=9Br., 27 maj 2020 o 13:33 Arnd Bergmann <arnd@arndb.de> napisa=C5=82(a)=
:
>
> On Wed, May 27, 2020 at 10:46 AM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
>
> > > I don't know if there should be a new label that excludes that
> > > assignment for those particular gotos or if new_dma_addr should
> > > be initialized to something at the top. Please take a look at
> > > addressing this when you get a chance.
> > >
> > > Cheers,
> > > Nathan
> >
> > Hi Nathan,
> >
> > Thanks for reporting this! I have a fix ready and will send it shortly.
>
> I already have a workaround for this bug as well as another one
> in my tree that I'll send later today after some more testing.
>
> Feel free to wait for that, or just ignore mine if you already have a fix=
.
>
>        Arnd

Hi Arnd!

I already posted a fix[1]. Sorry for omitting you, but somehow your
name didn't pop up in get_maintainers.pl.

Bartosz

[1] https://lkml.org/lkml/2020/5/27/378
