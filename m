Return-Path: <SRS0=wVrF=AS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B927C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 11:28:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4555220738
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jul 2020 11:28:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zWnIc6qo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbgGGL25 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jul 2020 07:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgGGL25 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jul 2020 07:28:57 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB0AC08C5DB
        for <devicetree@vger.kernel.org>; Tue,  7 Jul 2020 04:28:56 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id 9so49419898ljv.5
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2020 04:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l2GgGCQ4x2LNmv5qReFPVJw3khTbvSjXsD6wjYhQb7Y=;
        b=zWnIc6qofdCS9+DTAqiP2mYvfUMkKgNtY66044wIi1kMyF/YMWbTeAbp88neTmKAjg
         l4NVDAG1dEwiaZezcxnW8k9KINZmV3DJhoBAYyDImmbwzinIrmh6319oyq9VSJrczDFj
         mPkPKQ+JVKQJ33Pteub5ITH+KNCisvIOs2eDRq6lSy77ixWfNBm3/AbIu8/LYHSFisNL
         G4SQZdmMtzLpXK3Qo0STr2ZXBrJwTBjBoXIRtxft8IFNK/uVuvwcO82ILEZdRuaaiem9
         jwKqcIxMoUt6Nehc4S6/Wx9bgRY/ZxA1UbCtjfTs8v5QmYf6Ip9JPYGynYjONYsadalI
         Dzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l2GgGCQ4x2LNmv5qReFPVJw3khTbvSjXsD6wjYhQb7Y=;
        b=qThTTXXBjKfQuNHw0wxegsV92N7fi3YJtaZBATYVoOq+LJEvYYDLMge9I/MKhFwzfM
         Gc4zXUbKZ4eNNPtlHj9wYe7W5supKNhuihOZQSbIU08Ppp+EEkliDZxx/dfcjyopoQtg
         qVvBDGkVKVoEE3xSUEf9hfUYS147/tIyy00Yeo/Swodk0yyOgdl1KHqZOz0U9sCtIWYN
         ohXcQ9NMBO8RC7PvFT2Ac9xhwX47BI9GxKRw+q5Vfb9HtshkSAX0s8qx1uoGXNruRDS6
         3kS3Jx4STXQMqyKBTm7j8jIlvgnFhrKsHHQgZv0E82/eyb92u22RbdPFndXCr7bTvVJR
         XmPw==
X-Gm-Message-State: AOAM533/PY/lxkOkAnlhWrWDAp+GlYCjbD1waPUHs/M/mmB0fMp8mx2K
        uoJlwWfLOXwRXbNFz++XmKd3HQQaP2jeQ1p8mN/M7uuBg7m6YQ==
X-Google-Smtp-Source: ABdhPJzwnbeGJl04zq1MZBixqaru16oyOK4a5p7qERMrlxVnC8ulTiRIAiMfY3IMS44ahKysxRy+Eg/cXIDkrrO8/XM=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr13972698ljc.104.1594121335310;
 Tue, 07 Jul 2020 04:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200609162621.1769610-1-thierry.reding@gmail.com>
In-Reply-To: <20200609162621.1769610-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 13:28:44 +0200
Message-ID: <CACRpkdY=rVH03i+JsLuiDKa_BSU57ZNdBNHGv6avuC-AkPZkMQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: max77620: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Thierry,

thanks for doing this!

On Tue, Jun 9, 2020 at 6:26 PM Thierry Reding <thierry.reding@gmail.com> wrote:

>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max77620.txt
>  delete mode 100644 Documentation/devicetree/bindings/mfd/max77620.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/max77620.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
>  delete mode 100644 Documentation/devicetree/bindings/regulator/regulator-max77620.txt
>  delete mode 100644 Documentation/devicetree/bindings/thermal/max77620_thermal.txt

So everything goes in under the MFD node now I suppose (why not).

> diff --git a/Documentation/devicetree/bindings/mfd/max77620.yaml b/Documentation/devicetree/bindings/mfd/max77620.yaml
(...)
> +patternProperties:
> +  "^gpio(@[0-9]+)?$":
> +    type: object
> +    properties:
> +      gpio-hog:
> +        $ref: "/schemas/types.yaml#/definitions/flag"
> +
> +      output-high:
> +        $ref: "/schemas/types.yaml#/definitions/flag"
> +
> +      gpios:
> +        $ref: "/schemas/types.yaml#/definitions/uint32-matrix"

This looks strange. ^gpio(@[0-9]+)?$ seems like the node for
the gpio-controller per se, and that should have a subnode for
the hog, but this makes it look like that hog is directly in the
gpio controller node.

The current gpio.txt lists this example:

        qe_pio_a: gpio-controller@1400 {
                compatible = "fsl,qe-pario-bank-a", "fsl,qe-pario-bank";
                reg = <0x1400 0x18>;
                gpio-controller;
                #gpio-cells = <2>;

                line_b {
                        gpio-hog;
                        gpios = <6 0>;
                        output-low;
                        line-name = "foo-bar-gpio";
                };
        };

I know I should make a generic gpio.yaml include you can just
use for all of this but you know ... time. (Volunteers welcome!)

> +  "^pinmux(@[0-9]+)?$":
> +    type: object
> +    patternProperties:
> +      "^gpio[0-7_]+$":
> +        type: object
> +        properties:
> +          pins:
> +            items:
> +              pattern: "^gpio[0-7]$"
> +            minItems: 1
> +            maxItems: 8
> +
> +          function:
> +            $ref: "/schemas/types.yaml#/definitions/string"
> +            enum:
> +              - gpio
> +              - lpm-control-in
> +              - fps-out
> +              - 32k-out1
> +              - sd0-dvs-in
> +              - sd1-dvs-in
> +              - reference-out
> +
> +          drive-push-pull:
> +            $ref: "/schemas/types.yaml#/definitions/uint32"
> +            enum: [ 0, 1 ]
> +
> +          drive-open-drain:
> +            $ref: "/schemas/types.yaml#/definitions/uint32"
> +            enum: [ 0, 1 ]
> +
> +          bias-pull-up:
> +            $ref: "/schemas/types.yaml#/definitions/uint32"
> +            enum: [ 0, 1 ]
> +
> +          bias-pull-down:
> +            $ref: "/schemas/types.yaml#/definitions/uint32"
> +            enum: [ 0, 1 ]

This seems to reinvent large parts of Rob's already provided:
Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml

So just $ref-include these instead. See other bindings for examples.
Since this is placed in mfd you might need some ../pinctrl... path.

Yours,
Linus Walleij
