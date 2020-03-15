Return-Path: <SRS0=kXhk=5A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135BAC10F29
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 18:54:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8324206BE
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 18:54:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E+HBZbGX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgCOSyy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 15 Mar 2020 14:54:54 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39602 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728639AbgCOSyy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 15 Mar 2020 14:54:54 -0400
Received: by mail-lj1-f193.google.com with SMTP id f10so16125178ljn.6
        for <devicetree@vger.kernel.org>; Sun, 15 Mar 2020 11:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fTQd3aS5OhNIrglS2AjM4BcIR1NXf9NUl3ZVwz+9ZAQ=;
        b=E+HBZbGXPHlxT3smlEDZETEl6jN6e08Qzg/pBZejJ2lk+Qr5UD3pZwb+9iv9Cf8cYl
         fXToil1uzvcbDaq6EeGWKsti487QNARBigDgEjLOr8FfzApiBJDJCQKa0aSwOTnrk0Lr
         cCwj6antxj6hfQgugrlBzoNTrLlgdjouHXipYd4K+7TCZUFlB8xk+pinI97b1iMma4Id
         CYUEQQsiGurACKj/FVqICMUDE4mCyeU0A4YnwE9keZcDf8CYmr1Y+L7AkZ9YSSLtnxaN
         dBhdqC8HLDGVqbbp24yE3Vcw5oYB08U/T10tkSUVjvNoW115kbaHQZQsChy6plpMI0PO
         UXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fTQd3aS5OhNIrglS2AjM4BcIR1NXf9NUl3ZVwz+9ZAQ=;
        b=sSBump1msm6prFWxTISrO/qwGVs2X8n68DAZ8uf/2OimcMeFi0JWaLbRZkZ17iSG8n
         4NeSBX4G9b4heSRbLPUmt4JBMXBGNH/O68R2skewsFfFxcnZ3IKduNMIoSP/bvZSl07x
         eG49hEy/1LzRSa+LSIraW2ub3OyUJ32lc5kMJCDd2G9DRxqq1hUWAY3baRExKoD2rSwO
         YoncZ0KJ3tqJxk07NrCfuHBdar0h24ffByfmrdCe1rCGPwo8naROCvKA2AzOl9hmhCHo
         AlcseDPtp2nUTjA8r8XfJGnW5BnQCxj0UxpkGy/fPSuOkQa3+qhaLwLqTSC+ncPpthgm
         Aecw==
X-Gm-Message-State: ANhLgQ2+IAItc83mXRxUlEFu4n3kGlc7opcc5WGqlq9b95G1vOsSal2G
        jYPoLgxy9asIUS1hR+OIyZWsCbmbaIWuWpgpa1mT9g==
X-Google-Smtp-Source: ADFU+vssbL+S14lH6N8djcDEZl02ahI9L+idvGs1zzRXqR+eWnNl2HLjxbEiYTzRMwkdmwS16Jt4Fy4vCuUNuYgAb5g=
X-Received: by 2002:a05:651c:1026:: with SMTP id w6mr13694210ljm.168.1584298490016;
 Sun, 15 Mar 2020 11:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200315134416.16527-1-sam@ravnborg.org> <20200315134416.16527-7-sam@ravnborg.org>
In-Reply-To: <20200315134416.16527-7-sam@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 15 Mar 2020 19:54:38 +0100
Message-ID: <CACRpkdYVrTBKxuHSGpd9=03oD4=JVxzJf8fOcQ8uu5eRt9PgAg@mail.gmail.com>
Subject: Re: [PATCH v1 06/36] dt-bindings: display: convert ilitek,ili9322 to
 DT Schema
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Alexandre Courbot <acourbot@nvidia.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Brian Masney <masneyb@onstation.org>,
        Chris Zhong <zyw@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        Guido Gunther <agx@sigxcpu.org>, Heiko Schocher <hs@denx.de>,
        Nikolaus Schaller <hns@goldelico.com>,
        Hoegeun Kwon <hoegeun.kwon@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lin Huang <hl@rock-chips.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        Marco Franchi <marco.franchi@nxp.com>,
        Marek Belisko <marek@goldelico.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Nickey Yang <nickey.yang@rock-chips.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Peter Rosin <peda@axentia.se>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Purism Kernel Team <kernel@puri.sm>,
        Robert Chiras <robert.chiras@nxp.com>,
        Sandeep Panda <spanda@codeaurora.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vinay Simha BN <simhavcs@gmail.com>,
        Werner Johansson <werner.johansson@sonymobile.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Mar 15, 2020 at 2:44 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> The .txt binding explains:
>
> "
>     The following optional properties only apply to
>     RGB and YUV input modes and
>     can be omitted for BT.656 input modes:
> "
>
> This constraint is not implmented in the DT Schema.
>
> The original binding from the .txt file referenced
> properties that is included in panel-timing.yaml.
> These properties are kept here as we want as close to a 1:1
> conversion as we can. If the properties should be dropped
> from the binding then this is a follow-up patch.
>
> The properties in question are:
>   - pixelclk-active
>   - de-active
>   - hsync-active
>   - vsync-active

Sorry about that. They should be dropped, but certainly it
is fine to do with a follow up patch.

>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
