From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] arm64: dts: Add msm8998 SoC and MTP board support
Date: Thu, 19 Apr 2018 15:58:35 -0700
Message-ID: <152417871558.46528.12974380945707201990@swboyd.mtv.corp.google.com>
References: <20180327160154.1938-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180327160154.1938-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, Imran Khan <kimran@codeaurora.org>, Joonwoo Park <joonwoop@codeaurora.org>, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-03-27 09:01:53)
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/=
dts/qcom/msm8998-mtp.dtsi
> new file mode 100644
> index 000000000000..0f2f0e0de74f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2016, The Linux Foundation. All rights reserved. */
> +
> +#include "msm8998.dtsi"
> +
> +/ {
> +       aliases {
> +               serial0 =3D &blsp2_uart1;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0";

Plus :115200n8?

> +       };
> +};
> +
> +&soc {
> +       serial@0c1b0000 {
> +               status =3D "okay";
> +       };
> +};
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/=
qcom/msm8998.dtsi
> new file mode 100644
> index 000000000000..9e2c0ff7457f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -0,0 +1,344 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2016, The Linux Foundation. All rights reserved. */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-msm8998.h>
> +
> +/ {
> +       model =3D "Qualcomm Technologies, Inc. MSM 8998";
> +
> +       interrupt-parent =3D <&intc>;
> +
> +       qcom,msm-id =3D <292 0x0>;

Sadface.

> +
> +       #address-cells =3D <2>;
> +       #size-cells =3D <2>;
> +
[...]
> +
> +               cpu-map {
> +                       cluster0 {
> +                               core0 {
> +                                       cpu =3D <&CPU0>;
> +                               };
> +
> +                               core1 {
> +                                       cpu =3D <&CPU1>;
> +                               };
> +
> +                               core2 {
> +                                       cpu =3D <&CPU2>;
> +                               };
> +
> +                               core3 {
> +                                       cpu =3D <&CPU3>;
> +                               };
> +                       };
> +
> +                       cluster1 {
> +                               core0 {
> +                                       cpu =3D <&CPU4>;
> +                               };
> +
> +                               core1 {
> +                                       cpu =3D <&CPU5>;
> +                               };
> +
> +                               core2 {
> +                                       cpu =3D <&CPU6>;
> +                               };
> +
> +                               core3 {
> +                                       cpu =3D <&CPU7>;
> +                               };
> +                       };

Is this accurate? Or it's describing the power hierarchy?

> +               };
> +       };
> +
> +       timer {
> +               compatible =3D "arm,armv8-timer";
> +               interrupts =3D <1 1 0xf08>,
> +                            <1 2 0xf08>,
> +                            <1 3 0xf08>,
> +                            <1 0 0xf08>;

Are these 0xf08 things accurate?

> +               clock-frequency =3D <19200000>;

Drop? Should come from hardware.

> +       };
> +
> +       clocks {
> +               xo_board {
> +                       compatible =3D "fixed-clock";
> +                       #clock-cells =3D <0>;
> +                       clock-frequency =3D <19200000>;
> +                       clock-output-names =3D "xo_board";

The output names aren't needed.

> +               };
> +
> +               sleep_clk {
> +                       compatible =3D "fixed-clock";
> +                       #clock-cells =3D <0>;
> +                       clock-frequency =3D <32764>;
> +                       clock-output-names =3D "sleep_clk";
> +               };
> +       };
> +
> +       psci {
> +               compatible =3D "arm,psci-1.0";
> +               method =3D "smc";
> +       };
> +
> +       soc: soc {};
> +};
> +
> +&soc {

Ok!

> +       #address-cells =3D <1>;
> +       #size-cells =3D <1>;
> +       ranges =3D <0 0 0 0xffffffff>;
> +       compatible =3D "simple-bus";
> +
> +       intc: interrupt-controller@17a00000 {
> +               compatible =3D "arm,gic-v3";
> +               reg =3D <0x17a00000 0x10000>,       /* GICD */
> +                     <0x17b00000 0x100000>;      /* GICR * 8 */
> +               #interrupt-cells =3D <3>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges;
> +               interrupt-controller;
> +               #redistributor-regions =3D <1>;
> +               redistributor-stride =3D <0x0 0x20000>;

Was this stride stuff needed still?

> +               interrupts =3D <1 9 4>;

Use special GIC flags?

> +       };
> +
> +       gcc: clock-controller@100000 {
> +               compatible =3D "qcom,gcc-msm8998";
> +               #clock-cells =3D <1>;
> +               #reset-cells =3D <1>;
> +               #power-domain-cells =3D <1>;
> +               reg =3D <0x100000 0xb0000>;
> +       };
> +
> +       blsp2_uart1: serial@0c1b0000 {

Drop leading zeroes please.

> +               compatible =3D "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
> +               reg =3D <0xc1b0000 0x1000>;
> +               interrupts =3D <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks =3D <&gcc GCC_BLSP2_UART2_APPS_CLK>,
> +                        <&gcc GCC_BLSP2_AHB_CLK>;
> +               clock-names =3D "core", "iface";
> +               status =3D "disabled";
> +       };
> +
> +       timer@17920000 {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges;
> +               compatible =3D "arm,armv7-timer-mem";
> +               reg =3D <0x17920000 0x1000>;
> +               clock-frequency =3D <19200000>;

Read from hardware instead?
