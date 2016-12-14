From: Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org>
Subject: [PATCH v2 1/2] iio: adc: hx711: Add DT binding for avia,hx711
Date: Wed, 14 Dec 2016 10:59:45 +0100
Message-ID: <20161214095945.GA26511@andreas>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, ak-n176/SwNRljddJNmlsFzeA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add DT bindings for avia,hx711
Add vendor avia to vendor list

Signed-off-by: Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org>
---
 .../devicetree/bindings/iio/adc/avia-hx711.txt      | 21 +++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt         |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/avia-hx711.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt b/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
new file mode 100644
index 000000000000..6a4659fc7a4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
@@ -0,0 +1,21 @@
+* AVIA HX711 ADC chip for weight cells
+  Bit-banging driver
+
+Required properties:
+ - compatible: Should be "avia,hx711"
+ - sck-gpios:	Definition of the GPIO for the clock
+ - dout-gpios:	Definition of the GPIO for data-out
+		See Documentation/devicetree/bindings/gpio/gpio.txt
+
+Recommended properties:
+ - gain:	Gain select, can be 32, 64 or 128
+		default is 128
+
+Example:
+weight@0 {
+	compatible = "avia,hx711";
+	sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
+	dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
+	gain = <32>
+};
+
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 44ddc980b085..4696bb5c2198 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -32,6 +32,7 @@ atlas	Atlas Scientific LLC
 atmel	Atmel Corporation
 auo	AU Optronics Corporation
 avago	Avago Technologies
+avia	avia semiconductor
 avic	Shanghai AVIC Optoelectronics Co., Ltd.
 axis	Axis Communications AB
 boe	BOE Technology Group Co., Ltd.
-- 
2.1.4
