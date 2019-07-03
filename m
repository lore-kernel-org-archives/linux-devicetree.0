From: jun.li@nxp.com
Subject: [PATCH 4/5] arm64: dts: imx8mm: Remove setting for
 IMX8MM_CLK_USB_CORE_REF
Date: Wed,  3 Jul 2019 15:23:26 +0800
Message-ID: <20190703072327.38165-2-jun.li@nxp.com>
References: <20190703072327.38165-1-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190703072327.38165-1-jun.li@nxp.com>
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
Cc: mark.rutland@arm.com, Peter.Chen@nxp.com, peng.fan@nxp.com, ping.bai@nxp.com, Anson.Huang@nxp.com, devicetree@vger.kernel.org, daniel.baluta@nxp.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, aisheng.dong@nxp.com, leonard.crestez@nxp.com, festevam@gmail.com, s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
List-Id: devicetree@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

Since IMX8MM_CLK_USB_CORE_REF is not used at all, so remove the setting
for it.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 232a741..5d691a5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -743,10 +743,8 @@
 				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MM_CLK_USB1_CTRL_ROOT>;
 				clock-names = "usb1_ctrl_root_clk";
-				assigned-clocks = <&clk IMX8MM_CLK_USB_BUS>,
-						  <&clk IMX8MM_CLK_USB_CORE_REF>;
-				assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_500M>,
-							 <&clk IMX8MM_SYS_PLL1_100M>;
+				assigned-clocks = <&clk IMX8MM_CLK_USB_BUS>;
+				assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_500M>;
 				fsl,usbphy = <&usbphynop1>;
 				fsl,usbmisc = <&usbmisc1 0>;
 				status = "disabled";
@@ -764,10 +762,8 @@
 				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MM_CLK_USB1_CTRL_ROOT>;
 				clock-names = "usb1_ctrl_root_clk";
-				assigned-clocks = <&clk IMX8MM_CLK_USB_BUS>,
-						  <&clk IMX8MM_CLK_USB_CORE_REF>;
-				assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_500M>,
-							 <&clk IMX8MM_SYS_PLL1_100M>;
+				assigned-clocks = <&clk IMX8MM_CLK_USB_BUS>;
+				assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_500M>;
 				fsl,usbphy = <&usbphynop2>;
 				fsl,usbmisc = <&usbmisc2 0>;
 				status = "disabled";
-- 
2.7.4
