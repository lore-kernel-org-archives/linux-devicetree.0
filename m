From: Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH 1/2] dt-bindings: display: panel: Add support for Raydium RM67191 panel
Date: Fri, 14 Jun 2019 14:51:02 +0300
Message-ID: <1560513063-24995-2-git-send-email-robert.chiras@nxp.com>
References: <1560513063-24995-1-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560513063-24995-1-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com, Robert Chiras <robert.chiras@nxp.com>
List-Id: devicetree@vger.kernel.org

Add dt-bindings documentation for Raydium RM67191 DSI panel.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
---
 .../bindings/display/panel/raydium,rm67191.txt     | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
new file mode 100644
index 0000000..5a6268d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
@@ -0,0 +1,42 @@
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
+- reset-gpio:		a GPIO spec for the RST_B GPIO pin
+- pinctrl-0		phandle to the pin settings for the reset pin
+- width-mm:		physical panel width [mm]
+- height-mm:		physical panel height [mm]
+- display-timings:	timings for the connected panel according to [1]
+- video-mode:		0 - burst-mode
+			1 - non-burst with sync event
+			2 - non-burst with sync pulse
+
+[1]: Documentation/devicetree/bindings/display/display-timing.txt
+
+Example:
+
+	panel@0 {
+		compatible = "raydium,rm67191";
+		reg = <0>;
+		pinctrl-0 = <&pinctrl_mipi_dsi_0_1_en>;
+		reset-gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
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
