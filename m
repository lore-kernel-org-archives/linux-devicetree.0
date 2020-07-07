Return-Path: <SRS0=wVrF=AS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BB0C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 11:00:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC57E206E2
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 11:00:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fTRhwpj/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbgGGLAH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jul 2020 07:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGGLAG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jul 2020 07:00:06 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEDB7C061755
        for <devicetree@vger.kernel.org>; Tue,  7 Jul 2020 04:00:05 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id d17so34653748ljl.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2020 04:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KYp96ZZSsCMgncArOFXly9s4OIli23NE92mNWgNw4B4=;
        b=fTRhwpj/hU9LfJzJkArIDCDB06upW6a/C93yjE1K2cuse98pkQSzoA+sYMYtLUzpDf
         3bp4aEg2xQVvoYioUSQP0uJQAC21hPPGHss9REoOMCDiJiZ5xEBBCNpeUbFG4cvUniMv
         2TC9aOH9W8eK2nENG0Z49Gl/eIoFu9EfVU7YOlIOqdz27oL0+BEVXQstm2SudjiXJY3+
         27TOPF9Jb895pl5OdzMSly4xGJ0XrKuF6+ntvUXmtZOdDg2vGf6j8qqtWXaNTbOKnfRC
         k9bfaV65PgvLITOCEwGD9SdAmApIqfAx76iAQGVkmib6gjtNWscBDAyMLSGqGzdyvUTP
         y7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KYp96ZZSsCMgncArOFXly9s4OIli23NE92mNWgNw4B4=;
        b=K5P5RZl6rcLGCytuhToIGAgUWNWSK62WeVfmSY/yRixYueV9B5t1HUWzs+QkZW0Zcm
         Y4RnSJFC+VrP16/J0wFhhOSFzCzVfG5tpTHcevQp+IxgybLmL8EU+9KJ7CzimOzoYCNb
         7WudSCoG+VlEBEUnsYlc1tFgzDFYUefKtwReSkDQTCf/NJRzpTSqZkHljTMcJj2wfKhZ
         cXwwvoZkv0wTi844dE7JAOuMj137KPY2WgoFm+TV8SW1I62Lh+ZSFre+EiAn8bKC8BQg
         ZsbJ5iIDi8BfdTD+Rr3Twct+kOxB5nOlCNX2bqr1n2bWEuIZhmEsbK+en3jhJOABIkqF
         FBCA==
X-Gm-Message-State: AOAM532Ws/UOpmH03Fc6lCkmZqv/lajAPnH2M2ks8S0aTzM2fAF1CGVJ
        ymRPv7yQGaa9VUR5XXyoVi2gFMHWgwJV6bIIfK5ijg==
X-Google-Smtp-Source: ABdhPJz/EbBwJ1T3GgvyKHSaJPDBjC/885l2Y1IY+hCrikFT6rUcrPXU9Ohp3fztPR4QHzpES5qUG955fZ1BVL9iXNs=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr13896696ljc.104.1594119604328;
 Tue, 07 Jul 2020 04:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200701013320.130441-1-drew@beagleboard.org>
In-Reply-To: <20200701013320.130441-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 12:59:53 +0200
Message-ID: <CACRpkdY3mUjczkJhV9BdZhUJGOgrbOMJnciBjOaPg6c9XUt8Ww@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: single: support #pinctrl-cells = 2
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jul 1, 2020 at 3:33 AM Drew Fustini <drew@beagleboard.org> wrote:

> Currently, pinctrl-single only allows #pinctrl-cells = 1.
>
> This series will allow pinctrl-single to also support #pinctrl-cells = 2
>
> If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
> pcs_parse_one_pinctrl_entry() does an OR operation on conf and mux to
> get the value to store in the register.
>
> To take advantage of #pinctrl-cells = 2, the AM33XX_PADCONF macro in
> omap.h is modified to keep pin conf and pin mux values separate.
>
> change log:
> - v4: squash patches 2 and 3 together so that git biesct will not result
>   in a boot failure
>
> - v3: change order of patches to make sure the pinctrl-single.c patch
>   does not break anything without the dts patches
>
> - v2: remove outer parentheses from AM33XX_PADCONF macro as it causes a
>   compile error in dtc.  I had added it per suggestion from checkpatch
>   about having parentheses around complex values.
>
> Drew Fustini (2):
>   pinctrl: single: parse #pinctrl-cells = 2
>   ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2

Both patches applied to the pinctrl devel branch for v5.9!

Please make sure not to create colliding patches in the DTS files merged
through ARM SoC this merge window.

Yours,
Linus Walleij
