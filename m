From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 1/2] dt-bindings: display: Add King Display KD035G6-54NT panel documentation
Date: Mon,  3 Jun 2019 17:25:54 +0200
Message-ID: <20190603152555.23527-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: od@zcrc.me, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The KD035G6-54NT is a 3.5" 320x240 24-bit TFT LCD panel.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: - Add an address to the panel node
    	- Add information about SPI properties
    	- Add information about the 'port' sub-node

 .../panel/kingdisplay,kd035g6-54nt.txt        | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt

diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt
new file mode 100644
index 000000000000..fa9596082e44
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt
@@ -0,0 +1,42 @@
+King Display KD035G6-54NT 3.5" (320x240 pixels) 24-bit TFT LCD panel
+
+Required properties:
+- compatible: should be "kingdisplay,kd035g6-54nt"
+- power-supply: See panel-common.txt
+- reset-gpios: See panel-common.txt
+
+Optional properties:
+- backlight: see panel-common.txt
+
+The generic bindings for the SPI slaves documented in [1] also apply.
+
+The device node can contain one 'port' child node with one child
+'endpoint' node, according to the bindings defined in [2]. This
+node should describe panel's video bus.
+
+[1]: Documentation/devicetree/bindings/spi/spi-bus.txt
+[2]: Documentation/devicetree/bindings/graph.txt
+
+Example:
+
+&spi {
+	panel@0 {
+		compatible = "kingdisplay,kd035g6-54nt";
+		reg = <0>;
+
+		spi-max-frequency = <3125000>;
+		spi-3wire;
+		spi-cs-high;
+
+		reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
+
+		backlight = <&backlight>;
+		power-supply = <&ldo6>;
+
+		port {
+			panel_input: endpoint {
+				remote-endpoint = <&panel_output>;
+			};
+		};
+	};
+};
-- 
2.21.0.593.g511ec345e18
