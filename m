From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: sunxi: Add sun?i-q8-common.dtsi
 files for q8 tablets
Date: Sat,  5 Sep 2015 16:55:51 +0200
Message-ID: <1441464953-26351-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORB7MEVSXQKGQEMWTCKBY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Cheap allwinner based devices in the q8 enclosure come in many variants,
all sharing the case and a number of other basic features.

They differ in the display, touchscreen, accelerometer and wifi chips
used.

This commit adds 2 dtsi files defining the shared features of all the
q8 tablets. sunxi-q8-common.dtsi defines features shared amongst all
q8 tablets, sun8i-q8-common.dtsi defines features shared amongst all
a23 / a33 based q8 tablets, but not with a13 q8 based tablets.

a13 based tablets use a different card-detect pin for the mmc, and
use uart1 instead of the r_uart for the serial console.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts   | 76 +++-----------------------
 arch/arm/boot/dts/sun8i-a33-ippo-q8h-v1.2.dts | 70 +-----------------------
 arch/arm/boot/dts/sun8i-q8-common.dtsi        | 77 +++++++++++++++++++++++++++
 arch/arm/boot/dts/sunxi-q8-common.dtsi        | 77 +++++++++++++++++++++++++++
 4 files changed, 162 insertions(+), 138 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-q8-common.dtsi
 create mode 100644 arch/arm/boot/dts/sunxi-q8-common.dtsi

diff --git a/arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts b/arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts
index 8d9da68..4f47fd6 100644
--- a/arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts
+++ b/arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts
@@ -44,35 +44,11 @@
 
 /dts-v1/;
 #include "sun8i-a23.dtsi"
-#include "sunxi-common-regulators.dtsi"
-
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/pinctrl/sun4i-a10.h>
+#include "sun8i-q8-common.dtsi"
 
 / {
 	model = "Ippo Q8H Dual Core Tablet (v5)";
 	compatible = "ippo,q8h-v5", "allwinner,sun8i-a23";
-
-	aliases {
-		serial0 = &r_uart;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-};
-
-&i2c0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c0_pins_a>;
-	status = "okay";
-};
-
-&i2c1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c1_pins_a>;
-	status = "okay";
 };
 
 &i2c2 {
@@ -82,50 +58,12 @@
 	status = "failed";
 };
 
-&lradc {
-	vref-supply = <&reg_vcc3v0>;
-	status = "okay";
-
-	button@200 {
-		label = "Volume Up";
-		linux,code = <KEY_VOLUMEUP>;
-		channel = <0>;
-		voltage = <200000>;
-	};
-
-	button@400 {
-		label = "Volume Down";
-		linux,code = <KEY_VOLUMEDOWN>;
-		channel = <0>;
-		voltage = <400000>;
-	};
-};
-
-&mmc0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_q8h>;
-	vmmc-supply = <&reg_vcc3v0>;
-	bus-width = <4>;
-	cd-gpios = <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
-	cd-inverted;
-	status = "okay";
-};
-
-&pio {
-	mmc0_cd_pin_q8h: mmc0_cd_pin@0 {
-		allwinner,pins = "PB4";
-		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
-	};
-};
-
-&r_uart {
-	pinctrl-names = "default";
-	pinctrl-0 = <&r_uart_pins_a>;
-	status = "okay";
-};
-
+/*
+ * FIXME for now we only support host mode and rely on u-boot to have
+ * turned on Vbus which is controlled by the axp223 pmic on the board.
+ *
+ * Once we have axp223 support we should switch to fully supporting otg.
+ */
 &usb_otg {
 	dr_mode = "host";
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun8i-a33-ippo-q8h-v1.2.dts b/arch/arm/boot/dts/sun8i-a33-ippo-q8h-v1.2.dts
index a438975..b8439cb 100644
--- a/arch/arm/boot/dts/sun8i-a33-ippo-q8h-v1.2.dts
+++ b/arch/arm/boot/dts/sun8i-a33-ippo-q8h-v1.2.dts
@@ -42,79 +42,11 @@
 
 /dts-v1/;
 #include "sun8i-a33.dtsi"
-#include "sunxi-common-regulators.dtsi"
-
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/pinctrl/sun4i-a10.h>
+#include "sun8i-q8-common.dtsi"
 
 / {
 	model = "Ippo Q8H Quad Core Tablet (v1.2)";
 	compatible = "ippo,a33-q8h-v1.2", "allwinner,sun8i-a33";
-
-	aliases {
-		serial0 = &r_uart;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-};
-
-&i2c0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c0_pins_a>;
-	status = "okay";
-};
-
-&i2c1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c1_pins_a>;
-	status = "okay";
-};
-
-&lradc {
-	vref-supply = <&reg_vcc3v0>;
-	status = "okay";
-
-	button@200 {
-		label = "Volume Up";
-		linux,code = <KEY_VOLUMEUP>;
-		channel = <0>;
-		voltage = <200000>;
-	};
-
-	button@400 {
-		label = "Volume Down";
-		linux,code = <KEY_VOLUMEDOWN>;
-		channel = <0>;
-		voltage = <400000>;
-	};
-};
-
-&mmc0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_q8h>;
-	vmmc-supply = <&reg_vcc3v0>;
-	bus-width = <4>;
-	cd-gpios = <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
-	cd-inverted;
-	status = "okay";
-};
-
-&pio {
-	mmc0_cd_pin_q8h: mmc0_cd_pin@0 {
-		allwinner,pins = "PB4";
-		allwinner,function = "gpio_in";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
-		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
-	};
-};
-
-&r_uart {
-	pinctrl-names = "default";
-	pinctrl-0 = <&r_uart_pins_a>;
-	status = "okay";
 };
 
 /*
diff --git a/arch/arm/boot/dts/sun8i-q8-common.dtsi b/arch/arm/boot/dts/sun8i-q8-common.dtsi
new file mode 100644
index 0000000..6f8a8bb
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-q8-common.dtsi
@@ -0,0 +1,77 @@
+/*
+ * Copyright 2015 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+#include "sunxi-q8-common.dtsi"
+
+/ {
+	aliases {
+		serial0 = &r_uart;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_q8>;
+	vmmc-supply = <&reg_vcc3v0>;
+	bus-width = <4>;
+	cd-gpios = <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
+	cd-inverted;
+	status = "okay";
+};
+
+&pio {
+	mmc0_cd_pin_q8: mmc0_cd_pin@0 {
+		allwinner,pins = "PB4";
+		allwinner,function = "gpio_in";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	};
+};
+
+&r_uart {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_uart_pins_a>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/sunxi-q8-common.dtsi b/arch/arm/boot/dts/sunxi-q8-common.dtsi
new file mode 100644
index 0000000..17b26ff
--- /dev/null
+++ b/arch/arm/boot/dts/sunxi-q8-common.dtsi
@@ -0,0 +1,77 @@
+/*
+ * Copyright 2015 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/sun4i-a10.h>
+#include "sunxi-common-regulators.dtsi"
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins_a>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins_a>;
+	status = "okay";
+};
+
+&lradc {
+	vref-supply = <&reg_vcc3v0>;
+	status = "okay";
+
+	button@200 {
+		label = "Volume Up";
+		linux,code = <KEY_VOLUMEUP>;
+		channel = <0>;
+		voltage = <200000>;
+	};
+
+	button@400 {
+		label = "Volume Down";
+		linux,code = <KEY_VOLUMEDOWN>;
+		channel = <0>;
+		voltage = <400000>;
+	};
+};
-- 
2.4.3
