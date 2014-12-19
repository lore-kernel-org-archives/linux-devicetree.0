From: Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] iio: ti-adc128s052: Add DT binding documentation
Date: Fri, 19 Dec 2014 18:10:39 +0100
Message-ID: <1419009039-1057-1-git-send-email-angelo.compagnucci@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding binding documentation for Texas Instruments' ADC128S052 ADC chip.
---
 .../devicetree/bindings/iio/adc/ti-adc128s052.txt      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt b/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt
new file mode 100644
index 0000000..12132ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt
@@ -0,0 +1,18 @@
+* Texas Instruments' ADC128S052 ADC chip
+
+Required properties:
+  - compatible: Should be "ti,adc128s052" 
+  - reg: spi chip select number for the device
+  - vref-supply: The regulator supply ADC reference voltage.
+
+Recommended properties:
+- spi-max-frequency: Definition as per
+                     Documentation/devicetree/bindings/spi/spi-bus.txt
+
+Example:
+adc@0 {
+	compatible = "ti,adc128s052";
+	reg = <0>;
+	vref-supply = <&vdd_supply>;
+	spi-max-frequency = <1000000>;
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
