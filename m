From: Anson.Huang@nxp.com
Subject: [PATCH] arm64: dts: imx8mm: Fix build warnings
Date: Mon,  3 Jun 2019 08:48:20 +0800
Message-ID: <20190603004820.36247-1-Anson.Huang@nxp.com>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, aisheng.dong@nxp.com, viresh.kumar@linaro.org, ping.bai@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

This patch fixes below build warning with "W=1":

arch/arm64/boot/dts/freescale/imx8mm.dtsi:203.6-754.4:
 Warning (unit_address_vs_reg): /soc: node has a reg or
 ranges property, but no unit name
arch/arm64/boot/dts/freescale/imx8mm.dtsi:209.23-388.5:
 Warning (unit_address_vs_reg): /soc/bus@30000000: node
 has a unit name, but no reg property
arch/arm64/boot/dts/freescale/imx8mm.dtsi:390.23-439.5:
 Warning (unit_address_vs_reg): /soc/bus@30400000: node
 has a unit name, but no reg property
arch/arm64/boot/dts/freescale/imx8mm.dtsi:441.23-658.5:
 Warning (unit_address_vs_reg): /soc/bus@30800000: node
 has a unit name, but no reg property
arch/arm64/boot/dts/freescale/imx8mm.dtsi:660.23-724.5:
 Warning (unit_address_vs_reg): /soc/bus@32c00000: node
 has a unit name, but no reg property
arch/arm64/boot/dts/freescale/imx8mm.dtsi:681.27-687.6:
 Warning (simple_bus_reg): /soc/bus@32c00000/usbphynop1:
 missing or empty reg/ranges property
arch/arm64/boot/dts/freescale/imx8mm.dtsi:710.27-716.6:
 Warning (simple_bus_reg): /soc/bus@32c00000/usbphynop2:
 missing or empty reg/ranges property

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 38 +++++++++++++++++--------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 708d3c4..dc99f45 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -200,7 +200,7 @@
 		arm,no-tick-in-suspend;
 	};
 
-	soc {
+	soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -208,6 +208,7 @@
 
 		aips1: bus@30000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
+			reg = <0x30000000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -389,6 +390,7 @@
 
 		aips2: bus@30400000 {
 			compatible = "fsl,aips-bus", "simple-bus";
+			reg = <0x30400000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -440,6 +442,7 @@
 
 		aips3: bus@30800000 {
 			compatible = "fsl,aips-bus", "simple-bus";
+			reg = <0x30800000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -659,6 +662,7 @@
 
 		aips4: bus@32c00000 {
 			compatible = "fsl,aips-bus", "simple-bus";
+			reg = <0x32c00000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -678,14 +682,6 @@
 				status = "disabled";
 			};
 
-			usbphynop1: usbphynop1 {
-				compatible = "usb-nop-xceiv";
-				clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
-				assigned-clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
-				assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_100M>;
-				clock-names = "main_clk";
-			};
-
 			usbmisc1: usbmisc@32e40200 {
 				compatible = "fsl,imx8mm-usbmisc", "fsl,imx7d-usbmisc";
 				#index-cells = <1>;
@@ -707,14 +703,6 @@
 				status = "disabled";
 			};
 
-			usbphynop2: usbphynop2 {
-				compatible = "usb-nop-xceiv";
-				clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
-				assigned-clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
-				assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_100M>;
-				clock-names = "main_clk";
-			};
-
 			usbmisc2: usbmisc@32e50200 {
 				compatible = "fsl,imx8mm-usbmisc", "fsl,imx7d-usbmisc";
 				#index-cells = <1>;
@@ -752,4 +740,20 @@
 			status = "disabled";
 		};
 	};
+
+	usbphynop1: usbphynop1 {
+		compatible = "usb-nop-xceiv";
+		clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
+		assigned-clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
+		assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_100M>;
+		clock-names = "main_clk";
+	};
+
+	usbphynop2: usbphynop2 {
+		compatible = "usb-nop-xceiv";
+		clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
+		assigned-clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
+		assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_100M>;
+		clock-names = "main_clk";
+	};
 };
-- 
2.7.4
