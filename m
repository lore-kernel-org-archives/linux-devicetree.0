From: Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Add support for Raydium RM67191 panel
Date: Thu, 20 Jun 2019 16:30:27 +0300
Message-ID: <1561037428-13855-2-git-send-email-robert.chiras@nxp.com>
References: <1561037428-13855-1-git-send-email-robert.chiras@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561037428-13855-1-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com, Robert Chiras <robert.chiras@nxp.com>
List-Id: devicetree@vger.kernel.org

Add dt-bindings documentation for Raydium RM67191 DSI panel.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/panel/raydium,rm67191.txt     | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
new file mode 100644
index 0000000..52af272
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
@@ -0,0 +1,39 @@
+Raydium RM67171 OLED LCD panel with MIPI-DSI protocol
+
+Required properties:
+- compatible: 		"raydium,rm67191"
+- reg:			virtual channel for MIPI-DSI protocol
+			must be <0>
+- dsi-lanes:		number of DSI lanes to be used
+			must be <3> or <4>
+- port: 		input port node with endpoint definition as
+			defined in Documentation/devicetree/bindings/graph.txt;
+			the input port should be connected to a MIPI-DSI device
+			driver
+
+Optional properties:
+- reset-gpios:		a GPIO spec for the RST_B GPIO pin
+- width-mm:		see panel-common.txt
+- height-mm:		see panel-common.txt
+- video-mode:		0 - burst-mode
+			1 - non-burst with sync event
+			2 - non-burst with sync pulse
+
+Example:
+
+	panel@0 {
+		compatible = "raydium,rm67191";
+		reg = <0>;
+		pinctrl-0 = <&pinctrl_mipi_dsi_0_1_en>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+		dsi-lanes = <4>;
+		width-mm = <68>;
+		height-mm = <121>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mipi_out>;
+			};
+		};
+	};
-- 
2.7.4
