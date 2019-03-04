From: Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH 6/6] ARM: dts: tq imx7d board support
Date: Mon,  4 Mar 2019 17:56:30 +0100
Message-ID: <20190304165630.18225-7-bruno.thomsen@gmail.com>
References: <20190304165630.18225-1-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190304165630.18225-1-bruno.thomsen@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, bruno.thomsen@gmail.com, robh+dt@kernel.org, linux-imx@nxp.com, shawnguo@kernel.org, markus.niebel@tq-group.com
List-Id: devicetree@vger.kernel.org

This adds support for the TQ TQMa7D SoM together with
the MBa7 carrier board and it's based on the NXP i.MX7Dual SoC.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 arch/arm/boot/dts/Makefile         |   1 +
 arch/arm/boot/dts/imx7d-mba7.dts   | 122 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx7d-tqma7.dtsi |  11 +++
 3 files changed, 134 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx7d-mba7.dts
 create mode 100644 arch/arm/boot/dts/imx7d-tqma7.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7cdb288bce6a..16b7dd542b79 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -572,6 +572,7 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-cl-som-imx7.dtb \
 	imx7d-colibri-emmc-eval-v3.dtb \
 	imx7d-colibri-eval-v3.dtb \
+	imx7d-mba7.dtb \
 	imx7d-nitrogen7.dtb \
 	imx7d-pico-hobbit.dtb \
 	imx7d-pico-pi.dtb \
diff --git a/arch/arm/boot/dts/imx7d-mba7.dts b/arch/arm/boot/dts/imx7d-mba7.dts
new file mode 100644
index 000000000000..2c420c29f543
--- /dev/null
+++ b/arch/arm/boot/dts/imx7d-mba7.dts
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
+/*
+ * Device Tree Source for TQ Systems TQMa7D board on MBa7 carrier board.
+ *
+ * Copyright (C) 2016 TQ Systems GmbH
+ * Author: Markus Niebel <Markus.Niebel@tq-group.com>
+ * Copyright (C) 2019 Bruno Thomsen <bruno.thomsen@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "imx7d-tqma7.dtsi"
+#include "imx7-mba7.dtsi"
+
+/ {
+	model = "TQ Systems TQMa7D board on MBa7 carrier board";
+	compatible = "tq,imx7d-mba7", "tq,imx7d-tqma7", "fsl,imx7d";
+};
+
+&fec2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet2>;
+	phy-mode = "rgmii-id";
+	phy-reset-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
+	phy-reset-duration = <1>;
+	phy-reset-delay = <1>;
+	phy-supply = <&reg_fec2_pwdn>;
+	phy-handle = <&ethphy2_0>;
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy2_0: ethernet-phy2@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			/* LED1: Link/Activity, LED2: error */
+			ti,led-function = <0x0db0>;
+			/* active low, LED1/2 driven by phy */
+			ti,led-ctrl = <0x1001>;
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog_mba7_1>;
+
+	pinctrl_enet2: enet2grp {
+		fsl,pins = <
+			MX7D_PAD_SD2_CD_B__ENET2_MDIO			0x02
+			MX7D_PAD_SD2_WP__ENET2_MDC			0x00
+
+			MX7D_PAD_EPDC_GDSP__ENET2_RGMII_TXC		0x71
+			MX7D_PAD_EPDC_SDCE2__ENET2_RGMII_TD0		0x71
+			MX7D_PAD_EPDC_SDCE3__ENET2_RGMII_TD1		0x71
+			MX7D_PAD_EPDC_GDCLK__ENET2_RGMII_TD2		0x71
+			MX7D_PAD_EPDC_GDOE__ENET2_RGMII_TD3		0x71
+			MX7D_PAD_EPDC_GDRL__ENET2_RGMII_TX_CTL		0x71
+			MX7D_PAD_EPDC_SDCE1__ENET2_RGMII_RXC		0x79
+			MX7D_PAD_EPDC_SDCLK__ENET2_RGMII_RD0		0x79
+			MX7D_PAD_EPDC_SDLE__ENET2_RGMII_RD1		0x79
+			MX7D_PAD_EPDC_SDOE__ENET2_RGMII_RD2		0x79
+			MX7D_PAD_EPDC_SDSHR__ENET2_RGMII_RD3		0x79
+			MX7D_PAD_EPDC_SDCE0__ENET2_RGMII_RX_CTL		0x79
+
+			/* Reset: SION, 100kPU, SRE_FAST, DSE_X1 */
+			MX7D_PAD_EPDC_BDR0__GPIO2_IO28		0x40000070
+
+			/* INT/PWDN: SION, 100kPU, HYS, SRE_FAST, DSE_X1 */
+			MX7D_PAD_EPDC_PWR_STAT__GPIO2_IO31	0x40000078
+		>;
+	};
+
+	pinctrl_pcie: pciegrp {
+		fsl,pins = <
+			/* #pcie_wake */
+			MX7D_PAD_EPDC_PWR_COM__GPIO2_IO30		0x70
+			/* #pcie_rst */
+			MX7D_PAD_SD2_CLK__GPIO5_IO12			0x70
+			/* #pcie_dis */
+			MX7D_PAD_EPDC_BDR1__GPIO2_IO29			0x70
+		>;
+	};
+};
+
+&iomuxc_lpsr {
+	pinctrl_usbotg2: usbotg2grp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO06__USB_OTG2_OC	0x5c
+			MX7D_PAD_LPSR_GPIO1_IO07__GPIO1_IO7	0x59
+		>;
+	};
+};
+
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie>;
+	/* 1.5V logically from 3.3V */
+	/* probe deferal not supported */
+	/* pcie-bus-supply = <&reg_mpcie_1v5>; */
+	reset-gpio = <&gpio5 12 GPIO_ACTIVE_LOW>;
+	disable-gpio = <&gpio2 29 GPIO_ACTIVE_LOW>;
+	power-on-gpio = <&gpio2 30 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&usbotg2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbotg2>;
+	vbus-supply = <&reg_usb_otg2_vbus>;
+	srp-disable;
+	hnp-disable;
+	adp-disable;
+	dr_mode = "host";
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx7d-tqma7.dtsi b/arch/arm/boot/dts/imx7d-tqma7.dtsi
new file mode 100644
index 000000000000..8ad3048dac0d
--- /dev/null
+++ b/arch/arm/boot/dts/imx7d-tqma7.dtsi
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
+/*
+ * Device Tree Include file for TQ Systems TQMa7D board with NXP i.MX7Dual SoC.
+ *
+ * Copyright (C) 2016 TQ Systems GmbH
+ * Author: Markus Niebel <Markus.Niebel@tq-group.com>
+ * Copyright (C) 2019 Bruno Thomsen <bruno.thomsen@gmail.com>
+ */
+
+#include "imx7d.dtsi"
+#include "imx7-tqma7.dtsi"
-- 
2.20.1
