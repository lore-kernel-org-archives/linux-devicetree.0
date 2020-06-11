Return-Path: <SRS0=a2/f=7Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0586C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 13:01:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD89D20801
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 13:01:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="BXD053gC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgFKNBk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 11 Jun 2020 09:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbgFKNBk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Jun 2020 09:01:40 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5136BC03E96F
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 06:01:38 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x14so6079110wrp.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 06:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=elECq92oJ4/XDwQ9hOWJUgujb9aF8JKLlnlf1/L4bGY=;
        b=BXD053gCnYRcPJDIinKxGq0ceA7ctZrCxv5J4I9m/Cp5sQHGSTDSU0LOtOyVn7qqUj
         Krd+qAND6/A3L8TTMx2eC5OGjpGZcsZSHiJhVs4+1BKAT1l+6GNPrUI41ck9+os3+tWS
         XRwTIW87OAy4CW+LaSesaLBcFwKPjdTwBFf9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=elECq92oJ4/XDwQ9hOWJUgujb9aF8JKLlnlf1/L4bGY=;
        b=Q0HXsZmrJZ8MNB3H5iBGgBI6FAYxdhrutzTfihltRCF90bdNwuJ1wpGCSl3PWnlxG1
         O1aZ6UVlDGedBjljnsePIh+TriBpM0mzjYhwajAjDsJHVGbTteLHM+KqonJGf3VtFyiT
         bhYjrB2/Xe9yKflF27SlFEw83ZeLgjmK7qbqRzDrXi1U3vH+ISkPIc/YNitZXxRix0s0
         mM0opnJ07167u3m6EUIZ4JKkIKJlB2CGe3CASD96kXgSeRjy7aqZODsUE6Mgwnenkl+m
         ep0cF5ZWj+ci4XC4ZK4rCFxWrSg77ZP2hIBwahVzfr1rWWPGvizReUFgagRyRPDlfSEj
         LRhg==
X-Gm-Message-State: AOAM532hOXROM8H5MpxtxLWo4dCJ76T6zOUgrAQIS0ujOL8Sdre0KJeU
        JIRcGfUKvGbsqE+RsyebJNejx9DLT1cPRnw+iu15aw==
X-Google-Smtp-Source: ABdhPJxfj6Ic2hQLja4+A6vurSDrOmbpY/+FxQxxyINLp+8z03ANQKuArnIOi/AhJzUy1lPkZwoVW5sIY5NTSKdMO9E=
X-Received: by 2002:a5d:6cc1:: with SMTP id c1mr9805713wrc.144.1591880496326;
 Thu, 11 Jun 2020 06:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191014061617.10296-2-daniel@0x0f.com> <20200610090421.3428945-3-daniel@0x0f.com>
 <976e789e-edd7-c44d-ea99-840ecb883ff8@suse.de>
In-Reply-To: <976e789e-edd7-c44d-ea99-840ecb883ff8@suse.de>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Thu, 11 Jun 2020 22:01:20 +0900
Message-ID: <CAFr9PXkvmZv3_EakxvRR+X522xN-a8epvF0ns10JeYCLn2uUKw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] ARM: mstar: Add machine for MStar/Sigmastar
 infinity/mercury family ARMv7 SoCs
To:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc:     Krzysztof Adamski <k@japko.eu>, tim.bird@sony.com,
        devicetree@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Maxime Ripard <mripard@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Stephan Gerhold <stephan@gerhold.net>,
        Mark Brown <broonie@kernel.org>, allen <allen.chen@ite.com.tw>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Doug Anderson <armlinux@m.disordat.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Christian Lamparter <chunkeey@gmail.com>,
        Nathan Huckleberry <nhuck15@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Andreas,

On Thu, 11 Jun 2020 at 21:49, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> > peripherals and system memory in a single tiny QFN package that
> > can be hand soldered allowing almost anyone to embed Linux
>
> "soldered, allowing"?

The original reads ok to me. Maybe I can just split that into two sentences=
?
Like ".. QFN package that can be hand soldered. This allows almost anyone..=
".

> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2114,6 +2114,7 @@ ARM/MStar/Sigmastar ARMv7 SoC support
> >   M:  Daniel Palmer <daniel@thingy.jp>
> >   L:  linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
> >   S:  Maintained
> > +F:   arch/arm/mach-mstar/
> >   F:  Documentation/devicetree/bindings/arm/mstar.yaml
> >
> >   ARM/NEC MOBILEPRO 900/c MACHINE SUPPORT
> [snip]
>
> The sort order has recently been changed to case-sensitive, i.e., you
> should append arch after Documentation.

Interesting. Checkpatch didn't complain about that although it
complained about the
original ordering I had.

Thanks for the input.

Daniel
