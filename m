Return-Path: <SRS0=wVrF=AS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29601C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 12:10:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF40F20739
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 12:10:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ug7a56Ls"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgGGMKC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jul 2020 08:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726745AbgGGMKC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jul 2020 08:10:02 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F0DC061755
        for <devicetree@vger.kernel.org>; Tue,  7 Jul 2020 05:10:01 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e8so15321761ljb.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2020 05:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d4yO/3pLM9BsUyXotU6p4FchEuPml4bBxIP31xMlNUE=;
        b=Ug7a56LsGs18Xiftifsfc93KZaR94thWjuwwyLjHbfvS0Z8LiInSer5WqkG2aqQVCR
         GF+lJLNl1geXJK4FU79frU4tvDW/a2Yv2o6kR0M39hWl83BqAg68OTwaOu75p7QvAoO3
         /jmN1UHjnY4puPXb3abWRIctC6D4VRmpfE/DwVhuQKdJQYBfJJdybsBchjpId8L0xWB2
         XrPcRis5mkVG9UFLEg9af3OlcwnEm/aA4NdQLK75YLW8gbaL/PP42bbLgb3nu9rsRSzb
         b7kJ/LbSyTFrtZRNaE0Z4/omJnwHQaIDmY10OcoC9mcZuZrRmtENzLmPhpqk3Wl8jqZh
         0RaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d4yO/3pLM9BsUyXotU6p4FchEuPml4bBxIP31xMlNUE=;
        b=D7aS0jhGHJQilH2D2vjuPVehu0tUfIXEI9zmhBQA5rAhd1mPJYLBjyU1n6WQ9ShMo7
         iIQiaugitmNWRKuxz4Zs7G8JbyOUk/aY6cKIVrlpVmnItXQu/F5+OwBAD/tmCQT2+95F
         W731FmRit9k4y9FoORo3wQGToACSD0Vb7VrwdxVEJc93yypwK/SART0hwXLHSTBMr/yt
         oWYUdpfYjcBrE2sgvhOhO8qyl+wkGusbRzoQJIXM6k5CyUFZJ7roPs6peBWzkGBxO1Ka
         28QImaC8ZZTnJlswprMW19JEFM7VFPYkQfZfUUiiYuQNpG4WZlxCyMOeTWZQUNOGguwr
         smhg==
X-Gm-Message-State: AOAM530co+TzOy84vo0csdnZmb1jr2yAlGwqwQE4F1CW/GneIHbF1zhU
        XwgNUBCAj+ChmJH9d6PxIOa79z9atCEdSVW1Ls7eog==
X-Google-Smtp-Source: ABdhPJxSYwm/4aA4geUAgdv0Rq5b6dBSqPUG+jf/PHgMcnzi2eX1zeINc756mywhyeduITPrxJDyNwXEeeKL/RxoN2k=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr24357891ljg.144.1594123800310;
 Tue, 07 Jul 2020 05:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200621193822.133683-1-nick.reitemeyer@web.de>
In-Reply-To: <20200621193822.133683-1-nick.reitemeyer@web.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 14:09:49 +0200
Message-ID: <CACRpkdbN+xy3yGogw+OPg-faef7k6NKCPaAUawB1o-_b04WW+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: defconfig: u8500: Enable CONFIG_KEYBOARD_TM2_TOUCHKEY
To:     Nick Reitemeyer <nick.reitemeyer@web.de>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Jun 21, 2020 at 9:40 PM Nick Reitemeyer <nick.reitemeyer@web.de> wrote:

> Required for touchkey support on samsung-golden.
>
> Signed-off-by: Nick Reitemeyer <nick.reitemeyer@web.de>

Patch applied.

Yours,
Linus Walleij
