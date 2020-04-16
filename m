Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1613C2BB85
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 08:37:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A155A2063A
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 08:37:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fYkiVyjy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502186AbgDPIhB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 04:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502494AbgDPIfd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Apr 2020 04:35:33 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DBBC03C1AF
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 01:34:36 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h25so6848365lja.10
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 01:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MyKtvenZZySMWZjgRLJbDJOPHGIrfVrSPfr0WfI/VtA=;
        b=fYkiVyjy7eOsJYWlAiTayzWjGkE+e1mUldI0Bx/CxoO/uRzO5h5zkKeWvLWyT4wIVq
         y4Um/zqK1i/EUxtP/cB7m2yiCfOAVbucsbSvm9uAIBdUy5w/NyEgZas2SerPH26kjihk
         NJ5qrlR6KCeUheLOqsfKpP2vrUVQYBdC/lh6Iy4lvDXzlo9F10OICHSA8GRZxV9vIwgG
         g+fgaQUuLBOTvaOt4crwBP5OOZe7ophOecfwpbiaskT4jEC1w1TFXKcnvnYX+N2JBeWE
         dUyc5WtmVr5a+KeD8IdGTWSudzyYEY/vdzcMmFi1Gbr8mYPVC1ncjFXy4g01wQx0gT9E
         vWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MyKtvenZZySMWZjgRLJbDJOPHGIrfVrSPfr0WfI/VtA=;
        b=SuhBSszmbn8oCa7BlAQItAXsiKsu7Ia+Dd7gzz6Lq8+5/1y2XsqeXeE/xYo01EjPcu
         f1Gf66gwFTyFvTfo0TZz0xH5Ux+X8kei+0pFTgf09Kw+OGCKGs2tm899UT78IQwDb2tT
         eoHP0zZRZj2e1cKBeyTk1lDsBk6W9B3ABsPYfdE5haWeI9HWAkf0sWL+VWSKLAOqkpef
         Y1yECM+kIOu0Qw45bSmAxzwKygWHmHfUI7pn1xqxkVghfXSnpo3AmzE2llO5TEL3JBfT
         4SPlUhsyPn0yAM0VC3YFA26Xbh2v7ib7I2OGhLcz/x9LGMME4F5bzVbshd+eFfThCKkj
         Nsqg==
X-Gm-Message-State: AGi0PuYrZjr5MC8NxFUPkivC+rFDNIyNEQ6tk8nOoBZYhAQYxTWRmDbv
        Hzf8jNNaAujBhud2umO/VIYYQ4tOujP0Kho3XbXQMw==
X-Google-Smtp-Source: APiQypKpg4Qo0k4IoZG1lD0aQ14OtbNSt7M01nnNL2FnfHvo9Iw7EPQxYDZAVptV9fOJpu5zJ470WV5Vz4uxzy+rmRs=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr2229929ljh.223.1587026074289;
 Thu, 16 Apr 2020 01:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200402203656.27047-1-michael@walle.cc> <20200402203656.27047-12-michael@walle.cc>
In-Reply-To: <20200402203656.27047-12-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 10:34:23 +0200
Message-ID: <CACRpkdbANL_W3gcTwue5VUCWT95boMXjFSqTeFDZvJ6iSeNpJg@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] gpio: add support for the sl28cpld GPIO controller
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Michael,

this is looking good provided we can get the generic GPIO regmap
helper reviewed and merged. Thanks!

On Thu, Apr 2, 2020 at 10:37 PM Michael Walle <michael@walle.cc> wrote:

> This adds support for the GPIO controller of the sl28 board management
> controller. This driver is part of a multi-function device.
>
> Signed-off-by: Michael Walle <michael@walle.cc>

> +       depends on MFD_SL28CPLD

Apart from this depends it seems the patch is compile-time
independent of the other patches so I'd suggest we just merge
the generic regmap driver and this driver to the GPIO tree once
we feel finished with them, optimistically assuming that the MFD
driver will land and that we will not need any fundamental
changes in the GPIO driver.

Worst case we have to revert the driver and that is no disaster.

Yours,
Linus Walleij
