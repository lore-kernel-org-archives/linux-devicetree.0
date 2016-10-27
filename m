From: Clemens Gruber <clemens.gruber-lZxf/j91sTNWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/3] hwmon: (mcp3021) add devicetree bindings documentation
Date: Fri, 28 Oct 2016 00:33:44 +0200
Message-ID: <20161027223345.16733-2-clemens.gruber@pqgruber.com>
References: <20161027223345.16733-1-clemens.gruber@pqgruber.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161027223345.16733-1-clemens.gruber-lZxf/j91sTNWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Clemens Gruber <clemens.gruber-lZxf/j91sTNWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document the devicetree bindings for the Microchip MCP3021/3221.

Signed-off-by: Clemens Gruber <clemens.gruber-lZxf/j91sTNWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/hwmon/mcp3021.txt | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/mcp3021.txt

diff --git a/Documentation/devicetree/bindings/hwmon/mcp3021.txt b/Documentation/devicetree/bindings/hwmon/mcp3021.txt
new file mode 100644
index 0000000..294318b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/mcp3021.txt
@@ -0,0 +1,21 @@
+mcp3021 properties
+
+Required properties:
+- compatible: Must be one of the following:
+	- "microchip,mcp3021" for mcp3021
+	- "microchip,mcp3221" for mcp3221
+- reg: I2C address
+
+Optional properties:
+
+- reference-voltage-microvolt
+	Reference voltage in microvolt (uV)
+
+Example:
+
+mcp3021@4d {
+	compatible = "microchip,mcp3021";
+	reg = <0x4d>;
+
+	reference-voltage-microvolt = <4500000>; /* 4.5 V */
+};
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
