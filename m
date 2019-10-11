From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 1/3] ARM: dts: imx6qdl: add TQMa6{S,Q,QP} SoM
Date: Fri, 11 Oct 2019 16:36:49 +0200
Message-ID: <20191011143651.6424-1-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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

Add device trees for TQMa6S, TQMa6Q, and TQMa6QP embedded modules.
The A and B SoM variants are for hardware revisions that differ in
how the I2C devices are connected. For details, see [1].

This is a combination of the patches
  "arm: dt: imx6qdl: add tqma6[qdl] som on mba6 mainboard",
  "arm: dt: tqma6: add spi with spi nor flash on SOM",
  "arm: dt: add basic support for tqma6qp on mba6", and
  "arm: dt: imx6qdl-tqma6: use generic jedec,spi-nor"
from the TQMa6x BSP, with the MBa6 specific parts removed.

[1] https://support.tq-group.com/en/arm/tqma6x/linux/ptxdist/overview

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
[p.zabel@pengutronix.de: merged patches from TQMa6x BSP REV.0114,
 separated MBa6 DTs, fixed checkpatch and dtbs_check warnings,
 added no-sd(io) properties to eMMC, added SPDX license identifiers
 and commit message]
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 arch/arm/boot/dts/imx6dl-tqma6a.dtsi  |  17 +++
 arch/arm/boot/dts/imx6dl-tqma6b.dtsi  |  17 +++
 arch/arm/boot/dts/imx6q-tqma6a.dtsi   |  17 +++
 arch/arm/boot/dts/imx6q-tqma6b.dtsi   |  16 ++
 arch/arm/boot/dts/imx6qdl-tqma6.dtsi  | 202 ++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-tqma6a.dtsi |  29 ++++
 arch/arm/boot/dts/imx6qdl-tqma6b.dtsi |  29 ++++
 arch/arm/boot/dts/imx6qp-tqma6b.dtsi  |  17 +++
 8 files changed, 344 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-tqma6a.dtsi
 create mode 100644 arch/arm/boot/dts/imx6dl-tqma6b.dtsi
 create mode 100644 arch/arm/boot/dts/imx6q-tqma6a.dtsi
 create mode 100644 arch/arm/boot/dts/imx6q-tqma6b.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-tqma6.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-tqma6a.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-tqma6b.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qp-tqma6b.dtsi

diff --git a/arch/arm/boot/dts/imx6dl-tqma6a.dtsi b/arch/arm/boot/dts/imx6dl-tqma6a.dtsi
new file mode 100644
index 000000000000..b45ab3325dc4
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-tqma6a.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
+ */
+
+#include "imx6dl.dtsi"
+#include "imx6qdl-tqma6a.dtsi"
+#include "imx6qdl-tqma6.dtsi"
+
+/ {
+	memory@10000000 {
+		device_type = "memory";
+		reg = <0x10000000 0x20000000>;
+	};
+};
+
diff --git a/arch/arm/boot/dts/imx6dl-tqma6b.dtsi b/arch/arm/boot/dts/imx6dl-tqma6b.dtsi
new file mode 100644
index 000000000000..4b0e6b22466a
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-tqma6b.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
+ */
+
+#include "imx6dl.dtsi"
+#include "imx6qdl-tqma6b.dtsi"
+#include "imx6qdl-tqma6.dtsi"
+
+/ {
+	memory@10000000 {
+		device_type = "memory";
+		reg = <0x10000000 0x20000000>;
+	};
+};
+
diff --git a/arch/arm/boot/dts/imx6q-tqma6a.dtsi b/arch/arm/boot/dts/imx6q-tqma6a.dtsi
new file mode 100644
index 000000000000..d22eaeda9863
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-tqma6a.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
+ */
+
+#include "imx6q.dtsi"
+#include "imx6qdl-tqma6a.dtsi"
+#include "imx6qdl-tqma6.dtsi"
+
+/ {
+	memory@10000000 {
+		device_type = "memory";
+		reg = <0x10000000 0x40000000>;
+	};
+};
+
diff --git a/arch/arm/boot/dts/imx6q-tqma6b.dtsi b/arch/arm/boot/dts/imx6q-tqma6b.dtsi
new file mode 100644
index 000000000000..da6d406b5e89
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-tqma6b.dtsi
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ */
+
+#include "imx6q.dtsi"
+#include "imx6qdl-tqma6b.dtsi"
+#include "imx6qdl-tqma6.dtsi"
+
+/ {
+	memory@10000000 {
+		device_type = "memory";
+		reg = <0x10000000 0x40000000>;
+	};
+};
+
diff --git a/arch/arm/boot/dts/imx6qdl-tqma6.dtsi b/arch/arm/boot/dts/imx6qdl-tqma6.dtsi
new file mode 100644
index 000000000000..c0e2a03624f9
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-tqma6.dtsi
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
+ */
+
+/ {
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "supply-3p3v";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&ecspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	fsl,spi-num-chipselects = <1>;
+	cs-gpios = <&gpio3 19 0>;
+	status = "okay";
+
+	flash: m25p80@0 {
+		status = "okay";
+		compatible = "jedec,spi-nor";
+		spi-max-frequency = <50000000>;
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		m25p,fast-read;
+	};
+};
+
+&iomuxc {
+	tqma6 {
+		pinctrl_ecspi1: ecspi1grp {
+			fsl,pins = <
+				/* HYS, SPEED = MED, 100k up, DSE = 011, SRE_FAST */
+				MX6QDL_PAD_EIM_D17__ECSPI1_MISO 0x1b099
+				MX6QDL_PAD_EIM_D18__ECSPI1_MOSI 0xb099
+				MX6QDL_PAD_EIM_D16__ECSPI1_SCLK 0xb099
+				 /* eCSPI1 SS1 */
+				MX6QDL_PAD_EIM_D19__GPIO3_IO19 0xb099
+			>;
+		};
+
+		pinctrl_i2c1_tqma6: i2c1-tqma6grp {
+			fsl,pins = <
+				MX6QDL_PAD_CSI0_DAT8__I2C1_SDA 0x4001b899
+				MX6QDL_PAD_CSI0_DAT9__I2C1_SCL 0x4001b899
+			>;
+		};
+
+		pinctrl_i2c3_tqma6: i2c3-tqma6grp {
+			fsl,pins = <
+				MX6QDL_PAD_GPIO_5__I2C3_SCL 0x4001b899
+				MX6QDL_PAD_GPIO_6__I2C3_SDA 0x4001b899
+			>;
+		};
+
+		pinctrl_pmic: pmicgrp {
+			fsl,pins = <
+				MX6QDL_PAD_NANDF_RB0__GPIO6_IO10 0x1b099 /* PMIC irq */
+			>;
+		};
+
+		pinctrl_usdhc3: usdhc3grp {
+			fsl,pins = <
+				MX6QDL_PAD_SD3_CMD__SD3_CMD    0x17059
+				MX6QDL_PAD_SD3_CLK__SD3_CLK    0x10059
+				MX6QDL_PAD_SD3_DAT0__SD3_DATA0 0x17059
+				MX6QDL_PAD_SD3_DAT1__SD3_DATA1 0x17059
+				MX6QDL_PAD_SD3_DAT2__SD3_DATA2 0x17059
+				MX6QDL_PAD_SD3_DAT3__SD3_DATA3 0x17059
+				MX6QDL_PAD_SD3_DAT4__SD3_DATA4 0x17059
+				MX6QDL_PAD_SD3_DAT5__SD3_DATA5 0x17059
+				MX6QDL_PAD_SD3_DAT6__SD3_DATA6 0x17059
+				MX6QDL_PAD_SD3_DAT7__SD3_DATA7 0x17059
+			>;
+		};
+	};
+};
+
+&pmic {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pmic>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <10 8>;
+
+		regulators {
+			reg_vddcore: sw1ab {
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1875000>;
+				regulator-always-on;
+			};
+
+			reg_vddsoc: sw1c {
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1875000>;
+				regulator-always-on;
+			};
+
+			reg_gen_3v3: sw2 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_ddr_1v5a: sw3a {
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1975000>;
+				regulator-always-on;
+			};
+
+			reg_ddr_1v5b: sw3b {
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1975000>;
+				regulator-always-on;
+			};
+
+			sw4_reg: sw4 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_5v_600mA: swbst {
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5150000>;
+				regulator-always-on;
+			};
+
+			reg_snvs_3v: vsnvs {
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-always-on;
+			};
+
+			reg_vrefddr: vrefddr {
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			reg_vgen1_1v5: vgen1 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1550000>;
+				/* not used */
+			};
+
+			reg_vgen2_1v2_eth: vgen2 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1550000>;
+				regulator-always-on;
+			};
+
+			reg_vgen3_2v8: vgen3 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_vgen4_1v8: vgen4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_vgen5_1v8_eth: vgen5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_vgen6_3v3: vgen6 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+		};
+};
+
+/* eMMC */
+&usdhc3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	vmmc-supply = <&reg_3p3v>;
+	non-removable;
+	disable-wp;
+	no-sd;
+	no-sdio;
+	bus-width = <8>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	mmccard: mmccard@0 {
+		reg = <0>;
+		compatible = "mmc-card";
+		broken-hpi;
+	};
+};
diff --git a/arch/arm/boot/dts/imx6qdl-tqma6a.dtsi b/arch/arm/boot/dts/imx6qdl-tqma6a.dtsi
new file mode 100644
index 000000000000..a31bf04884d2
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-tqma6a.dtsi
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
+ */
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1_tqma6>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	pmic: pf0100@8 {
+		compatible = "fsl,pfuze100";
+		reg = <0x08>;
+	};
+
+	sensor0: lm75@48 {
+		compatible = "lm75";
+		reg = <0x48>;
+	};
+
+	eeprom0: m24c64@50 {
+		compatible = "st,24c64", "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+};
+
diff --git a/arch/arm/boot/dts/imx6qdl-tqma6b.dtsi b/arch/arm/boot/dts/imx6qdl-tqma6b.dtsi
new file mode 100644
index 000000000000..9a7c8d21cec2
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-tqma6b.dtsi
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
+ */
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3_tqma6>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	pmic: pf0100@8 {
+		compatible = "fsl,pfuze100";
+		reg = <0x08>;
+	};
+
+	sensor0: lm75@48 {
+		compatible = "lm75";
+		reg = <0x48>;
+	};
+
+	eeprom0: m24c64@50 {
+		compatible = "st,24c64", "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+};
+
diff --git a/arch/arm/boot/dts/imx6qp-tqma6b.dtsi b/arch/arm/boot/dts/imx6qp-tqma6b.dtsi
new file mode 100644
index 000000000000..4e7e7050da43
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qp-tqma6b.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2013 Sascha Hauer, Pengutronix
+ */
+
+#include "imx6q.dtsi"
+#include "imx6qp.dtsi"
+#include "imx6qdl-tqma6b.dtsi"
+#include "imx6qdl-tqma6.dtsi"
+
+/ {
+	memory@10000000 {
+		device_type = "memory";
+		reg = <0x10000000 0x40000000>;
+	};
+};
+
-- 
2.20.1
