From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: irq: Convert Allwinner NMI Controller to
 a schema
Date: Tue, 23 Jul 2019 10:32:41 -0600
Message-ID: <CAL_JsqJkTrCuscnWgm5cDmQj5RPGnd3qXkzR40XWKB2skZFwXA@mail.gmail.com>
References: <20190723132658.5068-1-maxime.ripard@bootlin.com>
 <20190723132658.5068-2-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190723132658.5068-2-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, maz@kernel.org, Chen-Yu Tsai <wens@csie.org>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 23, 2019 at 7:27 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The Allwinner SoCs have an interrupt controller called NMI supported in
> Linux, with a matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../allwinner,sun7i-a20-sc-nmi.yaml           | 83 +++++++++++++++++++
>  .../allwinner,sunxi-nmi.txt                   | 29 -------
>  2 files changed, 83 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/allwinner,sunxi-nmi.txt
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
> new file mode 100644
> index 000000000000..cb8077b0c8dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A20 Non-Maskable Interrupt Controller Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - allwinner,sun6i-a31-r-intc
> +          - allwinner,sun7i-a20-sc-nmi
> +          - allwinner,sun9i-a80-sc-nmi

This should have all the possible compatibles in case all are not listed.

> +
> +          # Deprecated
> +          - allwinner,sun6i-a31-sc-nmi

I know we already did things this way before, but perhaps this should
be listed below with the 'deprecated' property. The tools can include
it in select, but then remove it from compatible property.

> +
> +  required:
> +    - compatible
> +
> +properties:
> +  "#interrupt-cells":
> +    const: 2
> +    description:
> +      The first cell is the IRQ number, the second cell the trigger
> +      type as defined in interrupt.txt in this directory.
> +
> +  compatible:
> +    oneOf:
> +      - const: allwinner,sun6i-a31-r-intc
> +      - const: allwinner,sun7i-a20-sc-nmi
> +      - items:
> +        - const: allwinner,sun8i-a83t-r-intc
> +        - const: allwinner,sun6i-a31-r-intc
> +      - const: allwinner,sun9i-a80-sc-nmi
> +      - items:
> +        - const: allwinner,sun50i-a64-r-intc
> +        - const: allwinner,sun6i-a31-r-intc
> +      - items:
> +        - const: allwinner,sun50i-h6-r-intc
> +        - const: allwinner,sun6i-a31-r-intc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +required:
> +  - "#interrupt-cells"
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +
> +# FIXME: We should set it, but it would report all the generic
> +# properties as additional properties.
> +# additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@1c00030 {
> +        compatible = "allwinner,sun7i-a20-sc-nmi";
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        reg = <0x01c00030 0x0c>;
> +        interrupt-parent = <&gic>;
> +        interrupts = <0 0 4>;
> +    };
> +
> +...
