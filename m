From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 1/5] ARM: dts: imx7-colibri: use OF graph to describe the display
Date: Wed, 29 Mar 2017 16:21:09 -0700
Message-ID: <20170329232113.19078-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

To make use of the new eLCDIF DRM driver OF graph description is
required. Describe the display using OF graph nodes.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi | 38 +++++++++++------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
index 373ee19196a6..7a98a45a0d95 100644
--- a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
@@ -44,6 +44,17 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	panel: panel {
+		compatible = "edt,et057090dhu";
+		backlight = <&bl>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lcdif_out>;
+			};
+		};
+	};
 };
 
 &bl {
@@ -75,32 +86,11 @@
 };
 
 &lcdif {
-	display = <&display0>;
 	status = "okay";
 
-	display0: lcd-display {
-		bits-per-pixel = <16>;
-		bus-width = <18>;
-
-		display-timings {
-			native-mode = <&timing_vga>;
-
-			/* Standard VGA timing */
-			timing_vga: 640x480 {
-				clock-frequency = <25175000>;
-				hactive = <640>;
-				vactive = <480>;
-				hback-porch = <40>;
-				hfront-porch = <24>;
-				vback-porch = <32>;
-				vfront-porch = <11>;
-				hsync-len = <96>;
-				vsync-len = <2>;
-				de-active = <1>;
-				hsync-active = <0>;
-				vsync-active = <0>;
-				pixelclk-active = <0>;
-			};
+	port {
+		lcdif_out: endpoint {
+			remote-endpoint = <&panel_in>;
 		};
 	};
 };
-- 
2.12.1
