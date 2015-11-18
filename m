From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v7 1/5] Documentation: tps65912: Add DT bindings for the TPS65912 PMIC
Date: Wed, 18 Nov 2015 11:59:36 -0600
Message-ID: <1447869580-10416-2-git-send-email-afd@ti.com>
References: <1447869580-10416-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447869580-10416-1-git-send-email-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The TPS65912 PMIC contains several regulators and a GPIO controller.
Add bindings for the TPS65912 PMIC.

Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/tps65912.txt | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.txt

diff --git a/Documentation/devicetree/bindings/mfd/tps65912.txt b/Documentation/devicetree/bindings/mfd/tps65912.txt
new file mode 100644
index 0000000..717e66d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/tps65912.txt
@@ -0,0 +1,50 @@
+* TPS65912 Power Management Integrated Circuit bindings
+
+Required properties:
+ - compatible		: Should be "ti,tps65912".
+ - reg			: Slave address or chip select number (I2C / SPI).
+ - interrupt-parent	: The parent interrupt controller.
+ - interrupts		: The interrupt line the device is connected to.
+ - interrupt-controller	: Marks the device node as an interrupt controller.
+ - #interrupt-cells	: The number of cells to describe an IRQ, should be 2.
+			    The first cell is the IRQ number.
+			    The second cell is the flags, encoded as trigger
+			    masks from ../interrupt-controller/interrupts.txt.
+ - gpio-controller	: Marks the device node as a GPIO Controller.
+ - #gpio-cells		: Should be two.  The first cell is the pin number and
+			    the second cell is used to specify flags.
+			    See ../gpio/gpio.txt for more information.
+ - regulators:		: List of child nodes that specify the regulator
+			    initialization data. Child nodes must be named
+			    after their hardware counterparts: dcdc[1-4] and
+			    ldo[1-10]. Each child nodes is defined using the
+			    standard binding for regulators.
+
+Example:
+
+	pmic: tps65912@2d {
+		compatible = "ti,tps65912";
+		reg = <0x2d>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		regulators {
+			dcdc1 {
+				regulator-name = "vdd_core";
+				regulator-min-microvolt = <912000>;
+				regulator-max-microvolt = <1144000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1 {
+				regulator-name = "ldo1";
+				regulator-min-microvolt = <1900000>;
+				regulator-max-microvolt = <1900000>;
+			};
+		};
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
