From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH 08/14] arm64: dts: imx8: switch to new clock binding
Date: Thu, 21 Feb 2019 18:25:22 +0000
Message-ID: <1550773093-13349-9-git-send-email-aisheng.dong@nxp.com>
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

switch to new clock binding

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi    |  23 ++---
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |  40 ++++----
 arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi | 104 ++++++++++++++++++++-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi |  68 +++++++++++++-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi |  92 +++++++++++++++++-
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   7 --
 6 files changed, 287 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
index c7adeba..835ecf7 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
@@ -219,16 +219,11 @@ adma_subsys: bus@59000000 {
 				     "i2c3_lpcg_ipg_clk";
 	};
 
-	adma_lpcg: clock-controller@59000000 {
-		reg = <0x59000000 0x2000000>;
-		#clock-cells = <1>;
-	};
-
 	adma_lpuart0: serial@5a060000 {
 		reg = <0x5a060000 0x1000>;
 		interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
-		clocks = <&adma_lpcg IMX_ADMA_LPCG_UART0_BAUD_CLK>;
+		clocks = <&uart0_lpcg 0>;
 		clock-names = "ipg";
 		power-domains = <&pd IMX_SC_R_UART_0>;
 		status = "disabled";
@@ -238,9 +233,9 @@ adma_subsys: bus@59000000 {
 		reg = <0x5a800000 0x4000>;
 		interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
-		clocks = <&adma_lpcg IMX_ADMA_LPCG_I2C0_CLK>;
+		clocks = <&i2c0_lpcg 0>;
 		clock-names = "per";
-		assigned-clocks = <&clk IMX_ADMA_I2C0_CLK>;
+		assigned-clocks = <&i2c0_clk>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_0>;
 		status = "disabled";
@@ -250,9 +245,9 @@ adma_subsys: bus@59000000 {
 		reg = <0x5a810000 0x4000>;
 		interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
-		clocks = <&adma_lpcg IMX_ADMA_LPCG_I2C1_CLK>;
+		clocks = <&i2c1_lpcg 0>;
 		clock-names = "per";
-		assigned-clocks = <&clk IMX_ADMA_I2C1_CLK>;
+		assigned-clocks = <&i2c1_clk>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_1>;
 		status = "disabled";
@@ -262,9 +257,9 @@ adma_subsys: bus@59000000 {
 		reg = <0x5a820000 0x4000>;
 		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
-		clocks = <&adma_lpcg IMX_ADMA_LPCG_I2C2_CLK>;
+		clocks = <&i2c2_lpcg 0>;
 		clock-names = "per";
-		assigned-clocks = <&clk IMX_ADMA_I2C2_CLK>;
+		assigned-clocks = <&i2c2_clk>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_2>;
 		status = "disabled";
@@ -274,9 +269,9 @@ adma_subsys: bus@59000000 {
 		reg = <0x5a830000 0x4000>;
 		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
-		clocks = <&adma_lpcg IMX_ADMA_LPCG_I2C3_CLK>;
+		clocks = <&i2c3_lpcg 0>;
 		clock-names = "per";
-		assigned-clocks = <&clk IMX_ADMA_I2C3_CLK>;
+		assigned-clocks = <&i2c3_clk>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_3>;
 		status = "disabled";
diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
index 33a3584..c6b2870 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
@@ -198,11 +198,11 @@ conn_subsys: bus@5b000000 {
 		interrupt-parent = <&gic>;
 		interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
 		reg = <0x5b010000 0x10000>;
-		clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC0_IPG_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_SDHC0_PER_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_SDHC0_HCLK>;
+		clocks = <&sdhc0_lpcg 1>,
+			 <&sdhc0_lpcg 0>,
+			 <&sdhc0_lpcg 2>;
 		clock-names = "ipg", "per", "ahb";
-		assigned-clocks = <&clk IMX_CONN_SDHC0_CLK>;
+		assigned-clocks = <&sdhc0_clk>;
 		assigned-clock-rates = <200000000>;
 		power-domains = <&pd IMX_SC_R_SDHC_0>;
 		status = "disabled";
@@ -212,11 +212,11 @@ conn_subsys: bus@5b000000 {
 		interrupt-parent = <&gic>;
 		interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
 		reg = <0x5b020000 0x10000>;
-		clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC1_IPG_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_SDHC1_PER_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_SDHC1_HCLK>;
+		clocks = <&sdhc1_lpcg 1>,
+			 <&sdhc1_lpcg 0>,
+			 <&sdhc1_lpcg 2>;
 		clock-names = "ipg", "per", "ahb";
-		assigned-clocks = <&clk IMX_CONN_SDHC1_CLK>;
+		assigned-clocks = <&sdhc1_clk>;
 		assigned-clock-rates = <200000000>;
 		power-domains = <&pd IMX_SC_R_SDHC_1>;
 		fsl,tuning-start-tap = <20>;
@@ -228,11 +228,11 @@ conn_subsys: bus@5b000000 {
 		interrupt-parent = <&gic>;
 		interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
 		reg = <0x5b030000 0x10000>;
-		clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC2_IPG_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_SDHC2_PER_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_SDHC2_HCLK>;
+		clocks = <&sdhc2_lpcg 1>,
+			 <&sdhc2_lpcg 0>,
+			 <&sdhc2_lpcg 2>;
 		clock-names = "ipg", "per", "ahb";
-		assigned-clocks = <&clk IMX_CONN_SDHC2_CLK>;
+		assigned-clocks = <&sdhc2_clk>;
 		assigned-clock-rates = <200000000>;
 		power-domains = <&pd IMX_SC_R_SDHC_2>;
 		status = "disabled";
@@ -244,10 +244,10 @@ conn_subsys: bus@5b000000 {
 			     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&conn_lpcg IMX_CONN_LPCG_ENET0_IPG_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_ENET0_AHB_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_ENET0_TX_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_ENET0_ROOT_CLK>;
+		clocks = <&enet0_lpcg 3>,
+			 <&enet0_lpcg 2>,
+			 <&enet0_lpcg 1>,
+			 <&enet0_lpcg 0>;
 		clock-names = "ipg", "ahb", "enet_clk_ref", "ptp";
 		fsl,num-tx-queues=<3>;
 		fsl,num-rx-queues=<3>;
@@ -261,10 +261,10 @@ conn_subsys: bus@5b000000 {
 				<GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&conn_lpcg IMX_CONN_LPCG_ENET1_IPG_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_ENET1_AHB_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_ENET1_TX_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_ENET1_ROOT_CLK>;
+		clocks = <&enet1_lpcg 3>,
+			 <&enet1_lpcg 2>,
+			 <&enet1_lpcg 1>,
+			 <&enet1_lpcg 0>;
 		clock-names = "ipg", "ahb", "enet_clk_ref", "ptp";
 		fsl,num-tx-queues=<3>;
 		fsl,num-rx-queues=<3>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi
index 2486c72..2368e52 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi
@@ -4,8 +4,108 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
-&adma_lpcg {
-	compatible = "fsl,imx8qxp-lpcg-adma";
+&adc0_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&can0_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&ftm0_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&ftm1_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&i2c0_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&i2c1_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&i2c2_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&i2c3_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&lcd0_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&lcd0_pwm0_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&spi0_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&spi1_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&spi2_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&spi3_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&uart0_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&uart1_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&uart2_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&uart3_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&uart0_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&uart1_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&uart2_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&uart3_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&i2c0_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&i2c1_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&i2c2_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&i2c3_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
 };
 
 &adma_lpuart0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi
index 27a3b46..5f6552d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi
@@ -4,8 +4,72 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
-&conn_lpcg {
-	compatible = "fsl,imx8qxp-lpcg-conn";
+&enet0_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&enet0_bypass_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&enet0_rgmii_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&enet1_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&enet1_bypass_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&enet1_rgmii_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&gpmi_bch_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&gpmi_bch_io_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&sdhc0_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&sdhc1_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&usb3_aclk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&usb3_bus_aclk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&usb3_lpm_aclk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&sdhc0_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&sdhc1_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&enet0_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&enet1_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
 };
 
 &usdhc1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi
index 842849b..742e57f 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi
@@ -4,8 +4,96 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
-&lsio_lpcg {
-	compatible = "fsl,imx8qxp-lpcg-lsio";
+&fspi0_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&fspi1_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&gpt0_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&gpt1_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&gpt2_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&gpt3_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&gpt4_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&pwm0_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&pwm1_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&pwm2_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&pwm3_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&pwm4_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&pwm5_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&pwm6_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&pwm7_clk {
+	compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
+};
+
+&pwm0_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&pwm1_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&pwm2_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&pwm3_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&pwm4_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&pwm5_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&pwm6_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&pwm7_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
 };
 
 &lsio_mu0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index c27043c..589483a 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -97,13 +97,6 @@
 			  &lsio_mu1 1 2
 			  &lsio_mu1 1 3>;
 
-		clk: clock-controller {
-			compatible = "fsl,imx8qxp-clk";
-			#clock-cells = <1>;
-			clocks = <&xtal32k &xtal24m>;
-			clock-names = "xtal_32KHz", "xtal_24Mhz";
-		};
-
 		iomuxc: pinctrl {
 			compatible = "fsl,imx8qxp-iomuxc";
 		};
-- 
2.7.4
