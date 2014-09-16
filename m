From: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: zynq: DT: Fix GEM register area size
Date: Tue, 16 Sep 2014 08:08:38 -0700
Message-ID: <1410880118-3494-1-git-send-email-soren.brinkmann@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The size of the GEM's register area is only 0x1000 bytes.

Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/zynq-7000.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index 6cc83d4c6c76..3eb12f25e669 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -190,7 +190,7 @@
 
 		gem0: ethernet@e000b000 {
 			compatible = "cdns,gem";
-			reg = <0xe000b000 0x4000>;
+			reg = <0xe000b000 0x1000>;
 			status = "disabled";
 			interrupts = <0 22 4>;
 			clocks = <&clkc 30>, <&clkc 30>, <&clkc 13>;
@@ -199,7 +199,7 @@
 
 		gem1: ethernet@e000c000 {
 			compatible = "cdns,gem";
-			reg = <0xe000c000 0x4000>;
+			reg = <0xe000c000 0x1000>;
 			status = "disabled";
 			interrupts = <0 45 4>;
 			clocks = <&clkc 31>, <&clkc 31>, <&clkc 14>;
-- 
2.1.0.1.g27b9230

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
