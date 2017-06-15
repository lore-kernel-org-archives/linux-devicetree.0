From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 5/7] dt-bindings: Document the Raspberry Pi Touchscreen nodes.
Date: Thu, 15 Jun 2017 13:41:28 -0700
Message-ID: <20170615204130.19255-6-eric@anholt.net>
References: <20170615204130.19255-1-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170615204130.19255-1-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

This doesn't yet cover input, but the driver does get the display
working when the firmware is disabled from talking to our I2C lines.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 .../panel/raspberrypi,7inch-touchscreen.txt        | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.txt

diff --git a/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.txt b/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.txt
new file mode 100644
index 000000000000..e9e19c059260
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.txt
@@ -0,0 +1,49 @@
+This binding covers the official 7" (800x480) Raspberry Pi touchscreen
+panel.
+
+This DSI panel contains:
+
+- TC358762 DSI->DPI bridge
+- Atmel microcontroller on I2C for power sequencing the DSI bridge and
+  controlling backlight
+- Touchscreen controller on I2C for touch input
+
+and this binding covers the DSI display parts but not its touch input.
+
+Required properties:
+- compatible:	Must be "raspberrypi,7inch-touchscreen-panel"
+- reg:		Must be "45"
+- port:		See panel-common.txt
+
+Example:
+
+dsi1: dsi@7e700000 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	<...>
+
+	port {
+		dsi_out_port: endpoint {
+			remote-endpoint = <&panel_dsi_port>;
+		};
+	};
+};
+
+i2c_dsi: i2c {
+	compatible = "i2c-gpio";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	gpios = <&gpio 28 0
+		 &gpio 29 0>;
+
+	lcd@45 {
+		compatible = "raspberrypi,7inch-touchscreen-panel";
+		reg = <0x45>;
+
+		port {
+			panel_dsi_port: endpoint {
+				remote-endpoint = <&dsi_out_port>;
+			};
+		};
+	};
+};
-- 
2.11.0
