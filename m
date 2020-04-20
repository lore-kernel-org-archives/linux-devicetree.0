Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66A2C38A29
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 00:21:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A01A62073A
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 00:21:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NraVSXpw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgDTAVF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 19 Apr 2020 20:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725947AbgDTAVE (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sun, 19 Apr 2020 20:21:04 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E186C061A0C
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2020 17:21:03 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id i16so4452129ybq.9
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2020 17:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=s8BN9m+lx2Z48+uXcCTiGNQq8+iPaDOWBf0i0XZJgGg=;
        b=NraVSXpw2kgjiwrg7NQ9JOem9ozvndrMa4CK99N3hfpqAiTB5okNd7BQkOIk7i0g47
         wlf+AQKl1I/T4MjB3IQv5fTPC/KJQMpqHIAaKofnqvbwj7dBqebfC3XKHsitoueT/ctx
         IhciW92FBwcBz8630vH6Rib9AxRfveMs9JIUAVOS6YevLsGugYg1rP2R9Mv+CIuxN/Py
         0HKhPib8Kp+1AezkbppM2L4uuo8gcHkqATQ7Rs2kMdYu0msHNF57+nXZKrbSTGPUNDot
         9mVV3IXta/ufQvqz0081YfFXPOB4xHF7+rmRFy2frwp8Vj7ZSgNxGhY34wAX1tXth1EL
         G0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=s8BN9m+lx2Z48+uXcCTiGNQq8+iPaDOWBf0i0XZJgGg=;
        b=tEVLRHtVAvCILKJJ6tsc2t6G2MCjEPj/9McKmFl/mAvpUh9whKoG/kvTxOvx0IDDFO
         vRWQHqj2tciEooOg2XDq+5xiKx/rMKC8FcMydTYk0bgebJA1lBL7mfbR6L8tYlUwJX4y
         POY7Rv3tQb5kMK+68ogO4fDBN4TssOXYvvfwn45nGEsiJS61TiFfMH6hy3WdLkM2vkF3
         bWM/9P36W9tiDOGt6yZReRIzxKJ+YIlj3iY3GxiUJNZH9qUpb9a9egtIutJ2TIOaoGQu
         OhkkA/G1gQylgalISNqbRs4dtutoQ+3vlDoV9QJfDp/iL5gTFRbUzgCvFWndgRwCRo7E
         Br7Q==
X-Gm-Message-State: AGi0Pub9BRz143Jl4YGpHMtVcqvuk5FhSjODJFxH8fzkJG39ycp5ZZU2
        ldH59vVReRy5sK/1oXNgI1Hj5JTX/7RQu2K+2u/mLg==
X-Google-Smtp-Source: APiQypJSOxjv8wt4QQJ4xhmJDmewwOsK4skGY6vGs/0WOCDwdsbc/Vct6BQldP4vgGuwsYYSyW6gIb+HYgEIOtHSeEY=
X-Received: by 2002:a25:9cc3:: with SMTP id z3mr15862074ybo.234.1587342062189;
 Sun, 19 Apr 2020 17:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <158614147708.29424.2884940487411120526.stgit@localhost>
 <CAA93ih2ineuFYzA_uhGwmzsznDKacEG=7rK1beWsCkrnR0opuA@mail.gmail.com> <CAK7LNAR9tdhqkKft5j59_Z=sJj_wVJBwRysFpShO1HXck7-idw@mail.gmail.com>
In-Reply-To: <CAK7LNAR9tdhqkKft5j59_Z=sJj_wVJBwRysFpShO1HXck7-idw@mail.gmail.com>
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date:   Mon, 20 Apr 2020 09:20:50 +0900
Message-ID: <CAA93ih3tLjouxUB70BK42bi_dFfaovTy-aCyHjHjjYR6aR3TWw@mail.gmail.com>
Subject: Re: [PATCH 0/2] dts: uniphier: Add Akebi96 Board support
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Yamada-san,

2020=E5=B9=B44=E6=9C=8820=E6=97=A5(=E6=9C=88) 8:37 Masahiro Yamada <masahir=
oy@kernel.org>:
>
> Hiramatsu-san
>
>
> On Fri, Apr 17, 2020 at 2:31 PM Masami Hiramatsu
> <masami.hiramatsu@linaro.org> wrote:
> >
> > Hello Yamada-san,
> >
> > Could you review this series?
>
>
> Where did you post your series?
>
> I see this ping mail in
> https://lore.kernel.org/linux-arm-kernel/?q=3DAkebi96
>
> But, I do not see the original post.

Hmm, indeed. I had submitted the series to linux-arm-kernel, but it
seems to be failed.

>
> Could you point me to the patchwork URL, please?

OK, I'll repost it.

>
> Once I find the patch location, it is easy to handle.
> Since I do not have this board, I will just queue it up with no evaluatio=
n.


Thank you,


>
> Thanks.
>
>
>
> >
> > Thank you,
> >
> > 2020=E5=B9=B44=E6=9C=886=E6=97=A5(=E6=9C=88) 11:52 Masami Hiramatsu <ma=
sami.hiramatsu@linaro.org>:
> > >
> > > Hello,
> > >
> > > Here is a couple of patches to add a devicetree for Akebi96 board.
> > > The Akebi96 is a certified 96boards which is based on Socionext
> > > UniPhier LD20 SoC. Most of the part is similar to LD20 reference
> > > board, but there are some changes.
> > >
> > >   - MAX3421 USB-SPI chip on SPI port3 (for USB gadget port.)
> > >   - Simple frame buffer with 1080p fixed resolution.
> > >   - I2S port which is connected to aout1b instead of aout1.
> > >   - 3 serial ports, only serial3 has CTS/RTS.
> > >   - No NAND, only eMMC on the board.
> > >   - OP-TEE support.
> > >
> > > See https://www.96boards.org/product/akebi96/ for details.
> > >
> > > Thank you,
> > >
> > > ---
> > >
> > > Masami Hiramatsu (2):
> > >       dt-bindings: arm: Add Akebi96 board support
> > >       arm64: dts: uniphier: Add support for Akebi96
> > >
> > >
> > >  .../bindings/arm/socionext/uniphier.yaml           |    1
> > >  arch/arm64/boot/dts/socionext/Makefile             |    1
> > >  .../boot/dts/socionext/uniphier-ld20-akebi96.dts   |  200 ++++++++++=
++++++++++
> > >  arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi   |    2
> > >  4 files changed, 203 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/arm64/boot/dts/socionext/uniphier-ld20-akebi=
96.dts
> > >
> > > --
> > > Masami Hiramatsu <masami.hiramatsu@linaro.org>
> > >
> >
> >
> > --
> > Masami Hiramatsu
>
>
>
> --
> Best Regards
> Masahiro Yamada



--
Masami Hiramatsu
