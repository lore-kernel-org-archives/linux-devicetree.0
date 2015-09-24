From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] Documentation: arm: Fix typo in the idle-states bindings examples
Date: Thu, 24 Sep 2015 15:53:56 +0100
Message-ID: <1443106436-542-1-git-send-email-lorenzo.pieralisi@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Howard Chen <howard.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The idle-states bindings mandate that the entry-method string
in the idle-states node must be "psci" for ARM v8 64-bit systems,
but the examples in the bindings report a wrong entry-method string.
Owing to this typo, some dts in the kernel wrongly defined the
entry-method property, since they likely cut and pasted the example
definition without paying attention to the bindings definitions.

This patch fixes the typo in the DT idle states bindings examples and
respective dts in the kernel so that the bindings and related dts
files are made compliant.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Howard Chen <howard.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/idle-states.txt | 2 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi              | 2 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
index a8274ea..b8e41c1 100644
--- a/Documentation/devicetree/bindings/arm/idle-states.txt
+++ b/Documentation/devicetree/bindings/arm/idle-states.txt
@@ -497,7 +497,7 @@ cpus {
 	};
 
 	idle-states {
-		entry-method = "arm,psci";
+		entry-method = "psci";
 
 		CPU_RETENTION_0_0: cpu-retention-0-0 {
 			compatible = "arm,idle-state";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index d18ee42..06a1564 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -81,7 +81,7 @@
 		};
 
 		idle-states {
-			entry-method = "arm,psci";
+			entry-method = "psci";
 
 			CPU_SLEEP_0: cpu-sleep-0 {
 				compatible = "arm,idle-state";
diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index a712bea..cc093a4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -106,7 +106,7 @@
 		};
 
 		idle-states {
-			entry-method = "arm,psci";
+			entry-method = "psci";
 
 			cpu_sleep: cpu-sleep-0 {
 				compatible = "arm,idle-state";
-- 
2.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
