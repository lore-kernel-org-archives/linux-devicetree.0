Return-Path: <SRS0=0pfk=6G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5940C2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 02:19:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F74B20724
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 02:19:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c/Nn57tc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgDVCTS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Apr 2020 22:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgDVCTR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Apr 2020 22:19:17 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35674C0610D6
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 19:19:16 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id e17so412246ybq.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 19:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eD12MM0qRGC0+kgKXm3ggeVgtjEg4vFSk5PZGwQnw+o=;
        b=c/Nn57tcIJ4/Fsow2CyCQv4vmDsCDHTrp5fk9kmX3Sx21drX1zOVRkJPzc7l3AWB4d
         DhWCLB0C7AXuTtrA+++zf76bhHCpcCzjspRFGpBRjLAA9J1FqmjlOT3y3Nd90DoVug8E
         xl6uJ8Ht+0b09DrEv6i+pwmrmPlexWXO2dYOHfuMlcJ1mp6NMnSk5IxtazRDaELptCXv
         GSo2P4qtJO8pQvs1KGFuEC23AEakWg4f7TyjsPH+By0NuaOS1zUhyO1WBrW/vr4F3yDc
         DNcqoWPAufqfJQci8yqdmM4GC0ugOD+/PVTf9wAgYyuNeslJ/a8bqxs5D69LavEQJZjM
         7F4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eD12MM0qRGC0+kgKXm3ggeVgtjEg4vFSk5PZGwQnw+o=;
        b=n1cZLR1+eyAp87rE/Sd6OF5QRvbnMbCFuH5sX+mlUWvrHKSWyAt80tO+5Fr+bupPka
         DK2hVELqYlDEahDE2BCy8pvQBUvbSalhsv04JnQ+YKK9/iC1Bh5cvXPLSs1/z8qPe7U9
         3EiaZtsq3AWAGpNqi2RjyKwVKnMHfY4wCA/mbZl6QNvFiHsJP9IOeENDs0AFIYVYYbUW
         WOQcBeuklIVDT8OekhiExyOqF0Yc29mt+LyjD7+a01JiPOXFAmNZgt7l21sTpqZdNJEJ
         MCI6W6mkol9NdaHLEWdhDCnIKbbIUaDGc0nlDhv7ATxZhf5y/XzKLOauk2X5wF9oPf2/
         jxug==
X-Gm-Message-State: AGi0PubfR74bUcN5uwK7cELOmL9DhtPG4RpPioXm6HV0vTU9OMwLOXGW
        XDgTdi9gOz/urWa1L6XVKyQnfAcdyUCThcJfBwSCQQ==
X-Google-Smtp-Source: APiQypJuR76/LW08ImUx/6Stbr8KXo3jLagEMDDWMCJ+qlOKjssz3DtPf0dePxfy9mmoTCGk7EqJwjxIUvjkpKddAJw=
X-Received: by 2002:a25:4f0a:: with SMTP id d10mr164888ybb.52.1587521954812;
 Tue, 21 Apr 2020 19:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <158737719165.27947.6617937231903079086.stgit@localhost>
 <20200420190749.b508c7e6d60a8203360178ec@linaro.org> <CAK7LNAQtTPLdKN8cz842gvoS36GVQvk2ztahGp8XWoW3C8BzQg@mail.gmail.com>
 <CAA93ih0TNEfU_fiS_43+H6+UWrP2b8zh+PxMiiKBg3pZW8Jo8g@mail.gmail.com> <CAK7LNASjoM1vr6=nSfs76yauC+QChKC6VX_pZkq1rhXDnJE5+A@mail.gmail.com>
In-Reply-To: <CAK7LNASjoM1vr6=nSfs76yauC+QChKC6VX_pZkq1rhXDnJE5+A@mail.gmail.com>
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date:   Wed, 22 Apr 2020 11:19:03 +0900
Message-ID: <CAA93ih0ksjwNzAW9+Y4ex+Ki8bCViwjcVZxftdQ8rk_YM_HmgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: uniphier: Add support for Akebi96
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Yamada-san,

2020=E5=B9=B44=E6=9C=8821=E6=97=A5(=E7=81=AB) 21:57 Masahiro Yamada <masahi=
roy@kernel.org>:
>
> On Mon, Apr 20, 2020 at 10:21 PM Masami Hiramatsu
> <masami.hiramatsu@linaro.org> wrote:
> > > index f93519793bfb..afa90b762ea9 100644
> > > --- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> > > +++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> > > @@ -337,7 +337,7 @@ gpio: gpio@55000000 {
> > >                                                      <21 217 3>;
> > >                 };
> > >
> > > -               audio: audio@56000000 {
> > > +               audio@56000000 {
> > >                         compatible =3D "socionext,uniphier-ld20-aio";
> > >                         reg =3D <0x56000000 0x80000>;
> > >                         interrupts =3D <0 144 4>;
> > >
> > >
> > > Lastly, is the pin-setting "aout1", "aout1b" correct ?
> >
> > Yes, according to the schematics of Akebi96(*), it is connected to
> > aout1b(XIRQ*) instead of aout1(AO1*).
> >
> > (*) https://www.96boards.org/documentation/enterprise/akebi96/hardware-=
docs/akebi96-schematics.pdf
>
> So, I was asking about "aout1", not "aout1b".

Ah, I got it.

>
> According to the schematic, nothing is connected to AO1*.
> See sheet 6.
>
> Why do you need to assign the apparently unused pins?

No, we don't need it. I confirmed we only need groups =3D "aout1b".
I'll update the series with that fix.

Thank you!

>
>
>
> --
> Best Regards
> Masahiro Yamada



--=20
Masami Hiramatsu
