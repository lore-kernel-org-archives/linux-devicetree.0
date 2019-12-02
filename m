Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB8AC43215
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 11:45:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 812BB217F9
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 11:45:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JLrik/Q5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbfLBLpB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 06:45:01 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38918 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727354AbfLBLpB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 06:45:01 -0500
Received: by mail-lf1-f68.google.com with SMTP id q6so4680485lfb.6
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 03:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9dbeOa/yZiXLwAKhqVdLm2n/zVETLaeGOMkXijhyOxI=;
        b=JLrik/Q57hkA2pLMTsCgFgbbXQCV50ILFodTufcKAu1zVJThyK0XovKHqlm3wjIFXo
         thgwxcec57cupokH5vqIRP6Afm0WjEpc8qBe4nJwWGCNznGEyDTdlFrWzt3OQTWUtu7B
         9ojKBJ/a48Jp/wQ+CQoM8wncSSs9mNnuHZ41QHW7sAbD1bWBUOfgQH8nXdwsrzD82tOh
         +IJzbYXg/z1w5aY7ZGrLvj9474omGAyq7H6tFWkuH4FUM5PHsVMnE5lVUh/cwKaJl5tf
         /hhm7GuvMk6MXuDzwMfDqLgev32ArbhFfgAw6Pg0WZ76yLzTdJvlrpcRC1xyT7XWfzk0
         QIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9dbeOa/yZiXLwAKhqVdLm2n/zVETLaeGOMkXijhyOxI=;
        b=nZjtCIaQWFjHeuScTeQJkvDjh/2b9XwQ7pu+0l5TtAW9HvZE8YouErJ+bJy8/llieV
         5p1d9wpi63QU+1BJZmcc67vG2PDBwCvWAgrTQo+XSpBIOZKwXCMd6FggagJp8opE03x4
         Z6z8cSG8fFp731yErvqe8T0McOHwCgDbN8YnwvMTrsKj3VyulaU29huoRZpepA4Rd8dy
         FEfIrC7WdxFZ9f/c/f9Akf7U0sPOm9lyUwY1lRIO35+B8ye96qjvSbpeCt+5aVgHbUPj
         fRJGdGLRSOl3NqzzXrxlJVlf71fZJ8i3sEydmyqOiu23KuJRGciz3zyQGOazcI//zV2b
         R6zw==
X-Gm-Message-State: APjAAAU5lR1g0ZVVGYN3zfyakjAsL8x6UejLNCZ7QGfjnkuNRh7r8DHl
        DAta2FG3ksrFCxg9DavKjK5tNrwIgyrhyFlQpHs1EA==
X-Google-Smtp-Source: APXvYqyoHJVudY4Th9gkUkwA7ZvcT7SMc/yaucVRZjkFgzCxhl/qzF5ng9XGEy78xknVHWJ5WXqV+foidMFPzNGJqww=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr41600526lfi.93.1575287099487;
 Mon, 02 Dec 2019 03:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
In-Reply-To: <20191129172537.31410-1-m.felsch@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 2 Dec 2019 12:44:48 +0100
Message-ID: <CACRpkdaSmwORgetv7aZjtgk+2OchcvQR4SBjdWQ4KsRMHuUvSg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] DA9062 PMIC features
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 29, 2019 at 6:25 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> this series address all comments made on [1]. Patch "gpio: add support
> to get local gpio number" is splitted into:
>  - "gpio: treewide rename gpio_chip_hwgpio to gpiod_to_offset"
>  - "gpio: make gpiod_to_offset() available for other users"
> Please check the discussion [1] for more information. You need to apply
> [2] to test the new features.

I am very happy with the shape of patches (1) and (2).

I can apply these on an immutable branch and merge into the
GPIO tree at v5.5-rc1 and offer to other subsystem maintainers
to pull in so they can merge the rest of the patch series on
top.

Alternatively I can merge all the patches into the GPIO tree.

I suppose this is not so much of a MFD business at this
point so whatever the regulator maintainer prefers I suppose?

Yours,
Linus Walleij
