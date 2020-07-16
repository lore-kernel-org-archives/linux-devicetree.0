Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22F4C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:10:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAD4C20657
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594887005;
	bh=9U/Tqnp37+a3UeCbN/Rd8sLUh7bqxMwNK0GSPU3rn7U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=oXDaGOepfOy7FT/NDbpUB/eDzS1fjrFIDB86lIVcWhvmN5lqtV0cKg2q6ypaNR48n
	 0SefAbmjd6EM6BjYmbVAkWU9TkGviU8UeGypemwWyuDj+P9JyVl8Z/eZ+9syFGmpxZ
	 Rwmfjn6c/MGvxhHj3gOPylRon4HqjkSfw4EfrcCE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgGPIKF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 04:10:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:45340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbgGPIKF (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jul 2020 04:10:05 -0400
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9815920657
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 08:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594887004;
        bh=9U/Tqnp37+a3UeCbN/Rd8sLUh7bqxMwNK0GSPU3rn7U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wggqkr5xOlvI11gL5GhhaE3oI/suTd+Hi+YGwApT11Nwv6ox56zE5IiyYFypBGlhY
         jfs36+UBZnUqb/tViUtmAbteBDswDZQtoZ33vcGAirQzL7F+LROkToy7Ud9ZsiQbgN
         MO+vlh9CwkxUZa0rFLPq6FbdBQ7j4DClq8fztFaI=
Received: by mail-lj1-f170.google.com with SMTP id f5so6085772ljj.10
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 01:10:03 -0700 (PDT)
X-Gm-Message-State: AOAM532Akph9tB9Kqn9/VcxyXBF1+8xw0TZRkwYGSZvWuwjuLlRYtG2m
        ucJ1p0jPy6deNR0lm181LjFnS8M6KGt+BK9Hotk=
X-Google-Smtp-Source: ABdhPJzE94jfzWT9AWo4FurM0W9Z82oSyu+4uwwucgFaCYrUgTyttVF3u34Y20/R6fRz8KgntDWAVgtJ4D5hSsfaIj4=
X-Received: by 2002:a2e:3a14:: with SMTP id h20mr1316035lja.331.1594887001943;
 Thu, 16 Jul 2020 01:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200714071305.18492-1-wens@kernel.org> <20200714071305.18492-6-wens@kernel.org>
 <20200716080435.3td5il4eskh5jcru@gilmour.lan>
In-Reply-To: <20200716080435.3td5il4eskh5jcru@gilmour.lan>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Thu, 16 Jul 2020 16:09:51 +0800
X-Gmail-Original-Message-ID: <CAGb2v64d_nc2tPwLV6YeQuLjCxbTddEk0yGUtnGvJ8Pjk1FfYQ@mail.gmail.com>
Message-ID: <CAGb2v64d_nc2tPwLV6YeQuLjCxbTddEk0yGUtnGvJ8Pjk1FfYQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: dts: sun7i: Add MSI Primo73 tablet
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Siarhei Siamashka <siarhei.siamashka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 16, 2020 at 4:04 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Tue, Jul 14, 2020 at 03:13:05PM +0800, Chen-Yu Tsai wrote:
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > The Primo73 is an MSI branded Allwinner A20-based 7-inch tablet. It has
> > a metal back case with a plastic insert around where the WiFi antenna is.
> > The tablet is (as of July of 2020) no longer available from retailers.
> > Kernel sources (as required by GPL) are no longer available from the
> > vendor, MSI. The device support page still lists the link, but it is
> > dead.
> >
> > The tablet features a non-identifiable 1024x600 7" MIPI DPI TFT panel,
> > Goodix GT911-based capacitive touchscreen, 1GB DRAM, 8GB MLC NAND,
> > RTL8188ETV-based WiFi, an NXP MMA8452 accelerometer for orientation,
> > a GC2035 2 megapixel rear camera, a GC0308 0.3 megapixel front camera,
> > a mini-HDMI output, a micro-USB port, a headphone jack and single speaker.
> >
> > The board design is believe to follow Allwinner's reference design. This
> > judgement is based on the fact that the I/O pins and GPIO lines used
> > match up with the reference design. Assumptions about the regulator tree
> > are based on this.
> >
> > The LCD panel only has some serial number markings, and what appears to
> > be a part number: "OS1N71J003", which is also a prefix for one of the
> > serial number markings. Searching for this part number yielded no
> > results. As such, the color depth display timings are directly listed
> > in the device tree. The timing are from the FEX file recovered from the
> > device. The color depth was derived from the dithering setting from the
> > FEX file, as well as independent testing with a color gradient image.
> > The internal board, as well as the ribbon cable for the panel, route the
> > full 24 bits of color. So the 2 extra bits are dropped either by the
> > panel itself or somewhere within the LCD panel module casing.
> >
> > Add a device tree for this tablet. Almost the whole device is supported.
> > The only things missing are the two cameras, which don't have device
> > tree bindings or driver support. The vendor for the LCD panel is left
> > out, since there is nothing to go with.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >
> > The panel-dpi binding requires a more-specific compatible string.
> > However given the vendor of the panel is unknown, I'm not sure what
> > the best course of action is here. I opted to put the part number in
> > without a vendor prefix.
>
> I guess we could just make up a comptible from the tablet name here?
> Something like msi,primo73-panel ?

That might work. On the other hand, someone might take apart theirs
and find a different panel than mine, and not realize the timings
are off. Keeping the part number would still be useful, even if we
don't have any information on it.

> > ---
> >  arch/arm/boot/dts/Makefile              |   1 +
> >  arch/arm/boot/dts/sun7i-a20-primo73.dts | 279 ++++++++++++++++++++++++
> >  2 files changed, 280 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/sun7i-a20-primo73.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index e6a1cac0bfc7..c09cda958db5 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1133,6 +1133,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
> >       sun7i-a20-orangepi-mini.dtb \
> >       sun7i-a20-pcduino3.dtb \
> >       sun7i-a20-pcduino3-nano.dtb \
> > +     sun7i-a20-primo73.dtb \
> >       sun7i-a20-wexler-tab7200.dtb \
> >       sun7i-a20-wits-pro-a20-dkt.dtb
> >  dtb-$(CONFIG_MACH_SUN8I) += \
> > diff --git a/arch/arm/boot/dts/sun7i-a20-primo73.dts b/arch/arm/boot/dts/sun7i-a20-primo73.dts
> > new file mode 100644
> > index 000000000000..f3b1002ceb50
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/sun7i-a20-primo73.dts
> > @@ -0,0 +1,279 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (C) 2020 Chen-Yu Tsai <wens@csie.org>
> > + */
> > +
> > +/dts-v1/;
> > +#include "sun7i-a20.dtsi"
> > +#include "sunxi-common-regulators.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/pwm/pwm.h>
> > +
> > +/{
> > +     model = "MSI Primo73 Tablet";
> > +     compatible = "msi,primo73", "allwinner,sun7i-a20";
> > +
> > +     aliases {
> > +             serial0 = &uart0;
> > +     };
> > +
> > +     backlight: backlight {
> > +             compatible = "pwm-backlight";
> > +             pwms = <&pwm 0 50000 PWM_POLARITY_INVERTED>;
> > +             enable-gpios = <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
> > +     };
> > +
> > +     chosen {
> > +             stdout-path = "serial0:115200n8";
> > +     };
> > +
> > +     hdmi-connector {
> > +             compatible = "hdmi-connector";
> > +             type = "b";
> > +
> > +             port {
> > +                     hdmi_con_in: endpoint {
> > +                             remote-endpoint = <&hdmi_out_con>;
> > +                     };
> > +             };
> > +     };
> > +
> > +     panel: panel {
> > +             compatible = "os1n71j003", "panel-dpi";
> > +             backlight = <&backlight>;
> > +             power-supply = <&reg_vcc5v0>; /* Actually driven from IPSOUT */
> > +             enable-gpios = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
> > +             height-mm = <86>;
> > +             width-mm = <155>;
> > +             bits-per-color = <6>;
> > +
> > +             panel-timing {
> > +                     clock-frequency = <60000000>;
> > +                     hactive = <1024>;
> > +                     vactive = <600>;
> > +                     hfront-porch = <160>;
> > +                     hback-porch = <60>;
> > +                     hsync-len = <100>;
> > +                     vback-porch = <13>;
> > +                     vfront-porch = <10>;
> > +                     vsync-len = <10>;
> > +                     de-active = <1>;
> > +                     pixelclk-active = <0>;
> > +             };
>
> The clock frequency doesn't seem to match the rest of the timings
> though, it should be around 51MHz. Was this taken from the fex file too?

It was. I wonder if they somehow fixed up the timing in the driver.

ChenYu
