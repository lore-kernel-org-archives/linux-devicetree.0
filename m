From: Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] iio: mcp3422: Add DT binding documentation
Date: Fri, 19 Dec 2014 18:09:40 +0100
Message-ID: <1419008980-436-1-git-send-email-angelo.compagnucci@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding binding documentation for ADC MCP3422.
---
 Documentation/devicetree/bindings/iio/adc/mcp3422.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/mcp3422.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/mcp3422.txt b/Documentation/devicetree/bindings/iio/adc/mcp3422.txt
new file mode 100644
index 0000000..d6d6eb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/mcp3422.txt
@@ -0,0 +1,12 @@
+* Microchip mcp3422/3/4/6/7/8 chip family (ADC)
+
+Required properties:
+  - compatible: Should be 
+               "microchip,mcp3422" or
+               "microchip,mcp3423" or
+               "microchip,mcp3424" or
+               "microchip,mcp3426" or
+               "microchip,mcp3427" or
+               "microchip,mcp3428"
+  - reg: I2C address for the device
+
+Example:
+adc@0 {
+	compatible = "microchip,mcp3424";
+	reg = <0x68>;
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
