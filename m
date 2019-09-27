From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: Document the Xylon LogiCVC
 multi-function device
Date: Fri, 27 Sep 2019 17:15:50 -0500
Message-ID: <20190927221550.GA28831@bogus>
References: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com>
 <20190927100407.1863293-3-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190927100407.1863293-3-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2019 at 12:04:04PM +0200, Paul Kocialkowski wrote:
> The LogiCVC is a display engine which also exposes GPIO functionality.
> For this reason, it is described as a multi-function device that is expected
> to provide register access to its children nodes for gpio and display.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/mfd/xylon,logicvc.yaml           | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
> new file mode 100644
> index 000000000000..abc9937506e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 Bootlin
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/mfd/xylon,logicvc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Xylon LogiCVC multi-function device
> +
> +maintainers:
> +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +
> +description: |
> +  The LogiCVC is a display controller that also contains a GPIO controller.
> +  As a result, a multi-function device is exposed as parent of the display
> +  and GPIO blocks.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - xylon,logicvc-3.02.a
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - xylon,logicvc-3.02.a

I've seen a couple of these with 'syscon' today, so I fixed the schema 
tool to just exclude 'syscon' and 'simple-mfd' from the generated 
'select'. So you can drop select now.

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +  required:
> +    - compatible
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    logicvc: logicvc@43c00000 {
> +      compatible = "xylon,logicvc-3.02.a", "syscon", "simple-mfd";
> +      reg = <0x43c00000 0x6000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +    };
> -- 
> 2.23.0
> 
