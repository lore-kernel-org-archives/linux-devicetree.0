From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] ARM64: zynqmp: Keep gpio node alphabetically sorted
Date: Thu, 11 Feb 2016 13:26:26 +0100
Message-ID: <2f160e012080d5d6de11238ade239bb0bb224f64.1455193571.git.michal.simek@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Suneel Garapati <suneel.garapati-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

No functional change.

Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 200fb588d0f5..7bc65e391530 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -126,18 +126,6 @@
 			clock-frequency = <25000000>;
 		};
 
-		gpio: gpio@ff0a0000 {
-			compatible = "xlnx,zynqmp-gpio-1.0";
-			status = "disabled";
-			#gpio-cells = <0x2>;
-			clocks = <&misc_clk>;
-			interrupt-parent = <&gic>;
-			interrupts = <0 16 4>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			reg = <0x0 0xff0a0000 0x1000>;
-		};
-
 		gem0: ethernet@ff0b0000 {
 			compatible = "cdns,gem";
 			status = "disabled";
@@ -186,6 +174,18 @@
 			#size-cells = <0>;
 		};
 
+		gpio: gpio@ff0a0000 {
+			compatible = "xlnx,zynqmp-gpio-1.0";
+			status = "disabled";
+			#gpio-cells = <0x2>;
+			clocks = <&misc_clk>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 16 4>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			reg = <0x0 0xff0a0000 0x1000>;
+		};
+
 		i2c_clk: i2c_clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0x0>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
