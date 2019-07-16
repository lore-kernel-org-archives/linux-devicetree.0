From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v2 07/15] arm64: dts: imx8: switch to two cell scu clock
 binding
Date: Tue, 16 Jul 2019 23:14:41 +0800
Message-ID: <1563290089-11085-8-git-send-email-aisheng.dong@nxp.com>
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

switch to two cell scu clock binding

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v1->v2: split from lpcg binding changes
---
 arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi | 24 +++++-----
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi | 20 ++++----
 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi | 64 ++++++++++++-------------
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi      | 10 ++--
 4 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
index f0681a7..7dbc4db 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
@@ -68,7 +68,7 @@ adma_subsys: bus@59000000 {
 	uart0_lpcg: clock-controller@5a460000 {
 		reg = <0x5a460000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_ADMA_UART0_CLK>,
+		clocks = <&clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>,
 			 <&dma_ipg_clk>;
 		bit-offset = <0 16>;
 		clock-output-names = "uart0_lpcg_baud_clk",
@@ -79,7 +79,7 @@ adma_subsys: bus@59000000 {
 	uart1_lpcg: clock-controller@5a470000 {
 		reg = <0x5a470000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_ADMA_UART1_CLK>,
+		clocks = <&clk IMX_SC_R_UART_1 IMX_SC_PM_CLK_PER>,
 			 <&dma_ipg_clk>;
 		bit-offset = <0 16>;
 		clock-output-names = "uart1_lpcg_baud_clk",
@@ -90,7 +90,7 @@ adma_subsys: bus@59000000 {
 	uart2_lpcg: clock-controller@5a480000 {
 		reg = <0x5a480000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_ADMA_UART2_CLK>,
+		clocks = <&clk IMX_SC_R_UART_2 IMX_SC_PM_CLK_PER>,
 			 <&dma_ipg_clk>;
 		bit-offset = <0 16>;
 		clock-output-names = "uart2_lpcg_baud_clk",
@@ -101,7 +101,7 @@ adma_subsys: bus@59000000 {
 	uart3_lpcg: clock-controller@5a490000 {
 		reg = <0x5a490000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_ADMA_UART3_CLK>,
+		clocks = <&clk IMX_SC_R_UART_3 IMX_SC_PM_CLK_PER>,
 			 <&dma_ipg_clk>;
 		bit-offset = <0 16>;
 		clock-output-names = "uart3_lpcg_baud_clk",
@@ -115,7 +115,7 @@ adma_subsys: bus@59000000 {
 		interrupt-parent = <&gic>;
 		clocks = <&adma_lpcg IMX_ADMA_LPCG_I2C0_CLK>;
 		clock-names = "per";
-		assigned-clocks = <&clk IMX_ADMA_I2C0_CLK>;
+		assigned-clocks = <&clk IMX_SC_R_I2C_0 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_0>;
 		status = "disabled";
@@ -127,7 +127,7 @@ adma_subsys: bus@59000000 {
 		interrupt-parent = <&gic>;
 		clocks = <&adma_lpcg IMX_ADMA_LPCG_I2C1_CLK>;
 		clock-names = "per";
-		assigned-clocks = <&clk IMX_ADMA_I2C1_CLK>;
+		assigned-clocks = <&clk IMX_SC_R_I2C_1 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_1>;
 		status = "disabled";
@@ -139,7 +139,7 @@ adma_subsys: bus@59000000 {
 		interrupt-parent = <&gic>;
 		clocks = <&adma_lpcg IMX_ADMA_LPCG_I2C2_CLK>;
 		clock-names = "per";
-		assigned-clocks = <&clk IMX_ADMA_I2C2_CLK>;
+		assigned-clocks = <&clk IMX_SC_R_I2C_2 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_2>;
 		status = "disabled";
@@ -151,7 +151,7 @@ adma_subsys: bus@59000000 {
 		interrupt-parent = <&gic>;
 		clocks = <&adma_lpcg IMX_ADMA_LPCG_I2C3_CLK>;
 		clock-names = "per";
-		assigned-clocks = <&clk IMX_ADMA_I2C3_CLK>;
+		assigned-clocks = <&clk IMX_SC_R_I2C_3 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
 		power-domains = <&pd IMX_SC_R_I2C_3>;
 		status = "disabled";
@@ -160,7 +160,7 @@ adma_subsys: bus@59000000 {
 	i2c0_lpcg: clock-controller@5ac00000 {
 		reg = <0x5ac00000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_ADMA_I2C0_CLK>,
+		clocks = <&clk IMX_SC_R_I2C_0 IMX_SC_PM_CLK_PER>,
 			 <&dma_ipg_clk>;
 		bit-offset = <0 16>;
 		clock-output-names = "i2c0_lpcg_clk",
@@ -171,7 +171,7 @@ adma_subsys: bus@59000000 {
 	i2c1_lpcg: clock-controller@5ac10000 {
 		reg = <0x5ac10000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_ADMA_I2C1_CLK>,
+		clocks = <&clk IMX_SC_R_I2C_1 IMX_SC_PM_CLK_PER>,
 			 <&dma_ipg_clk>;
 		bit-offset = <0 16>;
 		clock-output-names = "i2c1_lpcg_clk",
@@ -182,7 +182,7 @@ adma_subsys: bus@59000000 {
 	i2c2_lpcg: clock-controller@5ac20000 {
 		reg = <0x5ac20000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_ADMA_I2C2_CLK>,
+		clocks = <&clk IMX_SC_R_I2C_2 IMX_SC_PM_CLK_PER>,
 			 <&dma_ipg_clk>;
 		bit-offset = <0 16>;
 		clock-output-names = "i2c2_lpcg_clk",
@@ -193,7 +193,7 @@ adma_subsys: bus@59000000 {
 	i2c3_lpcg: clock-controller@5ac30000 {
 		reg = <0x5ac30000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_ADMA_I2C3_CLK>,
+		clocks = <&clk IMX_SC_R_I2C_3 IMX_SC_PM_CLK_PER>,
 			 <&dma_ipg_clk>;
 		bit-offset = <0 16>;
 		clock-output-names = "i2c3_lpcg_clk",
diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
index 1ae49c1..c6363de 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
@@ -41,7 +41,7 @@ conn_subsys: bus@5b000000 {
 			 <&conn_lpcg IMX_CONN_LPCG_SDHC0_PER_CLK>,
 			 <&conn_lpcg IMX_CONN_LPCG_SDHC0_HCLK>;
 		clock-names = "ipg", "per", "ahb";
-		assigned-clocks = <&clk IMX_CONN_SDHC0_CLK>;
+		assigned-clocks = <&clk IMX_SC_R_SDHC_0 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <200000000>;
 		power-domains = <&pd IMX_SC_R_SDHC_0>;
 		status = "disabled";
@@ -55,7 +55,7 @@ conn_subsys: bus@5b000000 {
 			 <&conn_lpcg IMX_CONN_LPCG_SDHC1_PER_CLK>,
 			 <&conn_lpcg IMX_CONN_LPCG_SDHC1_HCLK>;
 		clock-names = "ipg", "per", "ahb";
-		assigned-clocks = <&clk IMX_CONN_SDHC1_CLK>;
+		assigned-clocks = <&clk IMX_SC_R_SDHC_1 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <200000000>;
 		power-domains = <&pd IMX_SC_R_SDHC_1>;
 		fsl,tuning-start-tap = <20>;
@@ -71,7 +71,7 @@ conn_subsys: bus@5b000000 {
 			 <&conn_lpcg IMX_CONN_LPCG_SDHC2_PER_CLK>,
 			 <&conn_lpcg IMX_CONN_LPCG_SDHC2_HCLK>;
 		clock-names = "ipg", "per", "ahb";
-		assigned-clocks = <&clk IMX_CONN_SDHC2_CLK>;
+		assigned-clocks = <&clk IMX_SC_R_SDHC_2 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <200000000>;
 		power-domains = <&pd IMX_SC_R_SDHC_2>;
 		status = "disabled";
@@ -120,7 +120,7 @@ conn_subsys: bus@5b000000 {
 	sdhc0_lpcg: clock-controller@5b200000 {
 		reg = <0x5b200000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_CONN_SDHC0_CLK>,
+		clocks = <&clk IMX_SC_R_SDHC_0 IMX_SC_PM_CLK_PER>,
 			 <&conn_ipg_clk>, <&conn_axi_clk>;
 		bit-offset = <0 16 20>;
 		clock-output-names = "sdhc0_lpcg_per_clk",
@@ -132,7 +132,7 @@ conn_subsys: bus@5b000000 {
 	sdhc1_lpcg: clock-controller@5b210000 {
 		reg = <0x5b210000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_CONN_SDHC1_CLK>,
+		clocks = <&clk IMX_SC_R_SDHC_1 IMX_SC_PM_CLK_PER>,
 			 <&conn_ipg_clk>, <&conn_axi_clk>;
 		bit-offset = <0 16 20>;
 		clock-output-names = "sdhc1_lpcg_per_clk",
@@ -144,7 +144,7 @@ conn_subsys: bus@5b000000 {
 	sdhc2_lpcg: clock-controller@5b220000 {
 		reg = <0x5b220000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_CONN_SDHC2_CLK>,
+		clocks = <&clk IMX_SC_R_SDHC_2 IMX_SC_PM_CLK_PER>,
 			 <&conn_ipg_clk>, <&conn_axi_clk>;
 		bit-offset = <0 16 20>;
 		clock-output-names = "sdhc2_lpcg_per_clk",
@@ -156,8 +156,8 @@ conn_subsys: bus@5b000000 {
 	enet0_lpcg: clock-controller@5b230000 {
 		reg = <0x5b230000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_CONN_ENET0_ROOT_CLK>,
-			 <&clk IMX_CONN_ENET0_ROOT_CLK>,
+		clocks = <&clk IMX_SC_R_ENET_0 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_ENET_0 IMX_SC_PM_CLK_PER>,
 			 <&conn_axi_clk>, <&conn_ipg_clk>, <&conn_ipg_clk>;
 		bit-offset = <0 4 8 16 20>;
 		clock-output-names = "enet0_ipg_root_clk",
@@ -171,8 +171,8 @@ conn_subsys: bus@5b000000 {
 	enet1_lpcg: clock-controller@5b240000 {
 		reg = <0x5b240000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_CONN_ENET1_ROOT_CLK>,
-			 <&clk IMX_CONN_ENET1_ROOT_CLK>,
+		clocks = <&clk IMX_SC_R_ENET_1 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_ENET_1 IMX_SC_PM_CLK_PER>,
 			 <&conn_axi_clk>, <&conn_ipg_clk>, <&conn_ipg_clk>;
 		bit-offset = <0 4 8 16 20>;
 		clock-output-names = "enet1_ipg_root_clk",
diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
index 0a779a8..464d233 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
@@ -156,11 +156,11 @@ lsio_subsys: bus@5d000000 {
 	pwm0_lpcg: clock-controller@5d400000 {
 		reg = <0x5d400000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_LSIO_PWM0_CLK>,
-			 <&clk IMX_LSIO_PWM0_CLK>,
-			 <&clk IMX_LSIO_PWM0_CLK>,
+		clocks = <&clk IMX_SC_R_PWM_0 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_0 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_0 IMX_SC_PM_CLK_PER>,
 			 <&lsio_bus_clk>,
-			 <&clk IMX_LSIO_PWM0_CLK>;
+			 <&clk IMX_SC_R_PWM_0 IMX_SC_PM_CLK_PER>;
 		bit-offset = <0 4 16 20 24>;
 		clock-output-names = "pwm0_lpcg_ipg_clk",
 				     "pwm0_lpcg_ipg_hf_clk",
@@ -173,11 +173,11 @@ lsio_subsys: bus@5d000000 {
 	pwm1_lpcg: clock-controller@5d410000 {
 		reg = <0x5d410000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_LSIO_PWM1_CLK>,
-			 <&clk IMX_LSIO_PWM1_CLK>,
-			 <&clk IMX_LSIO_PWM1_CLK>,
+		clocks = <&clk IMX_SC_R_PWM_1 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_1 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_1 IMX_SC_PM_CLK_PER>,
 			 <&lsio_bus_clk>,
-			 <&clk IMX_LSIO_PWM1_CLK>;
+			 <&clk IMX_SC_R_PWM_1 IMX_SC_PM_CLK_PER>;
 		bit-offset = <0 4 16 20 24>;
 		clock-output-names = "pwm1_lpcg_ipg_clk",
 				     "pwm1_lpcg_ipg_hf_clk",
@@ -190,11 +190,11 @@ lsio_subsys: bus@5d000000 {
 	pwm2_lpcg: clock-controller@5d420000 {
 		reg = <0x5d420000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_LSIO_PWM2_CLK>,
-			 <&clk IMX_LSIO_PWM2_CLK>,
-			 <&clk IMX_LSIO_PWM2_CLK>,
+		clocks = <&clk IMX_SC_R_PWM_2 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_2 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_2 IMX_SC_PM_CLK_PER>,
 			 <&lsio_bus_clk>,
-			 <&clk IMX_LSIO_PWM2_CLK>;
+			 <&clk IMX_SC_R_PWM_2 IMX_SC_PM_CLK_PER>;
 		bit-offset = <0 4 16 20 24>;
 		clock-output-names = "pwm2_lpcg_ipg_clk",
 				     "pwm2_lpcg_ipg_hf_clk",
@@ -207,11 +207,11 @@ lsio_subsys: bus@5d000000 {
 	pwm3_lpcg: clock-controller@5d430000 {
 		reg = <0x5d430000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_LSIO_PWM3_CLK>,
-			 <&clk IMX_LSIO_PWM3_CLK>,
-			 <&clk IMX_LSIO_PWM3_CLK>,
+		clocks = <&clk IMX_SC_R_PWM_3 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_3 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_3 IMX_SC_PM_CLK_PER>,
 			 <&lsio_bus_clk>,
-			 <&clk IMX_LSIO_PWM3_CLK>;
+			 <&clk IMX_SC_R_PWM_3 IMX_SC_PM_CLK_PER>;
 		bit-offset = <0 4 16 20 24>;
 		clock-output-names = "pwm3_lpcg_ipg_clk",
 				     "pwm3_lpcg_ipg_hf_clk",
@@ -224,11 +224,11 @@ lsio_subsys: bus@5d000000 {
 	pwm4_lpcg: clock-controller@5d440000 {
 		reg = <0x5d440000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_LSIO_PWM4_CLK>,
-			 <&clk IMX_LSIO_PWM4_CLK>,
-			 <&clk IMX_LSIO_PWM4_CLK>,
+		clocks = <&clk IMX_SC_R_PWM_4 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_4 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_4 IMX_SC_PM_CLK_PER>,
 			 <&lsio_bus_clk>,
-			 <&clk IMX_LSIO_PWM4_CLK>;
+			 <&clk IMX_SC_R_PWM_4 IMX_SC_PM_CLK_PER>;
 		bit-offset = <0 4 16 20 24>;
 		clock-output-names = "pwm4_lpcg_ipg_clk",
 				     "pwm4_lpcg_ipg_hf_clk",
@@ -241,11 +241,11 @@ lsio_subsys: bus@5d000000 {
 	pwm5_lpcg: clock-controller@5d450000 {
 		reg = <0x5d450000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_LSIO_PWM5_CLK>,
-			 <&clk IMX_LSIO_PWM5_CLK>,
-			 <&clk IMX_LSIO_PWM5_CLK>,
+		clocks = <&clk IMX_SC_R_PWM_5 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_5 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_5 IMX_SC_PM_CLK_PER>,
 			 <&lsio_bus_clk>,
-			 <&clk IMX_LSIO_PWM5_CLK>;
+			 <&clk IMX_SC_R_PWM_5 IMX_SC_PM_CLK_PER>;
 		bit-offset = <0 4 16 20 24>;
 		clock-output-names = "pwm5_lpcg_ipg_clk",
 				     "pwm5_lpcg_ipg_hf_clk",
@@ -258,11 +258,11 @@ lsio_subsys: bus@5d000000 {
 	pwm6_lpcg: clock-controller@5d460000 {
 		reg = <0x5d460000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_LSIO_PWM6_CLK>,
-			 <&clk IMX_LSIO_PWM6_CLK>,
-			 <&clk IMX_LSIO_PWM6_CLK>,
+		clocks = <&clk IMX_SC_R_PWM_6 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_6 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_6 IMX_SC_PM_CLK_PER>,
 			 <&lsio_bus_clk>,
-			 <&clk IMX_LSIO_PWM6_CLK>;
+			 <&clk IMX_SC_R_PWM_6 IMX_SC_PM_CLK_PER>;
 		bit-offset = <0 4 16 20 24>;
 		clock-output-names = "pwm6_lpcg_ipg_clk",
 				     "pwm6_lpcg_ipg_hf_clk",
@@ -275,11 +275,11 @@ lsio_subsys: bus@5d000000 {
 	pwm7_lpcg: clock-controller@5d470000 {
 		reg = <0x5d470000 0x10000>;
 		#clock-cells = <1>;
-		clocks = <&clk IMX_LSIO_PWM7_CLK>,
-			 <&clk IMX_LSIO_PWM7_CLK>,
-			 <&clk IMX_LSIO_PWM7_CLK>,
+		clocks = <&clk IMX_SC_R_PWM_7 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_7 IMX_SC_PM_CLK_PER>,
+			 <&clk IMX_SC_R_PWM_7 IMX_SC_PM_CLK_PER>,
 			 <&lsio_bus_clk>,
-			 <&clk IMX_LSIO_PWM7_CLK>;
+			 <&clk IMX_SC_R_PWM_7 IMX_SC_PM_CLK_PER>;
 		bit-offset = <0 4 16 20 24>;
 		clock-output-names = "pwm7_lpcg_ipg_clk",
 				     "pwm7_lpcg_ipg_hf_clk",
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 15babae..ac9912e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -43,7 +43,7 @@
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&A35_L2>;
-			clocks = <&clk IMX_A35_CLK>;
+			clocks = <&clk IMX_SC_R_A35 IMX_SC_PM_CLK_CPU>;
 			operating-points-v2 = <&a35_opp_table>;
 			#cooling-cells = <2>;
 		};
@@ -54,7 +54,7 @@
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			next-level-cache = <&A35_L2>;
-			clocks = <&clk IMX_A35_CLK>;
+			clocks = <&clk IMX_SC_R_A35 IMX_SC_PM_CLK_CPU>;
 			operating-points-v2 = <&a35_opp_table>;
 			#cooling-cells = <2>;
 		};
@@ -65,7 +65,7 @@
 			reg = <0x0 0x2>;
 			enable-method = "psci";
 			next-level-cache = <&A35_L2>;
-			clocks = <&clk IMX_A35_CLK>;
+			clocks = <&clk IMX_SC_R_A35 IMX_SC_PM_CLK_CPU>;
 			operating-points-v2 = <&a35_opp_table>;
 			#cooling-cells = <2>;
 		};
@@ -76,7 +76,7 @@
 			reg = <0x0 0x3>;
 			enable-method = "psci";
 			next-level-cache = <&A35_L2>;
-			clocks = <&clk IMX_A35_CLK>;
+			clocks = <&clk IMX_SC_R_A35 IMX_SC_PM_CLK_CPU>;
 			operating-points-v2 = <&a35_opp_table>;
 			#cooling-cells = <2>;
 		};
@@ -145,7 +145,7 @@
 
 		clk: clock-controller {
 			compatible = "fsl,imx8qxp-clk";
-			#clock-cells = <1>;
+			#clock-cells = <2>;
 			clocks = <&xtal32k &xtal24m>;
 			clock-names = "xtal_32KHz", "xtal_24Mhz";
 		};
-- 
2.7.4
