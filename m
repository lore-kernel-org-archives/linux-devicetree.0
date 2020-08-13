Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD9FC433E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 11:04:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C88620885
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 11:04:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fxWoJl9J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgHMLE3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Aug 2020 07:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgHMLE1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Aug 2020 07:04:27 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87BFC061757
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2020 04:04:26 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id l2so4869130wrc.7
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2020 04:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yr/mjxUpkY1c/lUEQ4SP0vPJpwMpzcQ8K8L8JyZm16M=;
        b=fxWoJl9JTcWAFzQ1sN5VdxEAh0+vy+RKj/GPr4K9n39MpVFGJgtH3nWpA8OodYIGth
         NsyH7Tpv3yBP6IBJ4tLRTo3IW2a1u3WTdiIdAbBMyDDXDWa3+JkCwDHtfldizY0aWP5Q
         AFK/ZtlexDndbpRgHmUyk8au5r50q8hI5wjeaddIHyApGiakM8Dvi/UTSafE3x+18WE1
         2/BWnVeGi2Ad7IJgUxhNWYSmLNPVJBF5tzU7Ocpx2l6pVtLHU/wWKHmwDkzo5HJzP+Fv
         gApHSKr49LFFy409Wv4bkKbZ8dgeq8NI9q5kjrRic/s+9VER6Rp+m/sI1YI5d8J6Hs8L
         LzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yr/mjxUpkY1c/lUEQ4SP0vPJpwMpzcQ8K8L8JyZm16M=;
        b=ccf0vwx4CBkDj+jLdv5oal/EKvo0SNE1g+ZLp/AzL5jOzW+J/+L1Nxj5MvGkBfX5cK
         OIeDFVkJoGablHi/tsqQctV+plVBRn9OWXxbwpBLqQRHwoGHmde7hykYYeVAxuPv8xxJ
         G0TMZ9qAzwiu1Yi5rW79wTTHONI48KX9ITC0+2PjGUhunrGgEyzn1aX7a19m72q0p4EQ
         1GocgxdEY8OVRAaaGz91JPfJp8++0eiP1ETp2ppyLsNy1oQzPXIIFU5xUmx27+qecr/B
         H8oX9ls9X61Nh/ChrCK6Ca5fiLuoGMj7+wXop3QpAtONixgYpK8gB4hY/4JPo1sr8G1K
         k2JA==
X-Gm-Message-State: AOAM531lbep+gWMhavO9npsvdqktKnZJQFryxxNa7bUDOUSi5my5sswl
        N3AfPHBR1AZM1s8d66UezaT/d0aepn6SbA==
X-Google-Smtp-Source: ABdhPJzdRWVo06phdhDhcFTY+xzsyPi1aU0HqVp/y5mvmsroDBpq9Cj/8/vse5cbsqFkG/0X6oF3kA==
X-Received: by 2002:adf:c552:: with SMTP id s18mr3415074wrf.209.1597316665325;
        Thu, 13 Aug 2020 04:04:25 -0700 (PDT)
Received: from holly.lan (82-132-221-219.dab.02.net. [82.132.221.219])
        by smtp.gmail.com with ESMTPSA id z8sm8642091wmf.10.2020.08.13.04.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 04:04:24 -0700 (PDT)
Date:   Thu, 13 Aug 2020 12:04:22 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/3 v2] dt-bindings: backlight: Add some common backlight
 properties
Message-ID: <20200813110422.25fkbqfldehncjzs@holly.lan>
References: <20200812085850.2643820-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812085850.2643820-1-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 12, 2020 at 10:58:48AM +0200, Linus Walleij wrote:
> Let's use a common.yaml include for the backlight like we do with
> the LEDs. The LEDs are inherently incompatible so their bindings
> cannot be reused for backlight.
> 
> Cc: devicetree@vger.kernel.org
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - New patch as suggested by Sam.
> ---
>  .../bindings/leds/backlight/common.yaml       | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/common.yaml b/Documentation/devicetree/bindings/leds/backlight/common.yaml
> new file mode 100644
> index 000000000000..8ae7e3818b0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/common.yaml
> @@ -0,0 +1,42 @@
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
> +description: |
> +  Backlight devices provide backlight for different types of graphical
> +  displays. They are typically but not necessarilt implemented using a white
> +  LED powered by a boost converter.
> +
> +properties:
> +  default-on:
> +    description:
> +      The initial state of the backlight can be set to be on with this
> +      property. This is a state applied by the operating system so that the
> +      backlight is always turned on at boot.

Is default-on really a common property? I would describe it as legacy
that emerged when we added the gpio bindings and didn't spell
default-brightness correctly!

Currently I think this is only implemented for GPIO and it is simply
not needed for most hardware. More specifically, for hardware that is
capable of flicker-free handover (bootloader -> kernel) by examining
the hardware state at handover then we don't want a DT property. It is
duplicative and can only result in bad handovers.


Daniel.
