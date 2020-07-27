Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19832C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 17:05:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E54642064B
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 17:05:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run-com.20150623.gappssmtp.com header.i=@solid-run-com.20150623.gappssmtp.com header.b="R7lqQ6pN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729876AbgG0RF1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 13:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729380AbgG0RF0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 13:05:26 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B64DC0619D2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 10:05:26 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id gg18so14437778ejb.6
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 10:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solid-run-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1UWXuVxrTXPn2/C98wkkf6EevtHV1S1R04GoKomRKLw=;
        b=R7lqQ6pNyaOi81+mhqvokLJeiXUFPNBwC3xsKxqjGxZb/k31uk7EKn6BoAnyjvbn5S
         umAchjm85d039omd9hPDmJX7TMsYmZd7fl7WCzCJNXIOxmYMpU2UG/d2A3DnuJV9jYkw
         HObkH8Tmtp3IlcOzSTwxKikid7ELzMjZcxWKX33SujUJUYjb1QcP23NVg6b2Z9j9rPnB
         PhaYFjPvHYlQS48MvUQ11ajUsuyb5p2iTQbx/NB402O1P8e4jeMxVmbk/tY/Bn65r3kh
         ibrzMKa53e3v1LP/eUFspBJbYORDRyf1V7s/OyEPLKdFiyAAQLQZIHw2elVliGPuU5vk
         FpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1UWXuVxrTXPn2/C98wkkf6EevtHV1S1R04GoKomRKLw=;
        b=KmPvvptFxLlIPv+CdxWC8ZmeNAaA8KmU8CTpBqlVjM7I1yfgdv9+9JgIVXQy3FUqLn
         vyqJBorcX1Psh8joUge0/byoNY/+uQD1WhRnljVjVl//o997o/JMOuH6zC86ipj8YszE
         T97Uluu9zUXYwwuTNGNjYfaYnRRzUIslJw9folxNLmSfbnU1hlBKmW7s84JpGQjL2oaS
         l5cbNz0Hkg9nwWBFgfSW+B2u5JGW/mCfCy7oTg62F0FSE0doTEojajrgEiNxWJ8OXJXU
         RQYxgktHlJ4vle81OR29zalkaxn+kjpRqqVCnKJCIfH+MQBXTFb8UfZ3eBRqtkWIl4rj
         xDLA==
X-Gm-Message-State: AOAM533XyVKq60TXL5v+MPnElulkmKnKegrmhY3n25Mwe3L4+j3kraaW
        TKQkftVUKYfnjMVgQIaHoFD0+1KRkZ9wSgOED51YMg==
X-Google-Smtp-Source: ABdhPJww0X8+AryGC7QGb6Vr6z1aKgVHMeJd/legoaBgd3/asP7tfo1T4gXuCtDNqqBsPtTHiO/pshG2xA412Y2chEw=
X-Received: by 2002:a17:906:cc48:: with SMTP id mm8mr20323361ejb.132.1595869524926;
 Mon, 27 Jul 2020 10:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200720112401.4620-1-miguelborgesdefreitas@gmail.com>
 <20200720112401.4620-2-miguelborgesdefreitas@gmail.com> <20200723174905.GA596242@bogus>
 <20200723195755.GV3428@piout.net> <20200727094553.GH1551@shell.armlinux.org.uk>
 <20200727144938.GC239143@piout.net> <20200727152439.GK1551@shell.armlinux.org.uk>
 <20200727154104.GE239143@piout.net> <20200727154335.GL1551@shell.armlinux.org.uk>
 <CABdtJHuVaTa5T0-KdQ-wZQrmFQ6HO3FvgnTgSo3aOi+=SPzDZA@mail.gmail.com> <20200727161632.GF239143@piout.net>
In-Reply-To: <20200727161632.GF239143@piout.net>
From:   Jon Nettleton <jon@solid-run.com>
Date:   Mon, 27 Jul 2020 19:04:48 +0200
Message-ID: <CABdtJHukOOMN7zsrAUQYma==N_t+LYmgWLpqJvZZNwg8PBM7dA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: pcf8523: add DSM pm option for
 battery switch-over
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Rob Herring <robh@kernel.org>,
        Miguel Borges de Freitas <miguelborgesdefreitas@gmail.com>,
        a.zummo@towertech.it, Baruch Siach <baruch@tkos.co.il>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jul 27, 2020 at 6:16 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 27/07/2020 17:55:50+0200, Jon Nettleton wrote:
> > > So, can we please have that discussion, it is pertinent to this patch.
> > >
> >
> > Thinking about this some more, I believe whether or not an IOCTL
> > interface is in the works or needed is irrelevant.  This patch
> > describes the hardware and how it is designed and the topic of
> > discussion is if we need a simple boolean state, or if we need
> > something that could be used to support dynamic configuration in the
> > future.  I would rather make this decision now rather than keep
> > tacking on boolean config options, or revisit a bunch of device-tree
> > changes.
>
> Something that would describe the hardware is a property telling whether
> the filter is present on VDD, not a property selecting DSM. The driver
> can then chose to avoid standard mode when needed.
>

The filter being present or not is not the singular hardware
requirement for making this determination.  There is no reason to make
this some obtuse argument.  There are two states and you may want one
or the other, or the ability to switch between them.  This is a flag
to tell the driver how the hardware should be configured based on the
board preference.  Let's find a simple consistent way to do this.
