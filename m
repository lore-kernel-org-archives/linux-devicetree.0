From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: mtd: Add YAML schemas for the generic
 NAND options
Date: Mon, 1 Apr 2019 20:58:49 -0500
Message-ID: <CAL_JsqLSfitzkb8P5xQ+cCmcSeL6fTjQ3rVPJ2qiNdSXyps-sw@mail.gmail.com>
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Boris Brezillon <boris.brezillon@collabora.com>, MTD Maling List <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 1, 2019 at 4:14 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The NAND chips in MTD have a bunch of generic options that are needed in a
> device tree. Add a YAML schemas for those.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 131 +++++++-
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nand-controller.yaml
>
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> new file mode 100644
> index 000000000000..05b1afb34972
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NAND Chip and NAND Controller Generic Binding
> +
> +maintainers:
> +  - Boris Brezillon <bbrezillon@kernel.org>
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +  - Richard Weinberger <richard@nod.at>
> +
> +description: |
> +  The NAND controller should be represented with its own DT node, and
> +  all NAND chips attached to this controller should be defined as
> +  children nodes of the NAND controller. This representation should be
> +  enforced even for simple controllers supporting only one chip.
> +
> +  The ECC strength and ECC step size properties define the correction
> +  capability of a controller. Together, they say a controller can
> +  correct {strength} bit errors per {size} bytes.
> +
> +  The interpretation of these parameters is implementation-defined, so
> +  not all implementations must support all possible
> +  combinations. However, implementations are encouraged to further
> +  specify the value(s) they support.
> +
> +properties:
> +  $nodename:
> +    pattern: "^nand-controller(@.*)?"
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  ranges: true

'ranges' should not be here as nand chip addresses are not translatable.

> +
> +patternProperties:
> +  "^nand@[a-z0-9]$":
> +    properties:
> +      reg:
> +        description:
> +          Contains the native Ready/Busy IDs.
> +
> +      nand-ecc-mode:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/string
> +          - enum: [ none, soft, hw, hw_syndrome, hw_oob_first, on-die ]
> +        description:
> +          Operation mode of the NAND ecc mode. soft_bch is deprecated
> +          and should be replaced by soft and nand-ecc-algo
> +
> +      nand-ecc-algo:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/string
> +          - enum: [ hamming, bch, rs ]
> +        description:
> +          Algorithm of NAND ECC.
> +
> +      nand-bus-width:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32
> +          - enum: [ 8, 16 ]
> +          - default: 8
> +        description:
> +          Bus width to the NAND chip
> +
> +      nand-on-flash-bbt:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Enable the on-flash Bad Block Table
> +
> +      nand-ecc-strength:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Number of bits to correct per ECC step.

Is there a range we can define here? Certainly there's a minimum
values of at least 1.

> +
> +      nand-ecc-step-size:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Number of data bytes covered by a single ECC step.

Same here.

> +
> +      nand-ecc-maximize:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Whether or not the ECC strength should be maximized. The
> +          maximum ECC strength is both controller and chip
> +          dependent. The controller side has to select the ECC config
> +          providing the best strength and taking the OOB area size
> +          constraint into account.  This is particularly useful when
> +          only the in-band area is used by the upper layers, and you
> +          want to make your NAND as reliable as possible.
> +
> +      nand-is-boot-medium:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Whether or not the NAND chip is a boot medium. Drivers might
> +          use this information to select ECC algorithms supported by
> +          the boot ROM or similar restrictions.
> +
> +      nand-rb:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          Contains the native Ready/Busy IDs.
> +
> +    required:
> +      - reg
> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +examples:
> +  - |
> +    nand-controller {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      /* controller specific properties */
> +
> +      nand@0 {
> +        reg = <0>;
> +        nand-ecc-mode = "soft";
> +        nand-ecc-algo = "bch";
> +
> +        /* controller specific properties */
> +      };
> +    };
>
> base-commit: aa63f222af3e5991099ebcecca7c474d8285c7c4
> --
> git-series 0.9.1
