From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 07/13] dt-bindings: interrupt-controller: Add Loongson-3 HTINTC
Date: Tue, 27 Aug 2019 07:49:26 -0500
Message-ID: <CAL_JsqJzkKDVm_DBpp4_w5YZQkg0yo9TJtvxzN5beTf45gtohw@mail.gmail.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com> <20190827085302.5197-8-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827085302.5197-8-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "open list:MIPS" <linux-mips@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>, Paul Burton <paul.burton@mips.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.co>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 27, 2019 at 3:59 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Document Loongson-3 HyperTransport Interrupt controller.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../loongson,ls3-htintc.yaml                  | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
> new file mode 100644
> index 000000000000..c1bc0faca656
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/interrupt-controller/loongson,ls3-htintc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Loongson-3 HyperTransport Interrupt Controller
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +description: |
> +  This interrupt controller is found in the Loongson-3 family of chips to transfer
> +  interrupts from PCH connected on HyperTransport bus.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - loongson,ls3-htintc

Can be simplified to:

compatible
  const: loongson,ls3-htintc

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 4

Need to list out what each of the 4 are.

> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +examples:
> +  - |
> +               htintc: interrupt-controller@0xEFDFB000080 {

interrupt-controller@efdfb000080

> +                       compatible = "loongson,ls3-htintc";
> +                       reg = <0xEFD 0xFB000080 0x100>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +
> +                       interrupt-parent = <&iointc>;
> +                       interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
> +                                               <25 IRQ_TYPE_LEVEL_HIGH>,
> +                                               <26 IRQ_TYPE_LEVEL_HIGH>,
> +                                               <27 IRQ_TYPE_LEVEL_HIGH>;

Run 'make dt_binding_check'. This will not build without the necessary include.

> +    };
> --
> 2.22.0
>
