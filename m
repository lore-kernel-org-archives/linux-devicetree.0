From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: thermal: Add DT bindings documentation
 for Amlogic Thermal
Date: Wed, 31 Jul 2019 11:00:50 -0600
Message-ID: <CAL_Jsq+Z1JvvtrDBtqbcuzdy_k5=OSSLQ7ezKvs9-oyvGi=-9A@mail.gmail.com>
References: <20190731121409.17285-1-glaroque@baylibre.com> <20190731121409.17285-2-glaroque@baylibre.com>
 <f0f0dfe5-0cd3-5275-53ff-cfc4bb44f7e6@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f0f0dfe5-0cd3-5275-53ff-cfc4bb44f7e6@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Guillaume La Roque <glaroque@baylibre.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:THERMAL" <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 6:44 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 31/07/2019 14:14, Guillaume La Roque wrote:
> > Adding the devicetree binding documentation for the Amlogic temperature
> > sensor found in the Amlogic Meson G12 SoCs.
> > the G12A  and G12B SoCs are supported.
> >
> > Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> > ---
> >  .../bindings/thermal/amlogic,thermal.yaml     | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> > new file mode 100644
> > index 000000000000..1e2fe84da13d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/thermal/amlogic,thermal.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Amlogic Thermal Driver
> > +
> > +maintainers:
> > +  - Guillaume La Roque <glaroque@baylibre.com>
> > +
> > +description: Amlogic Thermal driver
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - amlogic,g12-cpu-thermal
> > +              - amlogic,g12-ddr-thermal
> > +          - enum:
> > +              - amlogic,g12-thermal
>
> Shouldn't be :
>     compatible:
>         items:
>           - enum:
>               - amlogic,g12-cpu-thermal
>               - amlogic,g12-ddr-thermal
>           - const:
>               - amlogic,g12-thermal
>
> instead ?

Yes, except 'const' is a string, not list value.

>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  amlogic,ao-secure:
> > +    description: phandle to the ao-secure syscon
> > +    allOf:
> > +     - $ref: /schemas/types.yaml#/definitions/uint32

phandle, not uint32

> > +
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - amlogic,ao-secure
> > +
> > +examples:
> > +  - |
> > +        cpu_temp: temperature-sensor@ff634800 {
> > +                compatible = "amlogic,g12-cpu-thermal",
> > +                             "amlogic,g12-thermal";
> > +                reg = <0x0 0xff634800 0x0 0x50>;
> > +                interrupts = <0x0 0x24 0x0>;
> > +                clocks = <&clk 164>;
> > +                status = "okay";
> > +                #thermal-sensor-cells = <1>;
> > +                amlogic,ao-secure = <&sec_AO>;
> > +        };
> > +...
> > \ No newline at end of file

Fix this.


> >
>
