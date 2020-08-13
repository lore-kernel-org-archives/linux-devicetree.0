Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330E3C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 10:48:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BFD720791
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 10:48:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AOEwEckN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgHMKsj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Aug 2020 06:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgHMKsg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Aug 2020 06:48:36 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D1BC061757
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2020 03:48:35 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a5so4831168wrm.6
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2020 03:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=91/AI0gNRUqBMyl6qtmeLnkoBIi9LSCzGaFUbAh/Vjc=;
        b=AOEwEckNS1QRuUdtT81HZEYZViK/Tuiux10NJIdQOo9TW/TApIckkHPDHQaldN1idp
         vLVpGrQHm+FrpiU+qRZM1cfmCb7FZLJ6N30TdGTq59o+V4agaY2F7YrEvJdrxl4zbs3h
         ttkjaamAt5B2V2BqtVmTJGCVO1p8lnZ/JMQf1IKzf1RD+gxPwNx7OqM0RYd91LNH96EL
         AL9PX5g6PmD7TuVxlcULn9jMQG0c5q6UUaVgak+Sd9DG/+wYghKSzBIhh/dUNdiKK+Ba
         PCL8VfX2TGT48g77eib+mqv3574lfEkJ1QzG/T/MN4a55UQjJLfIu9xhYM6vgiJHo5ol
         90ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=91/AI0gNRUqBMyl6qtmeLnkoBIi9LSCzGaFUbAh/Vjc=;
        b=I0YTbGKvM1IKxH/pSORGoDPQebwUeFUMrFtbzPXw/GulwsU/jMBTUf9BN42cqK00Aa
         4nWQoP/2iM+zzIeNlYrsJmmtkucr22aSYfvMkAEUGrUg7gc6dPeQZx1N9ZsfBe+Olvm7
         Gm8BDXS6rIcjPq3cjkyEyFLjKg6pqCYaXnWJyEkQjTkDIgIX1Ty08wh2QjpQ7Gb0NvGA
         mtg0RJRl8azz5QNmgHPPaK3GXAm4/gcgP5+lybiETy5zSlJQccSEZJH8BwiKrslMiZ2x
         W7G8FgbMm+8u/RAznDTdbh1bYdo8dz6pH+xOzaANYub+Lqgn7jXqasUf2xtXAUdkW+B8
         xl9w==
X-Gm-Message-State: AOAM532K3xNGufqbzdjmo2q0ENqUYHxpLVAnI1/iPE9xvr8qKVxzUbqQ
        Hslmr82oecewWYAo70WMlpm3hE6MtuVkXw==
X-Google-Smtp-Source: ABdhPJzGisR/fuG5Cc/MqxRdmLj13Sv6i1inzq1f6Ud2vfUfhE8sLo7lnJtvJAqClM/spxV1TRHQAQ==
X-Received: by 2002:adf:f248:: with SMTP id b8mr3670301wrp.247.1597315714210;
        Thu, 13 Aug 2020 03:48:34 -0700 (PDT)
Received: from holly.lan (82-132-221-219.dab.02.net. [82.132.221.219])
        by smtp.gmail.com with ESMTPSA id i4sm9586845wrw.26.2020.08.13.03.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 03:48:33 -0700 (PDT)
Date:   Thu, 13 Aug 2020 11:48:31 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/3 v2] dt-bindings: backlight: Add Kinetic KTD253
 bindings
Message-ID: <20200813104831.td44b6wmnx4shwhr@holly.lan>
References: <20200812085850.2643820-1-linus.walleij@linaro.org>
 <20200812085850.2643820-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812085850.2643820-2-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 12, 2020 at 10:58:49AM +0200, Linus Walleij wrote:
> This adds device tree bindings for the Kinetic KTD253
> white LED backlight driver.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Create common.yaml for backlight as suggested by Sam and
>   use that.
> - Rename the GPIO line "enable-gpios"
> ---
>  .../leds/backlight/kinetic,ktd253.yaml        | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> new file mode 100644
> index 000000000000..e17f45a2a6bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktd253.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kinetic Technologies KTD253 one-wire backlight
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  The Kinetic Technologies KTD253 is a white LED backlight that is
> +  controlled by a single GPIO line. If you just turn on the backlight
> +  it goes to maximum backlight then you can set the level of backlight
> +  using pulses on the enable wire. This is sometimes referred to as
> +  "expresswire".
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    const: kinetic,ktd253
> +
> +  enable-gpios:
> +    description: GPIO to use to enable/disable and dim the backlight.
> +    maxItems: 1
> +
> +  default-on: true

What use is default-on here?

I'm guessing not much because there is no code in the driver to consume
it!

If there is a need to arrange a flicker-free backlight handover then
we should only use DT to handle that if the approach taken by other
drivers is not feasible (this is best demonstrated by
pwm_backlight_initial_power_state() ).

In short the approach is if not DT or no phandle link then turn the
backlight on (because noone else will) otherwise look at the current state
of the hardware and use that to inherit the power state (that is power
state, not brightness level).

To be honest flicker-free handover looks pretty hard for this driver.
It looks like we would have to flicker at some point so that we can
know exactly what brightness the hardware currently is.


Daniel.


> +  default-brightness: true
> +  max-brightness: true
> +
> +required:
> +  - compatible
> +  - enable-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    backlight {
> +        compatible = "kinetic,ktd253";
> +        enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
> +        default-on;
> +        default-brightness = <160>;

160 is out of range...


Daniel.
