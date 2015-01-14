From: Karol Wrona <k.wrona-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 2/5] iio: sensorhub: Add sensorhub bindings
Date: Wed, 14 Jan 2015 17:16:12 +0100
Message-ID: <1421252172-26797-1-git-send-email-k.wrona@samsung.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Karol Wrona <wrona.vy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Karol Wrona <k.wrona-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add sensorhub bindings for sensorhub on Galaxy Gear 2.

Signed-off-by: Karol Wrona <k.wrona-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/iio/sensorhub.txt          |   25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/sensorhub.txt

diff --git a/Documentation/devicetree/bindings/iio/sensorhub.txt b/Documentation/devicetree/bindings/iio/sensorhub.txt
new file mode 100644
index 0000000..8d57571
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/sensorhub.txt
@@ -0,0 +1,25 @@
+Samsung Sensorhub driver
+
+Sensorhub is a MCU which manages several sensors and also plays the role
+of a virtual sensor device.
+
+Required properties:
+- compatible: "samsung,sensorhub-rinato" or "samsung,sensorhub-thermostat"
+- spi-max-frequency: max SPI clock frequency
+- interrupt-parent: interrupt parent
+- interrupts: communication interrupt
+- ap-mcu-gpios: [out] ap to sensorhub line - used during communication
+- mcu-ap-gpios: [in] sensorhub to ap - used during communication
+- mcu-reset-gpios: [out] sensorhub reset
+
+Example:
+
+	shub_spi: shub {
+		compatible = "samsung,sensorhub-rinato";
+		spi-max-frequency = <5000000>;
+		interrupt-parent = <&gpx0>;
+		interrupts = <2 0>;
+		ap-mcu-gpios = <&gpx0 0 0>;
+		mcu-ap-gpios = <&gpx0 4 0>;
+		mcu-reset-gpios = <&gpx0 5 0>;
+	};
-- 
1.7.9.5
