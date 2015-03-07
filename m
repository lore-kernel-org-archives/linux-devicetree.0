From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/7] ARM: dts: sun5i: Add new Auxtek-t004 board
Date: Sat,  7 Mar 2015 20:01:21 +0100
Message-ID: <1425754884-7875-4-git-send-email-hdegoede@redhat.com>
References: <1425754884-7875-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBEEW5WTQKGQEQT6RZBA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1425754884-7875-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

The auxtek-t004:
http://www.fasttech.com/products/1110/10004200/1318603-auxtek-t004-allwinner-a10s-single-core-android-ics

Is an Allwinner A10s based hdmi tv stick with with 512M RAM, 4G nand flash,
toc9002 (bcm43362) sdio wifi, 1 USB host ports using an USB-A receptacle and
a 2 micro-usb receptacles, one for power and one for USB OTG.

The sdio wifi appears to not have an oob irq hooked up, so we rely on sdio-irq
support for it.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

foo
---
 arch/arm/boot/dts/Makefile                   |   1 +
 arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts | 151 +++++++++++++++++++++++++++
 2 files changed, 152 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index beac15f..d824336 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -525,6 +525,7 @@ dtb-$(CONFIG_MACH_SUN4I) += \
 	sun4i-a10-olinuxino-lime.dtb \
 	sun4i-a10-pcduino.dtb
 dtb-$(CONFIG_MACH_SUN5I) += \
+	sun5i-a10s-auxtek-t004.dtb \
 	sun5i-a10s-mk802.dtb \
 	sun5i-a10s-olinuxino-micro.dtb \
 	sun5i-a10s-r7-tv-dongle.dtb \
diff --git a/arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts b/arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts
new file mode 100644
index 0000000..6c6fef7
--- /dev/null
+++ b/arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts
@@ -0,0 +1,151 @@
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
+ *     You should have received a copy of the GNU General Public
+ *     License along with this file; if not, write to the Free
+ *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
+ *     MA 02110-1301 USA
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
+/dts-v1/;
+#include "sun5i-a10s.dtsi"
+#include "sunxi-common-regulators.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/sun4i-a10.h>
+
+/ {
+	model = "Auxtek t004 A10s hdmi tv-stick";
+	compatible = "allwinner,auxtek-t004", "allwinner,sun5i-a10s";
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins_t004>;
+
+		red {
+			label = "t004-tv-dongle:red:usr";
+			gpios = <&pio 1 2 GPIO_ACTIVE_HIGH>; /* PB2 */
+			default-state = "on";
+		};
+	};
+
+	reg_vmmc1: vmmc1 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&mmc1_vcc_en_pin_t004>;
+		regulator-name = "vmmc1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpio = <&pio 1 18 GPIO_ACTIVE_HIGH>; /* PB18 */
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_t004>;
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	cd-gpios = <&pio 6 1 GPIO_ACTIVE_HIGH>; /* PG1 */
+	cd-inverted;
+	status = "okay";
+};
+
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins_a>;
+	vmmc-supply = <&reg_vmmc1>;
+	bus-width = <4>;
+	non-removable;
+	cap-sdio-irq;
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&pio {
+	mmc0_cd_pin_t004: mmc0_cd_pin@0 {
+		allwinner,pins = "PG1";
+		allwinner,function = "gpio_in";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	};
+
+	mmc1_vcc_en_pin_t004: mmc1_vcc_en_pin@0 {
+		allwinner,pins = "PB18";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
+
+	led_pins_t004: led_pins@0 {
+		allwinner,pins = "PB2";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
+};
+
+&reg_usb1_vbus {
+	gpio = <&pio 6 13 GPIO_ACTIVE_HIGH>; /* PG13 */
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins_a>;
+	status = "okay";
+};
+
+&usb1_vbus_pin_a {
+	allwinner,pins = "PG13";
+};
+
+&usbphy {
+	usb1_vbus-supply = <&reg_usb1_vbus>;
+	status = "okay";
+};
-- 
2.3.1
