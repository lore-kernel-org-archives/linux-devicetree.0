From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add schemas for simple-framebuffer
Date: Mon, 25 Mar 2019 11:27:36 -0500
Message-ID: <CAL_JsqKep7B6LKUMRRxonKV48YEHtYow9TjKJwDUVN0S2BX3Ww@mail.gmail.com>
References: <20190325135414.9728-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190325135414.9728-1-maxime.ripard@bootlin.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Maxime Jourdan <mjourdan@baylibre.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 25, 2019 at 8:54 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The simple framebuffer is a binding that allows the bootloader to setup a
> framebuffer, describe it in the Device Tree for the OS to pick it up and
> use it as is.
>
> Replace the current binding by a schema to allow the validation tools to
> check those nodes.
>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Rob,
>
> Even though the node itself is properly described, I still end up with some
> validation warnings when the chosen node is validated (basically
> complaining that ranges, and the framebuffer nodes shouldn't be here, since
> we haven't described them in the chosen schemas).

Having 'ranges' is a bit strange because 'chosen' doesn't have an
address. We can add #address-cells, #size-cells and framebuffer child
node to the base chosen schema.

> I've tried to expand it, but I failed, using that patch:
> http://code.bulix.org/mimu5z-634661?raw

That should work, but you will still get warnings from the core
schema. Also, I guess you really want to match on the child compatible
which isn't possible with the current tools. I think for now at least,
we don't need to validate that simple-fb is a child of chosen.

Maybe we could add a '$parent' property which the tools add like
$nodename. I'd rather wait and see how frequently we need something
like this.

> I'm a bit lost right now about how to make those nodes being validated and
> not report any warning anymore. I guess one way would be to expand the
> chosen schemas instead. Let me know what you prefer.
> ---
>  .../display/amlogic,simple-framebuffer.txt    |  33 ----
>  .../display/simple-framebuffer-sunxi.txt      |  36 ----
>  .../bindings/display/simple-framebuffer.txt   |  91 ----------
>  .../bindings/display/simple-framebuffer.yaml  | 164 ++++++++++++++++++
>  4 files changed, 164 insertions(+), 160 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/amlogic,simple-framebuffer.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/simple-framebuffer.txt
>  create mode 100644 Documentation/devicetree/bindings/display/simple-framebuffer.yaml

[...]

> diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> new file mode 100644
> index 000000000000..9f2245e3f5ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> @@ -0,0 +1,164 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)

Keep in mind the old files were implicitly GPL2 only. I imagine some
of this is copied.

Also, as gregkh says, are you sure you are okay with GPLv9?

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/simple-framebuffer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple Framebuffer Device Tree Bindings
> +
> +maintainers:
> +  - Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> +  - Hans de Goede <hdegoede@redhat.com>
> +
> +description: |+
> +  A simple frame-buffer describes a frame-buffer setup by firmware or
> +  the bootloader, with the assumption that the display hardware has
> +  already been set up to scan out from the memory pointed to by the
> +  reg property.
> +
> +  Since simplefb nodes represent runtime information they must be
> +  sub-nodes of the chosen node (*). Simplefb nodes must be named
> +  framebuffer@<address>.
> +
> +  If the devicetree contains nodes for the display hardware used by a
> +  simplefb, then the simplefb node must contain a property called
> +  display, which contains a phandle pointing to the primary display
> +  hw node, so that the OS knows which simplefb to disable when handing
> +  over control to a driver for the real hardware. The bindings for the
> +  hw nodes must specify which node is considered the primary node.
> +
> +  It is advised to add display# aliases to help the OS determine how
> +  to number things. If display# aliases are used, then if the simplefb
> +  node contains a display property then the /aliases/display# path
> +  must point to the display hw node the display property points to,
> +  otherwise it must point directly to the simplefb node.
> +
> +  If a simplefb node represents the preferred console for user
> +  interaction, then the chosen node stdout-path property should point
> +  to it, or to the primary display hw node, as with display#
> +  aliases. If display aliases are used then it should be set to the
> +  alias instead.
> +
> +  It is advised that devicetree files contain pre-filled, disabled
> +  framebuffer nodes, so that the firmware only needs to update the
> +  mode information and enable them. This way if e.g. later on support
> +  for more display clocks get added, the simplefb nodes will already
> +  contain this info and the firmware does not need to be updated.
> +
> +  If pre-filled framebuffer nodes are used, the firmware may need
> +  extra information to find the right node. In that case an extra
> +  platform specific compatible and platform specific properties should
> +  be used and documented.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: allwinner,simple-framebuffer
> +          - const: simple-framebuffer
> +
> +      - items:
> +          - const: amlogic,simple-framebuffer
> +          - const: simple-framebuffer

I'd write this as:

- enum:
    - allwinner,simple-framebuffer
    - amlogic,simple-framebuffer
- const: simple-framebuffer

> +
> +      - const: simple-framebuffer
> +
> +  reg:
> +    description: Location and size of the framebuffer memory
> +
> +  clocks:
> +    description: List of clocks used by the framebuffer.
> +
> +  power-domains:
> +    description: List of power domains used by the framebuffer.
> +
> +  width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Width of the framebuffer in pixels
> +
> +  height:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Height of the framebuffer in pixels
> +
> +  stride:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Number of bytes of a line in the framebuffer
> +
> +  format:
> +    description: Format of the framebuffer
> +    oneOf:
> +      - const: r5g6b5
> +        description: 16-bit pixels, d[15:11]=r, d[10:5]=g, d[4:0]=b
> +      - const: a8b8g8r8
> +        description: 32-bit pixels, d[31:24]=a, d[23:16]=b, d[15:8]=g, d[7:0]=r

This can be an enum rather than oneOf and a bunch of const.

> +
> +  display:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Primary display hardware node
> +
> +  allwinner,pipeline:
> +    description: Pipeline used by the framebuffer on Allwinner SoCs
> +    oneOf:
> +      - const: de_be0-lcd0
> +      - const: de_be0-lcd0-hdmi
> +      - const: de_be0-lcd0-tve0
> +      - const: de_be1-lcd0
> +      - const: de_be1-lcd1-hdmi
> +      - const: de_fe0-de_be0-lcd0
> +      - const: de_fe0-de_be0-lcd0-hdmi
> +      - const: de_fe0-de_be0-lcd0-tve0
> +      - const: mixer0-lcd0
> +      - const: mixer0-lcd0-hdmi
> +      - const: mixer1-lcd1-hdmi
> +      - const: mixer1-lcd1-tve

Same here.

> +
> +  amlogic,pipeline:
> +    description: Pipeline used by the framebuffer on Amlogic SoCs
> +    oneOf:
> +      - const: vpu-cvbs
> +      - const: vpu-hdmi

Same here.

> +
> +patternProperties:
> +  "^[a-zA-Z0-9-]+-supply$":
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Regulators used by the framebuffer. These should be named
> +      according to the names in the device design.
> +
> +required:
> +  # The binding requires also reg, width, height, stride and format,
> +  # but usually they will be filled by the bootloader.
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    aliases {
> +      display0 = &lcdc0;
> +    };
> +
> +    chosen {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      stdout-path = "display0";
> +      framebuffer0: framebuffer@1d385000 {
> +        compatible = "simple-framebuffer";
> +        reg = <0x1d385000 3840000>;
> +        width = <1600>;
> +        height = <1200>;
> +        stride = <3200>;
> +        format = "r5g6b5";
> +        clocks = <&ahb_gates 36>, <&ahb_gates 43>, <&ahb_gates 44>;
> +        lcd-supply = <&reg_dc1sw>;
> +        display = <&lcdc0>;
> +      };
> +    };
> +
> +    soc@1c00000 {
> +      lcdc0: lcdc@1c0c000 {
> +        compatible = "allwinner,sun4i-a10-lcdc";
> +      };
> +    };
> +
> +...
> --
> 2.20.1
>
