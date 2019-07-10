From: jun.li@nxp.com
Subject: [PATCH 2/2] arm64: dts: imx8mq: correct usb controller clocks
Date: Wed, 10 Jul 2019 19:19:17 +0800
Message-ID: <20190710111917.6615-2-jun.li@nxp.com>
References: <20190710111917.6615-1-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190710111917.6615-1-jun.li@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, sboyd@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, peter.chen@nxp.com, agx@sigxcpu.org, ping.bai@nxp.com, Anson.Huang@nxp.com, ccaione@baylibre.com, andrew.smirnov@gmail.com, mturquette@baylibre.com, angus@akkea.ca, linux-clk@vger.kernel.org, abel.vesa@nxp.com, devicetree@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, l.stach@pengutronix.de, festevam@gmail.com, s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
List-Id: devicetree@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

The correct clock for "bus_early", "ref", "suspend" should be:
IMX8MQ_CLK_USB1_CTRL_ROOT, IMX8MQ_CLK_USB_CORE_REF, IMX8MQ_CLK_32K,
especially we may need the right suspend clock rate to set register
in controller driver.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d09b808..a43ddac 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -901,9 +901,9 @@
 		usb_dwc3_0: usb@38100000 {
 			compatible = "fsl,imx8mq-dwc3", "snps,dwc3";
 			reg = <0x38100000 0x10000>;
-			clocks = <&clk IMX8MQ_CLK_USB_BUS>,
+			clocks = <&clk IMX8MQ_CLK_USB1_CTRL_ROOT>,
 			         <&clk IMX8MQ_CLK_USB_CORE_REF>,
-			         <&clk IMX8MQ_CLK_USB1_CTRL_ROOT>;
+				 <&clk IMX8MQ_CLK_32K>;
 			clock-names = "bus_early", "ref", "suspend";
 			assigned-clocks = <&clk IMX8MQ_CLK_USB_BUS>,
 			                  <&clk IMX8MQ_CLK_USB_CORE_REF>;
@@ -933,9 +933,9 @@
 		usb_dwc3_1: usb@38200000 {
 			compatible = "fsl,imx8mq-dwc3", "snps,dwc3";
 			reg = <0x38200000 0x10000>;
-			clocks = <&clk IMX8MQ_CLK_USB_BUS>,
+			clocks = <&clk IMX8MQ_CLK_USB2_CTRL_ROOT>,
 			         <&clk IMX8MQ_CLK_USB_CORE_REF>,
-			         <&clk IMX8MQ_CLK_USB2_CTRL_ROOT>;
+				 <&clk IMX8MQ_CLK_32K>;
 			clock-names = "bus_early", "ref", "suspend";
 			assigned-clocks = <&clk IMX8MQ_CLK_USB_BUS>,
 			                  <&clk IMX8MQ_CLK_USB_CORE_REF>;
-- 
2.7.4
