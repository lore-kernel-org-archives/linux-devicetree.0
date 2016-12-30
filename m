From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2] ARM64: dts: meson-gx: Add reserved memory zone and usable memory range
Date: Fri, 30 Dec 2016 14:40:32 +0100
Message-ID: <1483105232-6242-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heinrich.schuchardt-Mmb7MZpHnFY@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Amlogic Meson GXBB/GXL/GXM secure monitor uses part of the memory space,
this patch adds this reserved zone and redefines the usable memory range.

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
Changes since v1 at [1] :
 - Renamed reg into linux,usable-memory to ovveride u-boot memory
 - only kept secmon memory zone

 [1] http://lkml.kernel.org/r/20161212101801.28491-1-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org

 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi       |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                 | 12 ++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts       |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi          |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts  |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-nexbox-a95x.dts     |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts      |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts       |  2 +-
 11 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index 7a078be..ca3c7fa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -56,7 +56,7 @@
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x80000000>;
+		linux,usable-memory = <0x0 0x1000000 0x0 0x7f000000>;
 	};
 
 	vddio_boot: regulator-vddio_boot {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index eada0b5..7f244b5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -55,6 +55,18 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* global autoconfigured region for contiguous allocations */
+		secmon: secmon {
+			reg = <0x0 0x10000000 0x0 0x200000>;
+			no-map;
+		};
+	};
+
 	cpus {
 		#address-cells = <0x2>;
 		#size-cells = <0x0>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index 4cbd626..c7f008a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -62,7 +62,7 @@
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x40000000>;
+		linux,usable-memory = <0x0 0x1000000 0x0 0x3f000000>;
 	};
 
 	leds {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 238fbea..546cbe4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -61,7 +61,7 @@
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x80000000>;
+		linux,usable-memory = <0x0 0x1000000 0x0 0x7f000000>;
 	};
 
 	usb_otg_pwr: regulator-usb-pwrs {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
index 4a96e0f..1fdf6da 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
@@ -55,7 +55,7 @@
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x40000000>;
+		linux,usable-memory = <0x0 0x1000000 0x0 0x3f000000>;
 	};
 
 	usb_pwr: regulator-usb-pwrs {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts
index 62fb496..6ac5c89 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts
@@ -50,6 +50,6 @@
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x80000000>;
+		linux,usable-memory = <0x0 0x1000000 0x0 0x7f000000>;
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts
index 9a9663a..58be8b4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts
@@ -50,6 +50,6 @@
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x40000000>;
+		linux,usable-memory = <0x0 0x1000000 0x0 0x3f000000>;
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts
index 2fe167b..010cb29 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts
@@ -50,6 +50,6 @@
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x80000000>;
+		linux,usable-memory = <0x0 0x1000000 0x0 0x7f000000>;
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-nexbox-a95x.dts
index cea4a3e..fb4a89b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-nexbox-a95x.dts
@@ -60,7 +60,7 @@
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x80000000>;
+		linux,usable-memory = <0x0 0x1000000 0x0 0x7f000000>;
 	};
 
 	vddio_card: gpio-regulator {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
index 9639f01..908894c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
@@ -59,7 +59,7 @@
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x80000000>;
+		linux,usable-memory = <0x0 0x1000000 0x0 0x7f000000>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index 5a337d3..2077385 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -62,7 +62,7 @@
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x80000000>;
+		linux,usable-memory = <0x0 0x1000000 0x0 0x7f000000>;
 	};
 
 	vddio_boot: regulator-vddio-boot {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
