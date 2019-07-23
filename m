From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: irq: Convert Allwinner IRQ Controller to
 a schema
Date: Tue, 23 Jul 2019 10:14:06 -0600
Message-ID: <CAL_JsqJJTwBwjXixjgr8KbiM-p6uTkVTcBwzUawdgkeybABxOQ@mail.gmail.com>
References: <20190723132658.5068-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190723132658.5068-1-maxime.ripard@bootlin.com>
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
> The Allwinner SoCs have an interrupt controller supported in Linux, with a
> matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../allwinner,sun4i-a10-ic.yaml               | 49 +++++++++++++++++++
>  .../allwinner,sun4i-ic.txt                    | 20 --------
>  2 files changed, 49 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/allwinner,sun4i-a10-ic.yaml
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/allwinner,sun4i-ic.txt
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun4i-a10-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun4i-a10-ic.yaml
> new file mode 100644
> index 000000000000..806cf4770f75
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun4i-a10-ic.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/allwinner,sun4i-a10-ic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A10 Interrupt Controller Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  "#interrupt-cells":
> +    const: 1
> +
> +  compatible:
> +    enum:
> +      - allwinner,sun4i-a10-ic
> +      - allwinner,suniv-f1c100s-ic
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +required:
> +  - "#interrupt-cells"
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +
> +# FIXME: We should set it, but it would report all the generic
> +# properties as additional properties.
> +# additionalProperties: false

Looks to me like you could enable this.

BTW, I think the fix is going to be just the new
'unevaluatedProperties: false'. We could start putting that in as
unknown keys are ignored (though the meta-schema will need an update
to allow it).

> +
> +examples:
> +  - |
> +    intc: interrupt-controller {

unit-address needed.

I need to figure out how to enable dtc warnings by default on the examples...

> +        compatible = "allwinner,sun4i-a10-ic";
> +        reg = <0x01c20400 0x400>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +    };
> +
> +...
