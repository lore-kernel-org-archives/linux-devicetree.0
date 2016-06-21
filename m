From: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] iio: adc: max1363: Add device tree binding documentation
Date: Tue, 21 Jun 2016 09:09:28 +0200
Message-ID: <1466492969-2185-3-git-send-email-florian.vaussard@heig-vd.ch>
References: <1466492969-2185-1-git-send-email-florian.vaussard@heig-vd.ch>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466492969-2185-1-git-send-email-florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the device tree documentation for all the supported parts. Mandatory
binding is the compatible string and the slave I2C address.

Optional properties can be used to specify the Vcc / Vref regulators, as
well as the IRQ line if available.

Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
---
 .../devicetree/bindings/iio/adc/max1363.txt        | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/max1363.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/max1363.txt b/Documentation/devicetree/bindings/iio/adc/max1363.txt
new file mode 100644
index 0000000..94a9011
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/max1363.txt
@@ -0,0 +1,63 @@
+* Maxim 1x3x/136x/116xx Analog to Digital Converter (ADC)
+
+The node for this driver must be a child node of a I2C controller, hence
+all mandatory properties for your controller must be specified. See directory:
+
+        Documentation/devicetree/bindings/i2c
+
+for more details.
+
+Required properties:
+  - compatible: Should be one of
+		"maxim,max1361"
+		"maxim,max1362"
+		"maxim,max1363"
+		"maxim,max1364"
+		"maxim,max1036"
+		"maxim,max1037"
+		"maxim,max1038"
+		"maxim,max1039"
+		"maxim,max1136"
+		"maxim,max1137"
+		"maxim,max1138"
+		"maxim,max1139"
+		"maxim,max1236"
+		"maxim,max1237"
+		"maxim,max1238"
+		"maxim,max1239"
+		"maxim,max11600"
+		"maxim,max11601"
+		"maxim,max11602"
+		"maxim,max11603"
+		"maxim,max11604"
+		"maxim,max11605"
+		"maxim,max11606"
+		"maxim,max11607"
+		"maxim,max11608"
+		"maxim,max11609"
+		"maxim,max11610"
+		"maxim,max11611"
+		"maxim,max11612"
+		"maxim,max11613"
+		"maxim,max11614"
+		"maxim,max11615"
+		"maxim,max11616"
+		"maxim,max11617"
+		"maxim,max11644"
+		"maxim,max11645"
+		"maxim,max11646"
+		"maxim,max11647"
+  - reg: Should contain the ADC I2C address
+
+Optional properties:
+  - vcc-supply: phandle to the regulator that provides power to the ADC.
+  - vref-supply: phandle to the regulator for ADC reference voltage.
+  - interrupts: IRQ line for the ADC. If not used the driver will use
+    polling.
+
+Example:
+adc: max11644@36 {
+	compatible = "maxim,max11644";
+	reg = <0x36>;
+	vref-supply = <&adc_vref>;
+};
-- 
2.5.0
