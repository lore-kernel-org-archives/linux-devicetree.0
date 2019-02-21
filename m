From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH 12/14] arm64: dts: imx8qm: add dma ss support
Date: Thu, 21 Feb 2019 18:25:39 +0000
Message-ID: <1550773093-13349-13-git-send-email-aisheng.dong@nxp.com>
References: <1550773093-13349-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550773093-13349-1-git-send-email-aisheng.dong@nxp.com>
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
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "dongas86@gmail.com" <dongas86@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

The DMA SS of MX8QM is mostly the same as the DMA part in MX8QXP ADMA SS
while it has one more instance for each of LPUART, ADC and LPI2C. And unlike
MX8QXP that flexcan clocks are shared between multiple CAN instances,
MX8QM has separate flexcan clock slice.

So we reuse the most part of common imx8-ss-dma.dtsi and add new things
based on it.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 171 +++++++++++++++++++++++
 1 file changed, 171 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
new file mode 100644
index 0000000..7645612
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2018 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+&dma_subsys {
+	adc1_clk: clock-adc1 {
+		compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_ADC_1>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "adc1_clk";
+	};
+
+	can1_clk: clock-can1 {
+		compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_CAN_1>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "can1_clk";
+	};
+
+	can2_clk: clock-can2 {
+		compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_CAN_2>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "can2_clk";
+	};
+
+	uart4_clk: clock-uart4 {
+		compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_UART_4>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "uart4_clk";
+	};
+
+	uart4_lpcg: clock-controller@5a4a0000 {
+		reg = <0x5a4a0000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&uart4_clk>, <&dma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "uart4_lpcg_baud_clk",
+				     "uart4_lpcg_ipg_clk";
+	};
+};
+
+&adc0_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&can0_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&ftm0_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&ftm1_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&i2c0_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&i2c1_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&i2c2_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&i2c3_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&lcd0_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&lcd0_pwm0_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&spi0_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&spi1_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&spi2_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&spi3_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&uart0_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&uart1_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&uart2_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&uart3_clk {
+	compatible = "fsl,imx8qm-clock", "fsl,scu-clk";
+};
+
+&uart0_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&uart1_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&uart2_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&uart3_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&i2c0_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&i2c1_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&i2c2_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&i2c3_lpcg {
+	compatible = "fsl,imx8qm-lpcg", "fsl,imx8qxp-lpcg";
+};
+
+&dma_lpuart0 {
+	compatible = "fsl,imx8qm-lpuart", "fsl,imx7ulp-lpuart";
+};
+
+&dma_i2c0 {
+	compatible = "fsl,imx8qm-lpi2c", "fsl,imx7ulp-lpi2c";
+};
+
+&dma_i2c1 {
+	compatible = "fsl,imx8qm-lpi2c", "fsl,imx7ulp-lpi2c";
+};
+
+&dma_i2c2 {
+	compatible = "fsl,imx8qm-lpi2c", "fsl,imx7ulp-lpi2c";
+};
+
+&dma_i2c3 {
+	compatible = "fsl,imx8qm-lpi2c", "fsl,imx7ulp-lpi2c";
+};
-- 
2.7.4
