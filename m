From: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
Subject: [PATCH 2/3] Documentation: dt: iio: add mcp4725/6 dac device binding
Date: Fri, 30 Sep 2016 15:19:47 +0200
Message-ID: <1475241588-18429-3-git-send-email-tomas@novotny.cz>
References: <1475241588-18429-1-git-send-email-tomas@novotny.cz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475241588-18429-1-git-send-email-tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yong Li <sdliyong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
---
 .../devicetree/bindings/iio/dac/mcp4725.txt        | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dac/mcp4725.txt

diff --git a/Documentation/devicetree/bindings/iio/dac/mcp4725.txt b/Documentation/devicetree/bindings/iio/dac/mcp4725.txt
new file mode 100644
index 0000000..69c9462
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/mcp4725.txt
@@ -0,0 +1,28 @@
+Microchpip mcp4725 and mcp4726 DAC device driver
+
+Required properties:
+	- compatible: Must be "microchip,mcp4725" or "microchip,mcp4726"
+	- reg: Should contain the DAC I2C address
+	- vref-millivolt: Value of the reference voltage
+
+Optional properties:
+	- vref-mode: Reference voltage selection. It is available only on
+	  mcp4726. Valid values are:
+		- 0, 1: Vdd pin voltage (unbuffered)
+		- 2: Vref pin voltage unbuffered
+		- 3: Vref pin voltage internally buffered
+
+Examples:
+
+        mcp4725@60 {
+                compatible = "microchip,mcp4725";
+                reg = <0x60>;
+                vref-millivolt = <3300>;
+        };
+
+        mcp4726@60 {
+                compatible = "microchip,mcp4726";
+                reg = <0x60>;
+                vref-mode = <2>;
+                vref-millivolt = <2500>;
+        };
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
