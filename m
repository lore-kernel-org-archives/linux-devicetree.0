Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10480C432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 12:46:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6749217AB
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 12:46:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vp5Bqqo+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbfK2Mqa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 07:46:30 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35160 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfK2Mqa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 07:46:30 -0500
Received: by mail-lj1-f195.google.com with SMTP id j6so22873142lja.2
        for <devicetree@vger.kernel.org>; Fri, 29 Nov 2019 04:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GljEEZ+qFQlAnuGdwSfhc8MmhbIqcq8xLrjdn0h36QY=;
        b=vp5Bqqo+zzlmJdEsceF0oP8x+cm0xaQ78+bK1cSLSofUgaBUY+daNYjZv50BNeUqzy
         VPoScXNlv7s+O6pt4L8RrqkDzjvtzPyTXpWRnSWQ1gbrYISHNc3E6H9d2yrNUA9bX8oN
         S908OXqpM1+w8NXQRQbBaIOTvink9NETDj8Rs/fx4oHC5gnZTixojHL0aO6w5Up3F8io
         BfHP2p13LOoHcy+JMOAhumbeEJPiv0yqRoBqvar2kQcglUOLFpo9NxyVhlUHbQ+orw5m
         ux7lApGMEXt4Z3I/XjfPzDZuXOlhw7UN3iSUnjoAzLDexwfPVT7OoBWZJthSPnyClyFC
         3GOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GljEEZ+qFQlAnuGdwSfhc8MmhbIqcq8xLrjdn0h36QY=;
        b=DxWzmvJ4jhYKFsjWMESytOkcbWgUYP0i0Tv5va5LuEPt5kmUF5sRPy/5Quen5moH2w
         9SsR6BmHBzpuPp8RnR8Rl0NzBNdtF74KX8kYkOdl6JXiZCeq+uxlsyg6gMUWe/XJxEuw
         +rJ4dA2AWK0dl21z9T9luOV0sNxm+g3qpANYTBgr0gUnm1fQB0B+3TzPE1BGsnsUGFKr
         ZWnfSoQFYusgRzIhGmmHCDJ73XKt9vzr/r7BrBVj0Ep4o/vFjmC0JiBhw+jIA1ovVuKK
         lGmxq+ZoRb4AWc6w6KFkQEOsaYT8ZfeO2f0Nvna25M3XUCPn3RKQnc/L2iFkRJ8yhkFt
         Woww==
X-Gm-Message-State: APjAAAU2oZ1A3PrrUnjpENFo+jJKUimppuNZFgy+mHURNzKNsdnB2Cty
        nB1jzoIei5SWSKo0vk2YD3jXW65o8WWeYVx5gcYPxw==
X-Google-Smtp-Source: APXvYqx6hPdvTl5RnE6kxUresU0OdGBbsEJEaEYsWpqaEmCS8XABYG3HsFp5vttj/Tt4ZuLXzaLHmZknQKP70/j3B1w=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr37680939lji.191.1575031587982;
 Fri, 29 Nov 2019 04:46:27 -0800 (PST)
MIME-Version: 1.0
References: <20191127135932.7223-1-m.felsch@pengutronix.de>
 <20191127135932.7223-2-m.felsch@pengutronix.de> <CACRpkdbG=XiQHNZa+zBqdyTDRhyXD5rLxbLjp3qqGbcQeTX26Q@mail.gmail.com>
 <20191129101542.drtcn44twcyzxqmm@pengutronix.de> <CACRpkda-mYbzxL9u-U9AHrFihtAQBaZajrQ-SN=WQH6=bg4swg@mail.gmail.com>
 <20191129113600.phbhqudrgtm2egpf@pengutronix.de>
In-Reply-To: <20191129113600.phbhqudrgtm2egpf@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Nov 2019 13:46:16 +0100
Message-ID: <CACRpkdYV=8sxisJkvov3KmfLDFRPt2Pva06XORz8tJUhuCU5Cg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gpio: add support to get local gpio number
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, stwiss.opensource@diasemi.com,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 29, 2019 at 12:36 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> On 19-11-29 11:19, Linus Walleij wrote:
> > On Fri, Nov 29, 2019 at 11:15 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > > > What about renaming gpio_chip_hwgpio() everywhere
> > > > to gpiod_to_offet(), remove it from drivers/gpio/gpiolib.h
> > > > and export it in <linux/gpio/consumer.h> instead?
> > >
> > > That's also possible but then we have to include the consumer.h header
> > > within the gpiolib.c and this seems to be wrong. But since I'm not the
> > > maintainer it is up to you and Bart. Both ways are possible,
> >
> > What about following the pattern by the clk subsystem and
> > create <linux/gpio/private.h> and put it there?
> >
> > It should be an indication to people to not use these features
> > lightly. We can decorate the header file with some warnings.
>
> That's a good idea. So the following points should be done:
>   - rename gpio_chip_hwgpio() to gpiod_to_offset() or gpiod_to_local_offset()
>   - move the new helper to <linux/gpio/private.h>
>   - add kerneldoc
>   - add warnings into the header

Ack!

Linus
