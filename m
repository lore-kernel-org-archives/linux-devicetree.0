From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/3] ARM: dts: imx6qdl: add MBa6 mainboard with TQMa6{S, Q,
 QP} SoMs.
Date: Fri, 11 Oct 2019 16:36:50 +0200
Message-ID: <20191011143651.6424-2-p.zabel@pengutronix.de>
References: <20191011143651.6424-1-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191011143651.6424-1-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, Markus Niebel <Markus.Niebel@tq-group.com>
List-Id: devicetree@vger.kernel.org

From: Markus Niebel <Markus.Niebel@tq-group.com>

Add device trees for TQMa6S, TQMa6Q, and TQMa6QP embedded modules on
MBa6 mainboards. The A and B SoM variants are for hardware revisions
that differ in how the I2C devices are connected. For details, see [1].

This is a combination of the patches
  "arm: dt: imx6qdl: add tqma6[qdl] som on mba6 mainboard" and
  "arm: dt: add basic support for tqma6qp on mba6"
from the TQMa6x BSP, with the TQMa6x specific parts removed.

[1] https://support.tq-group.com/en/arm/tqma6x/linux/ptxdist/overview

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
[p.zabel@pengutronix.de: merged patches from TQMa6x BSP REV.0114,
 separated MBa6 DTs, fixed checkpatch and dtbs_check warnings,
 added SPDX license identifiers and commit message]
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 arch/arm/boot/dts/Makefile           |   5 +
 arch/arm/boot/dts/imx6dl-mba6.dtsi   |  20 ++++
 arch/arm/boot/dts/imx6dl-mba6a.dts   |  18 +++
 arch/arm/boot/dts/imx6dl-mba6b.dts   |  18 +++
 arch/arm/boot/dts/imx6q-mba6.dtsi    |  20 ++++
 arch/arm/boot/dts/imx6q-mba6a.dts    |  18 +++
 arch/arm/boot/dts/imx6q-mba6b.dts    |  18 +++
 arch/arm/boot/dts/imx6qdl-mba6.dtsi  | 162 +++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-mba6a.dtsi |  41 +++++++
 arch/arm/boot/dts/imx6qdl-mba6b.dtsi |  47 ++++++++
 arch/arm/boot/dts/imx6qp-mba6b.dts   |  17 +++
 11 files changed, 384 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-mba6.dtsi
 create mode 100644 arch/arm/boot/dts/imx6dl-mba6a.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-mba6b.dts
 create mode 100644 arch/arm/boot/dts/imx6q-mba6.dtsi
 create mode 100644 arch/arm/boot/dts/imx6q-mba6a.dts
 create mode 100644 arch/arm/boot/dts/imx6q-mba6b.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-mba6.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-mba6a.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-mba6b.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qp-mba6b.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b21b3a64641a..17e3d41649d8 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -428,6 +428,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-icore-mipi.dtb \
 	imx6dl-icore-rqs.dtb \
 	imx6dl-mamoj.dtb \
+	imx6dl-mba6a.dtb \
+	imx6dl-mba6b.dtb \
 	imx6dl-nit6xlite.dtb \
 	imx6dl-nitrogen6x.dtb \
 	imx6dl-phytec-mira-rdk-nand.dtb \
@@ -503,6 +505,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-icore-rqs.dtb \
 	imx6q-kp-tpc.dtb \
 	imx6q-marsboard.dtb \
+	imx6q-mba6a.dtb \
+	imx6q-mba6b.dtb \
 	imx6q-mccmon6.dtb \
 	imx6q-nitrogen6x.dtb \
 	imx6q-nitrogen6_max.dtb \
@@ -537,6 +541,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-wandboard-revb1.dtb \
 	imx6q-wandboard-revd1.dtb \
 	imx6q-zii-rdu2.dtb \
+	imx6qp-mba6b.dtb \
 	imx6qp-nitrogen6_max.dtb \
 	imx6qp-nitrogen6_som2.dtb \
 	imx6qp-phytec-mira-rdk-nand.dtb \
diff --git a/arch/arm/boot/dts/imx6dl-mba6.dtsi b/arch/arm/boot/dts/imx6dl-mba6.dtsi
new file mode 100644
index 000000000000..4775268a5fdb
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-mba6.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
+ */
+
+&ethphy {
+	rxdv-skew-ps = <180>;
+	txen-skew-ps = <0>;
+	rxd3-skew-ps = <180>;
+	rxd2-skew-ps = <180>;
+	rxd1-skew-ps = <180>;
+	rxd0-skew-ps = <180>;
+	txd3-skew-ps = <120>;
+	txd2-skew-ps = <0>;
+	txd1-skew-ps = <300>;
+	txd0-skew-ps = <120>;
+	txc-skew-ps = <1860>;
+	rxc-skew-ps = <1860>;
+};
diff --git a/arch/arm/boot/dts/imx6dl-mba6a.dts b/arch/arm/boot/dts/imx6dl-mba6a.dts
new file mode 100644
index 000000000000..92f0e3a4e7f7
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-mba6a.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx6dl-tqma6a.dtsi"
+#include "imx6qdl-mba6.dtsi"
+#include "imx6qdl-mba6a.dtsi"
+#include "imx6dl-mba6.dtsi"
+
+/ {
+	model = "TQ TQMa6S on MBa6x";
+	compatible = "tq,mba6a", "fsl,imx6dl";
+};
diff --git a/arch/arm/boot/dts/imx6dl-mba6b.dts b/arch/arm/boot/dts/imx6dl-mba6b.dts
new file mode 100644
index 000000000000..e0aa108804f5
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-mba6b.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx6dl-tqma6b.dtsi"
+#include "imx6qdl-mba6.dtsi"
+#include "imx6qdl-mba6b.dtsi"
+#include "imx6dl-mba6.dtsi"
+
+/ {
+	model = "TQ TQMa6S on MBa6x";
+	compatible = "tq,mba6b", "fsl,imx6dl";
+};
diff --git a/arch/arm/boot/dts/imx6q-mba6.dtsi b/arch/arm/boot/dts/imx6q-mba6.dtsi
new file mode 100644
index 000000000000..9702bde41ccc
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-mba6.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
+ */
+
+&ethphy {
+	rxdv-skew-ps = <180>;
+	txen-skew-ps = <120>;
+	rxd3-skew-ps = <180>;
+	rxd2-skew-ps = <180>;
+	rxd1-skew-ps = <180>;
+	rxd0-skew-ps = <180>;
+	txd3-skew-ps = <120>;
+	txd2-skew-ps = <0>;
+	txd1-skew-ps = <180>;
+	txd0-skew-ps = <360>;
+	txc-skew-ps = <1860>;
+	rxc-skew-ps = <1860>;
+};
diff --git a/arch/arm/boot/dts/imx6q-mba6a.dts b/arch/arm/boot/dts/imx6q-mba6a.dts
new file mode 100644
index 000000000000..79192f257430
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-mba6a.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx6q-tqma6a.dtsi"
+#include "imx6qdl-mba6.dtsi"
+#include "imx6qdl-mba6a.dtsi"
+#include "imx6q-mba6.dtsi"
+
+/ {
+	model = "TQ TQMa6Q on MBa6x";
+	compatible = "tq,mba6a", "fsl,imx6q";
+};
diff --git a/arch/arm/boot/dts/imx6q-mba6b.dts b/arch/arm/boot/dts/imx6q-mba6b.dts
new file mode 100644
index 000000000000..f12400d2121e
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-mba6b.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx6q-tqma6b.dtsi"
+#include "imx6qdl-mba6.dtsi"
+#include "imx6qdl-mba6b.dtsi"
+#include "imx6q-mba6.dtsi"
+
+/ {
+	model = "TQ TQMa6Q on MBa6x";
+	compatible = "tq,mba6b", "fsl,imx6q";
+};
diff --git a/arch/arm/boot/dts/imx6qdl-mba6.dtsi b/arch/arm/boot/dts/imx6qdl-mba6.dtsi
new file mode 100644
index 000000000000..7a5ef59d976f
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-mba6.dtsi
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
+ */
+
+/ {
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	reg_mba6_3p3v: regulator-mba6-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "supply-mba6-3p3v";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&fec {
+	phy-mode = "rgmii-id";
+	phy-reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
+	phy-reset-duration = <1>;
+	mac-address = [00 00 00 00 00 00];
+	local-mac-address = [00 00 00 00 00 00];
+	phy-handle = <&ethphy>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy: ethernet-phy@3 {
+			compatible = "ethernet-phy-id0022.1622",
+				     "ethernet-phy-ieee802.3-c22";
+			reg = <3>;
+			force-master;
+			max-speed = <1000>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	mba6 {
+		pinctrl_enet: enetgrp {
+			fsl,pins = <
+				/* FEC phy IRQ */
+				MX6QDL_PAD_ENET_TX_EN__GPIO1_IO28     0x00011008
+				/* FEC phy reset */
+				MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25   0x1b099
+				/* DSE = 100, 100k up, SPEED = MED */
+				MX6QDL_PAD_ENET_MDIO__ENET_MDIO       0xb0a0
+				MX6QDL_PAD_ENET_MDC__ENET_MDC         0xb0a0
+				/* DSE = 111, pull 100k up */
+				MX6QDL_PAD_RGMII_TXC__RGMII_TXC       0xb038
+				MX6QDL_PAD_RGMII_TD0__RGMII_TD0       0xb038
+				MX6QDL_PAD_RGMII_TD1__RGMII_TD1       0xb038
+				MX6QDL_PAD_RGMII_TD2__RGMII_TD2       0xb038
+				MX6QDL_PAD_RGMII_TD3__RGMII_TD3       0xb038
+				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL 0xb038
+				/* DSE = 111, pull external */
+				MX6QDL_PAD_RGMII_RXC__RGMII_RXC       0x0038
+				MX6QDL_PAD_RGMII_RD0__RGMII_RD0       0x0038
+				MX6QDL_PAD_RGMII_RD1__RGMII_RD1       0x0038
+				MX6QDL_PAD_RGMII_RD2__RGMII_RD2       0x0038
+				MX6QDL_PAD_RGMII_RD3__RGMII_RD3       0x0038
+				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL 0x0038
+				/* HYS = 1, DSE = 111, 100k up, SPEED = HIGH */
+				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK  0x1b0f0
+			>;
+		};
+
+		pinctrl_hog: hoggrp {
+			fsl,pins = <
+				MX6QDL_PAD_GPIO_16__GPIO7_IO11 0x0001b099 /* LCD.PWR_EN */
+				MX6QDL_PAD_GPIO_7__GPIO1_IO07 0x0001b099 /* LCD.RESET */
+				/* LCD.CONTRAST -> Rev 0100 only, not used on Rev.0200*/
+				MX6QDL_PAD_DI0_PIN4__GPIO4_IO20 0x0001b099
+
+				MX6QDL_PAD_ENET_RXD1__GPIO1_IO26 0x0001b099
+				MX6QDL_PAD_ENET_TXD1__GPIO1_IO29 0x0001b099
+				MX6QDL_PAD_ENET_TXD0__GPIO1_IO30 0x0001b099
+
+				MX6QDL_PAD_NANDF_D1__GPIO2_IO01 0x0001b099
+				MX6QDL_PAD_NANDF_D2__GPIO2_IO02 0x0001b099
+				MX6QDL_PAD_NANDF_D3__GPIO2_IO03 0x0001b099
+				MX6QDL_PAD_SD4_DAT0__GPIO2_IO08 0x0001b099
+				MX6QDL_PAD_EIM_CS0__GPIO2_IO23 0x0001b099
+				MX6QDL_PAD_EIM_CS1__GPIO2_IO24 0x0001b099
+				MX6QDL_PAD_EIM_OE__GPIO2_IO25 0x0001b099
+
+				MX6QDL_PAD_EIM_D20__GPIO3_IO20 0x0001b099
+				MX6QDL_PAD_EIM_D26__GPIO3_IO26 0x0001b099
+				MX6QDL_PAD_EIM_D27__GPIO3_IO27 0x0001b099
+				MX6QDL_PAD_EIM_D28__GPIO3_IO28 0x0001b099
+				MX6QDL_PAD_EIM_D29__GPIO3_IO29 0x0001b099
+
+				MX6QDL_PAD_KEY_COL0__GPIO4_IO06 0x0001b099
+				MX6QDL_PAD_KEY_ROW0__GPIO4_IO07 0x0001b099
+				MX6QDL_PAD_KEY_COL1__GPIO4_IO08 0x0001b099
+				MX6QDL_PAD_KEY_ROW1__GPIO4_IO09 0x0001b099
+
+				MX6QDL_PAD_CSI0_PIXCLK__GPIO5_IO18 0x0001b099
+				MX6QDL_PAD_CSI0_DATA_EN__GPIO5_IO20 0x0001b099
+				MX6QDL_PAD_CSI0_VSYNC__GPIO5_IO21 0x0001b099
+
+				MX6QDL_PAD_NANDF_ALE__GPIO6_IO08 0x0001b099
+				MX6QDL_PAD_NANDF_CS1__GPIO6_IO14 0x0001b099
+			>;
+		};
+
+		pinctrl_uart2: uart2grp {
+			fsl,pins = <
+				MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA 0x1b099
+				MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA 0x1b099
+			>;
+		};
+
+		pinctrl_usdhc2: usdhc2grp {
+			fsl,pins = <
+				/* CLK: 47k Pup SPD_LOW DSE 40Ohm SRE_FAST HYS */
+				MX6QDL_PAD_SD2_CLK__SD2_CLK    0x00017071
+				/* SD2: 47k Pup SPD_LOW DSE 80Ohm SRE_FAST HYS */
+				MX6QDL_PAD_SD2_CMD__SD2_CMD    0x00017059
+				MX6QDL_PAD_SD2_DAT0__SD2_DATA0 0x00017059
+				MX6QDL_PAD_SD2_DAT1__SD2_DATA1 0x00017059
+				MX6QDL_PAD_SD2_DAT2__SD2_DATA2 0x00017059
+				MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x00017059
+
+				MX6QDL_PAD_GPIO_4__GPIO1_IO04  0x0001b099 /* usdhc2 CD */
+				MX6QDL_PAD_GPIO_2__GPIO1_IO02  0x0001b099 /* usdhc2 WP */
+			>;
+		};
+	};
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+&usdhc2 { /* Baseboard Slot */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	vmmc-supply = <&reg_mba6_3p3v>;
+	bus-width = <4>;
+	no-1-8-v;
+	cd-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&wdog1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6qdl-mba6a.dtsi b/arch/arm/boot/dts/imx6qdl-mba6a.dtsi
new file mode 100644
index 000000000000..fe8af3e670d4
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-mba6a.dtsi
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
+ */
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet>, <&pinctrl_enet_fix>;
+	interrupts-extended = <&gpio1 6 IRQ_TYPE_LEVEL_HIGH>,
+			      <&intc 0 119 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&i2c1 {
+	sensor1: lm75@49 {
+		compatible = "lm75";
+		reg = <0x49>;
+	};
+
+	eeprom1: m24c64@57 {
+		compatible = "st,24c64", "atmel,24c64";
+		reg = <0x57>;
+		pagesize = <32>;
+	};
+
+	rtc1: ds1339@68 {
+		compatible = "ds1339";
+		reg = <0x68>;
+	};
+};
+
+&iomuxc {
+	mba6 {
+		pinctrl_enet_fix: enetfixgrp {
+			fsl,pins = <
+				/* ENET ping patch */
+				MX6QDL_PAD_GPIO_6__ENET_IRQ 0x000b1
+			>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/imx6qdl-mba6b.dtsi b/arch/arm/boot/dts/imx6qdl-mba6b.dtsi
new file mode 100644
index 000000000000..4451a7c86722
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-mba6b.dtsi
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
+ */
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet>;
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+};
+
+&i2c3 {
+	sensor1: lm75@49 {
+		compatible = "lm75";
+		reg = <0x49>;
+	};
+
+	eeprom1: m24c64@57 {
+		compatible = "st,24c64", "atmel,24c64";
+		reg = <0x57>;
+		pagesize = <32>;
+	};
+
+	rtc1: ds1339@68 {
+		compatible = "ds1339";
+		reg = <0x68>;
+	};
+};
+
+&iomuxc {
+	mba6 {
+		pinctrl_i2c1: i2c1grp {
+			fsl,pins = <
+				MX6QDL_PAD_CSI0_DAT8__I2C1_SDA 0x4001b899
+				MX6QDL_PAD_CSI0_DAT9__I2C1_SCL 0x4001b899
+			>;
+		};
+	};
+
+};
diff --git a/arch/arm/boot/dts/imx6qp-mba6b.dts b/arch/arm/boot/dts/imx6qp-mba6b.dts
new file mode 100644
index 000000000000..a626313f3b54
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qp-mba6b.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2015 Markus Niebel TQ Systems GmbH
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx6qp-tqma6b.dtsi"
+#include "imx6qdl-mba6.dtsi"
+#include "imx6qdl-mba6b.dtsi"
+#include "imx6q-mba6.dtsi"
+
+/ {
+	model = "TQ TQMa6QP on MBa6x";
+	compatible = "tq,mba6b", "fsl,imx6q";
+};
-- 
2.20.1
