From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V4 1/2] mfd: Add ROHM BD9571MWV-M PMIC DT bindings
Date: Mon, 17 Jul 2017 22:45:11 +0200
Message-ID: <20170717204512.7075-1-marek.vasut+renesas@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT bindings for the ROHM BD9571MWV-M PMIC. This PMIC has
the following features:
- multiple voltage monitors for 1V8, 2V5, 3V3 voltage rail
- one voltage regulator for DVFS
- two GPIOs

Signed-off-by: Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
V2: - Drop the compatible = "regulator-fixed" from the binding example,
      it should not be there.
    - List the VD09 regulator
V3: Replace bd9571@30 with pmic@30
V4: No changes
---
 .../devicetree/bindings/mfd/bd9571mwv.txt          | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/bd9571mwv.txt

diff --git a/Documentation/devicetree/bindings/mfd/bd9571mwv.txt b/Documentation/devicetree/bindings/mfd/bd9571mwv.txt
new file mode 100644
index 000000000000..9ab216a851d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/bd9571mwv.txt
@@ -0,0 +1,49 @@
+* ROHM BD9571MWV Power Management Integrated Circuit (PMIC) bindings
+
+Required properties:
+ - compatible		: Should be "rohm,bd9571mwv".
+ - reg			: I2C slave address.
+ - interrupt-parent	: Phandle to the parent interrupt controller.
+ - interrupts		: The interrupt line the device is connected to.
+ - interrupt-controller	: Marks the device node as an interrupt controller.
+ - #interrupt-cells	: The number of cells to describe an IRQ, should be 2.
+			    The first cell is the IRQ number.
+			    The second cell is the flags, encoded as trigger
+			    masks from ../interrupt-controller/interrupts.txt.
+ - gpio-controller      : Marks the device node as a GPIO Controller.
+ - #gpio-cells          : Should be two.  The first cell is the pin number and
+                            the second cell is used to specify flags.
+                            See ../gpio/gpio.txt for more information.
+ - regulators:          : List of child nodes that specify the regulator
+                            initialization data. Child nodes must be named
+                            after their hardware counterparts:
+			     - vd09
+			     - vd18
+			     - vd25
+			     - vd33
+			     - dvfs
+			    Each child node is defined using the standard
+			    binding for regulators.
+
+Example:
+
+	pmic: pmic@30 {
+		compatible = "rohm,bd9571mwv";
+		reg = <0x30>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		regulators {
+			dvfs: dvfs {
+				regulator-name = "dvfs";
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <1030000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
