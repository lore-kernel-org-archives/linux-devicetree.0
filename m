From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: Add msm8998 SoC and MTP board support
Date: Mon, 07 May 2018 15:59:56 -0700
Message-ID: <152573399648.138124.10341359049104453178@swboyd.mtv.corp.google.com>
References: <20180428054248.22387-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180428054248.22387-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-04-27 22:42:47)
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/=
qcom/msm8998.dtsi
> new file mode 100644
> index 000000000000..d6665e4f801f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -0,0 +1,340 @@
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

No update to dtbtool?

> +
> +       #address-cells =3D <2>;
> +       #size-cells =3D <2>;
> +
> +       chosen { };
> +
> +       memory {
> +               device_type =3D "memory";
> +               /* We expect the bootloader to fill in the reg */
> +               reg =3D <0 0 0 0>;
> +       };
> +
> +       cpus {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <0>;
> +
> +               CPU0: cpu@0 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";
> +                       reg =3D <0x0 0x0>;
> +                       enable-method =3D "psci";
> +                       efficiency =3D <1024>;
> +                       next-level-cache =3D <&L2_0>;
> +                       L2_0: l2-cache {
> +                               compatible =3D "arm,arch-cache";
> +                               cache-level =3D <2>;
> +                       };
> +                       L1_I_0: l1-icache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +                       L1_D_0: l1-dcache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +               };
> +
> +               CPU1: cpu@1 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";
> +                       reg =3D <0x0 0x1>;
> +                       enable-method =3D "psci";
> +                       efficiency =3D <1024>;
> +                       next-level-cache =3D <&L2_0>;
> +                       L1_I_1: l1-icache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +                       L1_D_1: l1-dcache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +               };
> +
> +               CPU2: cpu@2 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";
> +                       reg =3D <0x0 0x2>;
> +                       enable-method =3D "psci";
> +                       efficiency =3D <1024>;
> +                       next-level-cache =3D <&L2_0>;
> +                       L1_I_2: l1-icache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +                       L1_D_2: l1-dcache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +               };
> +
> +               CPU3: cpu@3 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";
> +                       reg =3D <0x0 0x3>;
> +                       enable-method =3D "psci";
> +                       efficiency =3D <1024>;
> +                       next-level-cache =3D <&L2_0>;
> +                       L1_I_3: l1-icache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +                       L1_D_3: l1-dcache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +               };
> +
> +               CPU4: cpu@100 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";
> +                       reg =3D <0x0 0x100>;
> +                       enable-method =3D "psci";
> +                       efficiency =3D <1536>;
> +                       next-level-cache =3D <&L2_1>;
> +                       L2_1: l2-cache {
> +                               compatible =3D "arm,arch-cache";
> +                               cache-level =3D <2>;
> +                       };
> +                       L1_I_100: l1-icache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +                       L1_D_100: l1-dcache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +               };
> +
> +               CPU5: cpu@101 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";
> +                       reg =3D <0x0 0x101>;
> +                       enable-method =3D "psci";
> +                       efficiency =3D <1536>;
> +                       next-level-cache =3D <&L2_1>;
> +                       L1_I_101: l1-icache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +                       L1_D_101: l1-dcache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +               };
> +
> +               CPU6: cpu@102 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";
> +                       reg =3D <0x0 0x102>;
> +                       enable-method =3D "psci";
> +                       efficiency =3D <1536>;
> +                       next-level-cache =3D <&L2_1>;
> +                       L1_I_102: l1-icache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +                       L1_D_102: l1-dcache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +               };
> +
> +               CPU7: cpu@103 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,armv8";
> +                       reg =3D <0x0 0x103>;
> +                       enable-method =3D "psci";
> +                       efficiency =3D <1536>;
> +                       next-level-cache =3D <&L2_1>;
> +                       L1_I_103: l1-icache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +                       L1_D_103: l1-dcache {
> +                               compatible =3D "arm,arch-cache";
> +                       };
> +               };
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
> +               };

I still wonder if this is accurate, but OK.

> +       };
> +
> +       timer {
> +               compatible =3D "arm,armv8-timer";
> +               interrupts =3D <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
> +                            <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
> +                            <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
> +                            <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
> +       };
> +
> +       clocks {
> +               xo_board {
> +                       compatible =3D "fixed-clock";
> +                       #clock-cells =3D <0>;
> +                       clock-frequency =3D <19200000>;
> +               };
> +
> +               sleep_clk {
> +                       compatible =3D "fixed-clock";
> +                       #clock-cells =3D <0>;
> +                       clock-frequency =3D <32764>;
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

Is this needed? The redistributor stuff can be left out if there's only
one right?

> +               interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       blsp2_uart1: serial@c1b0000 {

Clk name says uart2 though?

> +               compatible =3D "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
> +               reg =3D <0xc1b0000 0x1000>;
> +               interrupts =3D <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks =3D <&gcc GCC_BLSP2_UART2_APPS_CLK>,
> +                        <&gcc GCC_BLSP2_AHB_CLK>;
> +               clock-names =3D "core", "iface";
> +               status =3D "disabled";
> +       };
> +
