Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46644C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 09:01:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F9052067C
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 09:01:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRE1cL8e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgHYJBl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 05:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgHYJBl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 05:01:41 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6582C061574
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2020 02:01:40 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id i10so6085913iow.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2020 02:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/JxcgaDbULCnptHgVEYW3WE8fpXfhJ/PrwruZOn3iWo=;
        b=sRE1cL8eQlPm5tP6WDbjsfJCehc4TmxikrDSl7AkQFUhAIkbIPPGPyB3WqUHgda5st
         u6bgChyX/ZZEhuLR9Xw5HItqY1KVEY14UeypxYD8gsg41vTwza4F8vMePBtS7HGRpFMm
         PNBsRuIzv6FS1kuj9HPZrzJviCmNGqXwHaA3IlyKBoWMB5sbDOh6FgcLIZyVMAfX57xG
         D2Tktomhd2pT2m5sPXwQeeaDv4AvY0gvElrcp40Un9sQCnHP0H8Iwe4NmBnx5Pzfp4+8
         Xz2mpK8d4QBTjqs5Sz5lQ4ev9L8LKkcRjRWBv6+JnE99irXTgtWF3IGAXkkBwQqqtb7b
         UCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/JxcgaDbULCnptHgVEYW3WE8fpXfhJ/PrwruZOn3iWo=;
        b=Dj4BrcZsz9wqBpOmDCGMc9+lCTmTYmQ293D/tkavv/0r8SHCY60k2ku7aIJmjqarWd
         3z47Hj2KMGyT+VrR6cOW0kdiQbBNrMVf23ADXerx7YsrSBWNpLAEPjoBEEPF6nyEp3x1
         aoZDEN3sxxw+OEBWcg26NS0WJc17Jzq2HFhRycaOuvLnbV3nK5iVRlTZ0/PFdeWeCBlK
         0bnQRfAczL2Zk6xsjbLBg3BkzTC98tvHiTfInnKBN8NT/iVJ6xe4UylRGDCSzOq+n5JR
         8YxPAhkFruStiP/9qJUY17bxYk9oeAVQye+0HHZ9sZtbB2voDBpsm4Q5OTD4rMypI8v/
         9rLA==
X-Gm-Message-State: AOAM532fsHcxnXgdY3w5vqz38Sw7Z45mS9V1yxEuS/nhCeqEi/i5njew
        2ZCRjIpI0XDrP8mwrZvCDQs/KNduz2TEy4R/auw=
X-Google-Smtp-Source: ABdhPJy/Lz3gTkcMcA7Fnu2cejGn4aBju3+/h6ns8W73b0vBxJEtaO56YrqX4053pfUaNVRsvej2hr6CGTxPKxRpz3w=
X-Received: by 2002:a6b:e419:: with SMTP id u25mr8281919iog.159.1598346100178;
 Tue, 25 Aug 2020 02:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200820121323.564-1-linux.amoon@gmail.com> <20200820121323.564-2-linux.amoon@gmail.com>
 <7hlfi9xgch.fsf@baylibre.com> <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
 <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com>
 <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com> <1j7dto3ylq.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j7dto3ylq.fsf@starbuckisacylon.baylibre.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Tue, 25 Aug 2020 14:31:29 +0530
Message-ID: <CANAwSgQ1Miu73hfdK+cgL3howpekn2xj_5qwGasQZwtQpSGj5Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Jerome

On Mon, 24 Aug 2020 at 20:00, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Mon 24 Aug 2020 at 15:50, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> > On 24/08/2020 15:41, Anand Moon wrote:
> >> hi All,
> >>
> >> On Fri, 21 Aug 2020 at 10:13, Anand Moon <linux.amoon@gmail.com> wrote:
> >>>
> >>> Hi Kevin,
> >>>
> >>> Thanks for your review comments.
> >>>
> >>> On Fri, 21 Aug 2020 at 01:03, Kevin Hilman <khilman@baylibre.com> wrote:
> >>>>
> >>>> Anand Moon <linux.amoon@gmail.com> writes:
> >>>>
> >>>>> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
> >>>>> support the RTC wakealarm feature for suspend and resume.
> >>>>> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
> >>>>> timer device to prevent it being assigned to /dev/rtc0
> >>>>> which disto userspace tools assume is a clock device.
> >>>>>
> >>>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
> >>>>> Cc: Kevin Hilman <khilman@baylibre.com>
> >>>>> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> >>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>>>> ---
> >>>>> Changes V3
> >>>>> --Drop the INI GPIOAO.BIT7 pinctrl.
> >>>>
> >>>> Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
> >>>> wakeup the system?  If so, this should be included as part of this
> >>>> patch.
> >>>>
> >>>> It probably still works because the bootloader configures this GPIO as
> >>>> input, but the kernel should not rely on the booloader for that, so
> >>>> please include as part of this patch.
> >>>>
> >>>
> >>> Ok I will figure out the correct pinctrl need for this settings.
> >>> looking into the Odroid N2 schematics.
> >>>
> >>
> >> I am trying to map the RTC INT pinctrl, ie RTC INT GPIOAO.BIT7.
> >
> >
> > Simply add:
> >
> > interrupt-parent = <&gpio_intc>;
> > interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
> >
> > to reflect the interrupt connection.

I have tried this setting, but it is not working.

[alarm@archl-on2e ~]$ dmesg| grep rtc
[    5.378002] meson-vrtc ff8000a8.rtc: registered as rtc1
[    5.942307] rtc-pcf8563 0-0051: pcf8563_write_block_data: err=-110
addr=0e, data=03
[    5.942316] rtc-pcf8563 0-0051: pcf8563_probe: write error
[    5.945983] rtc-pcf8563: probe of 0-0051 failed with error -5


> >
> > No need to setup pinctrl here since the GPIO input is always connected
> > to the gpio irq generator whatever pinctrl mode is set.
>
> It is actually better to setup pinctrl. Yes the irq controller can work
> whatever the pin setup but if an output function is active it can mess with
> what the irq controller gets.
>
> Think about applying/removing bias if necessary too.
>

Ok, I am trying to add a new pinctrl configuration for
TSIN_A_DIN0 //  TDMB_FS // TDMB_SLV_FS
But it's still not working at my end.

-Anand
