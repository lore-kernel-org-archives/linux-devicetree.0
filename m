Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A92C35E0D
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 17:02:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7BEC62084E
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 17:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582650137;
	bh=75rI8LJmFs7QbzNmjVJ9AEsY1DNPaa6kw0Pwevj0c3c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=CfrWq8WsGYcA74o/BrG6nOI5eoNIwWMKOVQJLyrvaCWY5TfxNoeu3mcQ5APID07QM
	 mx2X3gUvwWyKM9Z7IGz0A5VKGqv6ZpAIzg+rSUlnl/PAiiCDkCJanLokmNdW/75M3v
	 1BY9GDY9oy0C2DZOV1Cz/0+l7rVk1UwIthOGizUA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731189AbgBYRCQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 12:02:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:60944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728367AbgBYRCQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 25 Feb 2020 12:02:16 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 887CA2082F;
        Tue, 25 Feb 2020 17:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582650135;
        bh=75rI8LJmFs7QbzNmjVJ9AEsY1DNPaa6kw0Pwevj0c3c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=umgLCf9r6yrDoDODUJSd1dm7BAwlz5HvQLa7XNyIAGiaJ4lnw82tO0uWDeoNz+GKV
         EIXQQa2atMtWePB4tLViFbeQ0+ppLxNOCJuvSXAMIIJf1OH1rhvRPzEBqkQO87uPAL
         MDuWcFYhKMhU8qw/AgiMv4BpY80NsB/UoHBl159k=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200224152640.1318-1-geert+renesas@glider.be>
References: <20200224152640.1318-1-geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: clock: renesas: cpg-mssr: Convert to json-schema
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 25 Feb 2020 09:02:14 -0800
Message-ID: <158265013473.177367.4512247165308399202@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Geert Uytterhoeven (2020-02-24 07:26:40)
> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yam=
l b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> new file mode 100644
> index 0000000000000000..dfbd1933f1bc56de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> @@ -0,0 +1,204 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Renesas Clock Pulse Generator / Module Standby and Software Reset
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description: |
> +  On Renesas ARM SoCs (SH/R-Mobile, R-Car, RZ), the CPG (Clock Pulse Gen=
erator)
> +  and MSSR (Module Standby and Software Reset) blocks are intimately con=
nected,
> +  and share the same register block.
> +
> +  They provide the following functionalities:
> +    - The CPG block generates various core clocks,
> +    - The MSSR block provides two functions:
> +        1. Module Standby, providing a Clock Domain to control the clock=
 supply
> +           to individual SoC devices,
> +        2. Reset Control, to perform a software reset of individual SoC =
devices.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r7s9210-cpg-mssr  # RZ/A2
> +      - renesas,r8a7743-cpg-mssr  # RZ/G1M
> +      - renesas,r8a7744-cpg-mssr  # RZ/G1N
> +      - renesas,r8a7745-cpg-mssr  # RZ/G1E
> +      - renesas,r8a77470-cpg-mssr # RZ/G1C
> +      - renesas,r8a774a1-cpg-mssr # RZ/G2M
> +      - renesas,r8a774b1-cpg-mssr # RZ/G2N
> +      - renesas,r8a774c0-cpg-mssr # RZ/G2E
> +      - renesas,r8a7790-cpg-mssr  # R-Car H2
> +      - renesas,r8a7791-cpg-mssr  # R-Car M2-W
> +      - renesas,r8a7792-cpg-mssr  # R-Car V2H
> +      - renesas,r8a7793-cpg-mssr  # R-Car M2-N
> +      - renesas,r8a7794-cpg-mssr  # R-Car E2
> +      - renesas,r8a7795-cpg-mssr  # R-Car H3
> +      - renesas,r8a7796-cpg-mssr  # R-Car M3-W
> +      - renesas,r8a77961-cpg-mssr # R-Car M3-W+
> +      - renesas,r8a77965-cpg-mssr # R-Car M3-N
> +      - renesas,r8a77970-cpg-mssr # R-Car V3M
> +      - renesas,r8a77980-cpg-mssr # R-Car V3H
> +      - renesas,r8a77990-cpg-mssr # R-Car E3
> +      - renesas,r8a77995-cpg-mssr # R-Car D3
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2

Do we need this here and also below? Why can't it just be below with the
more specific constraints?

> +
> +  '#clock-cells':
> +    description: |
> +      - For CPG core clocks, the two clock specifier cells must be "CPG_=
CORE"
> +        and a core clock reference, as defined in
> +        <dt-bindings/clock/*-cpg-mssr.h>
> +      - For module clocks, the two clock specifier cells must be "CPG_MO=
D" and
> +        a module number, as defined in the datasheet.
> +    const: 2
> +
> +  '#power-domain-cells':
> +    description:
> +      SoC devices that are part of the CPG/MSSR Clock Domain and can be
> +      power-managed through Module Standby should refer to the CPG devic=
e node
> +      in their "power-domains" property, as documented by the generic PM=
 Domain
> +      bindings in Documentation/devicetree/bindings/power/power-domain.y=
aml.
> +    const: 0
> +
> +  '#reset-cells':
> +    description:
> +      The single reset specifier cell must be the module number, as defi=
ned in
> +      the datasheet.
> +    const: 1
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            enum:
> +              - renesas,r7s9210-cpg-mssr
> +              - renesas,r8a774c0-cpg-mssr
> +              - renesas,r8a7792-cpg-mssr
> +              - renesas,r8a77990-cpg-mssr
> +              - renesas,r8a77995-cpg-mssr
> +
> +    then:
> +      properties:
> +        clock:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +          items:
> +            - const: extal
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r8a7743-cpg-mssr
> +              - renesas,r8a7744-cpg-mssr
> +              - renesas,r8a7745-cpg-mssr
> +              - renesas,r8a77470-cpg-mssr
> +              - renesas,r8a7790-cpg-mssr
> +              - renesas,r8a7791-cpg-mssr
> +              - renesas,r8a7793-cpg-mssr
> +              - renesas,r8a7794-cpg-mssr
> +
> +    then:
> +      properties:
> +        clock:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +          items:
> +            - const: extal
> +            - const: usb_extal
> +
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            enum:
> +              - renesas,r8a774a1-cpg-mssr
> +              - renesas,r8a774b1-cpg-mssr
> +              - renesas,r8a7795-cpg-mssr
> +              - renesas,r8a7796-cpg-mssr
> +              - renesas,r8a77961-cpg-mssr
> +              - renesas,r8a77965-cpg-mssr
> +              - renesas,r8a77970-cpg-mssr
> +              - renesas,r8a77980-cpg-mssr
> +
> +    then:
> +      properties:
> +        clock:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +          items:
> +            - const: extal
> +            - const: extalr
> +
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            items:
> +              enum:
> +                - renesas,r7s9210-cpg-mssr
> +    then:
> +      required:
> +        - '#reset-cells'

It may make sense to split this binding up into multiple bindings so
that we don't have deeply nested if/else/then.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // CPG device node:
> +
> +    cpg: clock-controller@e6150000 {
> +            compatible =3D "renesas,r8a7795-cpg-mssr";
> +            reg =3D <0xe6150000 0x1000>;
> +            clocks =3D <&extal_clk>, <&extalr_clk>;
> +            clock-names =3D "extal", "extalr";
> +            #clock-cells =3D <2>;
> +            #power-domain-cells =3D <0>;
> +            #reset-cells =3D <1>;
> +    };
> +
> +  - |
> +    // CPG/MSSR Clock Domain member device node:
> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    scif2: serial@e6e88000 {
> +            compatible =3D "renesas,scif-r8a7795", "renesas,rcar-gen3-sc=
if",
> +                         "renesas,scif";
> +            reg =3D <0xe6e88000 64>;
> +            interrupts =3D <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks =3D <&cpg CPG_MOD 310>, <&cpg CPG_CORE R8A7795_CLK_S3=
D1>,
> +                     <&scif_clk>;
> +            clock-names =3D "fck";
> +            dmas =3D <&dmac1 0x13>, <&dmac1 0x12>, <&dmac2 0x13>, <&dmac=
2 0x12>;
> +            dma-names =3D "tx", "rx", "tx", "rx";
> +            power-domains =3D <&cpg>;
> +            resets =3D <&cpg 310>;
> +    };

I'm not sure we need this in the example.
