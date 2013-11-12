From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8][ 3/5] ARM: dts: Add support for the i.MX35.
Date: Tue, 12 Nov 2013 12:24:17 +0100
Message-ID: <1384255459-15134-3-git-send-email-denis@eukrea.com>
References: <1384255459-15134-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384255459-15134-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=46rom: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
---
ChangeLog v7->v8:
- The dts part of the patch that added the devicetree support for the i=
mx35 was
  moved here.
- The space in the nfc node was removed.
- A whitespace issue was fixed in imx35-pingrp.h
- fsl,ssi-dma-events was removed from the ssi node.
- The board specific iomuxc pins group configuration were removed.

ChangeLog v5->v6:
- The dependency on pdata clocks has been removed,
  and the dtsi adapted accordinly.
- Adaptation to the for-next branch of Shawn Guo at
  git://git.linaro.org/people/shawnguo/linux-2.6.git for-next
- imx35-dt.c: very small whitespace cleanup.
- Kconfig: The selection of IMX_HAVE_PLATFORM_* has been removed.
- dtsi: The nodes were reordered alphabetically.
- dtsi: The aliases have been reordered alphabetically.
- Shawn Guo was added in the Cc.
---
 arch/arm/boot/dts/imx35-pingrp.h |  100 ++++++++++++
 arch/arm/boot/dts/imx35.dtsi     |  312 ++++++++++++++++++++++++++++++=
++++++++
 2 files changed, 412 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx35-pingrp.h
 create mode 100644 arch/arm/boot/dts/imx35.dtsi

diff --git a/arch/arm/boot/dts/imx35-pingrp.h b/arch/arm/boot/dts/imx35=
-pingrp.h
new file mode 100644
index 0000000..4e954a84
--- /dev/null
+++ b/arch/arm/boot/dts/imx35-pingrp.h
@@ -0,0 +1,100 @@
+/*
+ * Copyright 2013 Eukr=C3=A9a Electromatique <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef __DTS_IMX35_PINGRP_H
+#define __DTS_IMX35_PINGRP_H
+
+#define MX35_AUDMUX_PINGRP1 \
+	MX35_PAD_STXFS4__AUDMUX_AUD4_TXFS		0x80000000 \
+	MX35_PAD_STXD4__AUDMUX_AUD4_TXD			0x80000000 \
+	MX35_PAD_SRXD4__AUDMUX_AUD4_RXD			0x80000000 \
+	MX35_PAD_SCK4__AUDMUX_AUD4_TXC			0x80000000
+
+#define MX35_CAN1_PINGRP1 \
+	MX35_PAD_I2C2_CLK__CAN1_TXCAN			0x1c0 \
+	MX35_PAD_I2C2_DAT__CAN1_RXCAN			0x1c0
+
+#define MX35_CAN2_PINGRP1 \
+	MX35_PAD_TX5_RX0__CAN2_TXCAN			0x1c0 \
+	MX35_PAD_TX4_RX1__CAN2_RXCAN			0x1c0
+
+#define MX35_ESDHC1_PINGRP1 \
+	MX35_PAD_SD1_CMD__ESDHC1_CMD			0x80000000 \
+	MX35_PAD_SD1_CLK__ESDHC1_CLK			0x80000000 \
+	MX35_PAD_SD1_DATA0__ESDHC1_DAT0			0x80000000 \
+	MX35_PAD_SD1_DATA1__ESDHC1_DAT1			0x80000000 \
+	MX35_PAD_SD1_DATA2__ESDHC1_DAT2			0x80000000 \
+	MX35_PAD_SD1_DATA3__ESDHC1_DAT3			0x80000000
+
+#define MX35_FEC_PINGRP1 \
+	MX35_PAD_FEC_TX_CLK__FEC_TX_CLK			0x80000000 \
+	MX35_PAD_FEC_RX_CLK__FEC_RX_CLK			0x80000000 \
+	MX35_PAD_FEC_RX_DV__FEC_RX_DV			0x80000000 \
+	MX35_PAD_FEC_COL__FEC_COL			0x80000000 \
+	MX35_PAD_FEC_RDATA0__FEC_RDATA_0		0x80000000 \
+	MX35_PAD_FEC_TDATA0__FEC_TDATA_0		0x80000000 \
+	MX35_PAD_FEC_TX_EN__FEC_TX_EN			0x80000000 \
+	MX35_PAD_FEC_MDC__FEC_MDC			0x80000000 \
+	MX35_PAD_FEC_MDIO__FEC_MDIO			0x80000000 \
+	MX35_PAD_FEC_TX_ERR__FEC_TX_ERR			0x80000000 \
+	MX35_PAD_FEC_RX_ERR__FEC_RX_ERR			0x80000000 \
+	MX35_PAD_FEC_CRS__FEC_CRS			0x80000000 \
+	MX35_PAD_FEC_RDATA1__FEC_RDATA_1		0x80000000 \
+	MX35_PAD_FEC_TDATA1__FEC_TDATA_1		0x80000000 \
+	MX35_PAD_FEC_RDATA2__FEC_RDATA_2		0x80000000 \
+	MX35_PAD_FEC_TDATA2__FEC_TDATA_2		0x80000000 \
+	MX35_PAD_FEC_RDATA3__FEC_RDATA_3		0x80000000 \
+	MX35_PAD_FEC_TDATA3__FEC_TDATA_3		0x80000000
+
+#define MX35_I2C1_PINGRP1 \
+	MX35_PAD_I2C1_CLK__I2C1_SCL			0x80000000 \
+	MX35_PAD_I2C1_DAT__I2C1_SDA			0x80000000
+
+#define MX35_I2C3_PINGRP1 \
+	MX35_PAD_ATA_DATA12__I2C3_SCL			0x1c0 \
+	MX35_PAD_ATA_DATA13__I2C3_SDA			0x1c0
+
+#define MX35_IPU_PINGRP1 \
+	MX35_PAD_LD0__IPU_DISPB_DAT_0			0x80000000 \
+	MX35_PAD_LD1__IPU_DISPB_DAT_1			0x80000000 \
+	MX35_PAD_LD2__IPU_DISPB_DAT_2			0x80000000 \
+	MX35_PAD_LD3__IPU_DISPB_DAT_3			0x80000000 \
+	MX35_PAD_LD4__IPU_DISPB_DAT_4			0x80000000 \
+	MX35_PAD_LD5__IPU_DISPB_DAT_5			0x80000000 \
+	MX35_PAD_LD6__IPU_DISPB_DAT_6			0x80000000 \
+	MX35_PAD_LD7__IPU_DISPB_DAT_7			0x80000000 \
+	MX35_PAD_LD8__IPU_DISPB_DAT_8			0x80000000 \
+	MX35_PAD_LD9__IPU_DISPB_DAT_9			0x80000000 \
+	MX35_PAD_LD10__IPU_DISPB_DAT_10			0x80000000 \
+	MX35_PAD_LD11__IPU_DISPB_DAT_11			0x80000000 \
+	MX35_PAD_LD12__IPU_DISPB_DAT_12			0x80000000 \
+	MX35_PAD_LD13__IPU_DISPB_DAT_13			0x80000000 \
+	MX35_PAD_LD14__IPU_DISPB_DAT_14			0x80000000 \
+	MX35_PAD_LD15__IPU_DISPB_DAT_15			0x80000000 \
+	MX35_PAD_LD16__IPU_DISPB_DAT_16			0x80000000 \
+	MX35_PAD_LD17__IPU_DISPB_DAT_17			0x80000000 \
+	MX35_PAD_D3_HSYNC__IPU_DISPB_D3_HSYNC		0x80000000 \
+	MX35_PAD_D3_FPSHIFT__IPU_DISPB_D3_CLK		0x80000000 \
+	MX35_PAD_D3_DRDY__IPU_DISPB_D3_DRDY		0x80000000 \
+	MX35_PAD_D3_VSYNC__IPU_DISPB_D3_VSYNC		0x80000000 \
+	MX35_PAD_CONTRAST__IPU_DISPB_CONTR		0x80000000
+
+#define MX35_UART1_PINGRP1 \
+	MX35_PAD_CTS1__UART1_CTS			0x80000000 \
+	MX35_PAD_RTS1__UART1_RTS			0x80000000 \
+	MX35_PAD_TXD1__UART1_TXD_MUX			0x80000000 \
+	MX35_PAD_RXD1__UART1_RXD_MUX			0x80000000
+
+#define MX35_UART2_PINGRP1 \
+	MX35_PAD_RTS2__UART2_RTS			0x80000000 \
+	MX35_PAD_CTS2__UART2_CTS			0x80000000 \
+	MX35_PAD_RXD2__UART2_RXD_MUX			0x80000000 \
+	MX35_PAD_TXD2__UART2_TXD_MUX			0x80000000
+
+#endif /* __DTS_IMX35_PINGRP_H */
diff --git a/arch/arm/boot/dts/imx35.dtsi b/arch/arm/boot/dts/imx35.dts=
i
new file mode 100644
index 0000000..7bd0ee2
--- /dev/null
+++ b/arch/arm/boot/dts/imx35.dtsi
@@ -0,0 +1,312 @@
+/*
+ * Copyright 2012 Steffen Trumtrar, Pengutronix
+ *
+ * based on imx27.dtsi
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it under
+ * the terms of the GNU General Public License version 2 as published =
by the
+ * Free Software Foundation.
+ */
+
+#include "skeleton.dtsi"
+#include "imx35-pinfunc.h"
+#include "imx35-pingrp.h"
+
+/ {
+	aliases {
+		gpio0 =3D &gpio1;
+		gpio1 =3D &gpio2;
+		gpio2 =3D &gpio3;
+		serial0 =3D &uart1;
+		serial1 =3D &uart2;
+		serial2 =3D &uart3;
+	};
+
+	avic: avic-interrupt-controller@68000000 {
+		compatible =3D "fsl,imx35-avic", "fsl,avic";
+		interrupt-controller;
+		#interrupt-cells =3D <1>;
+		reg =3D <0x68000000 0x10000000>;
+	};
+
+	clocks {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		ckil {
+			compatible =3D "fsl,imx-ckil", "fixed-clock";
+			clock-frequency =3D <32768>;
+		};
+
+		osc {
+			compatible =3D "fsl,imx-osc", "fixed-clock";
+			clock-frequency =3D <24000000>;
+		};
+	};
+
+	soc {
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+		compatible =3D "simple-bus";
+		interrupt-parent =3D <&avic>;
+		ranges;
+
+		L2: l2-cache@30000000 {
+			compatible =3D "arm,l210-cache";
+			reg =3D <0x30000000 0x1000>;
+			cache-unified;
+			cache-level =3D <2>;
+		};
+
+		aips1: aips@43f00000 {
+			compatible =3D "fsl,aips", "simple-bus";
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+			reg =3D <0x43f00000 0x100000>;
+			ranges;
+
+			i2c1: i2c@43f80000 {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				compatible =3D "fsl,imx35-i2c", "fsl,imx1-i2c";
+				reg =3D <0x43f80000 0x4000>;
+				clocks =3D <&clks 51>;
+				clock-names =3D "ipg_per";
+				interrupts =3D <10>;
+				status =3D "disabled";
+			};
+
+			i2c3: i2c@43f84000 {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				compatible =3D "fsl,imx35-i2c", "fsl,imx1-i2c";
+				reg =3D <0x43f84000 0x4000>;
+				clocks =3D <&clks 53>;
+				clock-names =3D "ipg_per";
+				interrupts =3D <3>;
+				status =3D "disabled";
+			};
+
+			uart1: serial@43f90000 {
+				compatible =3D "fsl,imx35-uart", "fsl,imx21-uart";
+				reg =3D <0x43f90000 0x4000>;
+				clocks =3D <&clks 9>, <&clks 70>;
+				clock-names =3D "ipg", "per";
+				interrupts =3D <45>;
+				status =3D "disabled";
+			};
+
+			uart2: serial@43f94000 {
+				compatible =3D "fsl,imx35-uart", "fsl,imx21-uart";
+				reg =3D <0x43f94000 0x4000>;
+				clocks =3D <&clks 9>, <&clks 71>;
+				clock-names =3D "ipg", "per";
+				interrupts =3D <32>;
+				status =3D "disabled";
+			};
+
+			i2c2: i2c@43f98000 {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				compatible =3D "fsl,imx35-i2c", "fsl,imx1-i2c";
+				reg =3D <0x43f98000 0x4000>;
+				clocks =3D <&clks 52>;
+				clock-names =3D "ipg_per";
+				interrupts =3D <4>;
+				status =3D "disabled";
+			};
+
+			ssi1: ssi@43fa0000 {
+				compatible =3D "fsl,imx35-ssi", "fsl,imx21-ssi";
+				reg =3D <0x43fa0000 0x4000>;
+				interrupts =3D <11>;
+				clocks =3D <&clks 68>;
+				dmas =3D <&sdma 28 0 0>,
+				       <&sdma 29 0 0>;
+				dma-names =3D "rx", "tx";
+				fsl,fifo-depth =3D <15>;
+				status =3D "disabled";
+			};
+
+			iomuxc: iomuxc@43fac000 {
+				compatible =3D "fsl,imx35-iomuxc";
+				reg =3D <0x43fac000 0x4000>;
+			};
+		};
+
+		spba: spba-bus@50000000 {
+			compatible =3D "fsl,spba-bus", "simple-bus";
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+			reg =3D <0x50000000 0x100000>;
+			ranges;
+
+			uart3: serial@5000c000 {
+				compatible =3D "fsl,imx35-uart", "fsl,imx21-uart";
+				reg =3D <0x5000c000 0x4000>;
+				clocks =3D <&clks 9>, <&clks 72>;
+				clock-names =3D "ipg", "per";
+				interrupts =3D <18>;
+				status =3D "disabled";
+			};
+
+			fec: fec@50038000 {
+				compatible =3D "fsl,imx35-fec", "fsl,imx27-fec";
+				reg =3D <0x50038000 0x4000>;
+				clocks =3D <&clks 46>, <&clks 8>;
+				clock-names =3D "ipg", "ahb";
+				interrupts =3D <57>;
+				status =3D "disabled";
+			};
+		};
+
+		aips2: aips@53f00000 {
+			compatible =3D "fsl,aips", "simple-bus";
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+			reg =3D <0x53f00000 0x100000>;
+			ranges;
+
+			clks: ccm@53f80000 {
+				compatible =3D "fsl,imx35-ccm";
+				reg =3D <0x53f80000 0x4000>;
+				interrupts =3D <31>;
+				#clock-cells =3D <1>;
+			};
+
+			gpio3: gpio@53fa4000 {
+				compatible =3D "fsl,imx35-gpio", "fsl,imx31-gpio";
+				reg =3D <0x53fa4000 0x4000>;
+				interrupts =3D <56>;
+				gpio-controller;
+				#gpio-cells =3D <2>;
+				interrupt-controller;
+				#interrupt-cells =3D <2>;
+			};
+
+			esdhc1: esdhc@53fb4000 {
+				compatible =3D "fsl,imx35-esdhc";
+				reg =3D <0x53fb4000 0x4000>;
+				interrupts =3D <7>;
+				clocks =3D <&clks 9>, <&clks 8>, <&clks 43>;
+				clock-names =3D "ipg", "ahb", "per";
+				status =3D "disabled";
+			};
+
+			esdhc2: esdhc@53fb8000 {
+				compatible =3D "fsl,imx35-esdhc";
+				reg =3D <0x53fb8000 0x4000>;
+				interrupts =3D <8>;
+				clocks =3D <&clks 9>, <&clks 8>, <&clks 44>;
+				clock-names =3D "ipg", "ahb", "per";
+				status =3D "disabled";
+			};
+
+			esdhc3: esdhc@53fbc000 {
+				compatible =3D "fsl,imx35-esdhc";
+				reg =3D <0x53fbc000 0x4000>;
+				interrupts =3D <9>;
+				clocks =3D <&clks 9>, <&clks 8>, <&clks 45>;
+				clock-names =3D "ipg", "ahb", "per";
+				status =3D "disabled";
+			};
+
+			audmux: audmux@53fc4000 {
+				compatible =3D "fsl,imx35-audmux", "fsl,imx31-audmux";
+				reg =3D <0x53fc4000 0x4000>;
+				status =3D "disabled";
+			};
+
+			gpio1: gpio@53fcc000 {
+				compatible =3D "fsl,imx35-gpio", "fsl,imx31-gpio";
+				reg =3D <0x53fcc000 0x4000>;
+				interrupts =3D <52>;
+				gpio-controller;
+				#gpio-cells =3D <2>;
+				interrupt-controller;
+				#interrupt-cells =3D <2>;
+			};
+
+			gpio2: gpio@53fd0000 {
+				compatible =3D "fsl,imx35-gpio", "fsl,imx31-gpio";
+				reg =3D <0x53fd0000 0x4000>;
+				interrupts =3D <51>;
+				gpio-controller;
+				#gpio-cells =3D <2>;
+				interrupt-controller;
+				#interrupt-cells =3D <2>;
+			};
+
+			sdma: sdma@53fd4000 {
+				compatible =3D "fsl,imx35-sdma";
+				reg =3D <0x53fd4000 0x4000>;
+				clocks =3D <&clks 9>, <&clks 65>;
+				clock-names =3D "ipg", "ahb";
+				#dma-cells =3D <3>;
+				interrupts =3D <34>;
+				fsl,sdma-ram-script-name =3D "imx/sdma/sdma-imx35.bin";
+			};
+
+			wdog: wdog@53fdc000 {
+				compatible =3D "fsl,imx35-wdt", "fsl,imx21-wdt";
+				reg =3D <0x53fdc000 0x4000>;
+				clocks =3D <&clks 74>;
+				clock-names =3D "";
+				interrupts =3D <55>;
+			};
+
+			can1: can@53fe4000 {
+				compatible =3D "fsl,imx35-flexcan", "fsl,p1010-flexcan";
+				reg =3D <0x53fe4000 0x1000>;
+				clocks =3D <&clks 33>;
+				clock-names =3D "ipg";
+				interrupts =3D <43>;
+				status =3D "disabled";
+			};
+
+			can2: can@53fe8000 {
+				compatible =3D "fsl,imx35-flexcan", "fsl,p1010-flexcan";
+				reg =3D <0x53fe8000 0x1000>;
+				clocks =3D <&clks 34>;
+				clock-names =3D "ipg";
+				interrupts =3D <44>;
+				status =3D "disabled";
+			};
+		};
+
+		emi@80000000 { /* External Memory Interface */
+			compatible =3D "fsl,emi", "simple-bus";
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+			reg =3D <0x80000000 0x40000000>;
+			ranges;
+
+			nfc: nand@bb000000 {
+				#address-cells =3D <1>;
+				#size-cells =3D <1>;
+				compatible =3D "fsl,imx35-nand", "fsl,imx25-nand";
+				reg =3D <0xbb000000 0x2000>;
+				clocks =3D <&clks 29>;
+				clock-names =3D "";
+				interrupts =3D <33>;
+				status =3D "disabled";
+			};
+
+			weim: weim@b8002000 {
+				#address-cells =3D <2>;
+				#size-cells =3D <1>;
+				compatible =3D "fsl,imx35-weim";
+				reg =3D <0xb8002000 0x1000>;
+				ranges =3D <
+					0 0 0xa0000000 0x8000000
+					1 0 0xa8000000 0x8000000
+					2 0 0xb0000000 0x2000000
+					3 0 0xb2000000 0x2000000
+					4 0 0xb4000000 0x2000000
+					5 0 0xb6000000 0x2000000
+				>;
+				status =3D "disabled";
+			};
+		};
+	};
+};
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
