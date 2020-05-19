Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83250C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 13:38:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6146D207FB
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 13:38:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="i1O08/bx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728725AbgESNiS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 09:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727904AbgESNiR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 09:38:17 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 504E6C08C5C2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 06:38:17 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id g4so13749657ljl.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 06:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uAKZAwd0Bsu5eMrKgCGYzypp282aFndHsMyiyLkrN6U=;
        b=i1O08/bxxOIrq419RAam2H5dwyFSgdcXiVSWk/U9KA3KeR3RWo8ArMEwsE8E3RWSYe
         Nd9/wMHI6sKfImJVRIxqWMaH/J27XjwU6drh068zhHNWyw2vm2xpQ6PTymfvKYwLWGv2
         chtMjuj/0I0ek1LnDJpo4paJ4t4JrcMBhtFd1HDgVouQ7J1j+NK72ChYsO+ai/fNmQhi
         T1hMIS1C/Ad0kLQzK6GW57GzRmpc8W80CHkP5DrAHBW7wRe51TvZQw6OzOBTMCxWC5Ik
         8q5GVlxdufQ2S4U8p9aO5ZKPbfNi8aQiiGXVEYhVClV1yHipzINJiyMsCgK2j/2BGCb8
         QFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uAKZAwd0Bsu5eMrKgCGYzypp282aFndHsMyiyLkrN6U=;
        b=GumQt5O8hNO5o/xyyNdW6E3d/8O92YiLF61qVn6cedSK4QIudTZf1Fa5qgllMr6sM7
         Q0c+gj14LBNbjdKHuDg7aEQV1Ny2afCHS/F8gFBma/gCrpCoUsSy9Krf2GrTi3YXkYeR
         yRlyKr6FOvPjmgprMfqmSW4diFp4ciNue+FJgHGND+Mq+srjp5L/xYz1qI5tiYcDcvKv
         aYGa+Kqx0opx43NIhc8qWSp6g54BdoX0hrKFVfCEXTyFoZo1/9QbFVExWTlsQe2p27Mp
         h34uZCEJiLJHsR1e2a3VkxpntYpSdqNnuon0nv9Rdi+jqUt2RhwcrzZg6qG51B+6GlD9
         biCg==
X-Gm-Message-State: AOAM531SEsyHraAjbstI8yWOMFnm3vn5PqC0CU9DGKGgvgpdLnK6nm50
        i4/n3Dtp8OMUxGZhajTeiprBHA==
X-Google-Smtp-Source: ABdhPJz1M+HZa6KTbp/Wm84AK/1i26pnGh8Q1KoAtFwzKht/E1RMhyzFVXiOnhMnaUCobafo0iBHiQ==
X-Received: by 2002:a2e:b4d0:: with SMTP id r16mr13906902ljm.129.1589895495703;
        Tue, 19 May 2020 06:38:15 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id w14sm4834468lfe.65.2020.05.19.06.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 06:38:15 -0700 (PDT)
Date:   Tue, 19 May 2020 15:38:14 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Add renesas,em-gio bindings
Message-ID: <20200519133814.GE470768@oden.dyn.berto.se>
References: <20200519081157.29095-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200519081157.29095-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2020-05-19 10:11:57 +0200, Geert Uytterhoeven wrote:
> Document Device Tree bindings for the Renesas EMMA Mobile General
> Purpose I/O Interface.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../bindings/gpio/renesas,em-gio.yaml         | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
> new file mode 100644
> index 0000000000000000..8bdef812c87c3771
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/renesas,em-gio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas EMMA Mobile General Purpose I/O Interface
> +
> +maintainers:
> +  - Magnus Damm <magnus.damm@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: renesas,em-gio
> +
> +  reg:
> +    items:
> +      - description: First set of contiguous registers
> +      - description: Second set of contiguous registers
> +
> +  interrupts:
> +    items:
> +      - description: Interrupt for the first set of 16 GPIO ports
> +      - description: Interrupt for the second set of 16 GPIO ports
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  ngpios:
> +    minimum: 1
> +    maximum: 32
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +  - ngpios
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    gpio0: gpio@e0050000 {
> +            compatible = "renesas,em-gio";
> +            reg = <0xe0050000 0x2c>, <0xe0050040 0x20>;
> +            interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            gpio-ranges = <&pfc 0 0 32>;
> +            ngpios = <32>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +    };
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
