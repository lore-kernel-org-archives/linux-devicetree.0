From: Xu YiPing <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH v2] arm64: dts: hi3660: improve pmu description
Date: Thu, 9 Nov 2017 19:18:23 +0800
Message-ID: <1510226303-20950-1-git-send-email-xuyiping@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, chenjun14-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

cortex-a73 pmu driver is supported now. hi3660 is 4*a73 + 4*a53, so it
should use "cortex-a73-pmu" and "cortex-a53-pmu" instead of "armpmu-v3",
then we can use the a73 and a53 events in perf tool directly.

Signed-off-by: Xu YiPing <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index 13ae69f..f4882d3 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -203,21 +203,25 @@
 					 IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
-	pmu {
-		compatible = "arm,armv8-pmuv3";
+	a53-pmu {
+		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu0>,
 				     <&cpu1>,
 				     <&cpu2>,
-				     <&cpu3>,
-				     <&cpu4>,
+				     <&cpu3>;
+	};
+
+	a73-pmu {
+		compatible = "arm,cortex-a73-pmu";
+		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu4>,
 				     <&cpu5>,
 				     <&cpu6>,
 				     <&cpu7>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
