From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 01/17] iio: accel: kxsd9: Add device tree bindings
Date: Tue, 16 Aug 2016 15:33:27 +0200
Message-ID: <1471354423-19186-2-git-send-email-linus.walleij@linaro.org>
References: <1471354423-19186-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471354423-19186-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This accelerometer can be probed from the device tree, so it needs
to have proper documentation of it's device tree bindings.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/iio/accel/kionix,kxsd9.txt | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.txt

diff --git a/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.txt b/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.txt
new file mode 100644
index 000000000000..b25bf3a77e0f
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.txt
@@ -0,0 +1,22 @@
+Kionix KXSD9 Accelerometer device tree bindings
+
+Required properties:
+ - compatible: 		should be set to "kionix,kxsd9"
+ - reg:			i2c slave address
+
+Optional properties:
+ - vdd-supply:		The input supply for VDD
+ - iovdd-supply:	The input supply for IOVDD
+ - interrupts:		The movement detection interrupt
+ - mount-matrix:	See mount-matrix.txt
+
+Example:
+
+kxsd9@18 {
+	compatible = "kionix,kxsd9";
+	reg = <0x18>;
+	interrupt-parent = <&foo>;
+	interrupts = <57 IRQ_TYPE_EDGE_FALLING>;
+	iovdd-supply = <&bar>;
+	vdd-supply = <&baz>;
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
