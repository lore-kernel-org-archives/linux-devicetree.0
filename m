Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE556C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 13:42:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCCF7204FD
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 13:42:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ok4MKUfm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgHXNmP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 09:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbgHXNmF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Aug 2020 09:42:05 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DBC1C061574
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 06:42:05 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id v2so7259296ilq.4
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rd33nPgNOMekiT/6KHR+eXtOiA25euKyz0AHeNDMQG0=;
        b=ok4MKUfmmgU1Zlvif0VPW0enBSZla+x1W0X09IaHfx5AdapmgKkAMSs7nPEinj4JSW
         I/qgdrUehdjcN2lLiKyIdxNVqGJwlSpG30n8ssqYnK4MtvHiVI9mAh5H+TllqvKVxDbT
         Lowk1gr7EeqgI4HIon8bmVF4b6FaW0kab3r6wvDbY9urxrzEcdr6A0a2cR8dyK1h/+rk
         zfwhfqdk2ikL7RgbN2pKiJ3Vq/C6iCwGZCd1l/v/B3cfehfLl/a5O1i9VdTHzXOTPcCi
         ywLfhLeHqB8cgzSZ/F21KcrLQUT3KS1e6IT9Xy+2/YvZluAyGpAZFAsTSL8rIHQmH7Gs
         MVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rd33nPgNOMekiT/6KHR+eXtOiA25euKyz0AHeNDMQG0=;
        b=P5ODrIvjsLya+FBrI61PwuNWEOyM8/j7c5kgnu2uzzgAjW2mz+IabAqVzPhR1ABA4H
         8FSspd3xnQiq8Ar55HfYKZxYiWzpAGpQjBQMOiP0BKUcwK4mCQQy8HsvvJofZb0As4/6
         gG7Zqdj0ygpbuwryfRGpaFLBE54TqkFJSXFVfJRDt2hBpa673yb6HJVkDdYcBx9lmH2M
         Jh3ZNyMXVrZG4fqpfi10H7PgKPqtR09/8G33J+rK0QL72YXpT2Le8m5mAsghFxEVsyWy
         pfejXZwSdbJf3A+Pl1dRfV+mX1VUjbKbEe/kDMZBzZChJDIdCneoOdM4lzqMj+nALbu9
         FpBA==
X-Gm-Message-State: AOAM5329GXZEg9xUX7Hg/5rfLqi3BshXfBYl7L9IVYHvTSEKvtNt2Yw3
        1alhuBb8g387NYdruousQDU9uJaYqFWbXjJjPFU=
X-Google-Smtp-Source: ABdhPJzp+QdqVtQXOIj0u5zSgHku4BKue60oem5BL8xR3PZ8eYMNJfIrz8N/DYp1H6wCX4Fd4/JIAHwgh+TUwps1adc=
X-Received: by 2002:a92:bb8d:: with SMTP id x13mr4901180ilk.243.1598276524235;
 Mon, 24 Aug 2020 06:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200820121323.564-1-linux.amoon@gmail.com> <20200820121323.564-2-linux.amoon@gmail.com>
 <7hlfi9xgch.fsf@baylibre.com> <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
In-Reply-To: <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Mon, 24 Aug 2020 19:11:52 +0530
Message-ID: <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

hi All,

On Fri, 21 Aug 2020 at 10:13, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Kevin,
>
> Thanks for your review comments.
>
> On Fri, 21 Aug 2020 at 01:03, Kevin Hilman <khilman@baylibre.com> wrote:
> >
> > Anand Moon <linux.amoon@gmail.com> writes:
> >
> > > Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
> > > support the RTC wakealarm feature for suspend and resume.
> > > Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
> > > timer device to prevent it being assigned to /dev/rtc0
> > > which disto userspace tools assume is a clock device.
> > >
> > > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > > Cc: Kevin Hilman <khilman@baylibre.com>
> > > Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > > Changes V3
> > > --Drop the INI GPIOAO.BIT7 pinctrl.
> >
> > Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
> > wakeup the system?  If so, this should be included as part of this
> > patch.
> >
> > It probably still works because the bootloader configures this GPIO as
> > input, but the kernel should not rely on the booloader for that, so
> > please include as part of this patch.
> >
>
> Ok I will figure out the correct pinctrl need for this settings.
> looking into the Odroid N2 schematics.
>

I am trying to map the RTC INT pinctrl, ie RTC INT GPIOAO.BIT7.

So from the schematics it is seen below.
RTC INT  GPIOAO_7 (AV46)   GPIOAO_7 (JTAG_A_TMS // TSIN_A_DIN0 //
TDMB_FS // TDMB_SLV_FS)

But the S922X datasheet this pin *AV46* shows to following settings,
AN16    DVSS    AV46      GPIOAO_7    BD19    BOOT_11

From the schematics it BOOT_11 is linked to
              BOOT_11 (NAND_CE0)      BD19

So can I conclude that BOOT_11 (nand_ce0_pins) pin linked to the RTC INT setting
Please can somebody help me with correct pinctrl settings.

Best Regards
-Anand Moon
