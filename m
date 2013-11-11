From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv7][ 1/3] DT: Add basic support for imx35-based devices.
Date: Mon, 11 Nov 2013 15:28:22 +0800
Message-ID: <20131111072821.GC10085@S2101-09.ap.freescale.net>
References: <1383911012-8905-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383911012-8905-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Eric =?iso-8859-1?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 08, 2013 at 12:43:29PM +0100, Denis Carikli wrote:
> From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>=20
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Eric B=E9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> ---
> ChangeLog v6->v7:
> - Added Grant Likely in the Cc list.
> - Added imx35-pingrp.h, and converted the rest of the patch to use it=
=2E
> - lcdc pads were moved from the dtsi into another commit.
> - A whitespace issue in the dtsi was removed.
>=20
> ChangeLog v5->v6:
> - The dependency on pdata clocks has been removed,
>   and the dtsi adapted accordinly.
> - Adaptation to the for-next branch of Shawn Guo at
>   git://git.linaro.org/people/shawnguo/linux-2.6.git for-next
> - imx35-dt.c: very small whitespace cleanup.
> - Kconfig: The selection of IMX_HAVE_PLATFORM_* has been removed.
> - dtsi: The nodes were reordered alphabetically.
> - dtsi: The aliases have been reordered alphabetically.
> - Shawn Guo was added in the Cc.
> ---
>  .../devicetree/bindings/clock/imx35-clock.txt      |  115 ++++++
>  arch/arm/boot/dts/imx35-pingrp.h                   |  100 ++++++
>  arch/arm/boot/dts/imx35.dtsi                       |  368 ++++++++++=
++++++++++
>  arch/arm/mach-imx/Kconfig                          |    9 +
>  arch/arm/mach-imx/Makefile                         |    1 +
>  arch/arm/mach-imx/clk-imx35.c                      |   18 +
>  arch/arm/mach-imx/common.h                         |    1 +
>  arch/arm/mach-imx/imx35-dt.c                       |   48 +++

Please separate arch/arm/boot/dts/ bits into another patch.

>  8 files changed, 660 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx35-clo=
ck.txt
>  create mode 100644 arch/arm/boot/dts/imx35-pingrp.h
>  create mode 100644 arch/arm/boot/dts/imx35.dtsi
>  create mode 100644 arch/arm/mach-imx/imx35-dt.c
>=20
> diff --git a/Documentation/devicetree/bindings/clock/imx35-clock.txt =
b/Documentation/devicetree/bindings/clock/imx35-clock.txt
> new file mode 100644
> index 0000000..9f9a60d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imx35-clock.txt
> @@ -0,0 +1,115 @@
> +* Clock bindings for Freescale i.MX35
> +
> +Required properties:
> +- compatible: Should be "fsl,imx35-ccm"
> +- reg: Address and length of the register set
> +- interrupts: Should contain CCM interrupt
> +- #clock-cells: Should be <1>
> +
> +The clock consumer should specify the desired clock by having the cl=
ock
> +ID in its "clocks" phandle cell.  The following is a full list of i.=
MX35
> +clocks and IDs.
> +
> +	Clock			ID
> +	---------------------------
> +	ckih			0
> +	mpll			1
> +	ppll			2
> +	mpll_075		3
> +	arm			4
> +	hsp			5
> +	hsp_div			6
> +	hsp_sel			7
> +	ahb			8
> +	ipg			9
> +	arm_per_div		10
> +	ahb_per_div		11
> +	ipg_per			12
> +	uart_sel		13
> +	uart_div		14
> +	esdhc_sel		15
> +	esdhc1_div		16
> +	esdhc2_div		17
> +	esdhc3_div		18
> +	spdif_sel		19
> +	spdif_div_pre		20
> +	spdif_div_post		21
> +	ssi_sel			22
> +	ssi1_div_pre		23
> +	ssi1_div_post		24
> +	ssi2_div_pre		25
> +	ssi2_div_post		26
> +	usb_sel			27
> +	usb_div			28
> +	nfc_div			29
> +	asrc_gate		30
> +	pata_gate		31
> +	audmux_gate		32
> +	can1_gate		33
> +	can2_gate		34
> +	cspi1_gate		35
> +	cspi2_gate		36
> +	ect_gate		37
> +	edio_gate		38
> +	emi_gate		39
> +	epit1_gate		40
> +	epit2_gate		41
> +	esai_gate		42
> +	esdhc1_gate		43
> +	esdhc2_gate		44
> +	esdhc3_gate		45
> +	fec_gate		46
> +	gpio1_gate		47
> +	gpio2_gate		48
> +	gpio3_gate		49
> +	gpt_gate		50
> +	i2c1_gate		51
> +	i2c2_gate		52
> +	i2c3_gate		53
> +	iomuxc_gate		54
> +	ipu_gate		55
> +	kpp_gate		56
> +	mlb_gate		57
> +	mshc_gate		58
> +	owire_gate		59
> +	pwm_gate		60
> +	rngc_gate		61
> +	rtc_gate		62
> +	rtic_gate		63
> +	scc_gate		64
> +	sdma_gate		65
> +	spba_gate		66
> +	spdif_gate		67
> +	ssi1_gate		68
> +	ssi2_gate		69
> +	uart1_gate		70
> +	uart2_gate		71
> +	uart3_gate		72
> +	usbotg_gate		73
> +	wdog_gate		74
> +	max_gate		75
> +	admux_gate		76
> +	csi_gate		77
> +	csi_div			78
> +	csi_sel			79
> +	iim_gate		80
> +	gpu2d_gate		81
> +	clk_max			82

clk_max is not a clock signal and should be here.

> +
> +Examples:
> +
> +clks: ccm@53f80000 {
> +	compatible =3D "fsl,imx35-ccm";
> +	reg =3D <0x53f80000 0x4000>;
> +	interrupts =3D <31>;
> +	#clock-cells =3D <1>;
> +};
> +
> +esdhc1: esdhc@53fb4000 {
> +	compatible =3D "fsl,imx35-esdhc";
> +	reg =3D <0x53fb4000 0x4000>;
> +	interrupts =3D <7>;
> +	clocks =3D <&clks 9>, <&clks 8>, <&clks 43>;
> +	clock-names =3D "ipg", "ahb", "per";
> +	status =3D "disabled";

Drop 'status' line from the example.

> +};
> diff --git a/arch/arm/boot/dts/imx35-pingrp.h b/arch/arm/boot/dts/imx=
35-pingrp.h
> new file mode 100644
> index 0000000..56fa422
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx35-pingrp.h
> @@ -0,0 +1,100 @@
> +/*
> + * Copyright 2013 Eukr=E9a Electromatique <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + */
> +
> +#ifndef __DTS_IMX35_PINGRP_H
> +#define __DTS_IMX35_PINGRP_H
> +
> +#define MX35_AUDMUX_PINGRP1 \
> +	MX35_PAD_STXFS4__AUDMUX_AUD4_TXFS	       	0x80000000 \
> +	MX35_PAD_STXD4__AUDMUX_AUD4_TXD			0x80000000 \
> +	MX35_PAD_SRXD4__AUDMUX_AUD4_RXD			0x80000000 \
> +	MX35_PAD_SCK4__AUDMUX_AUD4_TXC			0x80000000
> +
> +#define MX35_CAN1_PINGRP1 \
> +	MX35_PAD_I2C2_CLK__CAN1_TXCAN			0x1c0 \
> +	MX35_PAD_I2C2_DAT__CAN1_RXCAN			0x1c0
> +
> +#define MX35_CAN2_PINGRP1 \
> +	MX35_PAD_TX5_RX0__CAN2_TXCAN			0x1c0 \
> +	MX35_PAD_TX4_RX1__CAN2_RXCAN			0x1c0
> +
> +#define MX35_ESDHC1_PINGRP1 \
> +	MX35_PAD_SD1_CMD__ESDHC1_CMD			0x80000000 \
> +	MX35_PAD_SD1_CLK__ESDHC1_CLK			0x80000000 \
> +	MX35_PAD_SD1_DATA0__ESDHC1_DAT0			0x80000000 \
> +	MX35_PAD_SD1_DATA1__ESDHC1_DAT1			0x80000000 \
> +	MX35_PAD_SD1_DATA2__ESDHC1_DAT2			0x80000000 \
> +	MX35_PAD_SD1_DATA3__ESDHC1_DAT3			0x80000000
> +
> +#define MX35_FEC_PINGRP1 \
> +	MX35_PAD_FEC_TX_CLK__FEC_TX_CLK			0x80000000 \
> +	MX35_PAD_FEC_RX_CLK__FEC_RX_CLK			0x80000000 \
> +	MX35_PAD_FEC_RX_DV__FEC_RX_DV			0x80000000 \
> +	MX35_PAD_FEC_COL__FEC_COL			0x80000000 \
> +	MX35_PAD_FEC_RDATA0__FEC_RDATA_0		0x80000000 \
> +	MX35_PAD_FEC_TDATA0__FEC_TDATA_0		0x80000000 \
> +	MX35_PAD_FEC_TX_EN__FEC_TX_EN			0x80000000 \
> +	MX35_PAD_FEC_MDC__FEC_MDC			0x80000000 \
> +	MX35_PAD_FEC_MDIO__FEC_MDIO			0x80000000 \
> +	MX35_PAD_FEC_TX_ERR__FEC_TX_ERR			0x80000000 \
> +	MX35_PAD_FEC_RX_ERR__FEC_RX_ERR			0x80000000 \
> +	MX35_PAD_FEC_CRS__FEC_CRS			0x80000000 \
> +	MX35_PAD_FEC_RDATA1__FEC_RDATA_1		0x80000000 \
> +	MX35_PAD_FEC_TDATA1__FEC_TDATA_1		0x80000000 \
> +	MX35_PAD_FEC_RDATA2__FEC_RDATA_2		0x80000000 \
> +	MX35_PAD_FEC_TDATA2__FEC_TDATA_2		0x80000000 \
> +	MX35_PAD_FEC_RDATA3__FEC_RDATA_3		0x80000000 \
> +	MX35_PAD_FEC_TDATA3__FEC_TDATA_3		0x80000000
> +
> +#define MX35_I2C1_PINGRP1 \
> +	MX35_PAD_I2C1_CLK__I2C1_SCL			0x80000000 \
> +	MX35_PAD_I2C1_DAT__I2C1_SDA			0x80000000
> +
> +#define MX35_I2C3_PINGRP1 \
> +	MX35_PAD_ATA_DATA12__I2C3_SCL			0x1c0 \
> +	MX35_PAD_ATA_DATA13__I2C3_SDA			0x1c0
> +
> +#define MX35_IPU_PINGRP1 \
> +	MX35_PAD_LD0__IPU_DISPB_DAT_0			0x80000000 \
> +	MX35_PAD_LD1__IPU_DISPB_DAT_1			0x80000000 \
> +	MX35_PAD_LD2__IPU_DISPB_DAT_2			0x80000000 \
> +	MX35_PAD_LD3__IPU_DISPB_DAT_3			0x80000000 \
> +	MX35_PAD_LD4__IPU_DISPB_DAT_4			0x80000000 \
> +	MX35_PAD_LD5__IPU_DISPB_DAT_5			0x80000000 \
> +	MX35_PAD_LD6__IPU_DISPB_DAT_6			0x80000000 \
> +	MX35_PAD_LD7__IPU_DISPB_DAT_7			0x80000000 \
> +	MX35_PAD_LD8__IPU_DISPB_DAT_8			0x80000000 \
> +	MX35_PAD_LD9__IPU_DISPB_DAT_9			0x80000000 \
> +	MX35_PAD_LD10__IPU_DISPB_DAT_10			0x80000000 \
> +	MX35_PAD_LD11__IPU_DISPB_DAT_11			0x80000000 \
> +	MX35_PAD_LD12__IPU_DISPB_DAT_12			0x80000000 \
> +	MX35_PAD_LD13__IPU_DISPB_DAT_13			0x80000000 \
> +	MX35_PAD_LD14__IPU_DISPB_DAT_14			0x80000000 \
> +	MX35_PAD_LD15__IPU_DISPB_DAT_15			0x80000000 \
> +	MX35_PAD_LD16__IPU_DISPB_DAT_16			0x80000000 \
> +	MX35_PAD_LD17__IPU_DISPB_DAT_17			0x80000000 \
> +	MX35_PAD_D3_HSYNC__IPU_DISPB_D3_HSYNC		0x80000000 \
> +	MX35_PAD_D3_FPSHIFT__IPU_DISPB_D3_CLK		0x80000000 \
> +	MX35_PAD_D3_DRDY__IPU_DISPB_D3_DRDY		0x80000000 \
> +	MX35_PAD_D3_VSYNC__IPU_DISPB_D3_VSYNC		0x80000000 \
> +	MX35_PAD_CONTRAST__IPU_DISPB_CONTR		0x80000000
> +
> +#define MX35_UART1_PINGRP1 \
> +	MX35_PAD_CTS1__UART1_CTS			0x80000000 \
> +	MX35_PAD_RTS1__UART1_RTS			0x80000000 \
> +	MX35_PAD_TXD1__UART1_TXD_MUX			0x80000000 \
> +	MX35_PAD_RXD1__UART1_RXD_MUX			0x80000000
> +
> +#define MX35_UART2_PINGRP1 \
> +	MX35_PAD_RTS2__UART2_RTS			0x80000000 \
> +	MX35_PAD_CTS2__UART2_CTS			0x80000000 \
> +	MX35_PAD_RXD2__UART2_RXD_MUX			0x80000000 \
> +	MX35_PAD_TXD2__UART2_TXD_MUX			0x80000000
> +
> +#endif /* __DTS_IMX35_PINGRP_H */
> diff --git a/arch/arm/boot/dts/imx35.dtsi b/arch/arm/boot/dts/imx35.d=
tsi
> new file mode 100644
> index 0000000..1cf520a
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx35.dtsi
> @@ -0,0 +1,368 @@
> +/*
> + * Copyright 2012 Steffen Trumtrar, Pengutronix
> + *
> + * based on imx27.dtsi
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify it under
> + * the terms of the GNU General Public License version 2 as publishe=
d by the
> + * Free Software Foundation.
> + */
> +
> +#include "skeleton.dtsi"
> +#include "imx35-pinfunc.h"
> +#include "imx35-pingrp.h"
> +
> +/ {
> +	aliases {
> +		gpio0 =3D &gpio1;
> +		gpio1 =3D &gpio2;
> +		gpio2 =3D &gpio3;
> +		serial0 =3D &uart1;
> +		serial1 =3D &uart2;
> +		serial2 =3D &uart3;
> +	};
> +
> +	avic: avic-interrupt-controller@68000000 {
> +		compatible =3D "fsl,imx35-avic", "fsl,avic";
> +		interrupt-controller;
> +		#interrupt-cells =3D <1>;
> +		reg =3D <0x68000000 0x10000000>;
> +	};
> +
> +	clocks {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		ckil {
> +			compatible =3D "fsl,imx-ckil", "fixed-clock";
> +			clock-frequency =3D <32768>;
> +		};
> +
> +		osc {
> +			compatible =3D "fsl,imx-osc", "fixed-clock";
> +			clock-frequency =3D <24000000>;
> +		};
> +	};
> +
> +	soc {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		compatible =3D "simple-bus";
> +		interrupt-parent =3D <&avic>;
> +		ranges;
> +
> +		L2: l2-cache@30000000 {
> +			compatible =3D "arm,l210-cache";
> +			reg =3D <0x30000000 0x1000>;
> +			cache-unified;
> +			cache-level =3D <2>;
> +		};
> +
> +		aips1: aips@43f00000 {
> +			compatible =3D "fsl,aips", "simple-bus";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			reg =3D <0x43f00000 0x100000>;
> +			ranges;
> +
> +			i2c1: i2c@43f80000 {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				compatible =3D "fsl,imx35-i2c", "fsl,imx1-i2c";
> +				reg =3D <0x43f80000 0x4000>;
> +				clocks =3D <&clks 51>;
> +				clock-names =3D "ipg_per";
> +				interrupts =3D <10>;
> +				status =3D "disabled";
> +			};
> +
> +			i2c3: i2c@43f84000 {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				compatible =3D "fsl,imx35-i2c", "fsl,imx1-i2c";
> +				reg =3D <0x43f84000 0x4000>;
> +				clocks =3D <&clks 53>;
> +				clock-names =3D "ipg_per";
> +				interrupts =3D <3>;
> +				status =3D "disabled";
> +			};
> +
> +			uart1: serial@43f90000 {
> +				compatible =3D "fsl,imx35-uart", "fsl,imx21-uart";
> +				reg =3D <0x43f90000 0x4000>;
> +				clocks =3D <&clks 9>, <&clks 70>;
> +				clock-names =3D "ipg", "per";
> +				interrupts =3D <45>;
> +				status =3D "disabled";
> +			};
> +
> +			uart2: serial@43f94000 {
> +				compatible =3D "fsl,imx35-uart", "fsl,imx21-uart";
> +				reg =3D <0x43f94000 0x4000>;
> +				clocks =3D <&clks 9>, <&clks 71>;
> +				clock-names =3D "ipg", "per";
> +				interrupts =3D <32>;
> +				status =3D "disabled";
> +			};
> +
> +			i2c2: i2c@43f98000 {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				compatible =3D "fsl,imx35-i2c", "fsl,imx1-i2c";
> +				reg =3D <0x43f98000 0x4000>;
> +				clocks =3D <&clks 52>;
> +				clock-names =3D "ipg_per";
> +				interrupts =3D <4>;
> +				status =3D "disabled";
> +			};
> +
> +			ssi1: ssi@43fa0000 {
> +				compatible =3D "fsl,imx35-ssi", "fsl,imx21-ssi";
> +				reg =3D <0x43fa0000 0x4000>;
> +				interrupts =3D <11>;
> +				clocks =3D <&clks 68>;
> +				dmas =3D <&sdma 28 0 0>,
> +				       <&sdma 29 0 0>;
> +				dma-names =3D "rx", "tx";
> +				fsl,fifo-depth =3D <15>;
> +				fsl,ssi-dma-events =3D <29 28 27 26>; /* TX0 RX0 TX1 RX1 */

This custom property is deprecated.  Please drop it.

> +				status =3D "disabled";
> +			};
> +
> +			iomuxc: iomuxc@43fac000 {
> +				compatible =3D "fsl,imx35-iomuxc";
> +				reg =3D <0x43fac000 0x4000>;
> +
> +				audmux {
> +					pinctrl_audmux_1: audmuxgrp-1 {
> +						fsl,pins =3D <MX35_AUDMUX_PINGRP1>;
> +					};
> +				};

Do not add these pinctrl nodes here.  Instead, add them in <board>.dts
as needed.

> +
> +				can1 {
> +					pinctrl_can1_1: can1grp-1 {
> +						fsl,pins =3D <MX35_CAN1_PINGRP1>;
> +					};
> +				};
> +
> +				can2 {
> +					pinctrl_can2_1: can2grp-1 {
> +						fsl,pins =3D <MX35_CAN2_PINGRP1>;
> +					};
> +				};
> +
> +				esdhc1 {
> +					pinctrl_esdhc1_1: esdhc1grp-1 {
> +						fsl,pins =3D <MX35_ESDHC1_PINGRP1>;
> +					};
> +				};
> +
> +				fec {
> +					pinctrl_fec_1: fecgrp-1 {
> +						fsl,pins =3D <MX35_FEC_PINGRP1>;
> +					};
> +				};
> +
> +				i2c1 {
> +					pinctrl_i2c1_1: i2c1grp-1 {
> +						fsl,pins =3D <MX35_I2C1_PINGRP1>;
> +					};
> +				};
> +
> +				i2c3 {
> +					pinctrl_i2c3_1: i2c3grp-1 {
> +						fsl,pins =3D <MX35_I2C3_PINGRP1>;
> +					};
> +				};
> +
> +				uart1 {
> +					pinctrl_uart1_1: uart1grp-1 {
> +						fsl,pins =3D <MX35_UART1_PINGRP1>;
> +					};
> +				};
> +
> +				uart2 {
> +					pinctrl_uart2_1: uart2grp-1 {
> +						fsl,pins =3D <MX35_UART2_PINGRP1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		spba: spba-bus@50000000 {
> +			compatible =3D "fsl,spba-bus", "simple-bus";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			reg =3D <0x50000000 0x100000>;
> +			ranges;
> +
> +			uart3: serial@5000c000 {
> +				compatible =3D "fsl,imx35-uart", "fsl,imx21-uart";
> +				reg =3D <0x5000c000 0x4000>;
> +				clocks =3D <&clks 9>, <&clks 72>;
> +				clock-names =3D "ipg", "per";
> +				interrupts =3D <18>;
> +				status =3D "disabled";
> +			};
> +
> +			fec: fec@50038000 {
> +				compatible =3D "fsl,imx35-fec", "fsl,imx27-fec";
> +				reg =3D <0x50038000 0x4000>;
> +				clocks =3D <&clks 46>, <&clks 8>;
> +				clock-names =3D "ipg", "ahb";
> +				interrupts =3D <57>;
> +				status =3D "disabled";
> +			};
> +		};
> +
> +		aips2: aips@53f00000 {
> +			compatible =3D "fsl,aips", "simple-bus";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			reg =3D <0x53f00000 0x100000>;
> +			ranges;
> +
> +			clks: ccm@53f80000 {
> +				compatible =3D "fsl,imx35-ccm";
> +				reg =3D <0x53f80000 0x4000>;
> +				interrupts =3D <31>;
> +				#clock-cells =3D <1>;
> +			};
> +
> +			gpio3: gpio@53fa4000 {
> +				compatible =3D "fsl,imx35-gpio", "fsl,imx31-gpio";
> +				reg =3D <0x53fa4000 0x4000>;
> +				interrupts =3D <56>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +			};
> +
> +			esdhc1: esdhc@53fb4000 {
> +				compatible =3D "fsl,imx35-esdhc";
> +				reg =3D <0x53fb4000 0x4000>;
> +				interrupts =3D <7>;
> +				clocks =3D <&clks 9>, <&clks 8>, <&clks 43>;
> +				clock-names =3D "ipg", "ahb", "per";
> +				status =3D "disabled";
> +			};
> +
> +			esdhc2: esdhc@53fb8000 {
> +				compatible =3D "fsl,imx35-esdhc";
> +				reg =3D <0x53fb8000 0x4000>;
> +				interrupts =3D <8>;
> +				clocks =3D <&clks 9>, <&clks 8>, <&clks 44>;
> +				clock-names =3D "ipg", "ahb", "per";
> +				status =3D "disabled";
> +			};
> +
> +			esdhc3: esdhc@53fbc000 {
> +				compatible =3D "fsl,imx35-esdhc";
> +				reg =3D <0x53fbc000 0x4000>;
> +				interrupts =3D <9>;
> +				clocks =3D <&clks 9>, <&clks 8>, <&clks 45>;
> +				clock-names =3D "ipg", "ahb", "per";
> +				status =3D "disabled";
> +			};
> +
> +			audmux: audmux@53fc4000 {
> +				compatible =3D "fsl,imx35-audmux", "fsl,imx31-audmux";
> +				reg =3D <0x53fc4000 0x4000>;
> +				status =3D "disabled";
> +			};
> +
> +			gpio1: gpio@53fcc000 {
> +				compatible =3D "fsl,imx35-gpio", "fsl,imx31-gpio";
> +				reg =3D <0x53fcc000 0x4000>;
> +				interrupts =3D <52>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +			};
> +
> +			gpio2: gpio@53fd0000 {
> +				compatible =3D "fsl,imx35-gpio", "fsl,imx31-gpio";
> +				reg =3D <0x53fd0000 0x4000>;
> +				interrupts =3D <51>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +			};
> +
> +			sdma: sdma@53fd4000 {
> +				compatible =3D "fsl,imx35-sdma";
> +				reg =3D <0x53fd4000 0x4000>;
> +				clocks =3D <&clks 9>, <&clks 65>;
> +				clock-names =3D "ipg", "ahb";
> +				#dma-cells =3D <3>;
> +				interrupts =3D <34>;
> +				fsl,sdma-ram-script-name =3D "imx/sdma/sdma-imx35.bin";
> +			};
> +
> +			wdog: wdog@53fdc000 {
> +				compatible =3D "fsl,imx35-wdt", "fsl,imx21-wdt";
> +				reg =3D <0x53fdc000 0x4000>;
> +				clocks =3D <&clks 74>;
> +				clock-names =3D "";
> +				interrupts =3D <55>;
> +			};
> +
> +			can1: can@53fe4000 {
> +				compatible =3D "fsl,imx35-flexcan", "fsl,p1010-flexcan";
> +				reg =3D <0x53fe4000 0x1000>;
> +				clocks =3D <&clks 33>;
> +				clock-names =3D "ipg";
> +				interrupts =3D <43>;
> +				status =3D "disabled";
> +			};
> +
> +			can2: can@53fe8000 {
> +				compatible =3D "fsl,imx35-flexcan", "fsl,p1010-flexcan";
> +				reg =3D <0x53fe8000 0x1000>;
> +				clocks =3D <&clks 34>;
> +				clock-names =3D "ipg";
> +				interrupts =3D <44>;
> +				status =3D "disabled";
> +			};
> +		};
> +
> +		emi@80000000 { /* External Memory Interface */
> +			compatible =3D "fsl,emi", "simple-bus";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			reg =3D <0x80000000 0x40000000>;
> +			ranges;
> +
> +			nfc: nand@bb000000 {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <1>;
> +

Drop this blank line.

> +				compatible =3D "fsl,imx35-nand", "fsl,imx25-nand";
> +				reg =3D <0xbb000000 0x2000>;
> +				clocks =3D <&clks 29>;
> +				clock-names =3D "";
> +				interrupts =3D <33>;
> +				status =3D "disabled";
> +			};
> +
> +			weim: weim@b8002000 {
> +				#address-cells =3D <2>;
> +				#size-cells =3D <1>;
> +				compatible =3D "fsl,imx35-weim";
> +				reg =3D <0xb8002000 0x1000>;
> +				ranges =3D <
> +					0 0 0xa0000000 0x8000000
> +					1 0 0xa8000000 0x8000000
> +					2 0 0xb0000000 0x2000000
> +					3 0 0xb2000000 0x2000000
> +					4 0 0xb4000000 0x2000000
> +					5 0 0xb6000000 0x2000000
> +				>;
> +				status =3D "disabled";
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index 2b90984..b1b3b6a 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -616,6 +616,15 @@ config MACH_IMX31_DT
> =20
>  comment "MX35 platforms:"
> =20
> +config MACH_IMX35_DT
> +	bool "Support i.MX35 platforms from device tree"
> +	select SOC_IMX35
> +	select PINCTRL
> +	select PINCTRL_IMX35

Sort these selects alphabetically.

Shawn

> +	help
> +	  Include support for Freescale i.MX35 based platforms
> +	  using the device tree for discovery.
> +
>  config MACH_PCM043
>  	bool "Support Phytec pcm043 (i.MX35) platforms"
>  	select IMX_HAVE_PLATFORM_FLEXCAN
> diff --git a/arch/arm/mach-imx/Makefile b/arch/arm/mach-imx/Makefile
> index 0db1697..befcaf5 100644
> --- a/arch/arm/mach-imx/Makefile
> +++ b/arch/arm/mach-imx/Makefile
> @@ -89,6 +89,7 @@ obj-$(CONFIG_MACH_MX35_3DS) +=3D mach-mx35_3ds.o
>  obj-$(CONFIG_MACH_EUKREA_CPUIMX35SD) +=3D mach-cpuimx35.o
>  obj-$(CONFIG_MACH_EUKREA_MBIMXSD35_BASEBOARD) +=3D eukrea_mbimxsd35-=
baseboard.o
>  obj-$(CONFIG_MACH_VPR200) +=3D mach-vpr200.o
> +obj-$(CONFIG_MACH_IMX35_DT) +=3D imx35-dt.o
> =20
>  obj-$(CONFIG_HAVE_IMX_ANATOP) +=3D anatop.o
>  obj-$(CONFIG_HAVE_IMX_GPC) +=3D gpc.o
> diff --git a/arch/arm/mach-imx/clk-imx35.c b/arch/arm/mach-imx/clk-im=
x35.c
> index 2193c83..cea861b 100644
> --- a/arch/arm/mach-imx/clk-imx35.c
> +++ b/arch/arm/mach-imx/clk-imx35.c
> @@ -45,6 +45,8 @@ static struct arm_ahb_div clk_consumer[] =3D {
>  static char hsp_div_532[] =3D { 4, 8, 3, 0 };
>  static char hsp_div_400[] =3D { 3, 6, 3, 0 };
> =20
> +static struct clk_onecell_data clk_data;
> +
>  static const char *std_sel[] =3D {"ppll", "arm"};
>  static const char *ipg_per_sel[] =3D {"ahb_per_div", "arm_per_div"};
> =20
> @@ -286,3 +288,19 @@ int __init mx35_clocks_init(void)
> =20
>  	return 0;
>  }
> +
> +int __init mx35_clocks_init_dt(void)
> +{
> +	struct device_node *np;
> +	void __iomem *base;
> +	int irq;
> +
> +	np =3D of_find_compatible_node(NULL, NULL, "fsl,imx35-ccm");
> +	clk_data.clks =3D clk;
> +	clk_data.clk_num =3D ARRAY_SIZE(clk);
> +	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> +
> +	mx35_clocks_init();
> +
> +	return 0;
> +}
> diff --git a/arch/arm/mach-imx/common.h b/arch/arm/mach-imx/common.h
> index 59c3b9b..6919b7d 100644
> --- a/arch/arm/mach-imx/common.h
> +++ b/arch/arm/mach-imx/common.h
> @@ -65,6 +65,7 @@ int mx35_clocks_init(void);
>  int mx51_clocks_init(unsigned long ckil, unsigned long osc,
>  			unsigned long ckih1, unsigned long ckih2);
>  int mx25_clocks_init_dt(void);
> +int mx35_clocks_init_dt(void);
>  int mx27_clocks_init_dt(void);
>  int mx31_clocks_init_dt(void);
>  struct platform_device *mxc_register_gpio(char *name, int id,
> diff --git a/arch/arm/mach-imx/imx35-dt.c b/arch/arm/mach-imx/imx35-d=
t.c
> new file mode 100644
> index 0000000..e3def45
> --- /dev/null
> +++ b/arch/arm/mach-imx/imx35-dt.c
> @@ -0,0 +1,48 @@
> +/*
> + * Copyright 2012 Steffen Trumtrar, Pengutronix
> + *
> + * based on imx27-dt.c
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify it under
> + * the terms of the GNU General Public License version 2 as publishe=
d by the
> + * Free Software Foundation.
> + */
> +
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <asm/mach/arch.h>
> +#include <asm/mach/time.h>
> +#include <asm/hardware/cache-l2x0.h>
> +#include "common.h"
> +#include "mx35.h"
> +
> +static void __init imx35_dt_init(void)
> +{
> +	mxc_arch_reset_init_dt();
> +
> +	of_platform_populate(NULL, of_default_bus_match_table,
> +			     NULL, NULL);
> +}
> +
> +static void __init imx35_timer_init(void)
> +{
> +	mx35_clocks_init_dt();
> +}
> +
> +static const char *imx35_dt_board_compat[] __initdata =3D {
> +	"fsl,imx35",
> +	NULL
> +};
> +
> +DT_MACHINE_START(IMX35_DT, "Freescale i.MX35 (Device Tree Support)")
> +	.map_io		=3D mx35_map_io,
> +	.init_early	=3D imx35_init_early,
> +	.init_irq	=3D mx35_init_irq,
> +	.handle_irq	=3D imx35_handle_irq,
> +	.init_time	=3D imx35_timer_init,
> +	.init_machine	=3D imx35_dt_init,
> +	.dt_compat	=3D imx35_dt_board_compat,
> +	.restart	=3D mxc_restart,
> +MACHINE_END
> --=20
> 1.7.9.5
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
