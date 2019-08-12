From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH v5 02/18] dt-bindings: thermal: add binding document for
 h6 thermal controller
Date: Tue, 13 Aug 2019 07:40:44 +0800
Message-ID: <CAEExFWswLiFknVpBEKF9c5yoFvvA4np-ivWYkQLcteYoM8qjfg@mail.gmail.com>
References: <20190810052829.6032-1-tiny.windzz@gmail.com> <20190810052829.6032-3-tiny.windzz@gmail.com>
 <20190812085604.ozhl35wwm3ehlvqn@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812085604.ozhl35wwm3ehlvqn@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: rui.zhang@intel.com, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, David Miller <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan.Cameron@huawei.com, Nicolas Ferre <nicolas.ferre@microchip.com>, Linux PM <linux-pm@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 4:56 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Sat, Aug 10, 2019 at 05:28:13AM +0000, Yangtao Li wrote:
> > This patch adds binding document for allwinner h6 thermal controller.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >  .../bindings/thermal/sun8i-thermal.yaml       | 79 +++++++++++++++++++
> >  1 file changed, 79 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml b/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
> > new file mode 100644
> > index 000000000000..e0973199ba3c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
>
> We've used so far for the schemas the first compatible to introduce
> that controller as the filename, we should be consistent here. In that
> case that would be allwinner,sun8i-a23-ths.yaml
>
> > @@ -0,0 +1,79 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/thermal/sun8i-thermal.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner SUN8I Thermal Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Yangtao Li <tiny.windzz@gmail.com>
> > +
> > +description: |-
> > +  This describes the device tree binding for the Allwinner thermal
> > +  controller which measures the on-SoC temperatures.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - allwinner,sun50i-h6-ths
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: bus
> > +
> > +  "#thermal-sensor-cells":
> > +    const: 1
> > +
> > +  nvmem-cells:
>
> You need a maxItems here too
>
> > +    description: ths calibrate data
>
> What about something like this:
>
> Calibration data for the thermal sensor
>
> > +
> > +  nvmem-cell-names:
> > +    const: calib
>
> I'm not sure we need a abbreviation here, calibration would be more
> explicit
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reset
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - "#thermal-sensor-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    ths: ths@5070400 {
> > +        compatible = "allwinner,sun50i-h6-ths";
> > +        reg = <0x05070400 0x100>;
> > +        clocks = <&ccu CLK_BUS_THS>;
> > +        clock-names = "bus";
> > +        resets = <&ccu RST_BUS_THS>;
> > +        interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
>
> Those examples won't compile.

Emmm, I have some questions about this.
I added this information and it can be compiled.

Yours,
Yangtao

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
