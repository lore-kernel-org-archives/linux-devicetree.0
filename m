From: Chuanhua Han <chuanhua.han@nxp.com>
Subject: [PATCH v2] arm64: dts: ls1028a: fix watchdog device node
Date: Tue, 28 May 2019 20:45:06 +0800
Message-ID: <20190528124506.9339-1-chuanhua.han@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chuanhua Han <chuanhua.han@nxp.com>
List-Id: devicetree@vger.kernel.org

ls1028a platform uses sp805 watchdog, and use 1/16 platform clock as
timer clock, this patch fix device tree node.

Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
---
Changes in v2: 
	- Replace 'wdt' with 'watchdog' as the node name.
	- Keep nodes sort in unit-address.

 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 23 +++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index ceb608d0e622..bb386dd1d1b1 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -306,15 +306,6 @@
 			#interrupt-cells = <2>;
 		};
 
-		wdog0: watchdog@23c0000 {
-			compatible = "fsl,ls1028a-wdt", "fsl,imx21-wdt";
-			reg = <0x0 0x23c0000 0x0 0x10000>;
-			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 1>;
-			big-endian;
-			status = "disabled";
-		};
-
 		usb0: usb@3100000 {
 			compatible = "fsl,ls1028a-dwc3", "snps,dwc3";
 			reg = <0x0 0x3100000 0x0 0x10000>;
@@ -397,6 +388,20 @@
 				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cluster1_core0_watchdog: watchdog@c000000 {
+			compatible = "arm,sp805", "arm,primecell";
+			reg = <0x0 0xc000000 0x0 0x1000>;
+			clocks = <&clockgen 4 15>, <&clockgen 4 15>;
+			clock-names = "apb_pclk", "wdog_clk";
+		};
+
+		cluster1_core1_watchdog: watchdog@c010000 {
+			compatible = "arm,sp805", "arm,primecell";
+			reg = <0x0 0xc010000 0x0 0x1000>;
+			clocks = <&clockgen 4 15>, <&clockgen 4 15>;
+			clock-names = "apb_pclk", "wdog_clk";
+		};
+
 		sai1: audio-controller@f100000 {
 			#sound-dai-cells = <0>;
 			compatible = "fsl,vf610-sai";
-- 
2.17.1
