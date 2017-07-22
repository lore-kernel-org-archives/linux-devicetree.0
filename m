From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: meson8b: describe the embedded reset controller
Date: Sat, 22 Jul 2017 20:58:05 +0200
Message-ID: <20170722185807.10504-2-martin.blumenstingl@googlemail.com>
References: <20170722185807.10504-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170722185807.10504-1-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org, narmstrong@baylibre.com, jbrunet@baylibre.com, linux-clk@vger.kernel.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The Amlogic Meson8/Meson8b/Meson8m2 clock controller provides some reset
lines. These are used for example to boot the secondary CPU cores.

This patch describes the reset controller which is embedded into the
clock controller on these SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
index 606da38c0959..e1af4764114d 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
@@ -16,18 +16,24 @@ Required Properties:
 	   mapped region.
 
 - #clock-cells: should be 1.
+- #reset-cells: should be 1.
 
 Each clock is assigned an identifier and client nodes can use this identifier
 to specify the clock which they consume. All available clocks are defined as
 preprocessor macros in the dt-bindings/clock/meson8b-clkc.h header and can be
 used in device tree sources.
+This is also valid for the reset lines provided by the clock controller: a
+preprocessor macro for each reset line is defined (in the same header file as
+the clock identifiers).
+
 
 Example: Clock controller node:
 
 	clkc: clock-controller@c1104000 {
-		#clock-cells = <1>;
 		compatible = "amlogic,meson8b-clkc";
 		reg = <0xc1108000 0x4>, <0xc1104000 0x460>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 
-- 
2.13.3

