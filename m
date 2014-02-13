From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 3/9] Doc/DT: Add DT binding documentation for DVI Connector
Date: Thu, 13 Feb 2014 14:32:26 +0200
Message-ID: <1392294752-18762-4-git-send-email-tomi.valkeinen@ti.com>
References: <1392294752-18762-1-git-send-email-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392294752-18762-1-git-send-email-tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT binding documentation for DVI Connector.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/video/dvi-connector.txt    | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/dvi-connector.txt

diff --git a/Documentation/devicetree/bindings/video/dvi-connector.txt b/Documentation/devicetree/bindings/video/dvi-connector.txt
new file mode 100644
index 000000000000..6a0aff866c78
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/dvi-connector.txt
@@ -0,0 +1,26 @@
+DVI Connector
+==============
+
+Required properties:
+- compatible: "dvi-connector"
+
+Optional properties:
+- label: a symbolic name for the connector
+- i2c-bus: phandle to the i2c bus that is connected to DVI DDC
+
+Required nodes:
+- Video port for DVI input
+
+Example
+-------
+
+dvi0: connector@0 {
+	compatible = "dvi-connector";
+	label = "dvi";
+
+	i2c-bus = <&i2c3>;
+
+	dvi_connector_in: endpoint {
+		remote-endpoint = <&tfp410_out>;
+	};
+};
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
