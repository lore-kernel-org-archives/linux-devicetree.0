Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7062BC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 15:46:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A6C2207F7
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 15:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597247189;
	bh=8zjj45MDp5uQvFTIaQ4Tbj5ME5iYtUQlAllvKOxs1Bs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=0NvCVD3YXQZwa7VKZUzGKLLIJNJddfEd7+LyLyD2ipmUzqzq0DvGXH8z2qBPIi7xw
	 WGY6x7w55etNosKnsluAuNG0pkvANda+8TlaGXyBXD/SNYQEHWDvfT/rdOKGXwJooh
	 i/gnke/D8ELWkNjPVwUOT0uTdsjWFoYqvje/es1Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgHLPq3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 11:46:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:60068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726226AbgHLPq2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Aug 2020 11:46:28 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B05752080C
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 15:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597247187;
        bh=8zjj45MDp5uQvFTIaQ4Tbj5ME5iYtUQlAllvKOxs1Bs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BU8KmdYOmx+Vc1hjIb4NWSAP8FA5RL1ADwPVMH3fhrd4N0mF+Dux1/ttl2cVM+5ZH
         +uTukZXYWmH3q+5RbVPq1653WFW9YLMiQUg/iDe6WuwHUsBBHzuhYAf2nZalBVoaaB
         Y/LFI7wM5+Yq6cvNj0o1ocif7wzBMEMGHr7MNwLg=
Received: by mail-ot1-f54.google.com with SMTP id e11so2302970otk.4
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 08:46:27 -0700 (PDT)
X-Gm-Message-State: AOAM533J89gg0ZaYPFRBVYTFJg5nptiJvCdF3T53nwzEdOODfzf5PkjU
        /2Mht/3rFbvnLN7omSw3xrsfDjR4giU5tzJq5w==
X-Google-Smtp-Source: ABdhPJzIkz9fmUdhrhBihVEGFcNSEOVjprI3/DwicQgScfWx9wnTC83ZYLmwHWg/jDB8At5B5/84auzV3ufT8ZC6jHM=
X-Received: by 2002:a05:6830:1d8e:: with SMTP id y14mr261568oti.129.1597247187002;
 Wed, 12 Aug 2020 08:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200812085850.2643820-1-linus.walleij@linaro.org>
In-Reply-To: <20200812085850.2643820-1-linus.walleij@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 12 Aug 2020 09:46:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLR3HEsbuNq7i+N3ETYVoMtUP90_Ev=tO8GJr+fF4QHWQ@mail.gmail.com>
Message-ID: <CAL_JsqLR3HEsbuNq7i+N3ETYVoMtUP90_Ev=tO8GJr+fF4QHWQ@mail.gmail.com>
Subject: Re: [PATCH 1/3 v2] dt-bindings: backlight: Add some common backlight properties
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 12, 2020 at 2:58 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
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

I'd expect some refactoring here with existing backlight schemas
including the ones I just added for 5.9.

Ideally, we shouldn't have any property have a type definition more
than once. (We don't have any way to detect that though it wouldn't be
hard to write a program to do so).

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

You don't need '|' if there's no formatting to preserve.

> +  Backlight devices provide backlight for different types of graphical
> +  displays. They are typically but not necessarilt implemented using a white

typo

> +  LED powered by a boost converter.
> +
> +properties:
> +  default-on:
> +    description:
> +      The initial state of the backlight can be set to be on with this
> +      property. This is a state applied by the operating system so that the
> +      backlight is always turned on at boot.

Needs a type.

> +
> +  default-brightness:
> +    description:
> +      The default brightness that should be applied to the LED by the operating
> +      system on start-up. The brightness should not exceed the brightness the
> +      LED can provide.
> +    $ref: /schemas/types.yaml#definitions/uint32
> +    minimum: 0

It's an unsigned int, so the min is already 0.

> +
> +  max-brightness:
> +    description:
> +      Normally the maximum brightness is determined by the hardware and this
> +      property is not required. This property is used to put a software limit
> +      on the brightness apart from what the driver says, as it could happen
> +      that a LED can be made so bright that it gets damaged or causes damage
> +      due to restrictions in a specific system, such as mounting conditions.
> +    $ref: /schemas/types.yaml#definitions/uint32
> +    minimum: 0
