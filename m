From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v6 5/6] ARM: dts: meson8: add support for booting the secondary CPU cores
Date: Mon, 14 Aug 2017 23:58:59 +0200
Message-ID: <20170814215900.1032-6-martin.blumenstingl@googlemail.com>
References: <20170814215900.1032-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170814215900.1032-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Booting the secondary CPU cores involves the following nodes/devices:
- SCU (Snoop-Control-Unit, for which we already have a DT node)
- a reset line for each CPU core, provided by the reset-controller
  which is built into the clock-controller
- the PMU (power management unit) which controls the power of the CPU
  cores
- a range in the SRAM specifically reserved for booting secondary CPU
  cores
- the "enable-method" which activates booting the secondary CPU cores

This adds all required nodes and properties to boot the secondary CPU
cores.

Suggested-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm/boot/dts/meson8.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index b98d44fde6b6..bf572fb45fe0 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -45,6 +45,7 @@
 
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/gpio/meson8-gpio.h>
+#include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
 #include "meson.dtsi"
 
 / {
@@ -60,6 +61,8 @@
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
 			reg = <0x200>;
+			enable-method = "amlogic,meson8-smp";
+			resets = <&clkc CLKC_RESET_CPU0_SOFT_RESET>;
 		};
 
 		cpu@201 {
@@ -67,6 +70,8 @@
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
 			reg = <0x201>;
+			enable-method = "amlogic,meson8-smp";
+			resets = <&clkc CLKC_RESET_CPU1_SOFT_RESET>;
 		};
 
 		cpu@202 {
@@ -74,6 +79,8 @@
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
 			reg = <0x202>;
+			enable-method = "amlogic,meson8-smp";
+			resets = <&clkc CLKC_RESET_CPU2_SOFT_RESET>;
 		};
 
 		cpu@203 {
@@ -81,6 +88,8 @@
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
 			reg = <0x203>;
+			enable-method = "amlogic,meson8-smp";
+			resets = <&clkc CLKC_RESET_CPU3_SOFT_RESET>;
 		};
 	};
 
@@ -118,6 +127,11 @@
 }; /* end of / */
 
 &aobus {
+	pmu: pmu@e0 {
+		compatible = "amlogic,meson8-pmu", "syscon";
+		reg = <0xe0 0x8>;
+	};
+
 	pinctrl_aobus: pinctrl@84 {
 		compatible = "amlogic,meson8-aobus-pinctrl";
 		reg = <0x84 0xc>;
@@ -249,6 +263,13 @@
 	};
 };
 
+&ahb_sram {
+	smp-sram@1ff80 {
+		compatible = "amlogic,meson8-smp-sram";
+		reg = <0x1ff80 0x8>;
+	};
+};
+
 &ethmac {
 	clocks = <&clkc CLKID_ETH>;
 	clock-names = "stmmaceth";
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
