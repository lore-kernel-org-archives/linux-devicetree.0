Return-Path: <SRS0=a2/f=7Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1804FC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 15:00:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1BAC2075E
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 15:00:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="B+Z3WDXP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbgFKPAH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 11 Jun 2020 11:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727850AbgFKPAG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Jun 2020 11:00:06 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBF1C08C5C2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 08:00:05 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r7so6534427wro.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Zn13stpxx1Rl6Xjq5ftH7LM2yq+qpmzz5Dz1MnQNUPM=;
        b=B+Z3WDXPc51flB3UeEUdxOPDGME46i9EtyeRpwFsCr5JvF64iwG4FhswMrTGyj6mGn
         s+USFO0qbs3Cf6fqQBGxT5h1ANuIBWP6Qsj6eVuGckh4r+Gl7BFlG73ifQUcbJ7jzL1n
         PEdc9X0Kw9gtBSFMIj9AYMrDQR2Rs3rAp/Pmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Zn13stpxx1Rl6Xjq5ftH7LM2yq+qpmzz5Dz1MnQNUPM=;
        b=KEPEMxTUoEKzDQMfkdKvr4xxqLBo2o+iyjlaTcBSluYC4+WgwtsLHfIRuBaHUWdv0h
         YIeD++koM+vnzGFBywc07TqYLDo9Iqvl5uOFWuS24JeBnit3lmcGH2F7IoQkrJXH4hD4
         Jvrsj4pk5W5EV7zC5Q87HrQQTazsoIN8WEe0Aef4TBk9zGjZMR3G4V1971v8ajPjQQSs
         rq5q4zP6dnA8zZv9ZAIloRleSOMxF5j6lmlopTRWdMtdtOG8kCwu+X25Fdbp1/3nI2JQ
         Cnl/P+Fu/+oKZnE+QXGqyz09i0a7isea732ZUFpSckZfo1U15mtVyoin/5jM5rA8eV48
         Aekw==
X-Gm-Message-State: AOAM5336WlgzRtdynH6JfYOABiYDed60Bq9454cs5iRfwjGMaSPdcm1i
        oBhIcFiQ8xzlLY3fJ9e2jssnOpEDhNgWMtaB7hB6PA==
X-Google-Smtp-Source: ABdhPJxNJT/spy9XbHA9PU9q8cwSHEyiW4NzMoG2C4D+jtRZjp+QSEyOrmAAr+yM0n32lutR8zkOXLgsoPs/p1NMDZE=
X-Received: by 2002:adf:f003:: with SMTP id j3mr10047392wro.228.1591887603896;
 Thu, 11 Jun 2020 08:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191014061617.10296-2-daniel@0x0f.com> <20200610090421.3428945-3-daniel@0x0f.com>
 <976e789e-edd7-c44d-ea99-840ecb883ff8@suse.de> <CAFr9PXkvmZv3_EakxvRR+X522xN-a8epvF0ns10JeYCLn2uUKw@mail.gmail.com>
 <1e8262e0-9b30-0788-446a-5d88c1bb49ea@suse.de>
In-Reply-To: <1e8262e0-9b30-0788-446a-5d88c1bb49ea@suse.de>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Thu, 11 Jun 2020 23:58:44 +0900
Message-ID: <CAFr9PXkU8jYMx2NBHzNu2Xa7BfC6n9wpgxps9YE2VAcPTwdMiw@mail.gmail.com>
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

On Thu, 11 Jun 2020 at 23:27, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
>
> Hi Daniel,
>
> Am 11.06.20 um 15:01 schrieb Daniel Palmer:
> > On Thu, 11 Jun 2020 at 21:49, Andreas F=C3=A4rber <afaerber@suse.de> wr=
ote:
> >>> peripherals and system memory in a single tiny QFN package that
> >>> can be hand soldered allowing almost anyone to embed Linux
> >>
> >> "soldered, allowing"?
> >
> > The original reads ok to me. Maybe I can just split that into two sente=
nces?
> > Like ".. QFN package that can be hand soldered. This allows almost anyo=
ne..".
>
> As non-native speaker I merely wondered whether a comma should better be
> inserted to separate the two parts of the sentence. Splitting it in two
> or leaving as is should be fine, too - I assume you're a native speaker.

I'm a native speaker but it's not my daily driver anymore so I often mangle=
 it.

> Most people will rather read the bindings document than old git history,
> so you might want to consider adding such a description below its title.

I'll move the blurb and maybe reword it.

> Which reminds me, in 1/5 you should probably add a W: line (after S:
> according to above sort commit) pointing to your
> http://linux-chenxing.org/ website.
>
> And for the community following your project, you may want to set up a
> linux-chenxing mailing list on vger.kernel.org or on infradead.org and
> add it as L:, to allow for error reports and patches to not just go to
> you and crowded LAKML.

Very good points. I was thinking I should probably get this into mainline
before setting up lists etc.

Thanks,

Daniel
