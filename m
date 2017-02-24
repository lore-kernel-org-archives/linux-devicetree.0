From: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/4] Documentation: dt-bindings: iio: Add max961x
Date: Fri, 24 Feb 2017 16:05:53 +0100
Message-ID: <1487948756-25172-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1487948756-25172-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487948756-25172-1-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, meerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add device tree bindings documentation for Maxim max961x current sense
amplifier.

Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/iio/adc/max961x.txt        | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/max961x.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/max961x.txt b/Documentation/devicetree/bindings/iio/adc/max961x.txt
new file mode 100644
index 0000000..abbc6c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/max961x.txt
@@ -0,0 +1,27 @@
+* Maxim max9611/max9612 current sense amplifier with 12-bits ADC interface
+
+Maxim max9611/max9612 is an high-side current sense amplifier with integrated
+12-bits ADC communicating over I2c bus.
+The device node for this driver shall be a child of a I2c controller.
+
+Required properties
+  - compatible: Should be "maxim,max961x"
+  - reg: The 7-bits long I2c address of the device
+  - shunt-resistor: Resistor value, in uOhm, of the current sense shunt
+		    resistor.
+
+Example:
+
+&i2c4 {
+	csa: max9611@7c {
+		compatible = "maxim,max961x";
+		reg = <0x7c>;
+
+		shunt-resistor = <5000>;
+	};
+};
+
+This device node describes a current sense amplifier sitting on I2c4 bus
+with address 0x7c (read address is 0xf9, write address is 0xf8).
+A sense resistor with 0,005 Ohm is installed between RS+ and RS-
+current-sensing inputs.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
