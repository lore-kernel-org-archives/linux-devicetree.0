From: Tomasz Duszynski <tduszyns-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 4/4] iio: chemical: add dsm501 particle sensor driver bindings
Date: Thu,  9 Feb 2017 18:12:52 +0100
Message-ID: <20170209171252.4802-1-tduszyns@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds bindings for dsm501 particle sensor driver.

Signed-off-by: Tomasz Duszynski <tduszyns-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Changes in v2:
  o add 'data' prefix to gpios property

 .../devicetree/bindings/iio/chemical/dsm501.txt          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/dsm501.txt

diff --git a/Documentation/devicetree/bindings/iio/chemical/dsm501.txt b/Documentation/devicetree/bindings/iio/chemical/dsm501.txt
new file mode 100644
index 000000000000..126ce528f5eb
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
+- data-gpios: should specify the GPIO connected to the sensor's data line, see
+	      "gpios property" in Documentation/devicetree/bindings/gpio/gpio.txt
+
+Example:
+
+dsm501 {
+	compatible = "samyoung,dsm501";
+	data-gpios = <&gpio1 28 0>;
+};
--
2.11.1
