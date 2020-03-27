Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C86C2D0E8
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 10:04:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 31E5720717
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 10:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fm1BGbXw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgC0KEN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 06:04:13 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33669 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgC0KEN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Mar 2020 06:04:13 -0400
Received: by mail-lj1-f195.google.com with SMTP id f20so9603900ljm.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2020 03:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qtl1Eialsdl3z7ZP76hLFrTUnrm/Xwed3O3Is0v5u2s=;
        b=fm1BGbXw3YbyFJAFmqHvsEnrwOu7+/+ujtJ86z5Orejx852KLJeCDtQq+soYhGzfCj
         2rAfF7PxQg2H2Sgjn2JBjFbILfIVHBT7QxDFDZh2R3HOuTeyVGc0fKnVbnrXO43QCj8x
         cXlH+JS+Jobqck2T5KLCJ/QxbIlZUnxiWcd/WFLXFPVgiIHA/VQnYBo2xwwlOuCaoBNf
         PV01d4t1H3eQqxbYRIT2/sc/hXgoikPd8X3chF1TEDLMvJhtp9ZecGoNxVyrMZXDYddu
         VUti7wxKuFzjCVhJlxMkwTw2df/O1qZUfem6Ydt42/5xj5qm4D1YHiUkYri/dNaN3Cn1
         sdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qtl1Eialsdl3z7ZP76hLFrTUnrm/Xwed3O3Is0v5u2s=;
        b=NBVE/XWBoUKpsQK7WxBKIYUhDE2PSXuojqrewsUPaPE/spA7yzVaIhPn0poHK2cmVn
         Au4RV1egUZRllgrGq8+EIcD3/ckWTDK3vTBYAjicRYSqaukIvaPu6BqavNbrJ6WScq8y
         Qj4TbVLZgcuXS5c0bGAiBOeZQ4ebcfVLKRybwp3LlsttlCGkwOH4KuNygSWhxeMqZoV1
         9ToMcX2HIOh4+HUV0GKdP5pWVTd+GPFpA6jBX/FjZtvRsqc9YsjnKzJt8w9g6WLcOR+f
         IXEFKTjrj8qrEbinR2aq8S4syNofYK8/MbmrTtzEbesZ4tiztTEhNSZ6y6hJKsQfwf2U
         An5A==
X-Gm-Message-State: AGi0PuaPEIflG8PPdjZX3eWbfKm5U0fkc7c6MC8SHsgR2IFxNplzG2D/
        srAQZXKF6pKHlyoEtblaed9z0xUQHWdK+5H6br6DDw==
X-Google-Smtp-Source: ADFU+vsLFzRSaI0mp4F0YlxEk/ZWtLbeZk2X0x8rIBWVbKHsUZE12xxYtPOS4x7TLee1muHrdP/vfqhKQcCaKg9I0tI=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr7696484ljh.258.1585303451336;
 Fri, 27 Mar 2020 03:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200317093922.20785-1-lkundrak@v3.sk> <20200317093922.20785-22-lkundrak@v3.sk>
In-Reply-To: <20200317093922.20785-22-lkundrak@v3.sk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:04:00 +0100
Message-ID: <CACRpkdaEnODObC7emg2M7Ayn_JkeLuc3HpV4VhJcwaZ+=sDLcg@mail.gmail.com>
Subject: Re: [PATCH 21/28] dt-bindings: gpio: Convert mrvl-gpio to json-schema
To:     Lubomir Rintel <lkundrak@v3.sk>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-media@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
        linux-rtc@vger.kernel.org,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Lubomir!

Excellent work! Just nitpicks:

On Tue, Mar 17, 2020 at 10:40 AM Lubomir Rintel <lkundrak@v3.sk> wrote:

> +++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
> @@ -0,0 +1,173 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/mrvl-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell PXA GPIO controller

This binding is lacking a license. Please use the dual GPL+BSD license
tag.

> +maintainers:
> +  - devicetree@vger.kernel.org

I don't know if Robert Jarzmik is in on maintaining this, would you accept
it Robert?

Yours,
Linus Walleij
