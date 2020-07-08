Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D4FC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 07:35:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C610720656
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 07:35:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XmHSa0Uz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgGHHff (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 03:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgGHHfe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jul 2020 03:35:34 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EC5C08E763
        for <devicetree@vger.kernel.org>; Wed,  8 Jul 2020 00:35:34 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id o4so26300118lfi.7
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2020 00:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BR6f0/BqJCEN1CVfcKyyqFPGBwWk+T779U9WQ9pd+T8=;
        b=XmHSa0UzMCoKN/tnYpRpf1kVvmOC6ZnhRaRiqN4dhekdDS+dYRV4tKqjXeotjjk6CM
         0MOlfsqx2ohqnb6RqR6ienmLqhlOgV5HpjXxdnuF+2RNshU0o9RIAIhUZSGaeqwlgB4C
         gUW8FyQX+VrymFES8f5hJ2kMWkTZXksc4SuBtTUoukp8gzsIOf9gOetUEQ9GKiXZ9aEU
         cTaQ5sIe+t/aBH6d25PGmD5Ym6EFRxjCK4D01B+XFLYt6JFtN/HdUdeQ6VoTnNi1Qi+J
         7eBpWDqvtLxhJ+XWohhbbsQWumjK6uhfievDT2eH1knqhrEDjvihiHsulNpgkNzY+qj6
         CMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BR6f0/BqJCEN1CVfcKyyqFPGBwWk+T779U9WQ9pd+T8=;
        b=BYppVSiJogBczFDPpktk16rpIUZ8CC2txWYc1WfW82f+al8UNvbm2QhOBH7P+Yz7ld
         69uzIOZw+5AwkBcQ9nuVwgIB/93hjX9y7LyxfgTRrDBm/vKNInY79eFp4k3LsmyV2RAC
         WQFat1CKP8/eghoGxu//e2B4TSSoRyeU0bMI3VxEaoBZKhaRZDgT38O6Fup7Ts7rEZvd
         S36nHQOBtgEseMfBe2y3qQ9FOezF6Qb8a8zS1dCPsB0s6mbxD3UJEIgqePQEcK8wZn+0
         le+z8gEONFr/A1GRYbJo7YeThL4vcWifsjaIaXmH5POEm3BsSI8MIu9q0DuvLk3HKxoZ
         qtng==
X-Gm-Message-State: AOAM530CAagpXtUK8MTgTCeoncvJTBudyKe7q0Pcsij89h7mF3jVVgnq
        C8ah6b+Tbv2RBpeTUZm8+i5P4YGGsHoxcd7bzLsz6A==
X-Google-Smtp-Source: ABdhPJyJ+eDL/+RhcnG7xcn/RKZTuk4K1j7DdGcaDL2nOuPTPOOM3n5gq5c736mD3TdGBOD+yswnwtLJpQbCLuN0+7s=
X-Received: by 2002:ac2:47ed:: with SMTP id b13mr35325021lfp.21.1594193732803;
 Wed, 08 Jul 2020 00:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200706175353.16404-1-michael@walle.cc> <20200706175353.16404-9-michael@walle.cc>
In-Reply-To: <20200706175353.16404-9-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jul 2020 09:35:21 +0200
Message-ID: <CACRpkda=C1XxLEJrVb8oMdrt1CgVyfDn7=cf7UdK0AJJwt+0Yg@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] gpio: add support for the sl28cpld GPIO controller
To:     Michael Walle <michael@walle.cc>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jul 6, 2020 at 7:57 PM Michael Walle <michael@walle.cc> wrote:

> Add support for the GPIO controller of the sl28 board management
> controller. This driver is part of a multi-function device.
>
> A controller has 8 lines. There are three different flavors:
> full-featured GPIO with interrupt support, input-only and output-only.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Changes since v4:

This is awesomely elegant now.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose it needs merging through MFD with the rest.

Yours,
Linus Walleij
