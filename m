Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3735C352A3
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 20:35:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6DCDF218AC
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 20:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581626116;
	bh=j7xkB4UBP/a4SB+tL6k6ZUvIyVPprRWnw43EzRyPaW8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=kqkDF6QUjrpEVjGQnNocku5lvHgxIeb8PoslWv1WeSTNewZQzivzeO03zdOVJiqhZ
	 65buMAHYQtW9/XzDu/ltuLGk5L6ccqBEXnX983pKZ0OvlYtlLul98ft2LDbQlf01tJ
	 nCj51nx+B0ZKKyYOR/FMVEiZmd8yllR7yG98Cv6A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgBMUfQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 15:35:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:44346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727722AbgBMUfP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 13 Feb 2020 15:35:15 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EEDF6222C2
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 20:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581626115;
        bh=j7xkB4UBP/a4SB+tL6k6ZUvIyVPprRWnw43EzRyPaW8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=auLiMZ2UtabEA2a0gidgvM/qpqynCtWAh2YJU5yJ6JQt11GPonS3ognsM5zCb4uDw
         el4WZgCjHqVZF95vmDZKMfHcarTLtL/jgViGwRj0WKxHUwBS8qBLUmwVEiJS39l0lQ
         jU5VxGLIoT06xND5Hn8pEkpEfCj+vFUnuxzABb00=
Received: by mail-qt1-f177.google.com with SMTP id l21so5414625qtr.8
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 12:35:14 -0800 (PST)
X-Gm-Message-State: APjAAAUPqF5wZ4I3Z1uSZhF2Sc9JxLmq3uVrtE8+H4tpIcyPuVJoSgxx
        0A/X3WgFAXP4SMvfqTr2/XU1OWlX+Mf4IuZtEw==
X-Google-Smtp-Source: APXvYqwqr4BVYshVjg/S/mtUAD4tutWsr+wyOQtF1RhL365vMoqi766XHHE1A6knTgq1BghE5fQpEY38ESYEixHRCEM=
X-Received: by 2002:ac8:5513:: with SMTP id j19mr13527148qtq.143.1581626114034;
 Thu, 13 Feb 2020 12:35:14 -0800 (PST)
MIME-Version: 1.0
References: <20200210092713.279105-1-linus.walleij@linaro.org> <20200210092713.279105-6-linus.walleij@linaro.org>
In-Reply-To: <20200210092713.279105-6-linus.walleij@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 13 Feb 2020 14:35:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLG4dR6aeY2bP9ihjALT8DmQ3tHQy2mYdZBNay6xxanjA@mail.gmail.com>
Message-ID: <CAL_JsqLG4dR6aeY2bP9ihjALT8DmQ3tHQy2mYdZBNay6xxanjA@mail.gmail.com>
Subject: Re: [PATCH 5/7] dt-bindings: arm: Add RealView YAML schema
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Feb 10, 2020 at 3:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This implements the top-level schema for the ARM RealView
> platforms.
>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/arm/arm,realview.yaml | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,realview.yaml

Same comments as patch 3 apply here...

>
> diff --git a/Documentation/devicetree/bindings/arm/arm,realview.yaml b/Documentation/devicetree/bindings/arm/arm,realview.yaml
> new file mode 100644
> index 000000000000..d6e85d198afe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,realview.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,realview.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM RealView Boards Device Tree Bindings
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |+
> +  The ARM RealView series of reference designs were built to explore the ARM
> +  11, Cortex A-8 and Cortex A-9 CPUs. This included new features compared to
> +  the earlier CPUs such as TrustZone and multicore (MPCore).
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: ARM RealView Emulation Baseboard (HBI-0140) was created
> +          as a generic platform to test different FPGA designs, and has
> +          pluggable CPU modules, see ARM DUI 0303E.
> +        items:
> +          - const: arm,realview-eb
> +      - description: ARM RealView Platform Baseboard for ARM1176JZF-S
> +          (HBI-0147) was created as a development board to test ARM TrustZone,
> +          CoreSight and Intelligent Energy Management (IEM) see ARM DUI 0425F.
> +        items:
> +          - const: arm,realview-pb1176
> +      - description: ARM RealView Platform Baseboard for ARM 11 MPCore
> +          (HBI-0159, HBI-0175 and HBI-0176) was created to showcase
> +          multiprocessing with ARM11 using MPCore using symmetric
> +          multiprocessing (SMP). See ARM DUI 0351E.
> +        items:
> +          - const: arm,realview-pb11mp
> +      - description: ARM RealView Platform Baseboard for Cortex-A8 (HBI-0178,
> +          HBI-0176 and HBI-0175) was the first reference platform for the
> +          Cortex CPU family, including a Cortex-A8 test chip.
> +        items:
> +          - const: arm,realview-pba8
> +      - description: ARM RealView Platform Baseboard Explore for Cortex-A9
> +          (HBI-0182 and HBI-0183) was the reference platform for the Cortex-A9
> +          CPU.
> +        items:
> +          - const: arm,realview-pbx
> +
> +  soc:
> +    description: All RealView boards must provide a soc node in the root of the
> +      device tree, representing the System-on-Chip since these test chips are
> +      rather complex.
> +    type: object
> +    properties:
> +      compatible:
> +        oneOf:
> +          - items:
> +            - const: arm,realview-eb-soc
> +            - const: simple-bus
> +          - items:
> +            - const: arm,realview-pb1176-soc
> +            - const: simple-bus
> +          - items:
> +            - const: arm,realview-pb11mp-soc
> +            - const: simple-bus
> +          - items:
> +            - const: arm,realview-pba8-soc
> +            - const: simple-bus
> +          - items:
> +            - const: arm,realview-pbx-soc
> +            - const: simple-bus

Can be simplified.

> +
> +    patternProperties:
> +      "^.*syscon@[0-9a-f]+$":
> +        type: object
> +        description: All RealView boards must provide a syscon system controller
> +          node inside the soc node.
> +        properties:
> +          compatible:
> +            oneOf:
> +              - items:
> +                - const: arm,realview-eb11mp-revb-syscon
> +                - const: arm,realview-eb-syscon
> +                - const: syscon
> +                - const: simple-mfd
> +              - items:
> +                - const: arm,realview-eb11mp-revc-syscon
> +                - const: arm,realview-eb-syscon
> +                - const: syscon
> +                - const: simple-mfd

These 2 can be 1 items list.

> +              - items:
> +                - const: arm,realview-eb-syscon
> +                - const: syscon
> +                - const: simple-mfd
> +              - items:
> +                - const: arm,realview-pb1176-syscon
> +                - const: syscon
> +                - const: simple-mfd
> +              - items:
> +                - const: arm,realview-pb11mp-syscon
> +                - const: syscon
> +                - const: simple-mfd
> +              - items:
> +                - const: arm,realview-pba8-syscon
> +                - const: syscon
> +                - const: simple-mfd
> +              - items:
> +                - const: arm,realview-pbx-syscon
> +                - const: syscon
> +                - const: simple-mfd

And these 5 1 items list.

> +
> +        required:
> +          - compatible
> +          - reg
> +
> +    required:
> +      - compatible
> +
> +required:
> +  - compatible
> +  - soc
> +
> +...
> --
> 2.23.0
>
