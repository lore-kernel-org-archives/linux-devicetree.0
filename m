From: Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org>
Subject: [PATCH 1/2] iio: distance: add dt binding for devantech-srf04
Date: Sun, 29 Jan 2017 00:58:14 +0100
Message-ID: <20170128235814.GA4786@andreas>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, shraddha.6596-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, w@1wt.eu, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sjenning-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, ksenija.stanojevic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ak-n176/SwNRljddJNmlsFzeA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds dt binding for devantech ultrasonic ranger srf04.

The vendor "devantech" was already added to the vendor list with 
	"[PATCH v4 1/3] iio: distance: srf08: add trivial DT binding"

Signed-off-by: Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org>
---
 .../bindings/iio/proximity/devantech-srf04.txt          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt

diff --git a/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt b/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt
new file mode 100644
index 000000000000..4ea29ef3ff89
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt
@@ -0,0 +1,17 @@
+* Devantech SRF04 ultrasonic range finder
+  Bit-banging driver
+
+Required properties:
+ - compatible:	Should be "devantech,srf04"
+ - trig-gpios:	Definition of the GPIO for the triggering input
+ - echo-gpios:	Definition of the GPIO for the echo
+		needs to be an interrupt input
+		See Documentation/devicetree/bindings/gpio/gpio.txt
+
+Example:
+srf04@0 {
+	compatible = "devantech,srf04";
+	trig-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+	echo-gpios = <&gpio2  6 GPIO_ACTIVE_HIGH>;
+};
+
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
