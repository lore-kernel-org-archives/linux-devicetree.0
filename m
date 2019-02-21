From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH 02/14] arm64: dts: imx8: add lsio scu clocks
Date: Thu, 21 Feb 2019 18:24:56 +0000
Message-ID: <1550773093-13349-3-git-send-email-aisheng.dong@nxp.com>
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

Add lsio scu clocks

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi | 122 ++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
index 1c6ba8d..5c4c2fb 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
@@ -4,12 +4,134 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
+#include <dt-bindings/firmware/imx/rsrc.h>
+
 lsio_subsys: bus@5d000000 {
 	compatible = "simple-bus";
 	#address-cells = <1>;
 	#size-cells = <1>;
 	ranges = <0x5d000000 0x0 0x5d000000 0x1000000>;
 
+	/* SCU clocks */
+	lsio_mem_clk: clock-lsio-mem {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <200000000>;
+		clock-output-names = "lsio_mem_clk";
+	};
+
+	lsio_bus_clk: clock-lsio-bus {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "lsio_bus_clk";
+	};
+
+	fspi0_clk: clock-fspi0{
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_FSPI_0>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "fspi0_clk";
+	};
+
+	fspi1_clk: clock-fspi1 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_FSPI_1>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "fspi1_clk";
+	};
+
+	gpt0_clk: clock-gpt0 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_GPT_0>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "gpt0_clk";
+	};
+
+	gpt1_clk: clock-gpt1 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_GPT_1>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "gpt1_clk";
+	};
+
+	gpt2_clk: clock-gpt2 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_GPT_2>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "gpt2_clk";
+	};
+
+	gpt3_clk: clock-gpt3 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_GPT_3>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "gpt3_clk";
+	};
+
+	gpt4_clk: clock-gpt4 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_GPT_4>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "gpt4_clk";
+	};
+
+	pwm0_clk: clock-pwm0 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_PWM_0>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "pwm0_clk";
+	};
+
+	pwm1_clk: clock-pwm1 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_PWM_1>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "pwm1_clk";
+	};
+
+	pwm2_clk: clock-pwm2 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_PWM_2>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "pwm2_clk";
+	};
+
+	pwm3_clk: clock-pwm3 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_PWM_3>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "pwm3_clk";
+	};
+
+	pwm4_clk: clock-pwm4 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_PWM_4>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "pwm4_clk";
+	};
+
+	pwm5_clk: clock-pwm5 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_PWM_5>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "pwm5_clk";
+	};
+
+	pwm6_clk: clock-pwm6 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_PWM_6>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "pwm6_clk";
+	};
+
+	pwm7_clk: clock-pwm7 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_PWM_7>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "pwm7_clk";
+	};
+
 	lsio_lpcg: clock-controller@5d400000 {
 		reg = <0x5d400000 0x400000>;
 		#clock-cells = <1>;
-- 
2.7.4
