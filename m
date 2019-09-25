From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: meson: add A1 clock controller bindings
Date: Wed, 25 Sep 2019 16:29:43 +0200
Message-ID: <1j4l10motk.fsf@starbuckisacylon.baylibre.com>
References: <1569411888-98116-1-git-send-email-jian.hu@amlogic.com> <1569411888-98116-2-git-send-email-jian.hu@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569411888-98116-2-git-send-email-jian.hu@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 25 Sep 2019 at 19:44, Jian Hu <jian.hu@amlogic.com> wrote:

In addition to the comment expressed by Stephen on patch 2

> Add the documentation to support Amlogic A1 clock driver,
> and add A1 clock controller bindings.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  .../devicetree/bindings/clock/amlogic,a1-clkc.yaml |  65 +++++++++++++
>  include/dt-bindings/clock/a1-clkc.h                | 102 +++++++++++++++++++++
>  2 files changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-clkc.h
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> new file mode 100644
> index 0000000..f012eb2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + */
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/amlogic,a1-clkc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson A1 Clock Control Unit Device Tree Bindings
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Jian Hu <jian.hu@jian.hu.com>
> +
> +properties:
> +  compatible:
> +    - enum:
> +        - amlogic,a1-clkc
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      - description: peripheral registers
> +      - description: cpu registers
> +      - description: pll registers
> +
> +  reg-names:
> +    items:
> +      - const: peripheral
> +      - const: pll
> +      - const: cpu
> +
> +  clocks:
> +    maxItems: 1
> +    items:
> +      - description: Input Oscillator (usually at 24MHz)
> +
> +  clock-names:
> +    maxItems: 1
> +    items:
> +      - const: xtal
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +
> +examples:
> +  - |
> +    clkc: clock-controller {
> +        compatible = "amlogic,a1-clkc";
> +        reg = <0x0 0xfe000800 0x0 0x100>,
> +              <0x0 0xfe007c00 0x0 0x21c>,
> +              <0x0 0xfd000080 0x0 0x20>;
> +        reg-names = "peripheral", "pll", "cpu";

I'm sorry but I don't agree with this. You are trying to regroup several
controllers into one with this, and it is not OK

By the looks of it there are 3 different controllers, including one you
did not implement in the driver.

> +        clocks = <&xtal;
> +        clock-names = "xtal";
> +        #clock-cells = <1>;
