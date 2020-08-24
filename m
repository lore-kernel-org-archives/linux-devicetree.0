Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C85C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 13:57:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E9B4207CD
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 13:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0r8fn3r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgHXN5u (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 09:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgHXN5t (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Aug 2020 09:57:49 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E49C061573
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 06:57:49 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id m23so8110265iol.8
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 06:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dMeguMm96pDyAxCNEWFE6tm74xeCtyVll4TegHbBwcA=;
        b=C0r8fn3rtGIqTXG84StIGa8c91BO2qgo5z2OsnJIDt20bxO6byuQwT0b3H7LNVi4+C
         JYOeUYLo93Uh9C4ggps/W+xiOllb82xPFhAXp+ZDFhEgLNWn1Z2ywvLhlI5WKSM4nWG8
         LKZWhCU7GH2RsuRywILfNLk4V2vrVl0LpAv3pcGjmDd1sHscEiQNR5pSztBq0HRDd39v
         e/11XBOxxXcovZVWfgSd5OtLpqHywfeTktXPV6/JQH24XpppLdTXhogkHUYkEwFa6fN7
         duzHCqU3vJBWxQI2Ezm1rp+Pgv/WH4JnC6fNJcCZVDa2SqeuF+LqEYfPxNGAO1tXEYF5
         vfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dMeguMm96pDyAxCNEWFE6tm74xeCtyVll4TegHbBwcA=;
        b=Ycsk32/GdqpE1jD/3VA0pgTXS1uelTbUGg351I4Fs5bqV2uKHDWh5LjcLQ76lWWlKB
         S2UvJ6CutIbjcg9Z/f83cAESgncde7Jj0K4giwToonOL3FEIuKHleRRE4EFPKDenMqaX
         xcLYMrw48EH5tcvlZDjxiziNxOLLVNesrtxa+2zUALvk+U38bOlDcapFB2oQ2UqxILuG
         UOQSWP5E1SiNVg/1XBb5nGx46gBcD4ACXY/hvuuMbUQX5IyfRNlR0efjKN+5GMaPExgG
         mhEi94ugNOuaxm7mfQnVPqp5Ftofan9MowapOvNx9l/jRaobuHqxGrbYzkOozdRdvN2p
         4Xxg==
X-Gm-Message-State: AOAM531nDy+mak+SvftcNXZ2LZ5cPCeeKetsm1NfFdLm01nS5QTKM1A3
        M5d5Q+Kc5K3U1cSz0EWmoknyRIvPCg3sUgo+cOg=
X-Google-Smtp-Source: ABdhPJxv7Fzjo4etNqTn4asSi5M9XwBcfHBkl94QtZjSYX2e0e/pRxGvEnYwh72t4jk6oMt1yyR0pJZAEKXCjQqimjw=
X-Received: by 2002:a02:a90f:: with SMTP id n15mr5809057jam.120.1598277468498;
 Mon, 24 Aug 2020 06:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200820121323.564-1-linux.amoon@gmail.com> <20200820121323.564-2-linux.amoon@gmail.com>
 <7hlfi9xgch.fsf@baylibre.com> <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
 <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com> <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
In-Reply-To: <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Mon, 24 Aug 2020 19:27:37 +0530
Message-ID: <CANAwSgRm3yKgqrW50L0w4bzhrGF1GNe08oMgd4T59uK1D=fb=Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Neil,

On Mon, 24 Aug 2020 at 19:20, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 24/08/2020 15:41, Anand Moon wrote:
> > hi All,
> >
> > On Fri, 21 Aug 2020 at 10:13, Anand Moon <linux.amoon@gmail.com> wrote:
> >>
> >> Hi Kevin,
> >>
> >> Thanks for your review comments.
> >>
> >> On Fri, 21 Aug 2020 at 01:03, Kevin Hilman <khilman@baylibre.com> wrote:
> >>>
> >>> Anand Moon <linux.amoon@gmail.com> writes:
> >>>
> >>>> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
> >>>> support the RTC wakealarm feature for suspend and resume.
> >>>> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
> >>>> timer device to prevent it being assigned to /dev/rtc0
> >>>> which disto userspace tools assume is a clock device.
> >>>>
> >>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
> >>>> Cc: Kevin Hilman <khilman@baylibre.com>
> >>>> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> >>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>>> ---
> >>>> Changes V3
> >>>> --Drop the INI GPIOAO.BIT7 pinctrl.
> >>>
> >>> Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
> >>> wakeup the system?  If so, this should be included as part of this
> >>> patch.
> >>>
> >>> It probably still works because the bootloader configures this GPIO as
> >>> input, but the kernel should not rely on the booloader for that, so
> >>> please include as part of this patch.
> >>>
> >>
> >> Ok I will figure out the correct pinctrl need for this settings.
> >> looking into the Odroid N2 schematics.
> >>
> >
> > I am trying to map the RTC INT pinctrl, ie RTC INT GPIOAO.BIT7.
>
>
> Simply add:
>
> interrupt-parent = <&gpio_intc>;
> interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
>
> to reflect the interrupt connection.
>
> No need to setup pinctrl here since the GPIO input is always connected to the gpio irq generator whatever pinctrl mode is set.
>
> Neil
>

Thanks for this input.

Best Regards
-Anand Moon
