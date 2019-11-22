Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0921C432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 13:29:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A86022073F
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 13:29:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IDL7ob5n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbfKVN3x (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 Nov 2019 08:29:53 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39223 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfKVN3w (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 Nov 2019 08:29:52 -0500
Received: by mail-lj1-f195.google.com with SMTP id p18so7376961ljc.6
        for <devicetree@vger.kernel.org>; Fri, 22 Nov 2019 05:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W+Zc7Z97fvvNYHZnL1c1JIxGRQj+2WpocWRa+cXonDE=;
        b=IDL7ob5nX7sNC8DySqXW3eLlpoXTzpVE6NPwX6QSGY0Zw60mX9pYqxDVlaPXAyKEwG
         69iCabqzuza5RvNull7xO5wQV9fWZAEGL36eSd+mtLC8C9dWRl9E5venP912P4VCzJCT
         17gi9A7QnWGqmTGjAjqzCjsUqFJwhvZCfT7Fx8N2Zw3wSgzefAJ4+CLMsCdwGPDjgEPf
         jtsXQgeayqTAzGIl15ujsKAqD3gPDjevVAc7YnpRWuXnZm0SpMMsp316u9g1ox9yAkFM
         079HvOm5xazduN5QVrea3FZLjpznvlXJfqxe6xH8OsCJCoC7JbyCmAr5kSG+UePwvzsp
         96pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W+Zc7Z97fvvNYHZnL1c1JIxGRQj+2WpocWRa+cXonDE=;
        b=Iwyu39qu7Df+mVmYVue8Dx8iH1uEofXJKfSdyF+1KfoorQ8H5+yVR9jIEL4nQwRGem
         lCKHl9yrJZ5p8CNjcuOSpsHE57ridydMtchrTTtSz5iGasC2CbFGLxVF6v+WjUqzSXpQ
         QeYKkq/X1MRsgqJaPb9B6WeVWTTbUqfkxORc7bMQvAGcvRQeGLQzXGynTxQiQGGseW/b
         L2W5xBh5zsPiL95ZIQGSSn0beZtbR5CUWavF8X7T+peb2pAdwvs9GX3KQILiFgLtspxp
         jl+0oZB/rA2cqdfhNxDtG/EnDO3XMsE5NTD5qC+RK1wZ7kKrv8N4CXcpa6lsG1E5AfAZ
         9opg==
X-Gm-Message-State: APjAAAUFLXPIVRWCPNr6y/X3rRnqG3VkZXiG3wlcRCnEtMI9ZjttMmcV
        ERExsrDWoQl7OsPpz95X0ZfsQb4iJBinDkgRgqJwaQ==
X-Google-Smtp-Source: APXvYqwmSSOtVmBtX/HzWWq55yxz03Q3CaAmSGcHqiRIokiCHZLjK6quI6vEVqsvu5R0BpiQvgrlF6raTPg3lPC0DXg=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr12014078ljb.42.1574429390771;
 Fri, 22 Nov 2019 05:29:50 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdYhLoGdGQt_jzj5aFa-EY_kMimoVShi7QFLG3sZbC436w@mail.gmail.com>
 <563f2fdf0c32103d95a53fc1e7fd84c0@walle.cc>
In-Reply-To: <563f2fdf0c32103d95a53fc1e7fd84c0@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 14:29:39 +0100
Message-ID: <CACRpkdZWP0CSDGPjkUOTuEkDSvBpoW0tN3ia+B74s1dfFGNinw@mail.gmail.com>
Subject: Re: [PATCH v1] gpio : mpc8xxx : ls1088a/ls1028a edge detection mode
 bug fixs.
To:     Michael Walle <michael@walle.cc>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Hui Song <hui.song_1@nxp.com>,
        Leo Li <leoyang.li@nxp.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 22, 2019 at 2:08 PM Michael Walle <michael@walle.cc> wrote:

> >> From: Song Hui <hui.song_1@nxp.com>
> >>
> >> On these boards, the irq_set_type must point one valid function
> >> pointer
> >> that can correctly set both edge and falling edge.
> >>
> >> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> >
> > Patch applied!
> >
> > Yours,
> > Linus Walleij
>
> mhh.. this bug should already be fixed in a better way with [1]:
>    gpio: mpc8xxx: Don't overwrite default irq_set_type callback

OK I drop this patch.

Yours,
Linus Walleij
