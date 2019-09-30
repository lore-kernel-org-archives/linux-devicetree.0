From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v6 1/7] dt-bindings: thermal: Add DT bindings
 documentation for Amlogic Thermal
Date: Mon, 30 Sep 2019 15:04:59 +0530
Message-ID: <CAHLCerPxrGMm98nDC529pYkzEaiDk0p6VTdVzyHx8=U8_PYe_A@mail.gmail.com>
References: <20190927184352.28759-1-glaroque@baylibre.com> <20190927184352.28759-2-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927184352.28759-2-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-amlogic@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, lakml <linux-arm-kernel@lists.infradead.org>, Linux PM list <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 28, 2019 at 12:14 AM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Adding the devicetree binding documentation for the Amlogic temperature
> sensor found in the Amlogic Meson G12A and G12B SoCs.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  .../bindings/thermal/amlogic,thermal.yaml     | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
>
> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> new file mode 100644
> index 000000000000..f761681e4c0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/amlogic,thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Thermal
> +
> +maintainers:
> +  - Guillaume La Roque <glaroque@baylibre.com>
> +
> +description: Binding for Amlogic Thermal
> +
> +properties:
> +  compatible:
> +      items:
> +        - enum:
> +            - amlogic,g12a-cpu-thermal
> +            - amlogic,g12a-ddr-thermal
> +        - const: amlogic,g12a-thermal
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  amlogic,ao-secure:
> +    description: phandle to the ao-secure syscon
> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - amlogic,ao-secure
> +
> +examples:
> +  - |
> +        cpu_temp: temperature-sensor@ff634800 {
> +                compatible = "amlogic,g12a-cpu-thermal",
> +                             "amlogic,g12a-thermal";
> +                reg = <0xff634800 0x50>;
> +                interrupts = <0x0 0x24 0x0>;
> +                clocks = <&clk 164>;
> +                #thermal-sensor-cells = <0>;
> +                amlogic,ao-secure = <&sec_AO>;
> +        };
> +...
> --
> 2.17.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
