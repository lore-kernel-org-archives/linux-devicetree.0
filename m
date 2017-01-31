From: Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org>
Subject: [PATCH v3 1/2] iio: distance: add dt binding for devantech-srf04
Date: Tue, 31 Jan 2017 19:03:06 +0100
Message-ID: <20170131180306.GA12880@andreas>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, shraddha.6596-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, w@1wt.eu, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sjenning-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, ksenija.stanojevic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ak-n176/SwNRljddJNmlsFzeA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds dt binding for devantech ultrasonic ranger srf04.

The vendor "devantech" was already added to the vendor list with
        "[PATCH v4 1/3] iio: distance: srf08: add trivial DT binding"

Signed-off-by: Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org>
---
 .../bindings/iio/proximity/devantech-srf04.txt     | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt

diff --git a/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt b/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt
new file mode 100644
index 000000000000..d4dc7a227e2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt
@@ -0,0 +1,28 @@
+* Devantech SRF04 ultrasonic range finder
+  Bit-banging driver using two GPIOs
+
+Required properties:
+ - compatible:	Should be "devantech,srf04"
+
+ - trig-gpios:	Definition of the GPIO for the triggering (output)
+		This GPIO is set for about 10 us by the driver to tell the
+		device it should initiate the measurement cycle.
+
+ - echo-gpios:	Definition of the GPIO for the echo (input)
+		This GPIO is set by the device as soon as an ultrasonic
+		burst is sent out and reset when the first echo is
+		received.
+		Thus this GPIO is set while the ultrasonic waves are doing
+		one round trip.
+		It needs to be an GPIO which is able to deliver an
+		interrupt because the time between two interrupts is
+		measured in the driver.
+		See Documentation/devicetree/bindings/gpio/gpio.txt for
+		information on how to specify a consumer gpio.
+
+Example:
+srf04@0 {
+	compatible = "devantech,srf04";
+	trig-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+	echo-gpios = <&gpio2  6 GPIO_ACTIVE_HIGH>;
+};
-- 
2.1.4
