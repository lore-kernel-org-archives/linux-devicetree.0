From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: Convert Arm Mali Midgard GPU to DT schema
Date: Wed, 21 Aug 2019 08:28:07 -0500
Message-ID: <CAL_JsqL=qCVfbKnNK6q_au2PXKcOpZ6584gungRgz7T0oXNFdg@mail.gmail.com>
References: <20190820195959.6126-1-robh@kernel.org> <20190820195959.6126-2-robh@kernel.org>
 <0ab5959e-fc6c-06c3-a3f1-ea5a1ebef87d@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0ab5959e-fc6c-06c3-a3f1-ea5a1ebef87d@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Heiko Stuebner <heiko@sntech.de>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2019 at 2:12 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Rob,
>
> On 20/08/2019 21:59, Rob Herring wrote:
> > Convert the Arm Midgard GPU binding to DT schema format.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/gpu/arm,mali-midgard.txt         | 119 -------------
> >  .../bindings/gpu/arm,mali-midgard.yaml        | 165 ++++++++++++++++++
> >  2 files changed, 165 insertions(+), 119 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> >  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> > deleted file mode 100644
> > index 9b298edec5b2..000000000000
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> > +++ /dev/null
> > @@ -1,119 +0,0 @@
> > -ARM Mali Midgard GPU
> > -====================
> > -
> > -Required properties:
> > -
> > -- compatible :
> > -  * Must contain one of the following:
> > -    + "arm,mali-t604"
> > -    + "arm,mali-t624"
> > -    + "arm,mali-t628"
> > -    + "arm,mali-t720"
> > -    + "arm,mali-t760"
> > -    + "arm,mali-t820"
> > -    + "arm,mali-t830"
> > -    + "arm,mali-t860"
> > -    + "arm,mali-t880"
> > -  * which must be preceded by one of the following vendor specifics:
> > -    + "allwinner,sun50i-h6-mali"
> > -    + "amlogic,meson-gxm-mali"
> > -    + "samsung,exynos5433-mali"
> > -    + "rockchip,rk3288-mali"
> > -    + "rockchip,rk3399-mali"
> > -
> > -- reg : Physical base address of the device and length of the register area.
> > -
> > -- interrupts : Contains the three IRQ lines required by Mali Midgard devices.
> > -
> > -- interrupt-names : Contains the names of IRQ resources in the order they were
> > -  provided in the interrupts property. Must contain: "job", "mmu", "gpu".
> > -
> > -
> > -Optional properties:
> > -
> > -- clocks : Phandle to clock for the Mali Midgard device.
> > -
> > -- clock-names : Specify the names of the clocks specified in clocks
> > -  when multiple clocks are present.
> > -    * core: clock driving the GPU itself (When only one clock is present,
> > -      assume it's this clock.)
> > -    * bus: bus clock for the GPU
> > -
> > -- mali-supply : Phandle to regulator for the Mali device. Refer to
> > -  Documentation/devicetree/bindings/regulator/regulator.txt for details.
> > -
> > -- operating-points-v2 : Refer to Documentation/devicetree/bindings/opp/opp.txt
> > -  for details.
> > -
> > -- #cooling-cells: Refer to Documentation/devicetree/bindings/thermal/thermal.txt
> > -  for details.
> > -
> > -- resets : Phandle of the GPU reset line.
> > -
> > -Vendor-specific bindings
> > -------------------------
> > -
> > -The Mali GPU is integrated very differently from one SoC to
> > -another. In order to accommodate those differences, you have the option
> > -to specify one more vendor-specific compatible, among:
> > -
> > -- "allwinner,sun50i-h6-mali"
> > -  Required properties:
> > -  - clocks : phandles to core and bus clocks
> > -  - clock-names : must contain "core" and "bus"
> > -  - resets: phandle to GPU reset line
> > -
> > -- "amlogic,meson-gxm-mali"
> > -  Required properties:
> > -  - resets : Should contain phandles of :
> > -    + GPU reset line
> > -    + GPU APB glue reset line
> > -
> > -Example for a Mali-T760:
> > -
> > -gpu@ffa30000 {
> > -     compatible = "rockchip,rk3288-mali", "arm,mali-t760";
> > -     reg = <0xffa30000 0x10000>;
> > -     interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> > -                  <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> > -                  <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> > -     interrupt-names = "job", "mmu", "gpu";
> > -     clocks = <&cru ACLK_GPU>;
> > -     mali-supply = <&vdd_gpu>;
> > -     operating-points-v2 = <&gpu_opp_table>;
> > -     power-domains = <&power RK3288_PD_GPU>;
> > -     #cooling-cells = <2>;
> > -};
> > -
> > -gpu_opp_table: opp_table0 {
> > -     compatible = "operating-points-v2";
> > -
> > -     opp@533000000 {
> > -             opp-hz = /bits/ 64 <533000000>;
> > -             opp-microvolt = <1250000>;
> > -     };
> > -     opp@450000000 {
> > -             opp-hz = /bits/ 64 <450000000>;
> > -             opp-microvolt = <1150000>;
> > -     };
> > -     opp@400000000 {
> > -             opp-hz = /bits/ 64 <400000000>;
> > -             opp-microvolt = <1125000>;
> > -     };
> > -     opp@350000000 {
> > -             opp-hz = /bits/ 64 <350000000>;
> > -             opp-microvolt = <1075000>;
> > -     };
> > -     opp@266000000 {
> > -             opp-hz = /bits/ 64 <266000000>;
> > -             opp-microvolt = <1025000>;
> > -     };
> > -     opp@160000000 {
> > -             opp-hz = /bits/ 64 <160000000>;
> > -             opp-microvolt = <925000>;
> > -     };
> > -     opp@100000000 {
> > -             opp-hz = /bits/ 64 <100000000>;
> > -             opp-microvolt = <912500>;
> > -     };
> > -};
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> > new file mode 100644
> > index 000000000000..24c4af74fb8d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> > @@ -0,0 +1,165 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ARM Mali Midgard GPU
> > +
> > +maintainers:
> > +  - Rob Herring <robh@kernel.org>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^gpu@[a-f0-9]+$'
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +             - allwinner,sun50i-h6-mali
> > +          - const: arm,mali-t720
> > +      - items:
> > +          - enum:
> > +             - amlogic,meson-gxm-mali
> > +          - const: arm,mali-t820
> > +      - items:
> > +          - enum:
> > +             - rockchip,rk3288-mali
> > +          - const: arm,mali-t760
> > +      - items:
> > +          - enum:
> > +             - rockchip,rk3399-mali
> > +          - const: arm,mali-t860
> > +      - items:
> > +          - enum:
> > +             - samsung,exynos5433-mali
> > +          - const: arm,mali-t760
> > +
> > +          # "arm,mali-t604"
> > +          # "arm,mali-t624"
> > +          # "arm,mali-t628"
> > +          # "arm,mali-t830"
> > +          # "arm,mali-t880"
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Job interrupt
> > +      - description: MMU interrupt
> > +      - description: GPU interrupt
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: job
> > +      - const: mmu
> > +      - const: gpu
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: core
> > +      - const: bus
> > +
> > +  mali-supply:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  operating-points-v2: true
> > +
> > +  "#cooling-cells":
> > +    const: 2
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: allwinner,sun50i-h6-mali
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 2
> > +      required:
> > +        - clocks
> > +        - clock-names
> > +        - resets
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: amlogic,meson-gxm-mali
> > +    then:
> > +      properties:
> > +        resets:
> > +          minItems: 2
> > +      required:
> > +        - resets
>
> The original bindings was wrong, In fact, clocks should be required here aswell.
> Same for bifrost and utgard...
>
> Should I send a fixup patch ?

I think we should just make clocks required. I can't imagine anyone
not using the clock binding.

Rob
