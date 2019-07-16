From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v2 11/15] arm64: dts: imx8: split adma ss into dma and audio ss
Date: Tue, 16 Jul 2019 23:14:45 +0800
Message-ID: <1563290089-11085-12-git-send-email-aisheng.dong@nxp.com>
References: <1563290089-11085-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1563290089-11085-1-git-send-email-aisheng.dong@nxp.com>
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
Cc: Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, dongas86@gmail.com, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org
List-Id: devicetree@vger.kernel.org

amda ss is consisted of dma and audio ss in qxp which are
also used in qm.
Let's split them into two ss for better code reuse.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v1->v2:
 * change to the new two cell scu clk binding
---
 arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi    | 200 +-------------------
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     | 205 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |   6 +-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi |  16 +-
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   2 +-
 5 files changed, 218 insertions(+), 211 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
index d5374b3..c5c0ac5 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
@@ -4,202 +4,4 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
-#include <dt-bindings/firmware/imx/rsrc.h>
-
-adma_subsys: bus@59000000 {
-	compatible = "simple-bus";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges = <0x59000000 0x0 0x59000000 0x2000000>;
-
-	dma_ipg_clk: clock-dma-ipg {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <120000000>;
-		clock-output-names = "dma_ipg_clk";
-	};
-
-	adma_lpuart0: serial@5a060000 {
-		reg = <0x5a060000 0x1000>;
-		interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-parent = <&gic>;
-		clocks = <&uart0_lpcg 0>;
-		clock-names = "ipg";
-		power-domains = <&pd IMX_SC_R_UART_0>;
-		status = "disabled";
-	};
-
-	adma_lpuart1: serial@5a070000 {
-		reg = <0x5a070000 0x1000>;
-		interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-parent = <&gic>;
-		clocks = <&uart1_lpcg 0>;
-		clock-names = "ipg";
-		power-domains = <&pd IMX_SC_R_UART_1>;
-		status = "disabled";
-	};
-
-	adma_lpuart2: serial@5a080000 {
-		reg = <0x5a080000 0x1000>;
-		interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-parent = <&gic>;
-		clocks = <&uart2_lpcg 0>;
-		clock-names = "ipg";
-		power-domains = <&pd IMX_SC_R_UART_2>;
-		status = "disabled";
-	};
-
-	adma_lpuart3: serial@5a090000 {
-		reg = <0x5a090000 0x1000>;
-		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-parent = <&gic>;
-		clocks = <&uart3_lpcg 0>;
-		clock-names = "ipg";
-		power-domains = <&pd IMX_SC_R_UART_3>;
-		status = "disabled";
-	};
-
-	uart0_lpcg: clock-controller@5a460000 {
-		compatible = "fsl,imx8qxp-lpcg";
-		reg = <0x5a460000 0x10000>;
-		#clock-cells = <1>;
-		clocks = <&clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>,
-			 <&dma_ipg_clk>;
-		bit-offset = <0 16>;
-		clock-output-names = "uart0_lpcg_baud_clk",
-				     "uart0_lpcg_ipg_clk";
-		power-domains = <&pd IMX_SC_R_UART_0>;
-	};
-
-	uart1_lpcg: clock-controller@5a470000 {
-		compatible = "fsl,imx8qxp-lpcg";
-		reg = <0x5a470000 0x10000>;
-		#clock-cells = <1>;
-		clocks = <&clk IMX_SC_R_UART_1 IMX_SC_PM_CLK_PER>,
-			 <&dma_ipg_clk>;
-		bit-offset = <0 16>;
-		clock-output-names = "uart1_lpcg_baud_clk",
-				     "uart1_lpcg_ipg_clk";
-		power-domains = <&pd IMX_SC_R_UART_1>;
-	};
-
-	uart2_lpcg: clock-controller@5a480000 {
-		compatible = "fsl,imx8qxp-lpcg";
-		reg = <0x5a480000 0x10000>;
-		#clock-cells = <1>;
-		clocks = <&clk IMX_SC_R_UART_2 IMX_SC_PM_CLK_PER>,
-			 <&dma_ipg_clk>;
-		bit-offset = <0 16>;
-		clock-output-names = "uart2_lpcg_baud_clk",
-				     "uart2_lpcg_ipg_clk";
-		power-domains = <&pd IMX_SC_R_UART_2>;
-	};
-
-	uart3_lpcg: clock-controller@5a490000 {
-		compatible = "fsl,imx8qxp-lpcg";
-		reg = <0x5a490000 0x10000>;
-		#clock-cells = <1>;
-		clocks = <&clk IMX_SC_R_UART_3 IMX_SC_PM_CLK_PER>,
-			 <&dma_ipg_clk>;
-		bit-offset = <0 16>;
-		clock-output-names = "uart3_lpcg_baud_clk",
-				     "uart3_lpcg_ipg_clk";
-		power-domains = <&pd IMX_SC_R_UART_3>;
-	};
-
-	adma_i2c0: i2c@5a800000 {
-		reg = <0x5a800000 0x4000>;
-		interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-parent = <&gic>;
-		clocks = <&i2c0_lpcg 0>;
-		clock-names = "per";
-		assigned-clocks = <&clk IMX_SC_R_I2C_0 IMX_SC_PM_CLK_PER>;
-		assigned-clock-rates = <24000000>;
-		power-domains = <&pd IMX_SC_R_I2C_0>;
-		status = "disabled";
-	};
-
-	adma_i2c1: i2c@5a810000 {
-		reg = <0x5a810000 0x4000>;
-		interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-parent = <&gic>;
-		clocks = <&i2c1_lpcg 0>;
-		clock-names = "per";
-		assigned-clocks = <&clk IMX_SC_R_I2C_1 IMX_SC_PM_CLK_PER>;
-		assigned-clock-rates = <24000000>;
-		power-domains = <&pd IMX_SC_R_I2C_1>;
-		status = "disabled";
-	};
-
-	adma_i2c2: i2c@5a820000 {
-		reg = <0x5a820000 0x4000>;
-		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-parent = <&gic>;
-		clocks = <&i2c2_lpcg 0>;
-		clock-names = "per";
-		assigned-clocks = <&clk IMX_SC_R_I2C_2 IMX_SC_PM_CLK_PER>;
-		assigned-clock-rates = <24000000>;
-		power-domains = <&pd IMX_SC_R_I2C_2>;
-		status = "disabled";
-	};
-
-	adma_i2c3: i2c@5a830000 {
-		reg = <0x5a830000 0x4000>;
-		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-parent = <&gic>;
-		clocks = <&i2c3_lpcg 0>;
-		clock-names = "per";
-		assigned-clocks = <&clk IMX_SC_R_I2C_3 IMX_SC_PM_CLK_PER>;
-		assigned-clock-rates = <24000000>;
-		power-domains = <&pd IMX_SC_R_I2C_3>;
-		status = "disabled";
-	};
-
-	i2c0_lpcg: clock-controller@5ac00000 {
-		compatible = "fsl,imx8qxp-lpcg";
-		reg = <0x5ac00000 0x10000>;
-		#clock-cells = <1>;
-		clocks = <&clk IMX_SC_R_I2C_0 IMX_SC_PM_CLK_PER>,
-			 <&dma_ipg_clk>;
-		bit-offset = <0 16>;
-		clock-output-names = "i2c0_lpcg_clk",
-				     "i2c0_lpcg_ipg_clk";
-		power-domains = <&pd IMX_SC_R_I2C_0>;
-	};
-
-	i2c1_lpcg: clock-controller@5ac10000 {
-		compatible = "fsl,imx8qxp-lpcg";
-		reg = <0x5ac10000 0x10000>;
-		#clock-cells = <1>;
-		clocks = <&clk IMX_SC_R_I2C_1 IMX_SC_PM_CLK_PER>,
-			 <&dma_ipg_clk>;
-		bit-offset = <0 16>;
-		clock-output-names = "i2c1_lpcg_clk",
-				     "i2c1_lpcg_ipg_clk";
-		power-domains = <&pd IMX_SC_R_I2C_1>;
-	};
-
-	i2c2_lpcg: clock-controller@5ac20000 {
-		compatible = "fsl,imx8qxp-lpcg";
-		reg = <0x5ac20000 0x10000>;
-		#clock-cells = <1>;
-		clocks = <&clk IMX_SC_R_I2C_2 IMX_SC_PM_CLK_PER>,
-			 <&dma_ipg_clk>;
-		bit-offset = <0 16>;
-		clock-output-names = "i2c2_lpcg_clk",
-				     "i2c2_lpcg_ipg_clk";
-		power-domains = <&pd IMX_SC_R_I2C_2>;
-	};
-
-	i2c3_lpcg: clock-controller@5ac30000 {
-		compatible = "fsl,imx8qxp-lpcg";
-		reg = <0x5ac30000 0x10000>;
-		#clock-cells = <1>;
-		clocks = <&clk IMX_SC_R_I2C_3 IMX_SC_PM_CLK_PER>,
-			 <&dma_ipg_clk>;
-		bit-offset = <0 16>;
-		clock-output-names = "i2c3_lpcg_clk",
-				     "i2c3_lpcg_ipg_clk";
-		power-domains = <&pd IMX_SC_R_I2C_3>;
-	};
-};
+#include "imx8-ss-dma.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
new file mode 100644
index 0000000..a2e4dbf
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2018-2019 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+dma_subsys: bus@59000000 {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0x59000000 0x0 0x59000000 0x2000000>;
+
+	dma_ipg_clk: clock-dma-ipg {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <120000000>;
+		clock-output-names = "dma_ipg_clk";
+	};
+
+	lpuart0: serial@5a060000 {
+		reg = <0x5a060000 0x1000>;
+		interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		clocks = <&uart0_lpcg 0>;
+		clock-names = "ipg";
+		power-domains = <&pd IMX_SC_R_UART_0>;
+		status = "disabled";
+	};
+
+	lpuart1: serial@5a070000 {
+		reg = <0x5a070000 0x1000>;
+		interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		clocks = <&uart1_lpcg 0>;
+		clock-names = "ipg";
+		power-domains = <&pd IMX_SC_R_UART_1>;
+		status = "disabled";
+	};
+
+	lpuart2: serial@5a080000 {
+		reg = <0x5a080000 0x1000>;
+		interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		clocks = <&uart2_lpcg 0>;
+		clock-names = "ipg";
+		power-domains = <&pd IMX_SC_R_UART_2>;
+		status = "disabled";
+	};
+
+	lpuart3: serial@5a090000 {
+		reg = <0x5a090000 0x1000>;
+		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		clocks = <&uart3_lpcg 0>;
+		clock-names = "ipg";
+		power-domains = <&pd IMX_SC_R_UART_3>;
+		status = "disabled";
+	};
+
+	uart0_lpcg: clock-controller@5a460000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5a460000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>,
+			 <&dma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "uart0_lpcg_baud_clk",
+				     "uart0_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_UART_0>;
+	};
+
+	uart1_lpcg: clock-controller@5a470000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5a470000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_UART_1 IMX_SC_PM_CLK_PER>,
+			 <&dma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "uart1_lpcg_baud_clk",
+				     "uart1_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_UART_1>;
+	};
+
+	uart2_lpcg: clock-controller@5a480000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5a480000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_UART_2 IMX_SC_PM_CLK_PER>,
+			 <&dma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "uart2_lpcg_baud_clk",
+				     "uart2_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_UART_2>;
+	};
+
+	uart3_lpcg: clock-controller@5a490000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5a490000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_UART_3 IMX_SC_PM_CLK_PER>,
+			 <&dma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "uart3_lpcg_baud_clk",
+				     "uart3_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_UART_3>;
+	};
+
+	i2c0: i2c@5a800000 {
+		reg = <0x5a800000 0x4000>;
+		interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		clocks = <&i2c0_lpcg 0>;
+		clock-names = "per";
+		assigned-clocks = <&clk IMX_SC_R_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		power-domains = <&pd IMX_SC_R_I2C_0>;
+		status = "disabled";
+	};
+
+	i2c1: i2c@5a810000 {
+		reg = <0x5a810000 0x4000>;
+		interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		clocks = <&i2c1_lpcg 0>;
+		clock-names = "per";
+		assigned-clocks = <&clk IMX_SC_R_I2C_1 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		power-domains = <&pd IMX_SC_R_I2C_1>;
+		status = "disabled";
+	};
+
+	i2c2: i2c@5a820000 {
+		reg = <0x5a820000 0x4000>;
+		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		clocks = <&i2c2_lpcg 0>;
+		clock-names = "per";
+		assigned-clocks = <&clk IMX_SC_R_I2C_2 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		power-domains = <&pd IMX_SC_R_I2C_2>;
+		status = "disabled";
+	};
+
+	i2c3: i2c@5a830000 {
+		reg = <0x5a830000 0x4000>;
+		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		clocks = <&i2c3_lpcg 0>;
+		clock-names = "per";
+		assigned-clocks = <&clk IMX_SC_R_I2C_3 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		power-domains = <&pd IMX_SC_R_I2C_3>;
+		status = "disabled";
+	};
+
+	i2c0_lpcg: clock-controller@5ac00000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5ac00000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&dma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "i2c0_lpcg_clk",
+				     "i2c0_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_I2C_0>;
+	};
+
+	i2c1_lpcg: clock-controller@5ac10000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5ac10000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_I2C_1 IMX_SC_PM_CLK_PER>,
+			 <&dma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "i2c1_lpcg_clk",
+				     "i2c1_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_I2C_1>;
+	};
+
+	i2c2_lpcg: clock-controller@5ac20000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5ac20000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_I2C_2 IMX_SC_PM_CLK_PER>,
+			 <&dma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "i2c2_lpcg_clk",
+				     "i2c2_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_I2C_2>;
+	};
+
+	i2c3_lpcg: clock-controller@5ac30000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5ac30000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_I2C_3 IMX_SC_PM_CLK_PER>,
+			 <&dma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "i2c3_lpcg_clk",
+				     "i2c3_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_I2C_3>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index bfdada2..9b6922c 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -12,7 +12,7 @@
 	compatible = "fsl,imx8qxp-mek", "fsl,imx8qxp";
 
 	chosen {
-		stdout-path = &adma_lpuart0;
+		stdout-path = &lpuart0;
 	};
 
 	memory@80000000 {
@@ -30,7 +30,7 @@
 	};
 };
 
-&adma_lpuart0 {
+&lpuart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpuart0>;
 	status = "okay";
@@ -60,7 +60,7 @@
 	};
 };
 
-&adma_i2c1 {
+&i2c1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	clock-frequency = <100000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi
index c80303d..f0264f0 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi
@@ -4,34 +4,34 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
-&adma_lpuart0 {
+&lpuart0 {
 	compatible = "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
 };
 
-&adma_lpuart1 {
+&lpuart1 {
 	compatible = "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
 };
 
-&adma_lpuart2 {
+&lpuart2 {
 	compatible = "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
 };
 
-&adma_lpuart3 {
+&lpuart3 {
 	compatible = "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
 };
 
-&adma_i2c0 {
+&i2c0 {
 	compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
 };
 
-&adma_i2c1 {
+&i2c1 {
 	compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
 };
 
-&adma_i2c2 {
+&i2c2 {
 	compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
 };
 
-&adma_i2c3 {
+&i2c3 {
 	compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index ac9912e..98714cc 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -29,7 +29,7 @@
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
 		mu1 = &lsio_mu1;
-		serial0 = &adma_lpuart0;
+		serial0 = &lpuart0;
 	};
 
 	cpus {
-- 
2.7.4
