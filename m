Return-Path: <SRS0=mz9M=BP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90160C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Aug 2020 21:04:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65B8E22CB3
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Aug 2020 21:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aPqJee4+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgHEVEw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 5 Aug 2020 17:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgHEVEu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 5 Aug 2020 17:04:50 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB04BC061575
        for <devicetree@vger.kernel.org>; Wed,  5 Aug 2020 14:04:49 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id o18so47908561eje.7
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2020 14:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V2PZXILdefiTwwzfO5OUUQBgzK17xy7UQ4vY/f0A1uM=;
        b=aPqJee4+/II1pDeHm6YJT9N8szJtyfH8/u0a/mb/rUh0XKwrO9/lI6mAKg/YUjZsap
         p0B7nL/zuMyT3EsRGWbvq29/0Lc9irQLp5boKwUO0dgr7wICe4bQ/VVNo2zfxFQFtKUF
         aTAuAP1cEHDioLUgDXQmFNnV10RJlUC2CPrZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V2PZXILdefiTwwzfO5OUUQBgzK17xy7UQ4vY/f0A1uM=;
        b=phSppNi0Yd26sajUA55MQ3f4qICJMuaHLP9ivtslOqPE6L83gyrWpBAhwuHkjhoalF
         qQoKknQiQkVF1VUhLO4M7Z6fDNGVlFbkKjVoHTqHeC8BBkxFeKTsJSjeiV0b1+Jn6RdI
         gXcuPXAqiNleyfcXwCDkUktQpJlgyRNDZHl1mPkMiNL7/suqJhQCh5oTqmn4lo2FVW8c
         jg+Luhy67ueuP20TcvgEYUCqdNRfrJvuDY4r2KtNEANCXM87x/A43Bdxl+ysgy/6bX46
         gkzM/NblBC9SPE+MBOFxC8kn2+NUOY8gU8eBy1s2wsX5k0UIJQqgdggxwzvBP7Ip7mxk
         O6Tw==
X-Gm-Message-State: AOAM531nLPaa8cu9bTEfUlrSeZQwki2kybWqfXuqObFkpZ+JjJRxwm4N
        e44KpkCdslEj4AVTMg6JdhrJ5eH6+bE=
X-Google-Smtp-Source: ABdhPJwfDPpUmk5QHDxBeCFs01Vh1bM4gWbzhQdFzhmStmGK2r+knaSoM3xueIN1GDTeLCecC612BQ==
X-Received: by 2002:a17:906:c1d8:: with SMTP id bw24mr1171144ejb.91.1596661488231;
        Wed, 05 Aug 2020 14:04:48 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id m20sm2266311ejk.90.2020.08.05.14.04.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 14:04:47 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id df16so17221676edb.9
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2020 14:04:46 -0700 (PDT)
X-Received: by 2002:a05:6402:28f:: with SMTP id l15mr1118783edv.233.1596661486208;
 Wed, 05 Aug 2020 14:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200721042522.2403410-1-amstan@chromium.org>
In-Reply-To: <20200721042522.2403410-1-amstan@chromium.org>
From:   Alexandru M Stan <amstan@chromium.org>
Date:   Wed, 5 Aug 2020 14:04:09 -0700
X-Gmail-Original-Message-ID: <CAHNYxRzwQ2jx99M0oyNv8CDE4h051jcdAdYFjRd8mhNjB19FgA@mail.gmail.com>
Message-ID: <CAHNYxRzwQ2jx99M0oyNv8CDE4h051jcdAdYFjRd8mhNjB19FgA@mail.gmail.com>
Subject: Re: [PATCH 0/3] PWM backlight interpolation adjustments
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-pwm@vger.kernel.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jul 20, 2020 at 9:27 PM Alexandru Stan <amstan@chromium.org> wrote:
>
> I was trying to adjust the brightness for a new chromebook:
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2291209
> Like a lot of panels, the low end needs to be cropped,
> and now that we have the interpolation stuff I wanted to make use of it
> and bake in even the curve.
>
> I found the behavior a little unintuitive and non-linear. See patch 1
> for a suggested fix for this.
>
> Unfortunatelly a few veyron dts files were relying on this
> (perhaps weird) behavior. Those devices also want a minimum brightness.
> The issue is that they also want the 0% point for turning off the
> display.
> https://github.com/torvalds/linux/commit/6233269bce47bd450196a671ab28eb1ec5eb88d9#diff-e401ae20091bbfb311a062c464f4f47fL23
>
> So the idea here is to change those dts files to only say <3 255> (patch
> 3), and add in a virtual 0% point at the bottom of the scale (patch 2).
>
> We have to do this conditionally because it seems some devices like to
> have the scale inverted:
>   % git grep "brightness-levels\s*=\s*<\s*[1-9]"|cat
>   arch/arm/boot/dts/tegra124-apalis-eval.dts:             brightness-levels = <255 231 223 207 191 159 127 0>;
>
>
> Alexandru Stan (3):
>   backlight: pwm_bl: Fix interpolation
>   backlight: pwm_bl: Artificially add 0% during interpolation
>   ARM: dts: rockchip: Remove 0 point in backlight
>
>  arch/arm/boot/dts/rk3288-veyron-jaq.dts    |  2 +-
>  arch/arm/boot/dts/rk3288-veyron-minnie.dts |  2 +-
>  arch/arm/boot/dts/rk3288-veyron-tiger.dts  |  2 +-
>  drivers/video/backlight/pwm_bl.c           | 78 +++++++++++-----------
>  4 files changed, 42 insertions(+), 42 deletions(-)
>
> --
> 2.27.0
>

Hello,

Friendly ping.
Let me know if you would like me to make any changes to my patches.

Thanks,
Alexandru M Stan
