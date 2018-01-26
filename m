From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] drm/panel: Device tree bindings for ARM Versatile panels
Date: Fri, 26 Jan 2018 14:33:35 +0100
Message-ID: <20180126133336.21343-1-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds a pretty simple set of device tree bindings for
ARM Versatile panels appearing as child nodes of a system
controller.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../display/panel/arm,versatile-tft-panel.txt      | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt

diff --git a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt
new file mode 100644
index 000000000000..248141c3c7e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.txt
@@ -0,0 +1,31 @@
+ARM Versatile TFT Panels
+
+These panels are connected to the daughterboards found on the
+ARM Versatile reference designs.
+
+This device node must appear as a child to a "syscon"-compatible
+node.
+
+Required properties:
+- compatible: should be "arm,versatile-tft-panel"
+
+Required subnodes:
+- port: see display/panel/panel-common.txt, graph.txt
+
+
+Example:
+
+sysreg@0 {
+	compatible = "arm,versatile-sysreg", "syscon", "simple-mfd";
+	reg = <0x00000 0x1000>;
+
+	panel: display@0 {
+		compatible = "arm,versatile-tft-panel";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&foo>;
+			};
+		};
+	};
+};
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
