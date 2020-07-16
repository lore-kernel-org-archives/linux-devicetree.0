Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160BAC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 09:13:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E28732063A
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 09:12:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgTKv8iI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgGPJM7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 05:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbgGPJM6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 05:12:58 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3E2C061755
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 02:12:58 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id y2so5276011ioy.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 02:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s74d78nNzzAcB3E4FUhQIXK5reurauqlSlj+2GltzQM=;
        b=YgTKv8iIoVV3jDnayxciYMeKjoOo+eEWeK//VZvJ9AxohvPu/0TW6PB1AEF7d345Yp
         38fXLypUh/xg14+GXauMqEANBtGsjGoJVYQcM6Tyrp8oyTfd10ctS4YeR8NWr7/BH0//
         ZzNAEPhRnbhu6Vje3N9pXfagQlP9F2egvcpoUaQDy7EtmsTJFArBLsSIqYEoO+dj6Zxj
         ekoNX6pYp781pHtZiF4DCbIqIsf0AEyYjP6Ll0qOMazh7rDp3KHd+3Z81ujN7y9T47JH
         UvyoOrr/Q9msl/SF86/vDeTLRZWNzDf6g8OYCIFDS5mqC2SqQv7/oW4KARwmet4KTP8D
         x33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s74d78nNzzAcB3E4FUhQIXK5reurauqlSlj+2GltzQM=;
        b=cWjvHBMUhwBT8+h0v2UOWsKlBhY0WY1hhjG1EYbqnAXBdUYTw+tz3JZmFct+0kDq/2
         iTPyZaW04ysrr/Avq8m7D+xIHpQGMYpMJrZ/kg4rw9BDwUgYJmdjMFoIkNnYD8tlcEZP
         E2fKDXpgsbUidLSCm0B9ZzwQhBXevW0Mpt8QmPQuM0HwoQynBaU11szGErY5nNMe2f2P
         c27Tjphb/6i41LiOBH/Q/GEz2Luy7Yy65qZWJghF2xTR4J2OLoEIpYXpvADWbiFkK0/z
         AKDZ2II9WmBfF3MnbpUGiOvpsKOqn1hOd0SNWV1Aat0MiFQkh3JUUIf3FLlCus0lbLVv
         ffCw==
X-Gm-Message-State: AOAM532GBhowWLiH3zdPVQUNlJjwsiSq7b3nEo/BX+r9nYMdpHbwEheC
        K6TutUPnZ9cui7QiQP7OHQ/VIHOuPEDtrutgt7s=
X-Google-Smtp-Source: ABdhPJxVRr0StWt2vwHi7znILhAtGxQ8kecU9yRw9CdKjOzAPGbKtkPQLkR/aT1RulZCUh6cmbaYrwiRZqzvPJIa+MM=
X-Received: by 2002:a6b:b4d1:: with SMTP id d200mr3490972iof.128.1594890777717;
 Thu, 16 Jul 2020 02:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200715160209.652-1-linux.amoon@gmail.com> <20200715160209.652-2-linux.amoon@gmail.com>
 <1j1rlbg9uu.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j1rlbg9uu.fsf@starbuckisacylon.baylibre.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Thu, 16 Jul 2020 14:42:47 +0530
Message-ID: <CANAwSgQtjh7g1zDdU4q0HBJ-apXHW36pOMcQdLQs84U_KA=84A@mail.gmail.com>
Subject: Re: [PATCHv1 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Jerome,

Thanks for your review comments.

On Thu, 16 Jul 2020 at 13:38, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Wed 15 Jul 2020 at 18:02, Anand Moon <linux.amoon@gmail.com> wrote:
>
> > Enable RTC PCF8563 node on Odroid-N2 SBC, In order
> > to support the RTC wakealarm feature for suspend and resume.
> >
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > $ sudo hwclock -r && date
> > 2020-07-15 13:11:53.862508+00:00
> > Wed Jul 15 13:11:54 UTC 2020
> >
> > $ hwclock --show
> > 2020-07-15 13:17:30.903300+00:00
> >
> > But RTC wake up is not working at my end.
> > Any inputs are welcome.
> >
> > $ time rtcwake -s 30 -m mem
> > rtcwake: /dev/rtc0 not enabled for wakeup events
> >
> > real    0m0.002s
> > user    0m0.002s
> > sys     0m0.000s
> > ---
> >  .../boot/dts/amlogic/meson-g12b-odroid-n2.dts      | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > index 169ea283d4ee..a447cba4dd53 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > @@ -391,6 +391,20 @@ hdmi_tx_tmds_out: endpoint {
> >       };
> >  };
> >
> > +&i2c3 {
> > +     pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> > +     pinctrl-names = "default";
> > +     status = "okay";
> > +
> > +     rtc: rtc@51 {
> > +             reg = <0x51>;
> > +             compatible = "nxp,pcf8563";
> > +             #clock-cells = <0>;
> > +             clock-frequency = <32768>;
> > +             clock-output-names = "rtc_clkout";
> > +     };
>
> This rtc being on a connector, optional and not fitted by default,
> should it really be enabled for all odroid-n2 ?
>
> We tend not do that usually

My thought process was there will be an Internal primary interrupt pin
that handles
RTC wakeup and is connected to the CPU and IO peripherals..

-Anand
