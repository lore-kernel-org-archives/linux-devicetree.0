Return-Path: <SRS0=6MUZ=MV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f54.google.com ([209.85.221.54]:46677 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbeJINny (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Oct 2018 09:43:54 -0400
Received: by mail-wr1-f54.google.com with SMTP id n11-v6so323282wru.13
        for <devicetree@vger.kernel.org>; Mon, 08 Oct 2018 23:28:33 -0700 (PDT)
Date: Tue, 9 Oct 2018 08:28:29 +0200
From: Oliver Graute <oliver.graute@gmail.com>
Subject: Re: Can't set MX6UL_PAD_LCD_DATA10 register with devicetree
Message-ID: <20181009062829.GA4362@graute-opti>
References: <20181005124519.GA7699@graute-opti>
 <CAOMZO5AivtqPAdcNJk8O2pnse4-gTzL+rzxk7G6gwCcdUcZjHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5AivtqPAdcNJk8O2pnse4-gTzL+rzxk7G6gwCcdUcZjHg@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On 08/10/18, Fabio Estevam wrote:
> Hi Oliver,
> 
> On Fri, Oct 5, 2018 at 9:46 AM Oliver Graute <oliver.graute@gmail.com> wrote:
> >
> > Hello list,
> >
> > I try to set the following PAD in my imx6ul devicetree (derived from
> > imx6ul-14x14-evk.dts)
> >
> > MX6UL_PAD_LCD_DATA10__GPIO3_IO15 0x100b0
> 
> I don't see anything wrong with the definition of
> MX6UL_PAD_LCD_DATA10__GPIO3 in imx6ul-pinfunc.h.
> 
> Could you share your whole dts file?

see dts file below
> 
> Are you sure you are not getting a pin conflict due to previous usage
> of MX6UL_PAD_LCD_DATA10?

I commented out the MX6UL_PAD_LCD_DATA10__LCDIF_DATA10 Pad in the lcdif section
is this sufficient?


/*
 * Copyright (C) 2015 Freescale Semiconductor, Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

/dts-v1/;

#include <dt-bindings/input/input.h>
#include <dt-bindings/gpio/gpio.h>
#include "imx6ul.dtsi"

/ {
	model = "Freescale i.MX6 UltraLite 14x14 EVK Board";
	compatible = "fsl,imx6ul-14x14-evk", "fsl,imx6ul";

	chosen {
		stdout-path = &uart1;
	};

	memory {
		reg = <0x80000000 0x20000000>;
	};

	regulators {
		compatible = "simple-bus";
		#address-cells = <1>;
		#size-cells = <0>;

		reg_sd1_vmmc: sd1_regulator {
			compatible = "regulator-fixed";
			regulator-name = "VSD_3V3";
			regulator-min-microvolt = <3300000>;
			regulator-max-microvolt = <3300000>;
			gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
			enable-active-high;
		};

		reg_vref_3v3: regulator@2 {
			compatible = "regulator-fixed";
			regulator-name = "vref-3v3";
			regulator-min-microvolt = <3300000>;
			regulator-max-microvolt = <3300000>;
		};
	};

	bootshmem {
		compatible = "sagemcom,imx6ul-bootshmem";
	};
};

&cpu0 {
	arm-supply = <&reg_arm>;
	soc-supply = <&reg_soc>;
};

&fec1 {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_enet1>;
	phy-mode = "rmii";
	phy-handle = <&ethphy0>;
	status = "okay";

	mdio {
		#address-cells = <1>;
		#size-cells = <0>;

		ethphy0: ethernet-phy@0 {
			compatible = "micrel,ksz8031";
			phy-reset-gpios = <&gpio3 19 GPIO_ACTIVE_HIGH>;
			/* micrel,rmii-reference-clock-select-25-mhz; */
			clocks = <&mdc>;
			clock-names = "rmii-ref";
			reg = <0>;
		};

	};

	mdc: rmii-ref {
		#clock-cells = <0>;
		compatible ="fixed-clock";
		clock-frequency = <50000000>;
	};
};
/*
&fec2 {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_enet2>;
	phy-mode = "rmii";
	phy-handle = <&ethphy1>;
	status = "okay";

	mdio {
		#address-cells = <1>;
		#size-cells = <0>;

		ethphy0: ethernet-phy@2 {
			reg = <2>;
		};

		ethphy1: ethernet-phy@1 {
			reg = <1>;
		};
	};
};
*/

&qspi {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_qspi>;
	status = "disabled";

	flash0: n25q256a@0 {
		#address-cells = <1>;
		#size-cells = <1>;
		compatible = "micron,n25q256a";
		spi-max-frequency = <29000000>;
		reg = <0>;
	};
};

&snvs_poweroff {
	status = "okay";
};

&tsc {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_tsc>;
	xnur-gpio = <&gpio1 3 GPIO_ACTIVE_LOW>;
	measure-delay-time = <0xffff>;
	pre-charge-time = <0xfff>;
	status = "disabled";
};

&uart1 {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_uart1>;
	status = "okay";
};

&uart2 {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_uart2>;
	fsl,uart-has-rtscts;
	status = "okay";
};

&uart3 {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_uart3>;
	fsl,uart-has-rtscts;
	status = "okay";
};

&uart8 {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_uart8>;
	status = "okay";
};

&usbotg1 {
	dr_mode = "peripheral";
	status = "disabled";
};

&usbotg2 {
	dr_mode = "host";
	disable-over-current;
	status = "okay";
};

&usdhc1 {
	pinctrl-names = "default", "state_100mhz", "state_200mhz";
	pinctrl-0 = <&pinctrl_usdhc1>;
	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
	cd-gpios = <&gpio1 19 GPIO_ACTIVE_LOW>;
	keep-power-in-suspend;
	enable-sdio-wakeup;
	vmmc-supply = <&reg_sd1_vmmc>;
	status = "disabled";
};

&usdhc2 {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_usdhc2>;
	no-1-8-v;
	keep-power-in-suspend;
	enable-sdio-wakeup;
	status = "disabled";
};

&wdog1 {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_wdog>;
	fsl,ext-reset-output;
};

&iomuxc {
	pinctrl-names = "default";

	pinctrl_hog1: hog1grp {
		fsl,pins = <
			MX6UL_PAD_GPIO1_IO00__GPIO1_IO00  0x1b0b0 //GSM_DSR
			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01  0x1b0b0 //GSM_RING
			MX6UL_PAD_GPIO1_IO02__GPIO1_IO02  0x1b0b0 //GSM_DTR
			MX6UL_PAD_GPIO1_IO03__GPIO1_IO03  0x1b0b0 //GSM_DCD
			MX6UL_PAD_GPIO1_IO04__GPIO1_IO04  0x1b0b0 //PWR_IND
			MX6UL_PAD_GPIO1_IO08__GPIO1_IO08  0x1b0b0 //BOOT_EURI
			//MX6UL_PAD_GPIO1_IO05__GPIO1_IO05  0x1b0b0 //CHARGE_LVL
		>;
	};

	pinctrl_hog2: hog2grp {
		fsl,pins = <
			MX6UL_PAD_SD1_DATA1__GPIO2_IO19 0x80000000 //SERVICE_BUTTON
		>;
	};

	pinctrl_hog3: hog3grp {
		fsl,pins = <
			MX6UL_PAD_LCD_DATA08__GPIO3_IO13 0x80000000 //RES_EURI
			MX6UL_PAD_LCD_DATA09__GPIO3_IO14 0x80000000 //SECURE_RST_N
			MX6UL_PAD_LCD_DATA10__GPIO3_IO15 0x100b0 //BATT_USE
			MX6UL_PAD_LCD_DATA12__GPIO3_IO17 0x80000000 //LED_GPRS
			MX6UL_PAD_LCD_DATA13__GPIO3_IO18 0x80000000 //LED_CSD
			MX6UL_PAD_LCD_DATA14__GPIO3_IO19 0x80000000 //GSM_VUSB_EN
			MX6UL_PAD_LCD_DATA15__GPIO3_IO20 0x80000000 //IGNITION
			MX6UL_PAD_LCD_DATA16__GPIO3_IO21 0x80000000 //EMERG_RESET
			MX6UL_PAD_LCD_DATA17__GPIO3_IO22 0x80000000 //LED_POWER
			MX6UL_PAD_LCD_DATA18__GPIO3_IO23 0x80000000 //LED_LOCAL
			MX6UL_PAD_LCD_DATA19__GPIO3_IO24 0x80000000 //LED_ETH
			MX6UL_PAD_LCD_DATA22__GPIO3_IO27 0x80000000 //LED_RSL_1
			MX6UL_PAD_LCD_DATA23__GPIO3_IO28 0x80000000 //LED_RSL_2
		>;
	};

	pinctrl_hog4: hog4grp {
		fsl,pins = <
			MX6UL_PAD_CSI_HSYNC__GPIO4_IO20 0x10088 //RLY_CTRL
			MX6UL_PAD_CSI_DATA00__GPIO4_IO21 0x10088 //AC_FAIL
			MX6UL_PAD_CSI_DATA01__GPIO4_IO22 0x10088 //DC_FAIL
			MX6UL_PAD_CSI_DATA02__GPIO4_IO23 0x10088 //EN_CHARGE_N
			MX6UL_PAD_CSI_DATA03__GPIO4_IO24 0x10088 //CHARGED_SP
			MX6UL_PAD_CSI_DATA04__GPIO4_IO25 0x10088 //CHARGED_IN
			MX6UL_PAD_CSI_DATA05__GPIO4_IO26 0x10088 //EN_BOOST
		>;
	};

	pinctrl_hog5: hog5grp {
		fsl,pins = <
			MX6UL_PAD_BOOT_MODE0__GPIO5_IO10 0x10088 //BOOT_MODE0
			MX6UL_PAD_BOOT_MODE1__GPIO5_IO11 0x10088 //BOOT_MODE1
		>;
	};

	pinctrl_enet1: enet1grp {
		fsl,pins = <
			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b050
			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b050
			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
			MX6UL_PAD_ENET1_RX_ER__ENET1_RX_ER	0x1b0b0
			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b050
		>;
	};

	pinctrl_enet2: enet2grp {
		fsl,pins = <
			MX6UL_PAD_GPIO1_IO07__ENET2_MDC		0x1b0b0
			MX6UL_PAD_GPIO1_IO06__ENET2_MDIO	0x1b0b0
			MX6UL_PAD_ENET2_RX_EN__ENET2_RX_EN	0x1b0b0
			MX6UL_PAD_ENET2_RX_ER__ENET2_RX_ER	0x1b0b0
			MX6UL_PAD_ENET2_RX_DATA0__ENET2_RDATA00	0x1b0b0
			MX6UL_PAD_ENET2_RX_DATA1__ENET2_RDATA01	0x1b0b0
			MX6UL_PAD_ENET2_TX_EN__ENET2_TX_EN	0x1b0b0
			MX6UL_PAD_ENET2_TX_DATA0__ENET2_TDATA00	0x1b0b0
			MX6UL_PAD_ENET2_TX_DATA1__ENET2_TDATA01	0x1b0b0
			MX6UL_PAD_ENET2_TX_CLK__ENET2_REF_CLK2	0x4001b031
			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x17059
		>;
	};

	pinctrl_flexcan1: flexcan1grp{
		fsl,pins = <
			MX6UL_PAD_UART3_RTS_B__FLEXCAN1_RX	0x1b020
			MX6UL_PAD_UART3_CTS_B__FLEXCAN1_TX	0x1b020
		>;
	};

	pinctrl_flexcan2: flexcan2grp{
		fsl,pins = <
			MX6UL_PAD_UART2_RTS_B__FLEXCAN2_RX	0x1b020
			MX6UL_PAD_UART2_CTS_B__FLEXCAN2_TX	0x1b020
		>;
	};

	pinctrl_i2c1: i2c1grp {
		fsl,pins = <
			MX6UL_PAD_UART4_TX_DATA__I2C1_SCL 0x4001b8b0
			MX6UL_PAD_UART4_RX_DATA__I2C1_SDA 0x4001b8b0
		>;
	};

	pinctrl_i2c2: i2c2grp {
		fsl,pins = <
			MX6UL_PAD_UART5_TX_DATA__I2C2_SCL 0x4001b8b0
			MX6UL_PAD_UART5_RX_DATA__I2C2_SDA 0x4001b8b0
		>;
	};

	pinctrl_lcdif_dat: lcdifdatgrp {
		fsl,pins = <
			MX6UL_PAD_LCD_DATA00__LCDIF_DATA00  0x79
			MX6UL_PAD_LCD_DATA01__LCDIF_DATA01  0x79
			MX6UL_PAD_LCD_DATA02__LCDIF_DATA02  0x79
			MX6UL_PAD_LCD_DATA03__LCDIF_DATA03  0x79
			MX6UL_PAD_LCD_DATA04__LCDIF_DATA04  0x79
			MX6UL_PAD_LCD_DATA05__LCDIF_DATA05  0x79
			MX6UL_PAD_LCD_DATA06__LCDIF_DATA06  0x79
			MX6UL_PAD_LCD_DATA07__LCDIF_DATA07  0x79
			//MX6UL_PAD_LCD_DATA08__LCDIF_DATA08  0x79
			MX6UL_PAD_LCD_DATA09__LCDIF_DATA09  0x79
			//MX6UL_PAD_LCD_DATA10__LCDIF_DATA10  0x79
			MX6UL_PAD_LCD_DATA11__LCDIF_DATA11  0x79
			MX6UL_PAD_LCD_DATA12__LCDIF_DATA12  0x79
			MX6UL_PAD_LCD_DATA13__LCDIF_DATA13  0x79
			MX6UL_PAD_LCD_DATA14__LCDIF_DATA14  0x79
			MX6UL_PAD_LCD_DATA15__LCDIF_DATA15  0x79
			MX6UL_PAD_LCD_DATA16__LCDIF_DATA16  0x79
			MX6UL_PAD_LCD_DATA17__LCDIF_DATA17  0x79
			MX6UL_PAD_LCD_DATA18__LCDIF_DATA18  0x79
			MX6UL_PAD_LCD_DATA19__LCDIF_DATA19  0x79
			MX6UL_PAD_LCD_DATA20__LCDIF_DATA20  0x79
			MX6UL_PAD_LCD_DATA21__LCDIF_DATA21  0x79
			MX6UL_PAD_LCD_DATA22__LCDIF_DATA22  0x79
			MX6UL_PAD_LCD_DATA23__LCDIF_DATA23  0x79
		>;
	};

	pinctrl_lcdif_ctrl: lcdifctrlgrp {
		fsl,pins = <
			MX6UL_PAD_LCD_CLK__LCDIF_CLK	    0x79
			MX6UL_PAD_LCD_ENABLE__LCDIF_ENABLE  0x79
			MX6UL_PAD_LCD_HSYNC__LCDIF_HSYNC    0x79
			MX6UL_PAD_LCD_VSYNC__LCDIF_VSYNC    0x79
			/* used for lcd reset */
			MX6UL_PAD_SNVS_TAMPER9__GPIO5_IO09  0x79
		>;
	};

	pinctrl_qspi: qspigrp {
		fsl,pins = <
			MX6UL_PAD_NAND_WP_B__QSPI_A_SCLK	0x70a1
			MX6UL_PAD_NAND_READY_B__QSPI_A_DATA00	0x70a1
			MX6UL_PAD_NAND_CE0_B__QSPI_A_DATA01	0x70a1
			MX6UL_PAD_NAND_CE1_B__QSPI_A_DATA02	0x70a1
			MX6UL_PAD_NAND_CLE__QSPI_A_DATA03	0x70a1
			MX6UL_PAD_NAND_DQS__QSPI_A_SS0_B	0x70a1
		>;
	};
/*
	pinctrl_pwm1: pwm1grp {
		fsl,pins = <
			MX6UL_PAD_GPIO1_IO08__PWM1_OUT   0x110b0
		>;
	};
*/

	pinctrl_sim2: sim2grp {
		fsl,pins = <
			MX6UL_PAD_CSI_DATA03__SIM2_PORT1_PD		0xb808
			MX6UL_PAD_CSI_DATA04__SIM2_PORT1_CLK		0x31
			MX6UL_PAD_CSI_DATA05__SIM2_PORT1_RST_B		0xb808
			MX6UL_PAD_CSI_DATA06__SIM2_PORT1_SVEN		0xb808
			MX6UL_PAD_CSI_DATA07__SIM2_PORT1_TRXD		0xb809
			MX6UL_PAD_CSI_DATA02__GPIO4_IO23		0x3008
		>;
	};

	pinctrl_tsc: tscgrp {
		fsl,pins = <
			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01		0xb0
			MX6UL_PAD_GPIO1_IO02__GPIO1_IO02		0xb0
			MX6UL_PAD_GPIO1_IO03__GPIO1_IO03		0xb0
			MX6UL_PAD_GPIO1_IO04__GPIO1_IO04		0xb0
		>;
	};

	pinctrl_uart1: uart1grp {
		fsl,pins = <
			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX 0x1b0b1
			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX 0x1b0b1
		>;
	};

	pinctrl_uart2: uart2grp {
		fsl,pins = <
			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1 //MTR_RX
			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1 //MTR_TX
			MX6UL_PAD_UART2_CTS_B__UART2_DCE_CTS	0x1b0b1  //(MUX CTS/RI)
			MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
		>;
	};

	pinctrl_uart3: uart3grp {
		fsl,pins = <
			MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b0b1
		>;
	};

	pinctrl_uart8: uart8grp {
		fsl,pins = <
			MX6UL_PAD_LCD_DATA20__UART8_DCE_TX 	0x1b0b1
			MX6UL_PAD_LCD_DATA21__UART8_DCE_RX 	0x1b0b1
		>;
	};

	pinctrl_usdhc1: usdhc1grp {
		fsl,pins = <
			MX6UL_PAD_SD1_CMD__USDHC1_CMD     	0x17059
			MX6UL_PAD_SD1_CLK__USDHC1_CLK     	0x10059
			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0 	0x17059
			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1 	0x17059
			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2 	0x17059
			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3 	0x17059
			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18       0x17059
			MX6UL_PAD_UART1_RTS_B__GPIO1_IO19       0x17059 /* SD1 CD */
			MX6UL_PAD_GPIO1_IO05__USDHC1_VSELECT    0x17059 /* SD1 VSELECT */
			MX6UL_PAD_GPIO1_IO09__GPIO1_IO09        0x17059 /* SD1 RESET */
		>;
	};

	pinctrl_usdhc1_100mhz: usdhc1grp100mhz {
		fsl,pins = <
			MX6UL_PAD_SD1_CMD__USDHC1_CMD     0x170b9
			MX6UL_PAD_SD1_CLK__USDHC1_CLK     0x100b9
			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0 0x170b9
			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1 0x170b9
			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2 0x170b9
			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3 0x170b9

		>;
	};

	pinctrl_usdhc1_200mhz: usdhc1grp200mhz {
		fsl,pins = <
			MX6UL_PAD_SD1_CMD__USDHC1_CMD     0x170f9
			MX6UL_PAD_SD1_CLK__USDHC1_CLK     0x100f9
			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0 0x170f9
			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1 0x170f9
			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2 0x170f9
			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3 0x170f9
		>;
	};

	pinctrl_usdhc2: usdhc2grp {
		fsl,pins = <
			MX6UL_PAD_NAND_RE_B__USDHC2_CLK     0x17059
			MX6UL_PAD_NAND_WE_B__USDHC2_CMD     0x17059
			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0 0x17059
			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1 0x17059
			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2 0x17059
			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3 0x17059
		>;
	};

	pinctrl_wdog: wdoggrp {
		fsl,pins = <
			MX6UL_PAD_LCD_RESET__WDOG1_WDOG_ANY    0x30b0
		>;
	};

	pinctrl_adc1: adc1grp {
		fsl,pins = <
		MX6UL_PAD_GPIO1_IO05__GPIO1_IO05 0xb0
		>;
	};
};

&i2c1 {
	status = "okay";
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_i2c1>;
};

&i2c2 {
	status = "okay";
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_i2c2>;

	eeprom@50 {
		compatible = "at,24c32";
		reg = <0x50>;
		pagesize = <16>;
		size = <4096>;
	};

	temp@50 {
		compatible = "national,lm75";
		reg = <0x4a>;
	};
};


&adc1 {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_adc1>;
	vref-supply = <&reg_vref_3v3>;
	status = "okay";
};

&gpio1 {
	status = "okay";
};

&gpio2 {
	status = "okay";
};

&gpio3 {
	status = "okay";
};

&gpio4 {
	status = "okay";
};

&gpio5 {
	status = "okay";
};

&gpmi {
	status = "okay";
};
/*
&pwm1 {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_pwm1>;
	status = "okay";
};
*/
