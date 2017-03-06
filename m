From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH v3 3/3] mfd: wm831x: Add device tree binding document
Date: Mon, 6 Mar 2017 16:46:44 +0000
Message-ID: <1488818804-9406-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1488818804-9406-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488818804-9406-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a device tree binding document for the wm831x series of PMICs.
Currently only support for the registering the device and the GPIOs are
actually implemented in the driver.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---

Changes since v2:
 - Flesh the binding some more with some additional features of the device,
   although these are not yet implemented in the code.

 Documentation/devicetree/bindings/mfd/wm831x.txt | 81 ++++++++++++++++++++++++
 MAINTAINERS                                      |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/wm831x.txt

diff --git a/Documentation/devicetree/bindings/mfd/wm831x.txt b/Documentation/devicetree/bindings/mfd/wm831x.txt
new file mode 100644
index 0000000..680ac18
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/wm831x.txt
@@ -0,0 +1,81 @@
+Cirrus Logic/Wolfson Microelectronics wm831x PMICs
+
+System PMICs with a wide range of additional features.
+
+Required properties:
+
+  - compatible : One of the following chip-specific strings:
+        "wlf,wm8310"
+        "wlf,wm8311"
+        "wlf,wm8312"
+        "wlf,wm8320"
+        "wlf,wm8321"
+        "wlf,wm8325"
+        "wlf,wm8326"
+
+  - reg : I2C slave address when connected using I2C, chip select number
+    when using SPI.
+
+  - gpio-controller : Indicates this device is a GPIO controller.
+  - #gpio-cells : Must be 2. The first cell is the pin number and the
+    second cell is used to specify optional parameters (currently unused).
+
+  - interrupts : The interrupt line the /IRQ signal for the device is
+    connected to.
+  - interrupt-parent : The parent interrupt controller.
+
+  - interrupt-controller : wm831x devices contain interrupt controllers and
+    may provide interrupt services to other devices.
+  - #interrupt-cells: Must be 2. The first cell is the IRQ number, and the
+    second cell is the flags, encoded as the trigger masks from
+    Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+
+Optional sub-nodes:
+  - regulators : Contains sub-nodes for each of the regulators supplied by
+    the device. The regulators are bound using their names listed below:
+
+    dcdc1 : DCDC1
+    dcdc2 : DCDC2
+    dcdc3 : DCDC3
+    dcdc4 : DCDC3
+    isink1 : ISINK1
+    isink2 : ISINK2
+    ldo1 : LDO1
+    ldo2 : LDO2
+    ldo3 : LDO3
+    ldo4 : LDO4
+    ldo5 : LDO5
+    ldo7 : LDO7
+    ldo11 : LDO11
+
+    The bindings details of each regulator can be found in:
+    Documentation/devicetree/bindings/regulator/regulator.txt
+
+Example:
+
+wm8310: pmic@36 {
+	compatible = "wlf,wm8310";
+	reg = <0x36>;
+
+	gpio-controller;
+	#gpio-cells = <2>;
+
+	interrupts = <347>;
+	interrupt-parent = <&gic>;
+
+	interrupt-controller;
+	#interrupt-cells = <2>;
+
+	regulators {
+		dcdc1: dcdc1 {
+			regulator-name = "DCDC1";
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <600000>;
+		};
+		ldo1: ldo1 {
+			regulator-name = "LDO1";
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1700000>;
+		};
+	};
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index 2d8ca28..48fdc82 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13363,6 +13363,7 @@ F:	Documentation/hwmon/wm83??
 F:	Documentation/devicetree/bindings/extcon/extcon-arizona.txt
 F:	Documentation/devicetree/bindings/regulator/arizona-regulator.txt
 F:	Documentation/devicetree/bindings/mfd/arizona.txt
+F:	Documentation/devicetree/bindings/mfd/wm831x.txt
 F:	arch/arm/mach-s3c64xx/mach-crag6410*
 F:	drivers/clk/clk-wm83*.c
 F:	drivers/extcon/extcon-arizona.c
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
