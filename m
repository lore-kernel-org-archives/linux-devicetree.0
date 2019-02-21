From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH 04/14] arm64: dts: imx8: add adma scu clocks
Date: Thu, 21 Feb 2019 18:25:04 +0000
Message-ID: <1550773093-13349-5-git-send-email-aisheng.dong@nxp.com>
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

Add adma scu clocks

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi | 136 ++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
index f6f2b94..5f0e9e3 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
@@ -4,12 +4,148 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
+#include <dt-bindings/firmware/imx/rsrc.h>
+
 adma_subsys: bus@59000000 {
 	compatible = "simple-bus";
 	#address-cells = <1>;
 	#size-cells = <1>;
 	ranges = <0x59000000 0x0 0x59000000 0x2000000>;
 
+	/* SCU clocks */
+	adma_ipg_clk: clock-adma-ipg {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <120000000>;
+		clock-output-names = "adma_ipg_clk";
+	};
+
+	adc0_clk: clock-adc0 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_ADC_0>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "adc0_clk";
+	};
+
+	can0_clk: clock-can0 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_CAN_0>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "can0_clk";
+	};
+
+	ftm0_clk: clock-ftm0 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_FTM_0>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "ftm0_clk";
+	};
+
+	ftm1_clk: clock-ftm1 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_FTM_1>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "ftm1_clk";
+	};
+
+	i2c0_clk: clock-i2c0 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_I2C_0>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "i2c0_clk";
+	};
+
+	i2c1_clk: clock-i2c1 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_I2C_1>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "i2c1_clk";
+	};
+
+	i2c2_clk: clock-i2c2 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_I2C_2>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "i2c2_clk";
+	};
+
+	i2c3_clk: clock-i2c3 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_I2C_3>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "i2c3_clk";
+	};
+
+	lcd0_clk: clock-lcd0 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_LCD_0>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "lcd0_clk";
+	};
+
+	lcd0_pwm0_clk: clock-lcd0-pwm0 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_LCD_0_PWM_0>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "lcd0_pwm0_clk";
+	};
+
+	spi0_clk: clock-spi0 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_SPI_0>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "spi0_clk";
+	};
+
+	spi1_clk: clock-spi1 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_SPI_1>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "spi1_clk";
+	};
+
+	spi2_clk: clock-spi2 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_SPI_2>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "spi2_clk";
+	};
+
+	spi3_clk: clock-spi3 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_SPI_3>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "spi3_clk";
+	};
+
+	uart0_clk: clock-uart0 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_UART_0>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "uart0_clk";
+	};
+
+	uart1_clk: clock-uart1 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_UART_1>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "uart1_clk";
+	};
+
+	uart2_clk: clock-uart2 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_UART_2>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "uart2_clk";
+	};
+
+	uart3_clk: clock-uart3 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_UART_3>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "uart3_clk";
+	};
+
 	adma_lpcg: clock-controller@59000000 {
 		reg = <0x59000000 0x2000000>;
 		#clock-cells = <1>;
-- 
2.7.4
