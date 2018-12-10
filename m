From: Maxime Jourdan <mjourdan@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: meson: add specific simplefb bindings
Date: Mon, 10 Dec 2018 10:06:39 +0100
Message-ID: <20181210090640.4495-1-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Similar to simple-framebuffer-sunxi, we support different display pipelines
that the firmware is free to choose from.

This documents the "amlogic,simple-framebuffer" compatible and the
"amlogic,pipeline" extension.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 .../display/simple-framebuffer-meson.txt      | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/simple-framebuffer-meson.txt

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer-meson.txt b/Documentation/devicetree/bindings/display/simple-framebuffer-meson.txt
new file mode 100644
index 000000000000..122a5c005cd9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer-meson.txt
@@ -0,0 +1,33 @@
+Meson specific Simple Framebuffer bindings
+
+This binding documents meson specific extensions to the simple-framebuffer
+bindings. The meson simplefb u-boot code relies on the devicetree containing
+pre-populated simplefb nodes.
+
+These extensions are intended so that u-boot can select the right node based
+on which pipeline is being used. As such they are solely intended for
+firmware / bootloader use, and the OS should ignore them.
+
+Required properties:
+- compatible: "amlogic,simple-framebuffer"
+- amlogic,pipeline, one of:
+  "vpu-cvbs"
+  "vpu-hdmi"
+
+Example:
+
+chosen {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	ranges;
+
+	framebuffer@0 {
+		compatible = "amlogic,simple-framebuffer",
+			     "simple-framebuffer";
+		amlogic,pipeline = "vpu-hdmi";
+		clocks = <&clkc CLKID_HDMI_PCLK>,
+			 <&clkc CLKID_CLK81>,
+			 <&clkc CLKID_GCLK_VENCI_INT0>;
+		power-domains = <&pwrc_vpu>;
+	};
+};
-- 
2.19.2
