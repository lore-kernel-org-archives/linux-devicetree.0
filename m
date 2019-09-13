MIME-Version: 1.0
Date: Fri, 13 Sep 2019 15:22:10 -0500
References: <20190913122151.20264-1-horms+renesas@verge.net.au>
In-Reply-To: <20190913122151.20264-1-horms+renesas@verge.net.au>
Message-ID: <CAL_JsqKEym4i74AuTFvawBaB0_zBeh5KcBOY_OFheUV1oF4yEg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: hspi: Convert bindings to json-schema
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Yoshihiro Kaneko <ykaneko0929@gmail.com>, linux-spi <linux-spi@vger.kernel.org>, devicetree@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 13, 2019 at 7:22 AM Simon Horman <horms+renesas@verge.net.au> wrote:
>
> Convert Renesas HSPI bindings documentation to json-schema.
> Also name bindings documentation file according to the compat string
> being documented.
>
> As a side effect of this change all currently supported/used compat
> strings are listed while no while card compat string is documented.
> This, in my opinion, is desirable as only supported hardware should
> be documented.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on v5.3-rc1
> Tested using:
>   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/renesas,hspi.yaml
> ---
>  .../devicetree/bindings/spi/renesas,hspi.yaml      | 54 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/spi/sh-hspi.txt  | 26 -----------
>  2 files changed, 54 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/renesas,hspi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/spi/sh-hspi.txt
>
> diff --git a/Documentation/devicetree/bindings/spi/renesas,hspi.yaml b/Documentation/devicetree/bindings/spi/renesas,hspi.yaml
> new file mode 100644
> index 000000000000..94a64a33daf4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/renesas,hspi.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/renesas,hspi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas HSPI
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>

Add:

allOf:
  - $ref: spi-controller.yaml#

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - renesas,hspi-r8a7778 # R-Car M1A
> +        - renesas,hspi-r8a7779 # R-Car H1
> +      - const: renesas,hspi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +

> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

And then these 2 can be dropped.

> +
> +  # Pinctrl properties might be needed, too.
> +  # See Documentation/devicetree/bindings/pinctrl/renesas,*.

If only a single state, you don't. For multiple states, we need to
document the names.

If not present, then they get added automagically so that
'additionalProperties: false' works. But you can't use that here as
you'll have child nodes.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    hspi0: spi@fffc7000 {
> +        compatible = "renesas,hspi-r8a7778", "renesas,hspi";
> +        reg = <0xfffc7000 0x18>;
> +        interrupt-parent = <&gic>;
> +        interrupts = <0 63 IRQ_TYPE_LEVEL_HIGH>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +    };
> +
