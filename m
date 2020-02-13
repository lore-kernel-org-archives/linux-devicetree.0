Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4FEC3F68F
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 20:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6717324676
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 20:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581626407;
	bh=cDF3LhQWpDWYHtuU7yBQ1h0a5rtx3Yo49kFgRyADYJM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=hR2VBhw8Ftjw/vlbxtVZaAWFgaJNGyKWAmX3HnZyYF1usuAXG8Zcjz0hgMO9uSJTb
	 TSNZA7KUOPKzsuE4qy1qr9W/M9VPsWBIvhOV0oZEZT0EGOc//SDDcz0aa4TPk8g5fY
	 Eit6Pi7y0L4dyBzFzhVlM2KM3nT03U3SxNuRC0TE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgBMUkH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 15:40:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:48186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727905AbgBMUkG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 13 Feb 2020 15:40:06 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 072C324677;
        Thu, 13 Feb 2020 20:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581626405;
        bh=cDF3LhQWpDWYHtuU7yBQ1h0a5rtx3Yo49kFgRyADYJM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Yhxm3r/nU8of76d1GF+p8ZhMvTSnLM4GvjDUrAgsoqZwdDadlg46Atu7GRXGQXe6N
         9JRZeV2mg6Wq68bNpLKNSGKul7OBD8ZFiekiIvDN42nJroOezVjn4k8YpK3HRYICrD
         y/OH5U07cEAfv474rLpbt7l9pjqaFaVdPqrcfE+w=
Received: by mail-qt1-f181.google.com with SMTP id d18so5443765qtj.10;
        Thu, 13 Feb 2020 12:40:05 -0800 (PST)
X-Gm-Message-State: APjAAAU2NSEiaSYdA7sLQK6nZAKe1b1DvvXXjumaUnTuDXAc0RwW04+4
        vqCX0osxw4mD++Od6jjD9Rn1GwIBbt5NzNC3Rg==
X-Google-Smtp-Source: APXvYqyapGELfwtxtSmym+UJABxkTQiXuvJEHTRm4oUOPN5JVOJ2u/W90YhTS4laVx8f8kuKaQwn67ditKMdeRNiwFM=
X-Received: by 2002:ac8:6747:: with SMTP id n7mr13361090qtp.224.1581626403988;
 Thu, 13 Feb 2020 12:40:03 -0800 (PST)
MIME-Version: 1.0
References: <20200213141119.66462-1-linus.walleij@linaro.org>
In-Reply-To: <20200213141119.66462-1-linus.walleij@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 13 Feb 2020 14:39:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL-_s==8TsLos=1OyYVkdyZXMuTj5z8UDYFbOC-F3am1Q@mail.gmail.com>
Message-ID: <CAL_JsqL-_s==8TsLos=1OyYVkdyZXMuTj5z8UDYFbOC-F3am1Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Create YAML schema for ICST clocks
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 13, 2020 at 8:11 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The ICST clocks used in the ARM Integrator, Versatile and
> RealView platforms are updated to use YAML schema, and two
> new ICST clocks used by the Integrator IM-PD1 logical module
> are added in the process.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/clock/arm,syscon-icst.yaml       | 102 ++++++++++++++++++
>  .../bindings/clock/arm-integrator.txt         |  34 ------
>  .../bindings/clock/arm-syscon-icst.txt        |  70 ------------
>  3 files changed, 102 insertions(+), 104 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/arm-integrator.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
> new file mode 100644
> index 000000000000..06c4d84e8c3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/arm,syscon-icst.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM System Conctroller ICST Clocks
> +
> +maintainers:
> +  - Linus Walleij <linusw@kernel.org>
> +
> +description: The ICS525 and ICS307 oscillators are produced by Integrated

Needs a literal block '|' to preserve formatting of your table below.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +  Devices Technology (IDT). ARM integrated these oscillators deeply into their
> +  reference designs by adding special control registers that manage such
> +  oscillators to their system controllers.
> +
> +  The various ARM system controllers contain logic to serialize and initialize
> +  an ICST clock request after a write to the 32 bit register at an offset
> +  into the system controller. Furthermore, to even be able to alter one of
> +  these frequencies, the system controller must first be unlocked by
> +  writing a special token to another offset in the system controller.
> +
> +  Some ARM hardware contain special versions of the serial interface that only
> +  connects the low 8 bits of the VDW (missing one bit), hardwires RDW to
> +  different values and sometimes also hardwire the output divider. They
> +  therefore have special compatible strings as per this table (the OD value is
> +  the value on the pins, not the resulting output divider).
> +
> +  In the core modules and logic tiles, the ICST is a configurable clock fed
> +  from a 24 MHz clock on the motherboard (usually the main crystal) used for
> +  generating e.g. video clocks. It is located on the core module and there is
> +  only one of these. This clock node must be a subnode of the core module.
> +
> +  Hardware variant         RDW     OD          VDW
> +
> +  Integrator/AP            22      1           Bit 8 0, rest variable
> +  integratorap-cm
> +
> +  Integrator/AP            46      3           Bit 8 0, rest variable
> +  integratorap-sys
> +
> +  Integrator/AP            22 or   1           17 or (33 or 25 MHz)
> +  integratorap-pci         14      1           14
> +
> +  Integrator/CP            22      variable    Bit 8 0, rest variable
> +  integratorcp-cm-core
> +
> +  Integrator/CP            22      variable    Bit 8 0, rest variable
> +  integratorcp-cm-mem
> +
> +  The ICST oscillator must be provided inside a system controller node.
> +
> +properties:
> +  "#clock-cells":
> +    const: 0
> +
> +  compatible:
> +    enum:
> +      - arm,syscon-icst525
> +      - arm,syscon-icst307
> +      - arm,syscon-icst525-integratorap-cm
> +      - arm,syscon-icst525-integratorap-sys
> +      - arm,syscon-icst525-integratorap-pci
> +      - arm,syscon-icst525-integratorcp-cm-core
> +      - arm,syscon-icst525-integratorcp-cm-mem
> +      - arm,integrator-cm-auxosc
> +      - arm,versatile-cm-auxosc
> +      - arm,impd-vco1
> +      - arm,impd-vco2
> +
> +  clocks:
> +    description: Parent clock for the ICST VCO
> +    maxItems: 1
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  lock-offset:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    description: Offset to the unlocking register for the oscillator
> +
> +  vco-offset:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    description: Offset to the VCO register for the oscillator
> +
> +required:
> +  - "#clock-cells"
> +  - compatible
> +  - clocks
> +
> +examples:
> +  - |
> +    vco1: clock@00 {
> +      compatible = "arm,impd1-vco1";
> +      #clock-cells = <0>;
> +      lock-offset = <0x08>;
> +      vco-offset = <0x00>;
> +      clocks = <&sysclk>;
> +      clock-output-names = "IM-PD1-VCO1";
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/clock/arm-integrator.txt b/Documentation/devicetree/bindings/clock/arm-integrator.txt
> deleted file mode 100644
> index 11f5f95f571b..000000000000
> --- a/Documentation/devicetree/bindings/clock/arm-integrator.txt
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -Clock bindings for ARM Integrator and Versatile Core Module clocks
> -
> -Auxiliary Oscillator Clock
> -
> -This is a configurable clock fed from a 24 MHz chrystal,
> -used for generating e.g. video clocks. It is located on the
> -core module and there is only one of these.
> -
> -This clock node *must* be a subnode of the core module, since
> -it obtains the base address for it's address range from its
> -parent node.
> -
> -
> -Required properties:
> -- compatible: must be "arm,integrator-cm-auxosc" or "arm,versatile-cm-auxosc"
> -- #clock-cells: must be <0>
> -
> -Optional properties:
> -- clocks: parent clock(s)
> -
> -Example:
> -
> -core-module@10000000 {
> -       xtal24mhz: xtal24mhz@24M {
> -               #clock-cells = <0>;
> -               compatible = "fixed-clock";
> -               clock-frequency = <24000000>;
> -       };
> -       auxosc: cm_aux_osc@25M {
> -               #clock-cells = <0>;
> -               compatible = "arm,integrator-cm-auxosc";
> -               clocks = <&xtal24mhz>;
> -       };
> -};
> diff --git a/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt b/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
> deleted file mode 100644
> index 4cd81742038f..000000000000
> --- a/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -ARM System Controller ICST clocks
> -
> -The ICS525 and ICS307 oscillators are produced by Integrated Devices
> -Technology (IDT). ARM integrated these oscillators deeply into their
> -reference designs by adding special control registers that manage such
> -oscillators to their system controllers.
> -
> -The various ARM system controllers contain logic to serialize and initialize
> -an ICST clock request after a write to the 32 bit register at an offset
> -into the system controller. Furthermore, to even be able to alter one of
> -these frequencies, the system controller must first be unlocked by
> -writing a special token to another offset in the system controller.
> -
> -Some ARM hardware contain special versions of the serial interface that only
> -connects the low 8 bits of the VDW (missing one bit), hardwires RDW to
> -different values and sometimes also hardwire the output divider. They
> -therefore have special compatible strings as per this table (the OD value is
> -the value on the pins, not the resulting output divider):
> -
> -Hardware variant:        RDW     OD          VDW
> -
> -Integrator/AP            22      1           Bit 8 0, rest variable
> -integratorap-cm
> -
> -Integrator/AP            46      3           Bit 8 0, rest variable
> -integratorap-sys
> -
> -Integrator/AP            22 or   1           17 or (33 or 25 MHz)
> -integratorap-pci         14      1           14
> -
> -Integrator/CP            22      variable    Bit 8 0, rest variable
> -integratorcp-cm-core
> -
> -Integrator/CP            22      variable    Bit 8 0, rest variable
> -integratorcp-cm-mem
> -
> -The ICST oscillator must be provided inside a system controller node.
> -
> -Required properties:
> -- compatible: must be one of
> -  "arm,syscon-icst525"
> -  "arm,syscon-icst307"
> -  "arm,syscon-icst525-integratorap-cm"
> -  "arm,syscon-icst525-integratorap-sys"
> -  "arm,syscon-icst525-integratorap-pci"
> -  "arm,syscon-icst525-integratorcp-cm-core"
> -  "arm,syscon-icst525-integratorcp-cm-mem"
> -- lock-offset: the offset address into the system controller where the
> -  unlocking register is located
> -- vco-offset: the offset address into the system controller where the
> -  ICST control register is located (even 32 bit address)
> -- #clock-cells: must be <0>
> -- clocks: parent clock, since the ICST needs a parent clock to derive its
> -  frequency from, this attribute is compulsory.
> -
> -Example:
> -
> -syscon: syscon@10000000 {
> -       compatible = "syscon";
> -       reg = <0x10000000 0x1000>;
> -
> -       oscclk0: osc0@c {
> -               compatible = "arm,syscon-icst307";
> -               #clock-cells = <0>;
> -               lock-offset = <0x20>;
> -               vco-offset = <0x0c>;
> -               clocks = <&xtal24mhz>;
> -       };
> -       (...)
> -};
> --
> 2.23.0
>
