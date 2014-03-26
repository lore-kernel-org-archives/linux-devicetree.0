From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] ARM: rockchip: convert smp bringup to CPU_METHOD_OF_DECLARE
Date: Wed, 26 Mar 2014 11:27:35 +0100
Message-ID: <1632873.urGeGsUMPH@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

With the newly introduced CPU_METHOD_OF_DECLARE is not necessary anymore
to reference the relevant smp_ops in the board file, but instead it can
simply be set by the enable-method property of the cpu nodes.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 1 +
 arch/arm/boot/dts/rk3066a.dtsi                 | 1 +
 arch/arm/boot/dts/rk3188.dtsi                  | 1 +
 arch/arm/mach-rockchip/core.h                  | 2 --
 arch/arm/mach-rockchip/platsmp.c               | 3 ++-
 arch/arm/mach-rockchip/rockchip.c              | 1 -
 6 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index 333f4ae..2501d5d 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -185,6 +185,7 @@ nodes to be present and contain the properties described below.
 			    "qcom,gcc-msm8660"
 			    "qcom,kpss-acc-v1"
 			    "qcom,kpss-acc-v2"
+			    "rockchip,rk3066-smp"
 
 	- cpu-release-addr
 		Usage: required for systems that have an "enable-method"
diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 4d4dfbb..90b354d 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -24,6 +24,7 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "rockchip,rk3066-smp";
 
 		cpu@0 {
 			device_type = "cpu";
diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index bb36596..7ad5103 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -24,6 +24,7 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "rockchip,rk3066-smp";
 
 		cpu@0 {
 			device_type = "cpu";
diff --git a/arch/arm/mach-rockchip/core.h b/arch/arm/mach-rockchip/core.h
index e2e7c9d..39bca96 100644
--- a/arch/arm/mach-rockchip/core.h
+++ b/arch/arm/mach-rockchip/core.h
@@ -18,5 +18,3 @@ extern char rockchip_secondary_trampoline_end;
 
 extern unsigned long rockchip_boot_fn;
 extern void rockchip_secondary_startup(void);
-
-extern struct smp_operations rockchip_smp_ops;
diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/platsmp.c
index dbfa5a2..a18b7f2 100644
--- a/arch/arm/mach-rockchip/platsmp.c
+++ b/arch/arm/mach-rockchip/platsmp.c
@@ -178,7 +178,8 @@ static void __init rockchip_smp_prepare_cpus(unsigned int max_cpus)
 		pmu_set_power_domain(0 + i, false);
 }
 
-struct smp_operations rockchip_smp_ops __initdata = {
+static struct smp_operations rockchip_smp_ops __initdata = {
 	.smp_prepare_cpus	= rockchip_smp_prepare_cpus,
 	.smp_boot_secondary	= rockchip_boot_secondary,
 };
+CPU_METHOD_OF_DECLARE(rk3066_smp, "rockchip,rk3066-smp", &rockchip_smp_ops);
diff --git a/arch/arm/mach-rockchip/rockchip.c b/arch/arm/mach-rockchip/rockchip.c
index d211d6f..4499b0a 100644
--- a/arch/arm/mach-rockchip/rockchip.c
+++ b/arch/arm/mach-rockchip/rockchip.c
@@ -39,7 +39,6 @@ static const char * const rockchip_board_dt_compat[] = {
 };
 
 DT_MACHINE_START(ROCKCHIP_DT, "Rockchip Cortex-A9 (Device Tree)")
-	.smp		= smp_ops(rockchip_smp_ops),
 	.init_machine	= rockchip_dt_init,
 	.dt_compat	= rockchip_board_dt_compat,
 MACHINE_END
-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
