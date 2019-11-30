Return-Path: <SRS0=1K1h=ZW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F2FC432C0
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 19:12:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AFAFA2073C
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 19:12:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKG+8PTd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbfK3TMM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 30 Nov 2019 14:12:12 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38963 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727197AbfK3TMM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 30 Nov 2019 14:12:12 -0500
Received: by mail-wm1-f68.google.com with SMTP id s14so11705721wmh.4
        for <devicetree@vger.kernel.org>; Sat, 30 Nov 2019 11:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Fj8/eGhmkpNCrv6hZSNiJUAn6YzH6LdgGOzoOyH71EE=;
        b=LKG+8PTdFRfZ9P9GkvlNavQ7GuCPR/m2t3Q1rQoQpK1IouBEnv2f6A1EDHn6xgYNEi
         3aPHyN8w2dc1XNAQLstI2dSGYzCyQva0Xks2OMcTu+f1N0Dd2SHX5eUw3h5eDbhBH/Im
         +cOqXNhb8Ma/XaOlhPyJgLvWMryu1BG8rqFFt6u71f3fuQoBiM7ZJE0eZABbLd5j5PZE
         l14uNvJCcGwjPAy9fIUhsPkPvTXtEIRL4YXfCbrrUnisg+ljH0z8Aqpi974uma9AAqPL
         6+gM2a6Q5u5UfktHz4fO5C2wtVdJn2ZGFSJItDWYPEjYctfNB6SGLMxFNvKn16SsrN6C
         bUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fj8/eGhmkpNCrv6hZSNiJUAn6YzH6LdgGOzoOyH71EE=;
        b=ksYM3a0wJLbpKWJ4ZDsVn2i0UkU7pSkXx1ca9fD05i4Pfl/dcga7tB6HJD7cbhhVN3
         xyJDq1ZMt/IAm7wNFre9fxav56izVB8S8GpkLN9ZP7B7W4SheCQtVSry5ZHatkKaKeA3
         vVJs+jroEPa/jEeQI8dA5ZE+ABcfnelIuidSt0HOfBbmRxWu/R4l/5OPkLGQIoG2ua/Z
         YtiUvIMC+tniTqY5zuFz5kPa3UoP9kPo8ovZ3svsyH3Cs39CTxFbn4AuHVzeUWt/lGP5
         pOsGxoVrGy0BNvLSnu2ZV/boZdlAz8hBsqb/dSI9FinHFQd7ezJVcWWs/w2GPcllMtd8
         SSEw==
X-Gm-Message-State: APjAAAXMzgwS3OhgHsXRAKZQWvtcqFd2zLTwNNFLcglOcAObVXOC6OGx
        ++UpvZgUxav5IW9KLTwqbiQ=
X-Google-Smtp-Source: APXvYqzezjuu5zMYba0nW1uzpSCAihRGx0BNdo15JVbqbUcCHgab1YklrqzGqfSEK2q6wiF/aV1r9A==
X-Received: by 2002:a1c:9602:: with SMTP id y2mr19504528wmd.23.1575141128884;
        Sat, 30 Nov 2019 11:12:08 -0800 (PST)
Received: from localhost ([37.238.188.27])
        by smtp.gmail.com with ESMTPSA id s82sm17945337wms.28.2019.11.30.11.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 11:12:08 -0800 (PST)
Date:   Sat, 30 Nov 2019 22:12:06 +0300
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: meson-gxbb: add support for
Message-ID: <20191130191206.74qcibnf4v3wwrez@manjaro.localdomain>
References: <20191130115824.31778-1-mohammad.rasim96@gmail.com>
 <20191130115824.31778-3-mohammad.rasim96@gmail.com>
 <CAFBinCAxt5v6K3qcWeaECnqufRpb-0OK-Q+QFR+qph_tPVaXvg@mail.gmail.com>
 <20191130174753.6ajv5spl6n3ojhqy@manjaro.localdomain>
 <CAFBinCBdGHX2dR89C+sy+v_ZmPPeu95GGDu1t0E03TYg33SChQ@mail.gmail.com>
 <20191130190702.52zjhlh65gpq2ugj@manjaro.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191130190702.52zjhlh65gpq2ugj@manjaro.localdomain>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 19/11/30 10:07PM, Mohammad Rasim wrote:
> On 19/11/30 07:57PM, Martin Blumenstingl wrote:
> > On Sat, Nov 30, 2019 at 6:47 PM Mohammad Rasim
> > <mohammad.rasim96@gmail.com> wrote:
> > >
> > > On 19/11/30 02:59PM, Martin Blumenstingl wrote:
> > > > Hi Mohammad,
> > > >
> > > > this patch should be third in the series.
> > > > the currently missing patch for the dt-bindings should be patch two.
> > > > you can take the following commit as an example:
> > > > effdd8a6b6ecb30b088f36ed0a1fb67cdc7610a9 ("dt-bindings: arm: amlogic:
> > > > add SEI Robotics SEI610 bindings")
> > > >
> > > > On Sat, Nov 30, 2019 at 12:58 PM Mohammad Rasim
> > > > <mohammad.rasim96@gmail.com> wrote:
> > > > >
> > > > > This patch adds support for the Videostrong KII Pro tv box which is
> > > > > based on the gxbb-p201 reference design
> > > > >
> > > > > The device tree includes a new compatible for bluetooth "brcm,bcm4335a0"
> > > > > which was merged recently into torvalds tree
> > > > >
> > > > > Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
> > > > >  .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 76 +++++++++++++++++++
> > > > >  2 files changed, 77 insertions(+)
> > > > >  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> > > > > index 84afecba9ec0..a795a170dcab 100644
> > > > > --- a/arch/arm64/boot/dts/amlogic/Makefile
> > > > > +++ b/arch/arm64/boot/dts/amlogic/Makefile
> > > > > @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
> > > > >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> > > > >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
> > > > >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> > > > > +dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
> > > > >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
> > > > >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
> > > > >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
> > > > > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > > > > new file mode 100644
> > > > > index 000000000000..5d120e6ca338
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > > > > @@ -0,0 +1,76 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > +/*
> > > > > + * Copyright (c) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
> > > > > + */
> > > > > +
> > > > > +/dts-v1/;
> > > > > +
> > > > > +#include "meson-gxbb-p20x.dtsi"
> > > > > +
> > > > > +#include <dt-bindings/gpio/gpio.h>
> > > > > +#include <dt-bindings/input/input.h>
> > > > > +/ {
> > > > > +       compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
> > > > > +       model = "Videostrong KII Pro";
> > > > > +
> > > > > +       leds {
> > > > > +               compatible = "gpio-leds";
> > > > > +               red {
> > > > > +                       label = "status";
> > > > this property seems to be deprecated now, see
> > > > Documentation/devicetree/bindings/leds/common.txt
> > > > but I'm not sure whether Kevin has made a decision yet when to not
> > > > accept "label" properties here anymore
> > > OK, I will remove the deprecated property
> > > but I'm not sure what should I choose as a function, LED_FUNCTION_STATUS
> > > or LED_FUNCTION_ACTIVITY ?
> > I haven't used function and color myself but I believe it works like
> > this (untested):
> > - add an #include <dt-bindings/leds/common.h> next to the other
> > #includes (keep alphabetical ordering). this include file also
> > contains all the #defines for color and function
> > - add a color property, for example: color = <LED_COLOR_ID_RED>;
> > - add a function property, for example: function = <LED_FUNCTION_STATUS>;
> > - test, debug and fix potential issues ;)
> Yes, I've already tested it but I'm just not sure what should be in the
> function property, LED_FUNCTION_STATUS and LED_FUNCTION_ACTIVITY both
> seem like good choices,
> in my tests this property was prepended to the label
Scratch that, I was confused because i changed the node name, the labled
is generated from the color property and the node name.
although my question regarding userspace usage still applies.
> So the following:
>
> 		status {
> 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
> 			default-state = "off";
> 			color = <LED_COLOR_ID_RED>;
> 			function = LED_FUNCTION_STATUS;
> 		};
> resulted in a led labeled red:status
> [root@alarm ~]# ls /sys/class/leds/
> input1::capslock  input1::numlock  input1::scrolllock  red:status
>
> if this property only used to lable the led then LED_FUNCTION_STATUS is
> ok, but maybe this is used by userspace to trigger the led ?!
>
> Regards
> >
> >
> > Martin
