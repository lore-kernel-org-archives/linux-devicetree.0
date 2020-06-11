Return-Path: <SRS0=a2/f=7Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F98DC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 14:27:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24B2620842
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 14:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="FwBN+sIO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbgFKO1Q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 11 Jun 2020 10:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbgFKO1Q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Jun 2020 10:27:16 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6C7BC08C5C2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 07:27:15 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id r9so5160308wmh.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 07:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9PTMI4AzXbLxjyyfz+xfdpQHe4hbBWsXmsCFiQIKN4U=;
        b=FwBN+sIO4TrTpP0kISN3kEu0krnuRDrBMvQaELuZn2dafIWWIy3mCsH4FnnW14hbhE
         mQZvr+O1MMO1HbLLkF3esMZtzen5E4PSL/AFedMg9N7ZvIJHmtFJqWaEOL1D+FWBJpdk
         ++BzE/BZLtUb84uvG5wlSGRetmJXlxgLzcf6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9PTMI4AzXbLxjyyfz+xfdpQHe4hbBWsXmsCFiQIKN4U=;
        b=FjfT+FEJIrDih10tGBeOXpAu6lDKGoLPmq7OfYHRiQ6OJ/AJUIeP6vPZPQ+5au1VPL
         gwROC8R0nKvoIjNFGrsdICj4PODIgwkX643tN4GkgzcQh6kt9e2lZypHvvsKrgjs28eY
         d7vKSmBZ0R0GyErZ9QIQu2RVVDxbTPlg8msqrgMJUc8V5Sr9CJzS9euR/degFT9ekZfr
         C+54c8AVUo9qn5Y7gbN7Rxz+pII6qLkSvGrnoqGan2BTUK6XrjQWxPmJA2G9JryzcOZf
         bYE8l5CrN3pLZF3Lxl2tnY7MKuTCEkV5SAv9nC9F8STvoMPNVHBIctboRqg4e1jX24l3
         Rp3w==
X-Gm-Message-State: AOAM533ochS6Q9cczYLa5t6T6enC0y0SXQL8OORPcWDKBM6AuzTJjIbk
        WOkX5SKDF7DKrXyel463lMV5rtXRfeRJtpg+mQfX9g==
X-Google-Smtp-Source: ABdhPJxFx37GGZrR7mx+bOeh2G0xHw4CjeDEUlLUymRGmdGvuYyynBKWPZnPWwH+zKli3nFcFwjcLZAVrfDcfzhzaPA=
X-Received: by 2002:a1c:7206:: with SMTP id n6mr8751619wmc.4.1591885634606;
 Thu, 11 Jun 2020 07:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191014061617.10296-2-daniel@0x0f.com> <20200610090421.3428945-5-daniel@0x0f.com>
 <42aa9e03-3fcc-a602-40db-cfbddef36b34@suse.de>
In-Reply-To: <42aa9e03-3fcc-a602-40db-cfbddef36b34@suse.de>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Thu, 11 Jun 2020 23:26:59 +0900
Message-ID: <CAFr9PXkFqhivokPzP3ZyHMKaT52nRuJHE=DKd9V5BnC=pV+JWg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] ARM: mstar: Add dts for msc313(e) based BreadBee boards
To:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc:     Krzysztof Adamski <k@japko.eu>, tim.bird@sony.com,
        devicetree@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Maxime Ripard <mripard@kernel.org>,
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
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nathan Huckleberry <nhuck15@gmail.com>,
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

On Thu, 11 Jun 2020 at 22:45, Andreas F=C3=A4rber <afaerber@suse.de> wrote:

> > +     compatible =3D "thingyjp,breadbee-crust", "mstar,infinity";
> > +
> > +     aliases {
> > +             serial0 =3D &pm_uart;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +};
> > +
> > +&pm_uart {
> > +     status =3D "okay";
>
> Might this be a more suited place for temporary clock-frequency? For
> lack of clk driver it would seem to depend on the board's bootloader
> pre-configuring it rather than being a default of the SoC.

For all of the chips so far their second stage bootloader always turns
on a PLL and
reconfigures the pm_uart clock to use a 172MHz tap from that PLL right
at the start
of the boot process before u-boot is started. The new u-boot SPL I'm
working on to replace
that loader follows that convention.
Once the clk parts are in it should be possible to pull out the fixed
frequency and
replace it with a proper handle to that PLL tap.
Basically it's not documented anywhere except the assembly but the
convention for
these chips is to use the 172MHz clock for the uart pretty soon after
power on so it
made sense to have it in one place.

Thanks,

Daniel
