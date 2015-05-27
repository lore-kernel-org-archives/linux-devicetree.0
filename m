From: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
Subject: [PATCH v3] ARM: zynq: DT: Use the zynq binding with macb
Date: Wed, 27 May 2015 15:00:01 -0500
Message-ID: <1432756801-6896-1-git-send-email-nathan.sullivan@ni.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
Cc: soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use the new zynq binding for macb ethernet, since it will disable half
duplex gigabit like the Zynq TRM says to do. Also allow the compatible
cadence gem binding that won't disable half duplex but works otherwise.

Signed-off-by: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
---
 arch/arm/boot/dts/zynq-7000.dtsi |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index a5cd2ed..0691508 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -193,7 +193,7 @@
 		};
 
 		gem0: ethernet@e000b000 {
-			compatible = "cdns,gem";
+			compatible = "cdns,zynq-gem", "cdns,gem";
 			reg = <0xe000b000 0x1000>;
 			status = "disabled";
 			interrupts = <0 22 4>;
@@ -204,7 +204,7 @@
 		};
 
 		gem1: ethernet@e000c000 {
-			compatible = "cdns,gem";
+			compatible = "cdns,zynq-gem", "cdns,gem";
 			reg = <0xe000c000 0x1000>;
 			status = "disabled";
 			interrupts = <0 45 4>;
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
