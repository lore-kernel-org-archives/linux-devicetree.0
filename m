From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/6] dt-bindings: media: Add Allwinner H3 Deinterlace
 binding
Date: Fri, 11 Oct 2019 09:41:28 -0500
Message-ID: <20191011144128.GA24245@bogus>
References: <20190929161653.160158-1-jernej.skrabec@siol.net>
 <20190929161653.160158-5-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190929161653.160158-5-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: mripard@kernel.org, wens@csie.org, mark.rutland@arm.com, mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Sun, Sep 29, 2019 at 06:16:51PM +0200, Jernej Skrabec wrote:
> Allwinner H3 Deinterlace core is used for deinterlacing interlaced video
> content. Core can also be found on some later SoCs, like H5 and R40.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  .../media/allwinner,sun8i-h3-deinterlace.yaml | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml b/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml
> new file mode 100644
> index 000000000000..55a5d4e4f0f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/allwinner,sun8i-h3-deinterlace.yaml#

Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml: $id: path/filename 'arm/allwinner,sun8i-h3-deinterlace.yaml' doesn't match actual filename
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.example.dts] Error 1
Makefile:1282: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

With that fixed,

Reviewed-by: Rob Herring <robh@kernel.org>

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner H3 Deinterlace Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <mripard@kernel.org>
> +
> +description: |-
> +  The Allwinner H3 and later has a deinterlace core used for
> +  deinterlacing interlaced video content.
> +
> +properties:
> +  compatible:
> +    const: allwinner,sun8i-h3-deinterlace
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Deinterlace interface clock
> +      - description: Deinterlace module clock
> +      - description: Deinterlace DRAM clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +      - const: ram
> +
> +  resets:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    const: dma-mem
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/sun8i-h3-ccu.h>
> +    #include <dt-bindings/reset/sun8i-h3-ccu.h>
> +
> +    deinterlace: deinterlace@1400000 {
> +        compatible = "allwinner,sun8i-h3-deinterlace";
> +        reg = <0x01400000 0x20000>;
> +        clocks = <&ccu CLK_BUS_DEINTERLACE>,
> +                 <&ccu CLK_DEINTERLACE>,
> +                 <&ccu CLK_DRAM_DEINTERLACE>;
> +        clock-names = "bus", "mod", "ram";
> +        resets = <&ccu RST_BUS_DEINTERLACE>;
> +        interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +        interconnects = <&mbus 9>;
> +        interconnect-names = "dma-mem";
> +    };
> +
> +...
> -- 
> 2.23.0
> 
