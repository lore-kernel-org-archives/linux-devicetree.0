Return-Path: <SRS0=/Yzg=6L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C310C54FD0
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 06:59:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69F0A2080C
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 06:59:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R/yZNbJ/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgD0G7R (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Apr 2020 02:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbgD0G7P (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Apr 2020 02:59:15 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61B7C061A10
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2020 23:59:14 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id s5so16269978uad.4
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2020 23:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p75ZI/P1vAKdvQGL/dkDYNcJX48p538uaKviA/7sw78=;
        b=R/yZNbJ/FXJTeWHoBM/VGrSujsjvdbo2k6YfYwGCyStA4w4Vu+3r6pSliy3CmjHCY9
         SfTABC9U26Iuir75W2uhDMbjYrKuCe5gUJz+hjZT/9SPfNH7Wq+s6evzjQF/O4AlxycF
         7sWy9vdMYVW9+yX3/Mj1hq8Cq3GpFlBCf+O/f2/OrfpFFZM2dIPGtKvQdDFpzz+h3cRb
         YxUtXuByeXDj0ep4IIuVfFOTzrd8fJuc5IhLadjFSz8WuRsGOpPAvfFz5aPQ12iGPdpR
         +6r3h9+BxdYKM75iYz3wwyH0hWBh//y4y7f8slVNxEbN4lNLXnntUxChGWyVjmNjp1tw
         oeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p75ZI/P1vAKdvQGL/dkDYNcJX48p538uaKviA/7sw78=;
        b=o4Cvk5fUywmYjUb+Edi4lkeUEsrdNMALhNICyvSbC5+KxoCWUq7dPo9Y9kG2eUlEGd
         Fi/WceiBuaYNa/TLj3TutXnQ0wiYFc5dNRRhW1QPxXT6NncJ74ar6gordCuGeLoOJLCp
         g7IzOQIJ3ryqiJzs4mdaPpDf4ijwyJ1AONwXH3GnKdUYYcXucNhJY21x4NQk6ysK0CiM
         9dYPLdhuTnRTzaCdYHJpQte+8L3uEoN3rTfbUfcDPQen5JenM6O1uS687gZhQwt7jNH3
         boXAO33hdg7xtYwkaUj2ZxZN+W2l9rl9fhHapbvDxDxNDQ8qtUDSxZ4NarO4sjDwWWq9
         1UJw==
X-Gm-Message-State: AGi0PuZlfvwlzwyxiTSWv1dHvijFScKI2GABzj3tozYJkxkdIFVlefWK
        +SqDQgpy5fYyPL9H7vvSp6YwpHLUpLKT3TrL/ga2sQ==
X-Google-Smtp-Source: APiQypLgdu94xf46n59WAXNWbtQ/etKr47I9IXWtRxhdXwH7gOWdeXqlB5oxfaZVEhk0xe+ABAYpaedqjH2ouRHKL5s=
X-Received: by 2002:a67:11c4:: with SMTP id 187mr15068680vsr.34.1587970753925;
 Sun, 26 Apr 2020 23:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200328003249.1248978-1-martin.blumenstingl@googlemail.com> <CAFBinCDCv-zNf1FX+8FHMxcNdJ_69yog+O_=QPz3Fzryg3ynAw@mail.gmail.com>
In-Reply-To: <CAFBinCDCv-zNf1FX+8FHMxcNdJ_69yog+O_=QPz3Fzryg3ynAw@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 27 Apr 2020 08:58:37 +0200
Message-ID: <CAPDyKFqNgS4JGRqMDeMgguAHd11W_OpzxyKDjaWoTUXUdc6fwg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Amlogic 32-bit Meson SoC SDHC MMC controller driver
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lnykww@gmail.com, yinxin_1989@aliyun.com,
        Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 25 Apr 2020 at 22:27, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Ulf,
>
> On Sat, Mar 28, 2020 at 1:33 AM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> [...]
> > Martin Blumenstingl (3):
> >   dt-bindings: mmc: Document the Amlogic Meson SDHC MMC host controller
> >   clk: meson: add a driver for the Meson8/8b/8m2 SDHC clock controller
> >   mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson SDHC host
> I have Rob's reviewed-by for the dt-bindings patch and three
> tested-by's for the MMC driver in patch #3 (which means that patch #2
> was implicitly tested as well)
> I tried to answer all your previous questions where possible, but for
> some of your questions I simply don't have an answer.
>
> is there anything from your side which is holding this driver back
> from being merged?

Apologize for the delay. I will have a look asap.

>
> +Cc Jerome, because he is the maintainer of the Amlogic clock
> controller drivers - where this series adds another one, so we need to
> coordinate where patches go.

It seems like you may need to resend the series so the clock
maintainers (Stephen and Jerome) can get a look as well.

Perhaps it's better if the series is queued together - and can help to
do that, but then I need acks from Stephen/Jerome for the clock patch.

Kind regards
Uffe
