From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 5/5] ARM: dts: at91: nattis: describe the lvds panel
Date: Tue, 28 Aug 2018 11:48:44 +0200
Message-ID: <20180828094844.10018-6-peda@axentia.se>
References: <20180828094844.10018-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828094844.10018-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Make the DT usable with the panel-lvds driver.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
index 2eb0f947ab86..97e972aefac2 100644
--- a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
+++ b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
@@ -105,10 +105,29 @@
 	};
 
 	panel: panel {
-		compatible = "sharp,lq150x1lg11";
+		compatible = "sharp,lq150x1lg11", "panel-lvds";
+
 		backlight = <&panel_bl>;
 		power-supply = <&panel_reg>;
 
+		width-mm = <304>;
+		height-mm = <228>;
+
+		data-mapping = "jeida-18";
+
+		panel-timing {
+			// 1024x768 @ 60Hz (typical)
+			clock-frequency = <50000000 65000000 80000000>;
+			hactive = <1024>;
+			vactive = <768>;
+			hfront-porch = <48 88 88>;
+			hback-porch = <96 168 168>;
+			hsync-len = <32 64 64>;
+			vsync-len = <3 13 74>;
+			vfront-porch = <3 13 74>;
+			vback-porch = <3 12 74>;
+		};
+
 		port {
 			panel_input: endpoint {
 				remote-endpoint = <&lvds_encoder_output>;
@@ -205,6 +224,7 @@
 		port@0 {
 			hlcdc_output: endpoint {
 				remote-endpoint = <&lvds_encoder_input>;
+				bus-width = <16>;
 			};
 		};
 	};
-- 
2.11.0
