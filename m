Return-Path: <SRS0=Ck17=NI=googlemail.com=martin.blumenstingl@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: meson8b: use the registers from the HHI syscon
Date: Sun, 28 Oct 2018 13:08:57 +0100
Message-Id: <20181028120859.5735-2-martin.blumenstingl@googlemail.com>
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
- temperature sensor calibration coefficient (only on Meson8b and
  Meson8m2 - one one out of five TSC bits is stored in the HHI
  registers)
- HDMI controller

The HHI register area may be accessed concurrently. Allow this by using
a "system controller" as parent node.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/clock/amlogic,meson8b-clkc.txt         | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
index b455c5aa9139..4d94091c1d2d 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
@@ -9,15 +9,13 @@ Required Properties:
 	- "amlogic,meson8-clkc" for Meson8 (S802) SoCs
 	- "amlogic,meson8b-clkc" for Meson8 (S805) SoCs
 	- "amlogic,meson8m2-clkc" for Meson8m2 (S812) SoCs
-- reg: it must be composed by two tuples:
-	0) physical base address of the xtal register and length of memory
-	   mapped region.
-	1) physical base address of the clock controller and length of memory
-	   mapped region.
-
 - #clock-cells: should be 1.
 - #reset-cells: should be 1.
 
+Parent node should have the following properties :
+- compatible: "amlogic,meson-hhi-sysctrl", "simple-mfd", "syscon"
+- reg: base address and size of the HHI system control register space.
+
 Each clock is assigned an identifier and client nodes can use this identifier
 to specify the clock which they consume. All available clocks are defined as
 preprocessor macros in the dt-bindings/clock/meson8b-clkc.h header and can be
@@ -30,9 +28,8 @@ device tree sources).
 
 Example: Clock controller node:
 
-	clkc: clock-controller@c1104000 {
+	clkc: clock-controller {
 		compatible = "amlogic,meson8b-clkc";
-		reg = <0xc1108000 0x4>, <0xc1104000 0x460>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 	};
-- 
2.19.1
