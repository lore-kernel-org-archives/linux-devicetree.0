From: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] ARM: vexpress: Add interrupt-affinity
Date: Fri,  1 May 2015 19:11:26 +0200
Message-ID: <1430500286-10337-1-git-send-email-r.schwebel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Commit 9fd85eb502a7 ("ARM: pmu: add support for interrupt-affinity
property") added an optional "interrupt-affinity" property, to specify
the CPU affinity for each SPI listed in the interrupts property.

Without this property, we get this boot warning:

  CPU PMU: Failed to parse <no-node>/interrupt-affinity[0]

This patch adds interrupt-affinity to the PMU node in the
vexpress-v2p-ca9 device tree.

Signed-off-by: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Acked-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/boot/dts/vexpress-v2p-ca9.dts | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/vexpress-v2p-ca9.dts b/arch/arm/boot/dts/vexpress-v2p-ca9.dts
index a411274..9d71493 100644
--- a/arch/arm/boot/dts/vexpress-v2p-ca9.dts
+++ b/arch/arm/boot/dts/vexpress-v2p-ca9.dts
@@ -33,28 +33,28 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		A9_0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0>;
 			next-level-cache = <&L2>;
 		};
 
-		cpu@1 {
+		A9_1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <1>;
 			next-level-cache = <&L2>;
 		};
 
-		cpu@2 {
+		A9_2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <2>;
 			next-level-cache = <&L2>;
 		};
 
-		cpu@3 {
+		A9_3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <3>;
@@ -182,6 +182,11 @@
 			     <0 61 4>,
 			     <0 62 4>,
 			     <0 63 4>;
+		interrupt-affinity = <&A9_0>,
+		                     <&A9_1>,
+		                     <&A9_2>,
+		                     <&A9_3>;
+
 	};
 
 	dcc {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
