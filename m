From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCh v3 2/4] arm64: add basic DTS for i.MX8MQ
Date: Wed, 26 Sep 2018 14:19:25 +0000
Message-ID: <AM0PR04MB4211872231A83025EAFE793E80150@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180921125626.21971-1-l.stach@pengutronix.de>
 <20180921125626.21971-2-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180921125626.21971-2-l.stach@pengutronix.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

[...]

A few minor comments, 
see below:

> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> new file mode 100644
> index 000000000000..4f841d84ca8e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -0,0 +1,395 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2017 NXP
> + * Copyright (C) 2017-2018 Pengutronix, Lucas Stach
> <kernel@pengutronix.de>
> + */
> +
> +#include <dt-bindings/clock/imx8mq-clock.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "imx8mq-pinfunc.h"
> +
> +/* first 128 KiB of memory are owned by ATF */
> +/memreserve/ 0x40000000 0x00020000;
> +
> +/ {
> +	/* This should really be the GPC, but we need a driver for this first */
> +	interrupt-parent = <&gic>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		i2c0 = &i2c1;
> +		i2c1 = &i2c2;
> +		i2c2 = &i2c3;
> +		i2c3 = &i2c4;
> +		serial0 = &uart1;
> +		serial1 = &uart2;
> +		serial2 = &uart3;
> +		serial3 = &uart4;
> +	};
> +
> +	ckil: clk-ckil {

s/clk/clock

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "ckil";
> +	};
> +
> +	osc_25m: clk-osc-25m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <25000000>;
> +		clock-output-names = "osc_25m";
> +	};
> +
> +	osc_27m: clk-osc-27m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <27000000>;
> +		clock-output-names = "osc_27m";
> +	};
> +
> +	clk_ext1: clk-ext1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <133000000>;
> +		clock-output-names = "clk_ext1";
> +	};
> +
> +	clk_ext2: clk-ext2 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <133000000>;
> +		clock-output-names = "clk_ext2";
> +	};
> +
> +	clk_ext3: clk-ext3 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <133000000>;
> +		clock-output-names = "clk_ext3";
> +	};
> +
> +	clk_ext4: clk-ext4 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency= <133000000>;
> +		clock-output-names = "clk_ext4";
> +	};

[...]

> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		A53_0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&A53_L2>;
> +		};
> +
> +		A53_1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x1>;
> +			enable-method = "psci";
> +			next-level-cache = <&A53_L2>;
> +		};
> +
> +		A53_2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x2>;
> +			enable-method = "psci";
> +			next-level-cache = <&A53_L2>;
> +		};
> +
> +		A53_3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x3>;
> +			enable-method = "psci";
> +			next-level-cache = <&A53_L2>;
> +		};
> +
> +		A53_L2: l2-cache0 {
> +			compatible = "cache";
> +		};
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Physical Secure
> */
> +		             <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical
> Non-Secure */
> +		             <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
> +		             <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
> +		interrupt-parent = <&gic>;
> +		arm,no-tick-in-suspend;
> +	};
> +
> +	peripherals@0 {

Not sure whether we really need the extra reg address?

> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x0 0x3e000000>;
> +
> +		bus@30000000 { /* AIPS1 */
> +			compatible = "fsl,imx8mq-aips-bus", "simple-bus";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x30000000 0x30000000 0x400000>;
> +
> +			gpio1: gpio@30200000 {
> +				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
> +				reg = <0x30200000 0x10000>;
> +				interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> +				             <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;

There seems to be a code indent issue here and many other places.

> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +			};
> +
> +			gpio2: gpio@30210000 {
> +				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
> +				reg = <0x30210000 0x10000>;
> +				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
> +				        <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;

[...]

> +
> +			iomuxc: iomuxc@30330000 {
> +				compatible = "fsl,imx8mq-iomuxc";
> +				reg = <0x30330000 0x10000>;
> +			};
> +
> +			gpr: iomuxc-gpr@30340000 {

iomuxc_gpr: syscon@30340000

> +				compatible = "fsl,imx8mq-iomuxc-gpr", "syscon";
> +				reg = <0x30340000 0x10000>;
> +			};
> +
> +			anatop: anatop@30360000 {

anatop: syscon@...

> +				compatible = "fsl,imx8mq-anatop", "syscon";
> +				reg = <0x30360000 0x10000>;
> +				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			clk: clock-controller@30380000 {
> +				compatible = "fsl,imx8mq-ccm";
> +				reg = <0x30380000 0x10000>;
> +				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
> +				             <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;

[...]

> +			usdhc1: usdhc@30b40000 {

s/usdhc/mmc

> +				compatible = "fsl,imx8mq-usdhc",
> +				             "fsl,imx7d-usdhc";
> +				reg = <0x30b40000 0x10000>;
> +				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clk IMX8MQ_CLK_DUMMY>,
> +				         <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
> +				         <&clk IMX8MQ_CLK_USDHC1_ROOT>;
> +				clock-names = "ipg", "ahb", "per";
> +				fsl,tuning-start-tap = <20>;
> +				fsl,tuning-step = <2>;
> +				bus-width = <4>;
> +				status = "disabled";
> +			};
> +
> +			usdhc2: usdhc@30b50000 {
> +				compatible = "fsl,imx8mq-usdhc",
> +				             "fsl,imx7d-usdhc";
> +				reg = <0x30b50000 0x10000>;
> +				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clk IMX8MQ_CLK_DUMMY>,
> +				         <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
> +				         <&clk IMX8MQ_CLK_USDHC2_ROOT>;
> +				clock-names = "ipg", "ahb", "per";
> +				fsl,tuning-start-tap = <20>;
> +				fsl,tuning-step = <2>;
> +				bus-width = <4>;
> +				status = "disabled";
> +			};
> +

Otherwise:
Reviewed-by: Dong Aisheng <Aisheng.dong@nxp.com>

Regards
Dong Aisheng

> +			fec1: ethernet@30be0000 {
> +				compatible = "fsl,imx8mq-fec", "fsl,imx6sx-fec";
> +				reg = <0x30be0000 0x10000>;
> +				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +				             <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +				             <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clk IMX8MQ_CLK_ENET1_ROOT>,
> +				         <&clk IMX8MQ_CLK_ENET1_ROOT>,
> +				         <&clk IMX8MQ_CLK_ENET_TIMER>,
> +				         <&clk IMX8MQ_CLK_ENET_REF>,
> +				         <&clk IMX8MQ_CLK_ENET_PHY_REF>;
> +				clock-names = "ipg", "ahb", "ptp",
> +				              "enet_clk_ref", "enet_out";
> +				fsl,num-tx-queues = <3>;
> +				fsl,num-rx-queues = <3>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		gic: interrupt-controller@38800000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x38800000 0x10000>,	/* GIC Dist */
> +			      <0x38880000 0xc0000>,	/* GICR */
> +			      <0x31000000 0x2000>,	/* GICC */
> +			      <0x31010000 0x2000>,	/* GICV */
> +			      <0x31020000 0x2000>;	/* GICH */
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&gic>;
> +		};
> +	};
> +};
> --
> 2.19.0
