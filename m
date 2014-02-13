From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 8/9] Doc/DT: Add DT binding documentation for TFP410 encoder
Date: Thu, 13 Feb 2014 14:32:31 +0200
Message-ID: <1392294752-18762-9-git-send-email-tomi.valkeinen@ti.com>
References: <1392294752-18762-1-git-send-email-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392294752-18762-1-git-send-email-tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT binding documentation for TFP410 encoder

Signed-off-by: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/video/ti,tfp410.txt        | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/ti,tfp410.txt

diff --git a/Documentation/devicetree/bindings/video/ti,tfp410.txt b/Documentation/devicetree/bindings/video/ti,tfp410.txt
new file mode 100644
index 000000000000..6a5a04627584
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/ti,tfp410.txt
@@ -0,0 +1,41 @@
+TFP410 DPI to DVI encoder
+=========================
+
+Required properties:
+- compatible: "ti,tfp410"
+
+Optional properties:
+- gpios: power-down gpio
+
+Required nodes:
+- Video port 0 for DPI input
+- Video port 1 for DVI output
+
+Example
+-------
+
+tfp410: encoder@0 {
+	compatible = "ti,tfp410";
+	gpios = <&twl_gpio 2 GPIO_ACTIVE_LOW>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			tfp410_in: endpoint@0 {
+				remote-endpoint = <&dpi_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			tfp410_out: endpoint@0 {
+				remote-endpoint = <&dvi_connector_in>;
+			};
+		};
+	};
+};
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
