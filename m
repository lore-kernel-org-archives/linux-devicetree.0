Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABE4C43215
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 14:00:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5BAF3206F0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 14:00:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SMS3LbaE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbfK0OAS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 09:00:18 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:33371 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727091AbfK0OAS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Nov 2019 09:00:18 -0500
Received: by mail-vk1-f194.google.com with SMTP id b64so5481947vkg.0
        for <devicetree@vger.kernel.org>; Wed, 27 Nov 2019 06:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xv0agzTrWmCHWWQdEdnjrauxL6G7A6I1j0PhE1Au3GA=;
        b=SMS3LbaEfWEtk84MXTU1uY5sFT4i44DeL2NZO367/zZdh7MGxJwvobTxGQZIvkXmjt
         HKCivkes+H/swMNZxbygP2FDC6U+xHFyiW05trlZU1cniHBIu60/1Ik96HlX/dL/RH27
         Le3sp14Ldq4KMTRYJNQKVZZLhHUiDylCzNRBnESSO4lHsd3c3knyPh7TClIcSdxRGZX1
         N9HCa83BV9qLZHtXkGgqq469wsJeY0mdHM1TCf7UcvPhCkxgZCa2pK1yweCcAZjj4KNw
         +qE41yWCXXY+Ue6T0MSwV/Eb6ZcRLspo3Jlp4dxp5mBSEWDYthXsphbE+mMoG36oY64I
         RW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xv0agzTrWmCHWWQdEdnjrauxL6G7A6I1j0PhE1Au3GA=;
        b=WcnOi9K5EORpzr42FAJMLTJKXi20udJKxQQVA3CUiNHfQE5Ehfte4LoaP70iGa+Lka
         puUeNiLUOfyQxpyCLsdpc/rZtvRe15jf89aBC8/Fd4QSyb4GHf13nRvZbzIyu7Dvu/jU
         +rprUktAYjxFbpppYtHp1i7lwAT8oP2LEebcMQbBimWrautPTQ1CF8v5aNIfDHSn4aOh
         NGRES26227XkMBPgsK4BnA7aQsQAs+Yl4JWabzKgE+2ZisWNpfMjVPb1OGJ0W1PYldx+
         bH0aOu6e/VmEei5V5gjvyGpNISVSFetZUjzGujPG9lH+NT7um0Rd/PgeCYtZqkRKKLMb
         MOVw==
X-Gm-Message-State: APjAAAXfnDuFmKDHb7n/hg6q557KFZRHFxAdrgzgj5rU/k34/vN6C0ep
        DYhRmabI9cldmab/85Z/gMdwQ0a7gjOXaSIpEasriA==
X-Google-Smtp-Source: APXvYqy2z1ESn19JzZsxw2MQg1P7KKVZTecOuQKJc1YhRGnEfvelj4LBPw5SELJgHKFj9GZ2pB9Vdn4PruN7+IvV/3w=
X-Received: by 2002:a1f:cf43:: with SMTP id f64mr2942105vkg.18.1574863217253;
 Wed, 27 Nov 2019 06:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20191124205110.48031-1-stephan@gerhold.net>
In-Reply-To: <20191124205110.48031-1-stephan@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Nov 2019 15:00:06 +0100
Message-ID: <CACRpkdYnR3jYtrEWyKf=fi2c1Mvype9FeiKKmoLjK+1R73iVBQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: ux500: Use "arm,pl031" compatible for PL031
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Nov 24, 2019 at 9:52 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> The Ux500 device tree uses "arm,rtc-pl031" as compatible for PL031.
> All other boards in Linux describe it using "arm,pl031" instead.
> This works because the compatible is not actually used in Linux:
> AMBA devices get probed based on "arm,primecell" and their peripheral ID.
>
> Nevertheless, some other projects (e.g. U-Boot) rely on the compatible
> to probe the device with the correct driver. Those will look for
> "arm,pl031" instead of "arm,rtc-pl031", preventing the RTC from being
> probed.
>
> Change it to "arm,pl031" to match all other boards.
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Patch applied.

Yours,
Linus Walleij
