Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FEBC433E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:14:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F8142070E
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:14:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3uytgrv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgGPIOd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 04:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGPIOc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 04:14:32 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80551C061755
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 01:14:32 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id t27so4287291ill.9
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 01:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sb202bnMpR2L+FueL+OZRlSFJ9ClUCwQhcovgXlWEIE=;
        b=c3uytgrv60iea+g2Iy4az5CXHfYXhnKOMxcitOEDiE2mxPDdoGj5tlEocEAT8JPnFp
         8vZ6+ZpayANkGzGHcM3CNJePrfcN/8/KI+ycb2XEe3Cs6dgZ3SA51aQmNC/ySOziE4IG
         onCp5UAww7qXdyLat6PO1ctpxGJHAup9gfm7/jfVFwAUqDVirCUvs0bIcV1xVU9XBH6U
         nckI25Qa7Vnr0+3cr1+0GWO6Ks8bJB9KvmBMfFG047nApTky13RdvtGnKnqXNLEqyywu
         8fC4JgWBm4Krw7uNr+aKsbbDvWxTm5t9ZUWdQ2Cg2Bhw1z46swTYStUmobxQbZnva3+l
         sg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sb202bnMpR2L+FueL+OZRlSFJ9ClUCwQhcovgXlWEIE=;
        b=CvjUBBmlwhyExEkwRh+oooC7P7VLeNkbklyyvQ/Jov00tZPhnrpKwPj/v+1e0l3zEJ
         P0HL5MaewMWyiMCheidfj76jgmA/NNJYPbG3W20ayU4wdRKe9b7AyFOxd4vLReoLcu3l
         MFGjq7p49RH3PGvANGnvQXtitKOLtYHs/tJZRqP8/LOabanjU6zx1inOtMBf8CJbJ5e2
         AHd+W2fJMLx6RFWag7yxNMewh8W9JAt1EBrClLj9eyKh+GqrClBibSYMzaMrEcHkZkQL
         sLRgpATIJAChwDkCTF5gXlfPMIC2OoO7dV7sHqbvdH9eZW/8baamSyuU8fxpt7CECiFj
         sqPQ==
X-Gm-Message-State: AOAM530FxG1Qkms2/IJr8AKgDdowZIeDQwZLpFEvyfprtP9XIhRv7kJ+
        gkJmluYH21FPcATiIQHyQ/y4jNtCz/imI7V+7HM=
X-Google-Smtp-Source: ABdhPJx70BD/CO0Vg0/CK048ltr5UHKj/YXBwSS65IPYtXx9dkPIK4ydIyOWjTTlEOG5K0KawrCFDvV9iFR6l8mAYf8=
X-Received: by 2002:a92:4810:: with SMTP id v16mr3470348ila.75.1594887271665;
 Thu, 16 Jul 2020 01:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200715160209.652-1-linux.amoon@gmail.com> <455f5dcc-3be3-45cd-4947-50f261a502a4@baylibre.com>
In-Reply-To: <455f5dcc-3be3-45cd-4947-50f261a502a4@baylibre.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Thu, 16 Jul 2020 13:44:21 +0530
Message-ID: <CANAwSgRXLUqqSqnguV2pgPdumMi8i6T9rh6hNQ0Y03mv_j7V-g@mail.gmail.com>
Subject: Re: [PATCHv1 0/3] Enable RTC on Odroid N2
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Neil,

Thanks for your review comments.

On Thu, 16 Jul 2020 at 12:35, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Anand,
>
> Only the vrtc is able to wakeup the device from suspend,
> the external RTC is not capable.
>
> Neil

Now I have two RTC driver registered

$ dmesg | grep rtc
[    4.737315] rtc-pcf8563 0-0051: registered as rtc0
[    4.738763] rtc-pcf8563 0-0051: setting system clock to
2020-07-16T08:00:46 UTC (1594886446)
[    4.790206] meson-vrtc ff8000a8.rtc: registered as rtc1

And there are two nodes
# ls /dev/rtc*
/dev/rtc  /dev/rtc0  /dev/rtc1

So it seames an issue that /dev/rtc0 is not able to handle wakeup events.
How can we resolve this issue?

# time rtcwake -s 30 -m mem
rtcwake: /dev/rtc0 not enabled for wakeup events

real    0m0.002s
user    0m0.001s
sys     0m0.002s

-Anand
