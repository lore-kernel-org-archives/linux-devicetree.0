From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH v2 2/3] ARM: dts: sunxi: add support for Orange Pi Zero board
Date: Tue, 22 Nov 2016 00:24:20 +0800
Message-ID: <20161121162421.800-2-icenowy@aosc.xyz>
References: <20161121162421.800-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161121162421.800-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Corbet <corbet@lwn.net>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, Vishnu Patekar <vishnupatekar0510@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.xyz>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Orange Pi Zero is a board that came with the new Allwinner H2+ SoC.

Add a device tree file for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
Changes since v2:
- Use generic pinconf binding instead of legacy allwinner pinctrl binding.
- removed uart3, which is not accessible on Orange Pi Zero.
- Removed sun8i-h2plus.dtsi and make Orange Pi Zero dts directly include
  sun8i-h3.dtsi.
- Removed allwinner,sun8i-h3 compatible.

 arch/arm/boot/dts/Makefile                       |   1 +
 arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts | 137 +++++++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 802a10d..51a1dd7 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -834,6 +834,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-a33-sinlinx-sina33.dtb \
 	sun8i-a83t-allwinner-h8homlet-v2.dtb \
 	sun8i-a83t-cubietruck-plus.dtb \
+	sun8i-h2plus-orangepi-zero.dtb \
 	sun8i-h3-bananapi-m2-plus.dtb \
 	sun8i-h3-nanopi-neo.dtb \
 	sun8i-h3-orangepi-2.dtb \
diff --git a/arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts
new file mode 100644
index 0000000..b428e47
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts
@@ -0,0 +1,137 @@
+/*
+ * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.xyz>
+ *
+ * Based on sun8i-h3-orangepi-one.dts, which is:
+ *   Copyright (C) 2016 Hans de Goede <hdegoede@redhat.com>
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
+/dts-v1/;
+#include "sun8i-h3.dtsi"
+#include "sunxi-common-regulators.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/sun4i-a10.h>
+
+/ {
+	model = "Xunlong Orange Pi Zero";
+	compatible = "xunlong,orangepi-zero", "allwinner,sun8i-h2plus";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&leds_opi0>, <&leds_r_opi0>;
+
+		pwr_led {
+			label = "orangepi:green:pwr";
+			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		status_led {
+			label = "orangepi:red:status";
+			gpios = <&pio 0 17 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin>;
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
+	cd-inverted;
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&pio {
+	leds_opi0: led_pins@0 {
+		pins = "PA17";
+		function = "gpio_out";
+	};
+};
+
+&r_pio {
+	leds_r_opi0: led_pins@0 {
+		pins = "PL10";
+		function = "gpio_out";
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins_a>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	status = "disabled";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "disabled";
+};
+
+&usbphy {
+	/* USB VBUS is always on */
+	status = "okay";
+};
-- 
2.10.2
