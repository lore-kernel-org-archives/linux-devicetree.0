From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 3/4] ARM: vexpress/ca9: Add interrupt-affinity to the PMU node
Date: Thu,  7 May 2015 15:45:04 +0100
Message-ID: <1431009905-29265-4-git-send-email-sudeep.holla@arm.com>
References: <1431009905-29265-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431009905-29265-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

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
 arch/arm/boot/dts/vexpress-v2p-ca9.dts | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/vexpress-v2p-ca9.dts b/arch/arm/boot/dts/vexpress-v2p-ca9.dts
index a411274e8b6b..d949facba376 100644
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
@@ -182,6 +182,8 @@
 			     <0 61 4>,
 			     <0 62 4>,
 			     <0 63 4>;
+		interrupt-affinity = <&A9_0>, <&A9_1>, <&A9_2>, <&A9_3>;
+
 	};
 
 	dcc {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
