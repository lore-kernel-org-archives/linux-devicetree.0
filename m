From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 7/9] Doc/DT: Add DT binding documentation for Sony acx565akm panel
Date: Thu, 13 Feb 2014 14:32:30 +0200
Message-ID: <1392294752-18762-8-git-send-email-tomi.valkeinen@ti.com>
References: <1392294752-18762-1-git-send-email-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392294752-18762-1-git-send-email-tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT binding documentation for Sony acx565akm panel

Signed-off-by: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Reviewed-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/video/sony,acx565akm.txt   | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/sony,acx565akm.txt

diff --git a/Documentation/devicetree/bindings/video/sony,acx565akm.txt b/Documentation/devicetree/bindings/video/sony,acx565akm.txt
new file mode 100644
index 000000000000..cd9cfdf7e3fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/sony,acx565akm.txt
@@ -0,0 +1,28 @@
+Sony ACX565AKM SDI Panel
+========================
+
+Required properties:
+- compatible: "sony,acx565akm"
+
+Optional properties:
+- label: a symbolic name for the panel
+- gpios: panel reset gpio
+
+Required nodes:
+- Video port for SDI input
+
+Example
+-------
+
+acx565akm@2 {
+	compatible = "sony,acx565akm";
+	spi-max-frequency = <6000000>;
+	reg = <2>;
+
+	label = "lcd";
+	gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>; /* 90 */
+
+	lcd_in: endpoint {
+		remote-endpoint = <&sdi_out>;
+	};
+};
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
