Return-Path: <SRS0=Ck17=NI=googlemail.com=martin.blumenstingl@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 3/3] ARM: dts: meson: switch the clock controller to the HHI register area
Date: Sun, 28 Oct 2018 13:08:59 +0100
Message-Id: <20181028120859.5735-4-martin.blumenstingl@googlemail.com>
In-Reply-To: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org, khilman@baylibre.com, linux-clk@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

The clock controller on Meson8/Meson8m2 and Meson8b is part of a
register region called "HHI". This register area contains more
functionality than just a clock controller:
- the clock controller
- some reset controller bits
- temperature sensor calibration data (on Meson8b and Meson8m2 only)
- HDMI controller

Allow access to this HHI register area as "system controller". Also
migrate the Meson8 and Meson8b clock controllers to this new node.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/meson.dtsi   |  7 +++++++
 arch/arm/boot/dts/meson8.dtsi  | 15 ++++++++-------
 arch/arm/boot/dts/meson8b.dtsi | 15 ++++++++-------
 3 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 0d9faf1a51ea..ad903d1a2cb6 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -80,6 +80,13 @@
 			#size-cells = <1>;
 			ranges = <0x0 0xc1100000 0x200000>;
 
+			hhi: system-controller@4000 {
+				compatible = "amlogic,meson-hhi-sysctrl",
+					     "simple-mfd",
+					     "syscon";
+				reg = <0x4000 0x400>;
+			};
+
 			assist: assist@7c00 {
 				compatible = "amlogic,meson-mx-assist", "syscon";
 				reg = <0x7c00 0x200>;
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 7162e0ca05b0..3e3d9c54cddc 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -190,13 +190,6 @@
 };
 
 &cbus {
-	clkc: clock-controller@4000 {
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		compatible = "amlogic,meson8-clkc";
-		reg = <0x8000 0x4>, <0x4000 0x400>;
-	};
-
 	reset: reset-controller@4404 {
 		compatible = "amlogic,meson8b-reset";
 		reg = <0x4404 0x9c>;
@@ -323,6 +316,14 @@
 	status = "okay";
 };
 
+&hhi {
+	clkc: clock-controller {
+		compatible = "amlogic,meson8-clkc";
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+};
+
 &hwrng {
 	compatible = "amlogic,meson8-rng", "amlogic,meson-rng";
 	clocks = <&clkc CLKID_RNG0>;
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index cd1ca9dda126..f92aab0aa247 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -159,13 +159,6 @@
 };
 
 &cbus {
-	clkc: clock-controller@4000 {
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		compatible = "amlogic,meson8b-clkc";
-		reg = <0x8000 0x4>, <0x4000 0x400>;
-	};
-
 	reset: reset-controller@4404 {
 		compatible = "amlogic,meson8b-reset";
 		reg = <0x4404 0x9c>;
@@ -313,6 +306,14 @@
 	status = "okay";
 };
 
+&hhi {
+	clkc: clock-controller {
+		compatible = "amlogic,meson8-clkc";
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+};
+
 &hwrng {
 	compatible = "amlogic,meson8b-rng", "amlogic,meson-rng";
 	clocks = <&clkc CLKID_RNG0>;
-- 
2.19.1
