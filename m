From: Michael Stecklein <m-stecklein-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 1/3] dt-bindings: iio: humidity: add bindings for HDC100x sensors
Date: Mon, 12 Jun 2017 09:49:08 -0500
Message-ID: <1497278950-12973-1-git-send-email-m-stecklein@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Davis <afd-l0cyMroinI0@public.gmane.org>, Michael Stecklein <m-stecklein-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the bindings for the family of HDC100x sensors.

Signed-off-by: Michael Stecklein <m-stecklein-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/iio/humidity/hdc100x.txt         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/humidity/hdc100x.txt

diff --git a/Documentation/devicetree/bindings/iio/humidity/hdc100x.txt b/Documentation/devicetree/bindings/iio/humidity/hdc100x.txt
new file mode 100644
index 0000000..6f272fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/humidity/hdc100x.txt
@@ -0,0 +1,16 @@
+* HDC100x temperature + humidity sensors
+
+Required properties:
+  - compatible: Should contain one of the following:
+	ti,hdc100x
+	ti,hdc1010
+	ti,hdc1050
+	ti,hdc1080
+  - reg: i2c address of the sensor
+
+Example:
+
+hdc100x@40 {
+	compatible = "ti,hdc100x";
+	reg = <0x40>;
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
