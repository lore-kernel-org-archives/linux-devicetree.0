From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 1/6] Documentation: tps65086: Add DT bindings for the TPS65086 PMIC
Date: Fri, 30 Oct 2015 17:41:39 -0500
Message-ID: <1446244904-29315-2-git-send-email-afd@ti.com>
References: <1446244904-29315-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446244904-29315-1-git-send-email-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The TPS65086 PMIC contains several regulators and a GPO controller.
Add bindings for the TPS65086 PMIC.

Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/tps65086.txt | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65086.txt

diff --git a/Documentation/devicetree/bindings/mfd/tps65086.txt b/Documentation/devicetree/bindings/mfd/tps65086.txt
new file mode 100644
index 0000000..2fd5394
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/tps65086.txt
@@ -0,0 +1,46 @@
+* TPS65086 Power Management Integrated Circuit bindings
+
+Required properties:
+ - compatible		: Should be "ti,tps65086".
+ - reg			: I2C slave address.
+ - interrupt-parent	: Phandle to he parent interrupt controller.
+ - interrupts		: The interrupt line the device is connected to.
+ - interrupt-controller	: Marks the device node as an interrupt controller.
+ - #interrupt-cells	: The number of cells to describe an IRQ, this
+			    should be 2. The first cell is the IRQ number,
+			    the second cell is the flags, encoded as the trigger
+			    masks from <dt-bindings/interrupt-controller/irq.h>.
+
+Additional nodes defined in:
+ - Regulators	: ../regulator/tps65086-regulator.txt
+ - GPIO		: ../gpio/gpio-tps65086.txt
+
+Example:
+
+	pmic: tps65086@5e {
+		compatible = "ti,tps65086";
+		reg = <0x5e>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		regulators {
+			compatible = "ti,tps65086-regulator";
+
+			buck1 {
+				regulator-name = "vcc1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1600000>;
+				regulator-boot-on;
+				ti,regulator-decay;
+				ti,regulator-step-size-25mv;
+			};
+		};
+
+		gpio4: gpio {
+			compatible = "ti,tps65086-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
