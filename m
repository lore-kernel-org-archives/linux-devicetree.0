From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH] arm64: dts: imx8mq: Add QuadSPI controller
Date: Tue, 29 Jan 2019 16:34:57 +0000
Message-ID: <20190129163457.7107-1-ccaione@baylibre.com>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add a node for the Freescale/NXP QuadSPI controller with a proper
pinctrl set and enable it for the i.MX8MQ EVK board.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 27 ++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi    | 13 ++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index f74b13aa5aa5..ae181c2a5003 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -137,6 +137,21 @@
 	status = "okay";
 };
 
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_qspi>;
+	status = "okay";
+
+	flash0: n25q256a@0 {
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "micron,n25q256a", "jedec,spi-nor";
+		spi-max-frequency = <29000000>;
+		spi-nor,ddr-quad-read-dummy = <6>;
+	};
+};
+
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc1>;
@@ -195,6 +210,18 @@
 		>;
 	};
 
+	pinctrl_qspi: qspigrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_NAND_ALE_QSPI_A_SCLK	0x82
+			MX8MQ_IOMUXC_NAND_CE0_B_QSPI_A_SS0_B	0x82
+			MX8MQ_IOMUXC_NAND_DATA00_QSPI_A_DATA0	0x82
+			MX8MQ_IOMUXC_NAND_DATA01_QSPI_A_DATA1	0x82
+			MX8MQ_IOMUXC_NAND_DATA02_QSPI_A_DATA2	0x82
+			MX8MQ_IOMUXC_NAND_DATA03_QSPI_A_DATA3	0x82
+
+		>;
+	};
+
 	pinctrl_reg_usdhc2: regusdhc2grpgpio {
 		fsl,pins = <
 			MX8MQ_IOMUXC_SD2_RESET_B_GPIO2_IO19		0x41
diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index dbedc4a5e7fb..e0059f451591 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -516,6 +516,19 @@
 			};
 		};
 
+		spi0: spi@30bb0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "fsl,imx7d-qspi";
+			reg = <0x30bb0000 0x10000>, <0x08000000 0x10000000>;
+			reg-names = "QuadSPI", "QuadSPI-memory";
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX8MQ_CLK_QSPI_ROOT>,
+			<&clk IMX8MQ_CLK_QSPI_ROOT>;
+			clock-names = "qspi_en", "qspi";
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@38800000 {
 			compatible = "arm,gic-v3";
 			reg = <0x38800000 0x10000>,	/* GIC Dist */
-- 
2.19.1
