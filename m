From: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 7/7] ARM: meson: enable L2 cache
Date: Sun,  5 Oct 2014 23:59:19 +0200
Message-ID: <1412546359-15062-8-git-send-email-b.galvani@gmail.com>
References: <1412546359-15062-1-git-send-email-b.galvani@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412546359-15062-1-git-send-email-b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jerry Cao <jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Victor Wan <victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This enables the L2 cache controller available in Amlogic SoCs.

Signed-off-by: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/meson.dtsi  | 7 +++++++
 arch/arm/boot/dts/meson6.dtsi | 2 ++
 arch/arm/boot/dts/meson8.dtsi | 4 ++++
 arch/arm/mach-meson/Kconfig   | 1 +
 arch/arm/mach-meson/meson.c   | 2 ++
 5 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 55feb14..7d27f12 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -50,6 +50,13 @@
 / {
 	interrupt-parent = <&gic>;
 
+	L2: l2-cache-controller@c4200000 {
+		compatible = "arm,pl310-cache";
+		reg = <0xc4200000 0x1000>;
+		cache-unified;
+		cache-level = <2>;
+	};
+
 	gic: interrupt-controller@c4301000 {
 		compatible = "arm,cortex-a9-gic";
 		reg = <0xc4301000 0x1000>,
diff --git a/arch/arm/boot/dts/meson6.dtsi b/arch/arm/boot/dts/meson6.dtsi
index 4ba4912..8b33be1 100644
--- a/arch/arm/boot/dts/meson6.dtsi
+++ b/arch/arm/boot/dts/meson6.dtsi
@@ -60,12 +60,14 @@
 		cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
+			next-level-cache = <&L2>;
 			reg = <0x200>;
 		};
 
 		cpu@201 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
+			next-level-cache = <&L2>;
 			reg = <0x201>;
 		};
 	};
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 42e4026..1f442a7 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -58,24 +58,28 @@
 		cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
+			next-level-cache = <&L2>;
 			reg = <0x200>;
 		};
 
 		cpu@201 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
+			next-level-cache = <&L2>;
 			reg = <0x201>;
 		};
 
 		cpu@202 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
+			next-level-cache = <&L2>;
 			reg = <0x202>;
 		};
 
 		cpu@203 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
+			next-level-cache = <&L2>;
 			reg = <0x203>;
 		};
 	};
diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index b289e8e..18301dc 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -2,6 +2,7 @@ menuconfig ARCH_MESON
 	bool "Amlogic Meson SoCs" if ARCH_MULTI_V7
 	select GENERIC_IRQ_CHIP
 	select ARM_GIC
+	select CACHE_L2X0
 
 if ARCH_MESON
 
diff --git a/arch/arm/mach-meson/meson.c b/arch/arm/mach-meson/meson.c
index 8f42d8f..5d6affe 100644
--- a/arch/arm/mach-meson/meson.c
+++ b/arch/arm/mach-meson/meson.c
@@ -24,4 +24,6 @@ static const char * const meson_common_board_compat[] = {
 
 DT_MACHINE_START(MESON, "Amlogic Meson platform")
 	.dt_compat	= meson_common_board_compat,
+	.l2c_aux_val	= 0,
+	.l2c_aux_mask	= ~0,
 MACHINE_END
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
