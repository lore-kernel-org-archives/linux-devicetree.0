Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1534BC18E5B
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 12:07:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D851D20663
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 12:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584360444;
	bh=dKLStnngV26lqFF3RkpFDDio6Do+Y9GQ8/8bts/sxyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=YHUS8IAUulnzUKljPLwe5m48qjl0la2j/VYiz1QM9FugQ/fUVL1dz5rrqJxgYBNoV
	 EPYH0HE/azbj7q+QccNe923e+pdcJ5cwZfS5Vz4169V3K80TNIAfbjFldI42772yGH
	 6QPPesT9hzVL/RSWhwjKE/qJHkwmDlmt9mpeR/n4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730913AbgCPMHY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 08:07:24 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:44006 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730634AbgCPMHY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Mar 2020 08:07:24 -0400
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 02GC7HJe022659
        for <devicetree@vger.kernel.org>; Mon, 16 Mar 2020 21:07:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 02GC7HJe022659
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1584360438;
        bh=1WdVoD2GR3rsf9LOOCviumyPaCeZIZzcSnPah9GyQRo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AUi5omdfuSn7fW9rIh8cuNHJWA0zaQvmfoAu6FSyf+rA74wjPaBnwEwYFIyT5gKb1
         3taHlgNI8Nk9rzPXIs81zDPWrW4v3FOWnWTiZgEQwdX7W7SEDVa2WUcGlWLfisA846
         b8y5O10v/valqjW9DRcltYRBWCl7W46OLKc0T2CYSb3KH+ykxvTFuZ7/Ej3rtOAD2x
         xuEg38G0GnMpLQ/AGQl84RT8CCSORedML1RmAeet7LZiOMqeOWi2SyERorPKuSMPqg
         QqijorSqJ7CBixaPkPjtl16x5XnxB8st7OS5KkpWwtVdirMkLwqnQaysX0RiLLUPHP
         KE94L1sXvTIuQ==
X-Nifty-SrcIP: [209.85.222.48]
Received: by mail-ua1-f48.google.com with SMTP id q24so1517196ual.10
        for <devicetree@vger.kernel.org>; Mon, 16 Mar 2020 05:07:18 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2wvts4qSRNiCQ2RniAepsQS4VYGgJICOGHbKEV9/00WknDlnQe
        XUhG0TSrTXl/OVCYvpwLY/djuSwtAUspXEX8i+4=
X-Google-Smtp-Source: ADFU+vu+aiZaKzn4yQzmAfKsZEABMNGMwf1PqYMa2CZTlxIl9JDGIpCD9f5PgcYDxiJ9WvpEnqc4kwlvAq5+7XSqkjc=
X-Received: by 2002:ab0:28d8:: with SMTP id g24mr13929982uaq.121.1584360437287;
 Mon, 16 Mar 2020 05:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <1584061096-23686-2-git-send-email-hayashi.kunihiko@socionext.com>
 <CAK7LNASCOhZ5BMWWCA1zKep-sXra1pBBTxjsDp816k8Ph1m1Pw@mail.gmail.com> <20200316194330.B482.4A936039@socionext.com>
In-Reply-To: <20200316194330.B482.4A936039@socionext.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 16 Mar 2020 21:06:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNATmxhLn6fg8+5RAKcw+_-75SDN0dG=E1e8H2yrYU3p5Eg@mail.gmail.com>
Message-ID: <CAK7LNATmxhLn6fg8+5RAKcw+_-75SDN0dG=E1e8H2yrYU3p5Eg@mail.gmail.com>
Subject: Re: [PATCH 01/10] ARM: dts: uniphier: Add XDMAC node
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Mar 16, 2020 at 7:43 PM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> On Sat, 14 Mar 2020 11:14:09 +0900 <yamada.masahiro@socionext.com> wrote:
>
> > On Fri, Mar 13, 2020 at 9:58 AM Kunihiko Hayashi
> > <hayashi.kunihiko@socionext.com> wrote:
> > >
> > > Add external DMA controller support implemented in UniPhier SoCs.
> > > This supports for Pro4, Pro5 and PXs2.
> > >
> > > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> > > ---
> > >  arch/arm/boot/dts/uniphier-pro4.dtsi | 8 ++++++++
> > >  arch/arm/boot/dts/uniphier-pro5.dtsi | 8 ++++++++
> > >  arch/arm/boot/dts/uniphier-pxs2.dtsi | 8 ++++++++
> > >  3 files changed, 24 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/uniphier-pro4.dtsi b/arch/arm/boot/dts/uniphier-pro4.dtsi
> > > index 2ec04d7..a1bfe0f 100644
> > > --- a/arch/arm/boot/dts/uniphier-pro4.dtsi
> > > +++ b/arch/arm/boot/dts/uniphier-pro4.dtsi
> > > @@ -426,6 +426,14 @@
> > >                         };
> > >                 };
> > >
> > > +               xdmac: dma-controller@5fc10000 {
> > > +                       compatible = "socionext,uniphier-xdmac";
> > > +                       reg = <0x5fc10000 0x1000>, <0x5fc20000 0x800>;
> >
> >
> >
> > This is odd.
> > <0x5fc20000 0x800> causes reg overwrap with
> > aidet@5fc20000 below.
>
> Thank you for pointing out.
>
> Indeed, the address is wrong. I'll fix it.
> And I'll also fix the example of dt-bindings.
>
> Thank you,



You did not notice the over-wrap
because the second region is not used
from the driver.

Why did you define the unused region?


--
Best Regards
Masahiro Yamada
