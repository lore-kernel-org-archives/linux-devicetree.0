From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: media: Add Allwinner A10 CSI binding
Date: Mon, 28 Jan 2019 10:17:09 -0600
Message-ID: <CAL_JsqKOyr3nbXozTqBsEAQGw2bPsBGvFpJ_X7S-izdjTWxK=g@mail.gmail.com>
References: <cover.ba7411f0c7155d0292b38d3dec698e26b5cc813b.1548687041.git-series.maxime.ripard@bootlin.com>
 <f6b6adf84c58e0de605d0a23dd559fee011f380c.1548687041.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f6b6adf84c58e0de605d0a23dd559fee011f380c.1548687041.git-series.maxime.ripard@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Chen-Yu Tsai <wens@csie.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 28, 2019 at 8:52 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The Allwinner A10 CMOS Sensor Interface is a camera capture interface also
> used in later (A10s, A13, A20, R8 and GR8) SoCs.
>
> On some SoCs, like the A10, there's multiple instances of that controller,
> with one instance supporting more channels and having an ISP.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 73 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> new file mode 100644
> index 000000000000..f550fefa074f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR X11)

X11 is generally wrong because it is specific to X Consortium. MIT is
what you want.

The core bindings are using 'GPL-2.0 OR BSD-2-Clause'. I don't think
it really matters whether we have a mixture of MIT and BSD, but if you
don't have a reason to deviate, I wouldn't.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/allwinner,sun4i-a10-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A10 CMOS Sensor Interface (CSI) Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: Allwinner A10 CSI0 Controller
> +        items:
> +        - const: allwinner,sun4i-a10-csi0
> +
> +      - description: Allwinner A20 CSI0 Controller
> +        items:
> +        - const: allwinner,sun7i-a20-csi0

You may want to use 'enum' here if you will have more to add later.

> +        - const: allwinner,sun4i-a10-csi0
> +
> +  reg:
> +    description: The base address and size of the memory-mapped region

IMO, we don't need to define what 'reg' is everywhere.

> +    maxItems: 1
> +
> +  interrupts:
> +    description: The interrupt associated to this IP

Same here.

> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 4
> +    maxItems: 4

No need for these. We count 'items' and add them automatically. You
only need them if the size is variable.

> +    items:
> +      - description: The CSI interface clock
> +      - description: The CSI module clock
> +      - description: The CSI ISP clock
> +      - description: The CSI DRAM clock
> +
> +  clock-names:
> +    minItems: 4
> +    maxItems: 4

Same here.

> +    items:
> +      - const: bus
> +      - const: mod
> +      - const: isp
> +      - const: ram
> +
> +  resets:
> +    description: The reset line driver this IP
> +    maxItems: 1
> +
> +  pinctrl-0: true

No defined length? I guess we generally allow a variable number of entries.

> +
> +  pinctrl-names:
> +    description:
> +      When present, must have one state named "default" that sets up
> +      pins for ordinary operations.
> +    minItems: 1
> +    maxItems: 1
> +    items:
> +      - const: default

A single entry can be simplified to just 'const: default' under pinctrl-names.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +# The media OF-graph binding hasn't been described yet
> +# additionalProperties: false
> --
> git-series 0.9.1
