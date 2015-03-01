From: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/3] arm64: dts: Fix interrupt active level for the generic timer on exynos7
Date: Sun,  1 Mar 2015 21:53:45 +0530
Message-ID: <1425227026-5336-3-git-send-email-a.kesavan@samsung.com>
References: <1425227026-5336-1-git-send-email-a.kesavan@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425227026-5336-1-git-send-email-a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix the exynos7 device tree to indicate that the arm generic timers
provide an active low interrupt output. Also, update the CPU mask to
match the number of CPUs on the SoC.

Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 749c4b3..c5687f9 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/clock/exynos7-clk.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
 	compatible = "samsung,exynos7";
@@ -440,10 +441,10 @@
 
 		timer {
 			compatible = "arm,armv8-timer";
-			interrupts = <1 13 0xff01>,
-				     <1 14 0xff01>,
-				     <1 11 0xff01>,
-				     <1 10 0xff01>;
+			interrupts = <1 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <1 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <1 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <1 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		};
 
 		pmu_system_controller: system-controller@105c0000 {
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
