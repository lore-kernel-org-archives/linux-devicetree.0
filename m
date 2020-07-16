Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0A9C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 15:42:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC03B2076D
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 15:42:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nkv6LkY6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728962AbgGPPmc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 11:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728714AbgGPPmc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 11:42:32 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B04EC061755
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 08:42:32 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id t18so5447390ilh.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b0u1Ktk7Razombpw+VKtZ2EiV3sdrsnL2SrGFQwq5gc=;
        b=Nkv6LkY6ZQVCWJ5riUqbyS5rW6CG4x3CXZ6qX031txwjrwFCaXxxqwy65dxKWglT0B
         gGRCqaoQfXguq3A74GeIz3teSOCSxxTsgNOGfDkt5AVvZM1rJkeqmIrCyLAjz7aCyKIt
         wVvlAeSW3RyewbKFLmDZXpVnFUKyXPMn4bWEsKW9EgjRSu5SjxLh4cayOz4Jd8DdJxyG
         ykrx4nEg4bZyRxuKpGYBu5aWsustzUDbNYIvfFu5BITLbEfJoW3aRYYVDS2GBuQNWXd6
         7DYyfQZJs3hNZaoW6FpX57kb/UgEOyA2cWk82AMiztgUuHQBflr44JOSCBqPCwNoYjRv
         opxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b0u1Ktk7Razombpw+VKtZ2EiV3sdrsnL2SrGFQwq5gc=;
        b=RxD4gu3UsdE5cFPU989UMIXCKg6iGQCxOeSipR/Z3LzFfcXbMFkKAkAhsY72WzR7L9
         GviyOu3BYRgIR8O0MWwDp52KTpjmIDdvixRkCBGva6N0UHlGGRe/OcNPQ26EVTbKCSR7
         RkfRHuGYEnppuMeKxLdtyjxazMuG+fq7IdRwjyoln0Qu2jJO1iBlHONHTa8UVKX2n/Lr
         zLsNRiQc68L9SgYSIBDM+niBrQOZoh2WkSl1MGC2Vi8PwQFN7BSqHejogyV7cLcnpbHO
         bNKZdapaFcq9GRxEe8gE8G9PTegmzm64QGFUsw+MeH3zWQTQDGmgVWmNBY7fhUpVh7gK
         Clow==
X-Gm-Message-State: AOAM530FDfVGrSmkPn/zxN9/M2iOI8aoqsF4w7QGj88I5T0y7aWQgjLD
        ehVDdjYCacbkMuu1pY+8vb2tpN4947g/PMgbBv4=
X-Google-Smtp-Source: ABdhPJyB2P2sQk/4pFFdFQV8RmEmUqp4OZPnagXYnUH/VUn4XenhJM/80v/X3TtMOjrgRZ7a/oozy0sIRSh1x07seeI=
X-Received: by 2002:a92:dc8c:: with SMTP id c12mr5187959iln.243.1594914151188;
 Thu, 16 Jul 2020 08:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200715160209.652-1-linux.amoon@gmail.com> <455f5dcc-3be3-45cd-4947-50f261a502a4@baylibre.com>
 <CANAwSgRXLUqqSqnguV2pgPdumMi8i6T9rh6hNQ0Y03mv_j7V-g@mail.gmail.com>
 <91fbbe36-d839-d864-7666-5483cc643a5e@baylibre.com> <a7e9b154-ceb2-3915-454a-a53c9b65622e@baylibre.com>
In-Reply-To: <a7e9b154-ceb2-3915-454a-a53c9b65622e@baylibre.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Thu, 16 Jul 2020 21:12:20 +0530
Message-ID: <CANAwSgS8FfZ=_GfZBRYLOozzp5dcsuhiiHuwM_dOxdAwaSxWEA@mail.gmail.com>
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

hi Neil,

On Thu, 16 Jul 2020 at 14:05, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 16/07/2020 10:20, Neil Armstrong wrote:
> > Hi,
> >
> > On 16/07/2020 10:14, Anand Moon wrote:
> >> Hi Neil,
> >>
> >> Thanks for your review comments.
> >>
> >> On Thu, 16 Jul 2020 at 12:35, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>>
> >>> Hi Anand,
> >>>
> >>> Only the vrtc is able to wakeup the device from suspend,
> >>> the external RTC is not capable.
> >>>
> >>> Neil
> >>
> >> Now I have two RTC driver registered
> >>
> >> $ dmesg | grep rtc
> >> [    4.737315] rtc-pcf8563 0-0051: registered as rtc0
> >> [    4.738763] rtc-pcf8563 0-0051: setting system clock to
> >> 2020-07-16T08:00:46 UTC (1594886446)
> >> [    4.790206] meson-vrtc ff8000a8.rtc: registered as rtc1
> >>
> >> And there are two nodes
> >> # ls /dev/rtc*
> >> /dev/rtc  /dev/rtc0  /dev/rtc1
> >>
> >> So it seames an issue that /dev/rtc0 is not able to handle wakeup events.
> >> How can we resolve this issue?
> >>
> >> # time rtcwake -s 30 -m mem
> >> rtcwake: /dev/rtc0 not enabled for wakeup events
> >
> > rtcwake -d /dev/rtc1 -s 30 -m mem
> >
> > As Christian reported off-list, it may be necessary to keep the vrtc as rtc0,
> > so you should add aliases in the odroid-n2 DT to have vrtc as rtc0 and the on-board
> > rtc as rtc1, but it may break the hwclock tools, so the reverse may be better
> > but you'll need to specify rtc1 to rtcwake.
>
> While looking closer to the Odroid-N2 schematics and U-Boot/SCP Firmware, the external on-board
> RTC can wake the device with the GPIO_AO 7, and wakeup is enabled in:
> https://github.com/hardkernel/u-boot/blob/odroidn2-v2015.01/board/hardkernel/odroidn2/firmware/scp_task/pwr_ctrl.c#L143
>
> So, something must be missing.
>
Ok I have missed this setting.
But I could not find any more information on this configuration
in S922X_Public_Datasheet_V0.2-Hardkernel,

But HK uses the same set up as we do.
https://github.com/hardkernel/linux/blob/odroidn2-4.9.y/arch/arm64/boot/dts/amlogic/mesong12_odroid_common.dtsi#L322-L333
I could not gather much input from this configration.

Does VIM3 support VRTC or do they prefer rtc wakeup via RTC ?

-Anand
