Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E653C432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 08:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6CF3217BA
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 08:50:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KVLHCWMi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfK2IuK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 03:50:10 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44249 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2IuK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 03:50:10 -0500
Received: by mail-lj1-f193.google.com with SMTP id c19so4093771lji.11
        for <devicetree@vger.kernel.org>; Fri, 29 Nov 2019 00:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DDD/UnUADM3mnwpvsAchbYVhZu3juMpSxL84tbPsIbo=;
        b=KVLHCWMignsuWlcS7LxuvXdykXnJdIoBNiW8JithqBRaN9wcvo1g4UE3oE6h6RdcRN
         jLEvrMDIUWh3WxK9ixpeKqxPjlewzTq0GI6ilyuAFhW2YJf1ZqbkL3ADAUdPwFG875jh
         x9vo6h0wlgAaxokaLK4+dCSaEdEZrMQXocgg3mRKJwRpOm0JsRMmk9AGZyiS5TIAU7qN
         6LRFXkHjDx00GXywgORKLFx4NJ+nqr0y7wGWB2ZGfDi/YrZchGozjMmNsFaqACRsKEPr
         fn6mkQtNRbJfvCBG9q3xKL9NRXLgrzKNGAdC+zFhxaiIniwKZZetUCiZPeUpg5H5cbep
         yDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DDD/UnUADM3mnwpvsAchbYVhZu3juMpSxL84tbPsIbo=;
        b=M1mJwGrQOfw/bJrAzQZH3MXHYr21ek/JvvhQdO0GEWr24/NcCeL8SNYgsTaD3BdrsM
         oO1u5MbDU9/ytZ7s7TAJvkEhdsIiiiuE+7XBmuR5KToYVAy4MR04uLkSISffeSqyZrDR
         doWaeLebEgFubJx6XqUHlR+Jq408sSwkTNIwiJHDttygStGBbL4qGnZTrnAOgCsjmnvx
         Ouxv33E47zURpt7gYrN3+AZWPHlOXOowh8rrA8XtEguFiIMty/5zDKX0G3mveb8Kf0qw
         q6mOw5l8OICTsd8ljKmHmaPixCnjrtwe/YfNlS+SBdDkDSOMRWTphp8LQGp3wuOv1lyH
         kD6w==
X-Gm-Message-State: APjAAAVij9a9DU7+8MwYGu0MoQoHMqON9zt1JOMHmmj2fMB+d+Bb0zNn
        SL/WOOdau+r1yC1H3q+81D78WnukuhWoWQ/P9Oygvg==
X-Google-Smtp-Source: APXvYqxNOTdjq0eH1xPQUrG1i3ed9i46I+BwE5vw5X2SkpBR2UmTqJlh0NKv9bJLxRIPCTk4T6SWpbiyPuLBwslQnQw=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr36852322lji.191.1575017408368;
 Fri, 29 Nov 2019 00:50:08 -0800 (PST)
MIME-Version: 1.0
References: <20191127115619.20278-1-m.felsch@pengutronix.de>
 <20191127115619.20278-3-m.felsch@pengutronix.de> <CACRpkdYLeSjsXaG6Bg4Y2-8PW41ALn4PN7QUvp3tA7XReWrKGg@mail.gmail.com>
 <20191127151929.GC4879@sirena.org.uk>
In-Reply-To: <20191127151929.GC4879@sirena.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Nov 2019 09:49:56 +0100
Message-ID: <CACRpkdbJbCwo7yALnywscCTZBzO1ZzWY_=c5RoVGqY7Eue3t=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mfd: da9062: add support for the DA9062 GPIOs in
 the core
To:     Mark Brown <broonie@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 27, 2019 at 4:19 PM Mark Brown <broonie@kernel.org> wrote:
> On Wed, Nov 27, 2019 at 02:35:33PM +0100, Linus Walleij wrote:
>
> > I can clearly see that regmap's irqchip does not support
> > hierarchical interrupt domains, so we should just make a
> > mental note somewhere that "oh yeah and then one day
> > we should make regmap irqchips play well with hierarchical
> > interrupts".
>
> Why, what do we need to do?  We're just doing all the default stuff,
> it's not something we've opted out of, and the whole point with using
> the frameworks should be that we should get software features like this
> for free :(

I guess it is a bit about moving targets.

The regmap irq thing was covering all reasonable cases until
the hierarchical interrupts were introduced some years ago.

The hallmark of these are that the irq_domain_ops implement
.translate() .alloc() and .free() rather than .map() and .xlate()
as the irqdomain in reqmap-irq currently does.

The problem with hierarchical domains is that the system using
them need to be hierarchical "all the way up" to the overarching
top-level irqchip. Currently only the ARM GIC and the IXP4xx
irq top-level irq controllers supports this, ruling out some
obvious users like all non-ARM systems (for now).

I think the assumption in hierarchical irq is that you have
a few hardware-specific irchips and you know exactly which
irqchip that goes on top of another one, as well as which
hardware irq line is connected to which hardware irq line
on the parent.

Since we know the specific hardware (from a compatible
string or so) we can hardcode the parent-to-child mappings
of interrupt lines in the driver. These mappings are not
in the device tree for example.

Therefore supporting hierarchical and nonhierarchical alike
in a very generic plug-in irqchip like the regmap-irq is a bit
of a challenge as it has to support both hierarchical and
non-hierarchical, because it is not possible to just
convert this to hierarchical callbacks: it has to check what
its parent is doing and adapt, essentially implement both
hierarchical and non-hierarchical at this time.

Also we need to pass mappings between parent and child
somehow. In the gpiolib we did this with a callback to the
GPIO-chip-specific driver. How to do it for something
generic like regmap-irq is an open question.

So it is a bit complex.

(Marc may correct me here.)

Yours,
Linus Walleij
