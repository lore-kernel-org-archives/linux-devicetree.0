From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH 03/14] arm64: dts: imx8: add conn scu clocks
Date: Thu, 21 Feb 2019 18:25:00 +0000
Message-ID: <1550773093-13349-4-git-send-email-aisheng.dong@nxp.com>
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

Add conn scu clocks

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi | 122 ++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
index ac5131d..0765cb2 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
@@ -4,12 +4,134 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
+#include <dt-bindings/firmware/imx/rsrc.h>
+
 conn_subsys: bus@5b000000 {
 	compatible = "simple-bus";
 	#address-cells = <1>;
 	#size-cells = <1>;
 	ranges = <0x5b000000 0x0 0x5b000000 0x1000000>;
 
+	/* SCU clocks */
+	conn_axi_clk: clock-conn-axi {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <333333333>;
+		clock-output-names = "conn_axi_clk";
+	};
+
+	conn_ahb_clk: clock-conn-ahb {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <166666666>;
+		clock-output-names = "conn_ahb_clk";
+	};
+
+	conn_ipg_clk: clock-conn-ipg {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <83333333>;
+		clock-output-names = "conn_ipg_clk";
+	};
+
+	enet0_clk: clock-enet0 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_ENET_0>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "enet0_clk";
+	};
+
+	enet0_bypass_clk: clock-enet0-bypass {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_ENET_0>;
+		clk-type = <IMX_SC_PM_CLK_BYPASS>;
+		clock-output-names = "enet0_bypass_clk";
+	};
+
+	enet0_rgmii_clk: clock-enet0-rgmii {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_ENET_0>;
+		clk-type = <IMX_SC_PM_CLK_MISC0>;
+		clock-output-names = "enet0_rgmii_clk";
+	};
+
+	enet1_clk: clock-enet1 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_ENET_1>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "enet1_clk";
+	};
+
+	enet1_bypass_clk: clock-enet1-bypass {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_ENET_1>;
+		clk-type = <IMX_SC_PM_CLK_BYPASS>;
+		clock-output-names = "enet1_bypass_clk";
+	};
+
+	enet1_rgmii_clk: clock-enet1-rgmii {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_ENET_1>;
+		clk-type = <IMX_SC_PM_CLK_MISC0>;
+		clock-output-names = "enet1_rgmii_clk";
+	};
+
+	gpmi_bch_clk: clock-gpmi-bch {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_NAND>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "gpmi_bch_clk";
+	};
+
+	gpmi_bch_io_clk: clock-gpmi-bch-io {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_NAND>;
+		clk-type = <IMX_SC_PM_CLK_MST_BUS>;
+		clock-output-names = "gpmi_bch_io_clk";
+	};
+
+	sdhc0_clk: clock-sdhc0 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_SDHC_0>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "sdhc0_clk";
+	};
+
+	sdhc1_clk: clock-sdhc1 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_SDHC_1>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "sdhc1_clk";
+	};
+
+	sdhc2_clk: clock-sdhc2 {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_SDHC_2>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "sdhc2_clk";
+	};
+
+	usb3_aclk: clock-usb3-aclk {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_USB_2>;
+		clk-type = <IMX_SC_PM_CLK_PER>;
+		clock-output-names = "usb3_aclk";
+	};
+
+	usb3_bus_aclk: clock-usb3-bus {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_USB_2>;
+		clk-type = <IMX_SC_PM_CLK_MST_BUS>;
+		clock-output-names = "usb3_bus_aclk";
+	};
+
+	usb3_lpm_aclk: clock-usb3-lpm {
+		#clock-cells = <0>;
+		rsrc-id = <IMX_SC_R_USB_2>;
+		clk-type = <IMX_SC_PM_CLK_MISC>;
+		clock-output-names = "usb3_lpm_aclk";
+	};
+
 	conn_lpcg: clock-controller@5b200000 {
 		reg = <0x5b200000 0xb0000>;
 		#clock-cells = <1>;
-- 
2.7.4
