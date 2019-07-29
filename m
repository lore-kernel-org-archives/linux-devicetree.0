From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: MIPS: lantiq: Add documentation for the
 External Bus Unit
Date: Mon, 29 Jul 2019 17:17:47 -0600
Message-ID: <CAL_JsqLRKF3mE7Xf_8Fxt2ycYAMmyo=bGB5f13cVoHShS3+G=g@mail.gmail.com>
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com> <20190727175315.28834-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190727175315.28834-2-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, maz@kernel.org, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, John Crispin <john@phrozen.org>, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 27, 2019 at 11:53 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Lantiq SoCs contain a so-called External Bus Unit.
>
> It attaches PCI memory as well as NAND and NOR flash. Additioanlly it

typo

> contains an interrupt-controller for the PCI_INTA interrupt line.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/mips/lantiq/lantiq,ebu.yaml      | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
>
> diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
> new file mode 100644
> index 000000000000..0b0b27d0b64b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/lantiq/lantiq,ebu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lantiq External Bus Unit (EBU) bindings
> +
> +maintainers:
> +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - lantiq,falcon-ebu
> +      - lantiq,xway-ebu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The EBU module clock

I prefer just 'maxItems: 1' as when there's only one clock, the
description is not too useful.

> +
> +  interrupt-controller:
> +    type: boolean

Just 'true' is fine as this already has a defined type.

> +
> +  interrupt-cells:
> +    const: 2
> +
> +  interrupts:
> +    items:
> +      - description: The EBU module interrupt line
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    memory-controller@e105300 {
> +        compatible = "lantiq,xway-ebu";
> +        reg = <0xe105300 0x100>;
> +        clocks = <&pmu 10>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        interrupt-parent = <&icu0>;
> +        interrupts = <30>;
> +    };
> +...
> --
> 2.22.0
>
