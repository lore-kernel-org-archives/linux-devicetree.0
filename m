Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C93C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 16:37:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 441352054F
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 16:37:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P1eiFlVO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729969AbgHTQhk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 12:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728987AbgHTQhe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 12:37:34 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1BAC061385
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 09:37:33 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u18so2176297wmc.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 09:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=phxeP4MV+AZQ9kUQVMqGmzO05ejp2HQBRzK/nNCK9N8=;
        b=P1eiFlVOgLxo3DkLBmkvbq9UU2VuBQjg54RT5Y5dw+W8OxcnIUE3hO6QOPd1YNJvLu
         AMOWO50dSluF5lWqUfL5f/cYUXvV8LBj34xpRzWwbZCO+wqQ+xRurb+mJrpf6Z8yGxqH
         waMfOmcesXpwEG03SI2gDqo7ozpdeiNEgQTm8q2mumcuOQuc9qma1pOBCkUMX4RjAxky
         ldRBYJK8uGJd1riL0etiRUXMxlXM9twIZHQhxg3WXuKCQOC6qKq3KNlEdk3z0SCA3AWI
         bfLzyXbGIh82VQX9kJVDSZZ8GQbkaLjdzOSKAK3UAtoUrwZ68LiwbGFf9t2mylJd0cpn
         wFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=phxeP4MV+AZQ9kUQVMqGmzO05ejp2HQBRzK/nNCK9N8=;
        b=Sl6nBBq1lQfRVSEzOaMzOpB+I2XOjQeQZWORswlg3VOyiIvR/WQlBZQovUXsD72Alc
         +86VUjB2Qezm6Uvepsb/4Flk4iGCcPlUAiMvoTzbWg9CXL4KKg9rh7eGYIxmPE8Vvr4h
         Zmxyr6diN5LmsXNBKKzETpZMhEFEzG1zgfprK0xUPgnan9WzBptWODnT2VvQbWOIK06Y
         La3qNTHTHjcaISB19cNLDEoCZKzMsTQ82I6dveHcMLO+D9k5tNxnzx8lKZFY5MbtdvL3
         OstR08WCRL2egYB84BpUSEeJDc47VrYTojdOzHC9n6s5YjvYAJCTVzUgUMi3XvJYn4kj
         nuIQ==
X-Gm-Message-State: AOAM530DUbJj3VHojFpXO64gYb8xS2gOjuz7e1EjrO1Fj0VuAHeDuDZJ
        DYKdaOEWjjUSS8c8PTwtARIy6A==
X-Google-Smtp-Source: ABdhPJyFLmeHBDicbx7M1ykYXBGiA8dKvHpRmhTK+h59Do0inB8TCK9Hde0p8vsSnS1TSDj/XbEkvg==
X-Received: by 2002:a05:600c:410b:: with SMTP id j11mr4487705wmi.38.1597941452130;
        Thu, 20 Aug 2020 09:37:32 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id a188sm5520953wmc.31.2020.08.20.09.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 09:37:31 -0700 (PDT)
Date:   Thu, 20 Aug 2020 17:37:29 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/3 v3] dt-bindings: backlight: Add some common backlight
 properties
Message-ID: <20200820163729.eq6vqmi3z6fcazd4@holly.lan>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819205150.164403-1-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 19, 2020 at 10:51:48PM +0200, Linus Walleij wrote:
> Let's use a common.yaml include for the backlight like we do with
> the LEDs. The LEDs are inherently incompatible so their bindings
> cannot be reused for backlight.
> 
> Cc: devicetree@vger.kernel.org
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> ChangeLog v2->v3:
> - Drop the | for the description
> - Drop the "default-on" property, we're not using it.
> - Drop the minimum 0 for unsigned u32:s
> ChangeLog v1->v2:
> - New patch as suggested by Sam.
> ---
>  .../bindings/leds/backlight/common.yaml       | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/common.yaml b/Documentation/devicetree/bindings/leds/backlight/common.yaml
> new file mode 100644
> index 000000000000..4e7e95e331a5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/common.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common backlight properties
> +
> +maintainers:
> +  - Lee Jones <lee.jones@linaro.org>
> +  - Daniel Thompson <daniel.thompson@linaro.org>
> +  - Jingoo Han <jingoohan1@gmail.com>
> +
> +description:
> +  Backlight devices provide backlight for different types of graphical
> +  displays. They are typically but not necessarily implemented using a white
> +  LED powered by a boost converter.
> +
> +properties:
> +  default-brightness:
> +    description:
> +      The default brightness that should be applied to the LED by the operating
> +      system on start-up. The brightness should not exceed the brightness the
> +      LED can provide.
> +    $ref: /schemas/types.yaml#definitions/uint32
> +
> +  max-brightness:
> +    description:
> +      Normally the maximum brightness is determined by the hardware and this
> +      property is not required. This property is used to put a software limit
> +      on the brightness apart from what the driver says, as it could happen
> +      that a LED can be made so bright that it gets damaged or causes damage
> +      due to restrictions in a specific system, such as mounting conditions.
> +    $ref: /schemas/types.yaml#definitions/uint32
> -- 
> 2.26.2
> 
