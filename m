From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v2 3/3] mfd: wm831x: Add device tree binding document
Date: Mon, 13 Feb 2017 11:15:14 +0000
Message-ID: <1486984514-29749-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1486984514-29749-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486984514-29749-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

This is just a very simple initial binding, supporting only registering
the chip and the GPIOs. More features will be added as support for
device tree in the driver is expanded.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---

Changes since v1:
 - Added MAINTAINERS update

 Documentation/devicetree/bindings/mfd/wm831x.txt | 31 ++++++++++++++++++++++++
 MAINTAINERS                                      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/wm831x.txt

diff --git a/Documentation/devicetree/bindings/mfd/wm831x.txt b/Documentation/devicetree/bindings/mfd/wm831x.txt
new file mode 100644
index 0000000..9771022
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/wm831x.txt
@@ -0,0 +1,31 @@
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
+  - reg : I2C slave address when connected using I2C, chip select number when
+    using SPI.
+
+  - gpio-controller : Indicates this device is a GPIO controller.
+  - #gpio-cells : Must be 2. The first cell is the pin number and the
+    second cell is used to specify optional parameters (currently unused).
+
+Example:
+
+wm8310: wm8310@36 {
+	compatible = "wlf,wm8310";
+	reg = <0x36>;
+
+	gpio-controller;
+	#gpio-cells = <2>;
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
