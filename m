From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] drm/panel: Add DT bindings for Ilitek ILI9322
Date: Fri,  1 Dec 2017 17:16:57 +0100
Message-ID: <20171201161659.9588-1-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Stefano Babic <sbabic-ynQEQJNshbs@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the Ilitek ILI9322
320x240 TFT panel driver.

Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: Stefano Babic <sbabic-ynQEQJNshbs@public.gmane.org>
Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
ChangeLog v1->v2:
- Add explicit requirement to specify the system type so the
  driver can look up the display configuration from the
  compatible string.
- Dropped all display-specific configuration data I could
  in favor of open coding it all in a per-system config struct
  in the driver.
- Now only regulators and GPIO lines remain as DT resources.
---
 .../bindings/display/panel/ilitek,ili9322.txt      | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
new file mode 100644
index 000000000000..3d5ce6ad6ec7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
@@ -0,0 +1,49 @@
+Ilitek ILI9322 TFT panel driver with SPI control bus
+
+This is a driver for 320x240 TFT panels, accepting a variety of input
+streams that get adapted and scaled to the panel. The panel output has
+960 TFT source driver pins and 240 TFT gate driver pins, VCOM, VCOML and
+VCOMH outputs.
+
+Required properties:
+  - compatible: "dlink,dir-685-panel", "ilitek,ili9322"
+    (full system-specific compatible is always required to look up configuration)
+  - reg: address of the panel on the SPI bus
+
+Optional properties:
+  - vcc-supply: core voltage supply, see regulator/regulator.txt
+  - iovcc-supply: voltage supply for the interface input/output signals,
+    see regulator/regulator.txt
+  - vci-supply: voltage supply for analog parts, see regulator/regulator.txt
+  - reset-gpios: a GPIO spec for the reset pin, see gpio/gpio.txt
+
+  The following optional properties only apply to RGB and YUV input modes and
+  can be omitted for BT.656 input modes:
+
+  - pixelclk-active: see display/panel/display-timing.txt
+  - de-active: see display/panel/display-timing.txt
+  - hsync-active: see display/panel/display-timing.txt
+  - vsync-active: see display/panel/display-timing.txt
+
+The panel must obey the rules for a SPI slave device as specified in
+spi/spi-bus.txt
+
+The device node can contain one 'port' child node with one child
+'endpoint' node, according to the bindings defined in
+media/video-interfaces.txt. This node should describe panel's video bus.
+
+Example:
+
+panel: display@0 {
+	compatible = "dlink,dir-685-panel", "ilitek,ili9322";
+	reg = <0>;
+	vcc-supply = <&vdisp>;
+	iovcc-supply = <&vdisp>;
+	vci-supply = <&vdisp>;
+
+	port {
+		panel_in: endpoint {
+			remote-endpoint = <&display_out>;
+		};
+	};
+};
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
