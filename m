Return-Path: <SRS0=UCWN=6F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4417C54FD0
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 12:57:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC4902076C
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 12:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587473851;
	bh=MB7/B6i0MZyDQYRvtRfqu1a3qVxolGl4xjHiJaUNUpo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=0HT6yVqAZdk4DWsHuLEk7XKwt9f4EZYa4CabHv4b7M6WOknFQ/EIUdeRiOJFdQOkK
	 uOav1VFQlHBBXMwAJvwh38tUQKfv7j+oZeJK8GdYiDAvb8sjsTGstDo25RFg/3bCNA
	 EcHoeyKCYKwWnKeYXExZxdbB7ehwjMfdW4wZgCEo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbgDUM5b (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Apr 2020 08:57:31 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:47858 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbgDUM5a (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Apr 2020 08:57:30 -0400
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 03LCvFBW029007
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 21:57:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 03LCvFBW029007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587473836;
        bh=9UQpcRvUemaHFo7L5Odh9LS7PYBKVGflzlH8vlG+LVg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZnrvpskK19jcp87FYObOSmn8s0vCYicKFdaOsd0iFTeNVWqXM1HFiH6DBZsgQllZF
         6+jW+5aMUWd1dfMIGECANxko1j7ArpXZ37a5Ofi10gkzk7tlzt7BQI4GKMof4Z3F40
         XuQ3O0/Oq6e0H4Nx67hDdfNbN5HvZby3JM+A+fSHJjExf3iVjLscDyiY+JCv4+rs89
         ZP3pB5cxN5bA5zJgHqG9c/W5qooFq0nG7829HeZPgQK9y/u8WFpe+sM1JPbKjzu/xY
         +jqRQoMHDGhkzxhDFNOjC6WYYOxf92Y2T6rgSfWSUricatwzsevuhx5ZzOsIJvUrBS
         q5zLJd8XxwtQg==
X-Nifty-SrcIP: [209.85.221.177]
Received: by mail-vk1-f177.google.com with SMTP id q200so3350106vka.13
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 05:57:15 -0700 (PDT)
X-Gm-Message-State: AGi0PubQWxw1qtnfET4GzO5W85HV335YXY1qQjSmtMlN/Oalq3Qi6Vr0
        Hl0Yoy0gqnppnPeDkb5xd7XaI/5zU5j7l0ZIUEU=
X-Google-Smtp-Source: APiQypIFObNeifQg7K56qQ6Q0t2K2BsBNuMJSZC/7uLKgOT/hbDbDAq/b+UNL2D89DT7u5415ggoOFVevCaGcrIYn8Y=
X-Received: by 2002:a1f:1e11:: with SMTP id e17mr14979491vke.73.1587473834593;
 Tue, 21 Apr 2020 05:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <158737719165.27947.6617937231903079086.stgit@localhost>
 <20200420190749.b508c7e6d60a8203360178ec@linaro.org> <CAK7LNAQtTPLdKN8cz842gvoS36GVQvk2ztahGp8XWoW3C8BzQg@mail.gmail.com>
 <CAA93ih0TNEfU_fiS_43+H6+UWrP2b8zh+PxMiiKBg3pZW8Jo8g@mail.gmail.com>
In-Reply-To: <CAA93ih0TNEfU_fiS_43+H6+UWrP2b8zh+PxMiiKBg3pZW8Jo8g@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 21 Apr 2020 21:56:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNASjoM1vr6=nSfs76yauC+QChKC6VX_pZkq1rhXDnJE5+A@mail.gmail.com>
Message-ID: <CAK7LNASjoM1vr6=nSfs76yauC+QChKC6VX_pZkq1rhXDnJE5+A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: uniphier: Add support for Akebi96
To:     Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Apr 20, 2020 at 10:21 PM Masami Hiramatsu
<masami.hiramatsu@linaro.org> wrote:
> > index f93519793bfb..afa90b762ea9 100644
> > --- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> > +++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> > @@ -337,7 +337,7 @@ gpio: gpio@55000000 {
> >                                                      <21 217 3>;
> >                 };
> >
> > -               audio: audio@56000000 {
> > +               audio@56000000 {
> >                         compatible = "socionext,uniphier-ld20-aio";
> >                         reg = <0x56000000 0x80000>;
> >                         interrupts = <0 144 4>;
> >
> >
> > Lastly, is the pin-setting "aout1", "aout1b" correct ?
>
> Yes, according to the schematics of Akebi96(*), it is connected to
> aout1b(XIRQ*) instead of aout1(AO1*).
>
> (*) https://www.96boards.org/documentation/enterprise/akebi96/hardware-docs/akebi96-schematics.pdf



So, I was asking about "aout1", not "aout1b".

According to the schematic, nothing is connected to AO1*.
See sheet 6.

Why do you need to assign the apparently unused pins?



-- 
Best Regards
Masahiro Yamada
