From: Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] iio: mcp3422: Add DT binding documentation
Date: Sun,  8 Mar 2015 15:31:44 +0100
Message-ID: <1425825104-4817-1-git-send-email-angelo.compagnucci@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding binding documentation for ADC MCP3422.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Changelog:

* Added signed-off

 Documentation/devicetree/bindings/iio/adc/mcp3422.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/mcp3422.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/mcp3422.txt b/Documentation/devicetree/bindings/iio/adc/mcp3422.txt
new file mode 100644
index 0000000..333139c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/mcp3422.txt
@@ -0,0 +1,17 @@
+* Microchip mcp3422/3/4/6/7/8 chip family (ADC)
+
+Required properties:
+ - compatible: Should be
+	"microchip,mcp3422" or
+	"microchip,mcp3423" or
+	"microchip,mcp3424" or
+	"microchip,mcp3426" or
+	"microchip,mcp3427" or
+	"microchip,mcp3428"
+ - reg: I2C address for the device
+
+Example:
+adc@0 {
+	compatible = "microchip,mcp3424";
+	reg = <0x68>;
+};
-- 
1.9.1
