Return-Path: <SRS0=1K1h=ZW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D407C432C0
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 18:57:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBD9A2075A
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 18:57:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Gpkidqji"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfK3S5h (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 30 Nov 2019 13:57:37 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36830 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfK3S5h (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 30 Nov 2019 13:57:37 -0500
Received: by mail-oi1-f193.google.com with SMTP id c16so6685704oic.3
        for <devicetree@vger.kernel.org>; Sat, 30 Nov 2019 10:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yqW1F0PK4uWgsjZ30TNatVDixat9HzqjfJPVfcA99us=;
        b=GpkidqjiHVReKMnlhuDjBMjxfcRyq/mG9QHTZULg9sjdIZvoKX/5BOFI47Kc2m3sLF
         AwsTEFkPFpZ7Oz8g8IN4iClnYN9c7mbIkacQd5zAEEKWEAIE3C0Bd1d7lNCs3X5ho80Y
         o6yNvtjRCSezDjuhp5gipIJzpqHcWJ3beSlzu++C+1ABhJafjZ2BRoWdBGWMkinDhTdH
         KepyN1ZpMQsb/F2K2c8clFfjXDY5p73mlZscgvYhqZVQPUzzW5eKICV2Y2pWp6BK+B3g
         xC1Yt+Z5p4zO1Xj2WzD6gl2Qqo1f8tE5KaqRhXpVXLENb3EoTAs39zWlE2PzaTOuGdpp
         FraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yqW1F0PK4uWgsjZ30TNatVDixat9HzqjfJPVfcA99us=;
        b=Cp2unKN376b3CXHA+OFuGuMFVDvtL64Qek9yAYKO63f0ZP/KKKyhIzPmjRQG6w3hcy
         71hfGaB7RuEKmlJAqqU9LOQv5bfP36SRf6n2U7YNHVdDeKEXoiR/p3oifAC1HItx7bY7
         P7qrvtm6s3I4ST9cnEEQup9bhJz53wx5sEGiL5IgpNf+Lh0BjqL/m4o2JOUsCW0/JRva
         FEW4GFWz52bpuF+EaWpOwwblpGa/n0lj+ftTbHe3sdLomOJTKop+TjHcvhu/lvIS2Jxa
         aFyO1V7GWN82Ny9K/FhNWw37wRCnqpuXx7PaR0G+QQ1gu36ylDrq3Qqlc6zNZ2MzZX9h
         KZAA==
X-Gm-Message-State: APjAAAUzKVkzY3qPbjGYZqLc0KD5DBjCSsnO8s+ekZx44ytvFuBdmkWL
        ukXMsfPKFh81kT8wd8qlNLQeoIcfnleM2Nv98DI=
X-Google-Smtp-Source: APXvYqxvtwhtUuoeUB9eWD1OUWzsUM256fQ8fpmE4BjRMy/Y4ST0Jb6ycGc5/P4uU9AsiOiVJ5PQWhqR0K6yBKCBOJc=
X-Received: by 2002:a54:4815:: with SMTP id j21mr17291513oij.15.1575140255802;
 Sat, 30 Nov 2019 10:57:35 -0800 (PST)
MIME-Version: 1.0
References: <20191130115824.31778-1-mohammad.rasim96@gmail.com>
 <20191130115824.31778-3-mohammad.rasim96@gmail.com> <CAFBinCAxt5v6K3qcWeaECnqufRpb-0OK-Q+QFR+qph_tPVaXvg@mail.gmail.com>
 <20191130174753.6ajv5spl6n3ojhqy@manjaro.localdomain>
In-Reply-To: <20191130174753.6ajv5spl6n3ojhqy@manjaro.localdomain>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 30 Nov 2019 19:57:24 +0100
Message-ID: <CAFBinCBdGHX2dR89C+sy+v_ZmPPeu95GGDu1t0E03TYg33SChQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: meson-gxbb: add support for
To:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Nov 30, 2019 at 6:47 PM Mohammad Rasim
<mohammad.rasim96@gmail.com> wrote:
>
> On 19/11/30 02:59PM, Martin Blumenstingl wrote:
> > Hi Mohammad,
> >
> > this patch should be third in the series.
> > the currently missing patch for the dt-bindings should be patch two.
> > you can take the following commit as an example:
> > effdd8a6b6ecb30b088f36ed0a1fb67cdc7610a9 ("dt-bindings: arm: amlogic:
> > add SEI Robotics SEI610 bindings")
> >
> > On Sat, Nov 30, 2019 at 12:58 PM Mohammad Rasim
> > <mohammad.rasim96@gmail.com> wrote:
> > >
> > > This patch adds support for the Videostrong KII Pro tv box which is
> > > based on the gxbb-p201 reference design
> > >
> > > The device tree includes a new compatible for bluetooth "brcm,bcm4335a0"
> > > which was merged recently into torvalds tree
> > >
> > > Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
> > >  .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 76 +++++++++++++++++++
> > >  2 files changed, 77 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > >
> > > diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> > > index 84afecba9ec0..a795a170dcab 100644
> > > --- a/arch/arm64/boot/dts/amlogic/Makefile
> > > +++ b/arch/arm64/boot/dts/amlogic/Makefile
> > > @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
> > >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> > >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
> > >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> > > +dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
> > >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
> > >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
> > >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
> > > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > > new file mode 100644
> > > index 000000000000..5d120e6ca338
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > > @@ -0,0 +1,76 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright (c) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "meson-gxbb-p20x.dtsi"
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/input/input.h>
> > > +/ {
> > > +       compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
> > > +       model = "Videostrong KII Pro";
> > > +
> > > +       leds {
> > > +               compatible = "gpio-leds";
> > > +               red {
> > > +                       label = "status";
> > this property seems to be deprecated now, see
> > Documentation/devicetree/bindings/leds/common.txt
> > but I'm not sure whether Kevin has made a decision yet when to not
> > accept "label" properties here anymore
> OK, I will remove the deprecated property
> but I'm not sure what should I choose as a function, LED_FUNCTION_STATUS
> or LED_FUNCTION_ACTIVITY ?
I haven't used function and color myself but I believe it works like
this (untested):
- add an #include <dt-bindings/leds/common.h> next to the other
#includes (keep alphabetical ordering). this include file also
contains all the #defines for color and function
- add a color property, for example: color = <LED_COLOR_ID_RED>;
- add a function property, for example: function = <LED_FUNCTION_STATUS>;
- test, debug and fix potential issues ;)


Martin
