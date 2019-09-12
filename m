From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V3 12/15] arm64: dts: imx8qm: add dma ss support
Date: Thu, 12 Sep 2019 23:30:49 +0800
Message-ID: <1568302252-28066-13-git-send-email-aisheng.dong@nxp.com>
References: <1568302252-28066-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568302252-28066-1-git-send-email-aisheng.dong@nxp.com>
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
Cc: Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, dongas86@gmail.com, catalin.marinas@arm.com, will.deacon@arm.com, oliver.graute@gmail.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, Mark Rutland <mark.rutland@arm.com>, shawnguo@kernel.org
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
Tested-by: Oliver Graute <oliver.graute@kococonnector.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v2->v3:
 * use new clock-indices IDs
 * update lpuart fallback compatible string to fsl,imx8qxp-lpuart
v1->v2:
 * change to the new two cell scu clk binding
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 51 ++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
new file mode 100644
index 0000000..bbe5f5e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2018-2019 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+&dma_subsys {
+	uart4_lpcg: clock-controller@5a4a0000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5a4a0000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_UART_4 IMX_SC_PM_CLK_PER>,
+			 <&dma_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_4>;
+		clock-output-names = "uart4_lpcg_baud_clk",
+				     "uart4_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_UART_4>;
+	};
+};
+
+&lpuart0 {
+	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
+};
+
+&lpuart1 {
+	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
+};
+
+&lpuart2 {
+	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
+};
+
+&lpuart3 {
+	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
+};
+
+&i2c0 {
+	compatible = "fsl,imx8qm-lpi2c", "fsl,imx7ulp-lpi2c";
+};
+
+&i2c1 {
+	compatible = "fsl,imx8qm-lpi2c", "fsl,imx7ulp-lpi2c";
+};
+
+&i2c2 {
+	compatible = "fsl,imx8qm-lpi2c", "fsl,imx7ulp-lpi2c";
+};
+
+&i2c3 {
+	compatible = "fsl,imx8qm-lpi2c", "fsl,imx7ulp-lpi2c";
+};
-- 
2.7.4
