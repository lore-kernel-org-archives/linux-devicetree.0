From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: [PATCH V2 3/4] arm64: dts: imx: add imx8qxp mek support
Date: Sun, 14 Oct 2018 14:34:56 +0000
Message-ID: <1539527419-23613-4-git-send-email-aisheng.dong@nxp.com>
References: <1539527419-23613-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1539527419-23613-1-git-send-email-aisheng.dong@nxp.com>
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
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "dongas86@gmail.com" <dongas86@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

Add imx8qxp mek board support.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.txt |   4 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 134 ++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index baeb1fc..704472b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -97,6 +97,10 @@ i.MX7 SabreSD Board
 Required root node properties:
     - compatible = "fsl,imx7d-sdb", "fsl,imx7d";
 
+i.MX8QXP MEK Board
+Required root node properties:
+    - compatible = "fsl,imx8qxp-mek", "fsl,imx8qxp";
+
 Generic i.MX boards
 -------------------
 
diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 86e18ad..cff87f3 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -13,3 +13,4 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-rdb.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-simu.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-rdb.dtb
+dtb-$(CONFIG_SOC_IMX8QXP) += imx8qxp-mek.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
new file mode 100644
index 0000000..04e3a42
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2017~2018 NXP
+ */
+
+/dts-v1/;
+
+#include "imx8qxp.dtsi"
+
+/ {
+	model = "Freescale i.MX8QXP MEK";
+	compatible = "fsl,imx8qxp-mek", "fsl,imx8qxp";
+
+	chosen {
+		stdout-path = &dma_lpuart0;
+	};
+
+	reg_usdhc2_vmmc: usdhc2-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "SD1_SPWR";
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+		gpio = <&lsio_gpio4 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&dma_lpuart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart0>;
+	status = "okay";
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy0>;
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			at803x,eee-disabled;
+			at803x,vddio-1p8v;
+			reg = <0>;
+		};
+
+		ethphy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			at803x,eee-disabled;
+			at803x,vddio-1p8v;
+			reg = <1>;
+		};
+	};
+};
+
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	cd-gpios = <&lsio_gpio4 22 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&lsio_gpio4 21 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <
+			SC_P_ENET0_MDC_CONN_ENET0_MDC			0x06000020
+			SC_P_ENET0_MDIO_CONN_ENET0_MDIO			0x06000020
+			SC_P_ENET0_RGMII_TX_CTL_CONN_ENET0_RGMII_TX_CTL	0x06000020
+			SC_P_ENET0_RGMII_TXC_CONN_ENET0_RGMII_TXC	0x06000020
+			SC_P_ENET0_RGMII_TXD0_CONN_ENET0_RGMII_TXD0	0x06000020
+			SC_P_ENET0_RGMII_TXD1_CONN_ENET0_RGMII_TXD1	0x06000020
+			SC_P_ENET0_RGMII_TXD2_CONN_ENET0_RGMII_TXD2	0x06000020
+			SC_P_ENET0_RGMII_TXD3_CONN_ENET0_RGMII_TXD3	0x06000020
+			SC_P_ENET0_RGMII_RXC_CONN_ENET0_RGMII_RXC	0x06000020
+			SC_P_ENET0_RGMII_RX_CTL_CONN_ENET0_RGMII_RX_CTL	0x06000020
+			SC_P_ENET0_RGMII_RXD0_CONN_ENET0_RGMII_RXD0	0x06000020
+			SC_P_ENET0_RGMII_RXD1_CONN_ENET0_RGMII_RXD1	0x06000020
+			SC_P_ENET0_RGMII_RXD2_CONN_ENET0_RGMII_RXD2	0x06000020
+			SC_P_ENET0_RGMII_RXD3_CONN_ENET0_RGMII_RXD3	0x06000020
+		>;
+	};
+
+	pinctrl_lpuart0: lpuart0grp {
+		fsl,pins = <
+			SC_P_UART0_RX_ADMA_UART0_RX			0x06000020
+			SC_P_UART0_TX_ADMA_UART0_TX			0x06000020
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			SC_P_EMMC0_CLK_CONN_EMMC0_CLK			0x06000041
+			SC_P_EMMC0_CMD_CONN_EMMC0_CMD			0x00000021
+			SC_P_EMMC0_DATA0_CONN_EMMC0_DATA0		0x00000021
+			SC_P_EMMC0_DATA1_CONN_EMMC0_DATA1		0x00000021
+			SC_P_EMMC0_DATA2_CONN_EMMC0_DATA2		0x00000021
+			SC_P_EMMC0_DATA3_CONN_EMMC0_DATA3		0x00000021
+			SC_P_EMMC0_DATA4_CONN_EMMC0_DATA4		0x00000021
+			SC_P_EMMC0_DATA5_CONN_EMMC0_DATA5		0x00000021
+			SC_P_EMMC0_DATA6_CONN_EMMC0_DATA6		0x00000021
+			SC_P_EMMC0_DATA7_CONN_EMMC0_DATA7		0x00000021
+			SC_P_EMMC0_STROBE_CONN_EMMC0_STROBE		0x00000041
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			SC_P_USDHC1_CLK_CONN_USDHC1_CLK			0x06000041
+			SC_P_USDHC1_CMD_CONN_USDHC1_CMD			0x00000021
+			SC_P_USDHC1_DATA0_CONN_USDHC1_DATA0		0x00000021
+			SC_P_USDHC1_DATA1_CONN_USDHC1_DATA1		0x00000021
+			SC_P_USDHC1_DATA2_CONN_USDHC1_DATA2		0x00000021
+			SC_P_USDHC1_DATA3_CONN_USDHC1_DATA3		0x00000021
+			SC_P_USDHC1_VSELECT_CONN_USDHC1_VSELECT		0x00000021
+		>;
+	};
+};
-- 
2.7.4
