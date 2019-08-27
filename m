From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 05/13] dt-bindings: interrupt-controller: Add Loongson-3 IOINTC
Date: Tue, 27 Aug 2019 08:08:30 -0500
Message-ID: <CAL_Jsq+aEOPOvRr8c-umqwKdVi=WMXL=fufeDCj2+87P69tLgQ@mail.gmail.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com> <20190827085302.5197-6-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827085302.5197-6-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "open list:MIPS" <linux-mips@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>, Paul Burton <paul.burton@mips.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.co>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 27, 2019 at 4:00 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Document Loongson-3 I/O Interrupt controller.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../loongson,ls3-iointc.yaml                  | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml
> new file mode 100644
> index 000000000000..cc6ac8b2cd7c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license please.

> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/interrupt-controller/loongson,ls3-iointc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Loongson-3 I/O Interrupt Controller
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +description: |
> +  This interrupt controller is found in the Loongson-3 family of chips as the primary
> +  package interrupt source which can route interrupt to interrupt line of cores.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - loongson,ls3-iointc

Same comment here.

> +
> +  reg:
> +    maxItems: 1
> +
> +  'loongson,map-ip':
> +    description:
> +      The interrupt line it's going to map to.

I don't understand. Needs a better description.

> +    allOf:

You need to define the type here with a $ref.


> +      - maximum: 5
> +        minimum: 0
> +
> +  'loongson,map-core':
> +    description:
> +      The core it's going to map to.

There's 1 interrupt ctrlr per core or what?

> +    allOf:
> +      - maximum: 5
> +        minimum: 0
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'

Add a:

additionalProperties: false

> +
> +examples:
> +  - |
> +    iointc: interrupt-controller@3ff01400 {
> +        compatible = "loongson,ls3-io-intc";
> +        reg = <0x3ff01400 0x60>;
> +        interrupts = <2>;
> +        loongson,map-ip = <0>;
> +        loongson,map-core = <0>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +    };
> --
> 2.22.0
>
