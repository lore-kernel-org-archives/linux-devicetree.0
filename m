From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 2/3] ARM: dts: at91: nattis: add lvds-encoder
Date: Tue, 16 Jan 2018 17:08:34 +0100
Message-ID: <20180116160835.27943-3-peda@axentia.se>
References: <20180116160835.27943-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180116160835.27943-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The lvds encoder chip was omitted by oversight. Add it.

Fixes: 0e4323899973 ("ARM: dts: at91: add devicetree for the Axentia Nattis with Natte power")
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 31 ++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
index 4882bd6d38c1..3f08cc2aeae8 100644
--- a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
+++ b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
@@ -109,7 +109,32 @@
 
 		port {
 			panel_input: endpoint {
-				remote-endpoint = <&hlcdc_panel_output>;
+				remote-endpoint = <&lvds_encoder_output>;
+			};
+		};
+	};
+
+	lvds-encoder {
+		compatible = "lvds-encoder";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lvds_encoder_input: endpoint {
+					remote-endpoint = <&hlcdc_output>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lvds_encoder_output: endpoint {
+					remote-endpoint = <&panel_input>;
+				};
 			};
 		};
 	};
@@ -176,8 +201,8 @@
 			     &pinctrl_lcd_hipow0>;
 
 		port@0 {
-			hlcdc_panel_output: endpoint {
-				remote-endpoint = <&panel_input>;
+			hlcdc_output: endpoint {
+				remote-endpoint = <&lvds_encoder_input>;
 			};
 		};
 	};
-- 
2.11.0
