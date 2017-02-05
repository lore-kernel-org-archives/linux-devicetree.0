From: Tomasz Duszynski <tduszyns-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] iio: chemical: add dsm501 particle sensor driver bindings
Date: Sun,  5 Feb 2017 16:03:44 +0100
Message-ID: <20170205150344.11000-1-tduszyns@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds bindings for dsm501 particle sensor driver.

Signed-off-by: Tomasz Duszynski <tduszyns-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/iio/chemical/dsm501.txt          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/dsm501.txt

diff --git a/Documentation/devicetree/bindings/iio/chemical/dsm501.txt b/Documentation/devicetree/bindings/iio/chemical/dsm501.txt
new file mode 100644
index 000000000000..918c55c4c401
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/chemical/dsm501.txt
@@ -0,0 +1,16 @@
+* DSM501 particle sensor
+
+Required properties:
+
+- compatible: should be one of:
+	      "samyoung,dsm501"
+	      "shinyei,ppd42ns"
+- gpios: should specify the GPIO connected to the sensor's data line, see
+  	 "gpios property" in Documentation/devicetree/bindings/gpio/gpio.txt
+
+Example:
+
+dsm501 {
+	compatible = "samyoung,dsm501";
+	gpios = <&gpio1 28 0>;
+};
-- 
2.11.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
