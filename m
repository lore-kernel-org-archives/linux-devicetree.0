From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 4/9] Doc/DT: Add DT binding documentation for HDMI Connector
Date: Thu, 13 Feb 2014 14:32:27 +0200
Message-ID: <1392294752-18762-5-git-send-email-tomi.valkeinen@ti.com>
References: <1392294752-18762-1-git-send-email-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392294752-18762-1-git-send-email-tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT binding documentation for HDMI Connector.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/video/hdmi-connector.txt   | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/hdmi-connector.txt

diff --git a/Documentation/devicetree/bindings/video/hdmi-connector.txt b/Documentation/devicetree/bindings/video/hdmi-connector.txt
new file mode 100644
index 000000000000..5d25f6a432bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/hdmi-connector.txt
@@ -0,0 +1,23 @@
+HDMI Connector
+==============
+
+Required properties:
+- compatible: "hdmi-connector"
+
+Optional properties:
+- label: a symbolic name for the connector
+
+Required nodes:
+- Video port for HDMI input
+
+Example
+-------
+
+hdmi0: connector@1 {
+	compatible = "hdmi-connector";
+	label = "hdmi";
+
+	hdmi_connector_in: endpoint {
+		remote-endpoint = <&tpd12s015_out>;
+	};
+};
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
