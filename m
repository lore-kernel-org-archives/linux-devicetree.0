From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: thermal: Add DT bindings
 documentation for Amlogic Thermal
Date: Wed, 31 Jul 2019 11:59:14 -0600
Message-ID: <CAL_JsqLyhiLkpje8a4Qh5K21s9xU6k1kkR0OtyGPss8=efR5Sg@mail.gmail.com>
References: <20190731153529.30159-1-glaroque@baylibre.com> <20190731153529.30159-2-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731153529.30159-2-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "open list:THERMAL" <linux-pm@vger.kernel.org>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 9:36 AM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Adding the devicetree binding documentation for the Amlogic temperature
> sensor found in the Amlogic Meson G12 SoCs.
> the G12A  and G12B SoCs are supported.
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  .../bindings/thermal/amlogic,thermal.yaml     | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
>
> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> new file mode 100644
> index 000000000000..f10537ab4c8b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/amlogic,thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Thermal Driver

This is not a driver.

> +
> +maintainers:
> +  - Guillaume La Roque <glaroque@baylibre.com>
> +
> +description: Amlogic Thermal driver
> +
> +properties:
> +  compatible:
> +    oneOf:

oneOf is not necessary as there is only one of.

> +      - items:
> +          - enum:
> +              - amlogic,g12-cpu-thermal
> +              - amlogic,g12-ddr-thermal
> +          - const:
> +              - amlogic,g12-thermal

Please run 'make dt_binding_check'. You'll find this is not valid json-schema.

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
> +    allOf:
> +     - $ref: /schemas/types.yaml#/definitions/uint32
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
> +                compatible = "amlogic,g12-cpu-thermal",
> +                             "amlogic,g12-thermal";
> +                reg = <0x0 0xff634800 0x0 0x50>;

Examples are built now and this will have an error. The default
address and size cells are 1 for examples, so you either have to
override them or adjust this.

> +                interrupts = <0x0 0x24 0x0>;
> +                clocks = <&clk 164>;
> +                status = "okay";

Don't show status in examples.

> +                #thermal-sensor-cells = <0>;
> +                amlogic,ao-secure = <&sec_AO>;
> +        };
> +...
> \ No newline at end of file
> --
> 2.17.1
>
