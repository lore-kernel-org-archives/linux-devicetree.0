Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECEEC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 08:16:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 942FC206B5
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 08:16:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBojPTd7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgHRIQA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 04:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbgHRIP7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 04:15:59 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B223C061342
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 01:15:59 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id z6so20335903iow.6
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 01:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mVTJ27D4R3H6C6f0jdBIw50yJtblFxQuDJ6LjKOMP5s=;
        b=qBojPTd7Q+0e6B8OJziPOJ9nn7uED4XQgwDpQNf996Pu0sWnuI7BWPbmuzmjvketsq
         Nz46NgmdJ9KoR00KJGuDfmAfZGZtXB76eV1PVh1pVjJwFz09zLl4ZLiOxv5hK2d384du
         1B3BD/3QQo24iogPuiSkD5HKTNsfefDaY+WlOZ34sSGaRkQh5lkE5QGzBdqSdhfTOqkF
         6p1AUoRhtjl5E6apEJXb7AVYrnf3G7101Myby6rfj/hsYitV3mRo68qGXC5/HBEJO/Ry
         /O4QVYQ2E9GaPz1po2qEkOkLnmncFpR7A0zxLVmj5Ic5SEUGnAYynHN7b0cB2UAsgjqB
         BV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mVTJ27D4R3H6C6f0jdBIw50yJtblFxQuDJ6LjKOMP5s=;
        b=FqNysAoV2oIYjDcOEkrugSwK0UkY1e9gB657m4g0hUsqLR44JXoSEvJUInIk9CAmQ3
         U9P7CFKuMlAraCXH1wHitS+VZH0FPrnDGY1cJ3BsPostoUozk505SwZ4a0nznZZAxhTo
         dIoiIBRCzQV+SUHZcOufdFYjRzHi9zABn9NpyZkMtS/RcQENqLPG3WzN6wSmUHikQEJp
         uTgw3neir4JEwuXT+OFBVk3tSDd1Uf+UGLn4PPRktqTnTzFT9v3YUB1hFUGv5IwCpzB9
         cwU8+EsmBojUUXfCLWOcLt6Y2Rlhna5HD/YLCbCad6w0gmhE1mqdh1kRnNdm9ifjkSLn
         Hw7w==
X-Gm-Message-State: AOAM533ETCePaNzWE2ocuRw+un9fiXjpwTaRuygW7UCpqbLBBgH9nJW6
        m9M1c/f375QroFoSOjSoFLyFODiQal4BMp9XKi4=
X-Google-Smtp-Source: ABdhPJwoaSxUUmkYr7BSfO/yhNs7u20OUnmAeKOoAXMZAbbSOtGvZT9QCMhCfI4jY1MhXOJVcmRHUZ20H+AirlWZWg4=
X-Received: by 2002:a6b:f801:: with SMTP id o1mr15423627ioh.43.1597738558213;
 Tue, 18 Aug 2020 01:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200817102122.434-1-linux.amoon@gmail.com> <20200817102122.434-3-linux.amoon@gmail.com>
 <1jzh6se6te.fsf@starbuckisacylon.baylibre.com> <6B583170-3479-4DFB-B81A-431B5982C8D6@gmail.com>
In-Reply-To: <6B583170-3479-4DFB-B81A-431B5982C8D6@gmail.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Tue, 18 Aug 2020 13:45:48 +0530
Message-ID: <CANAwSgS+MwbQHT=o3Bs7h_D7Gn3F2j4zDeT7dCnMwA2_YD4eDQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: meson-g12b-odroid-n2: Disable virtual
 RTC driver
To:     Christian Hewitt <christianshewitt@gmail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Christian and Jerome,

Thanks for the review comments..

On Tue, 18 Aug 2020 at 13:21, Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
>
>
> > On 18 Aug 2020, at 11:45 am, Jerome Brunet <jbrunet@baylibre.com> wrote:
> >
> >
> > On Mon 17 Aug 2020 at 12:21, Anand Moon <linux.amoon@gmail.com> wrote:
> >
> >> Disable virtual RTC node on Odroid N2,
> >> since RTC PCF8563 support rtc wakeup.
> >>
> >> [    7.171149] meson-vrtc ff8000a8.rtc: registered as rtc0
> >> [    7.182875] meson-vrtc ff8000a8.rtc: setting system clock to 1970-01-01T00:00:07 UTC (7)
> >>
> >
> > Maybe I'm missing something but why should disable this ?
> > Can't the 2 RTCs co-exist ?
>
> aliases {
>         serial0 = &uart_AO;
>         ethernet0 = &ethmac;
>         rtc1 = &vrtc;
> };
>
> ^ adding this alias moves vrtc to /dev/rtc1 allowing the on-board rtc to
> assume /dev/rtc0 which scripts/users and HOWTO guides assume to be a
> real clock device. Tested and working fine with my own experiments with
> enabling rtc on a bunch of G12B/SM1 boards.
>
> Christian

I will drop this patch and add the alias in the next version.

-Anand
