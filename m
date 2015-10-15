From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: sun6i: Add a dts file for the
 Sinovoip BPI-M2 board
Date: Thu, 15 Oct 2015 16:28:47 +0200
Message-ID: <1444919327-23747-3-git-send-email-hdegoede@redhat.com>
References: <1444919327-23747-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBMHQ72YAKGQEPFVGBNA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1444919327-23747-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thomas Kaiser <Thomas.Kaiser-id7G5ibTm3AZ78jC37dNPg@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Sinovoip BPI-M2 is a SBC board based on the A31s SoC it features
1G RAM, a microsd slot, Gbit ethernet, 4 usb-a USB-2 ports, ir receiver,
stereo headphone jack and hdmi video output.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                       |   1 +
 arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts | 194 +++++++++++++++++++++++
 2 files changed, 195 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 389f30d..46a163d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -612,6 +612,7 @@ dtb-$(CONFIG_MACH_SUN6I) += \
 	sun6i-a31-m9.dtb \
 	sun6i-a31-mele-a1000g-quad.dtb \
 	sun6i-a31s-cs908.dtb \
+	sun6i-a31s-sinovoip-bpi-m2.dtb \
 	sun6i-a31s-yones-toptech-bs1078-v2.dtb
 dtb-$(CONFIG_MACH_SUN7I) += \
 	sun7i-a20-bananapi.dtb \
diff --git a/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
new file mode 100644
index 0000000..db7fa13
--- /dev/null
+++ b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
@@ -0,0 +1,194 @@
+/*
+ * Copyright 2015 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This library is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This library is distributed in the hope that it will be useful,
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
+#include "sun6i-a31s.dtsi"
+#include "sunxi-common-regulators.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Sinovoip BPI-M2";
+	compatible = "sinovoip,bpi-m2", "allwinner,sun6i-a31s";
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
+		pinctrl-0 = <&led_pins_bpi_m2>;
+
+		blue {
+			label = "bpi-m2:blue:usr";
+			gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>; /* PG11 */
+		};
+
+		green {
+			label = "bpi-m2:green:usr";
+			gpios = <&pio 6 10 GPIO_ACTIVE_HIGH>; /* PG10 */
+		};
+
+		red {
+			label = "bpi-m2:red:usr";
+			gpios = <&pio 6 5 GPIO_ACTIVE_HIGH>; /* PG5 */
+		};
+	};
+
+	mmc2_pwrseq: mmc2_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&mmc2_pwrseq_pin_bpi_m2>;
+		reset-gpios = <&r_pio 0 8 GPIO_ACTIVE_LOW>; /* PL8 WIFI_EN */
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&gmac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac_pins_rgmii_a>, <&gmac_phy_reset_pin_bpi_m2>;
+	phy = <&phy1>;
+	phy-mode = "rgmii";
+	snps,reset-gpio = <&pio 0 21 GPIO_ACTIVE_HIGH>; /* PA21 */
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 10000 30000>;
+	status = "okay";
+
+	phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
+
+&ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ir_pins_a>;
+	status = "okay";
+};
+
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_bpi_m2>;
+	vmmc-supply = <&reg_vcc3v0>;
+	bus-width = <4>;
+	cd-gpios = <&pio 0 4 GPIO_ACTIVE_HIGH>; /* PA4 */
+	cd-inverted;
+	status = "okay";
+};
+
+&mmc0_pins_a {
+	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+};
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_pins_a>;
+	vmmc-supply = <&reg_vcc3v0>;
+	mmc-pwrseq = <&mmc2_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	brcmf: bcrmf@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&r_pio>;
+		interrupts = <0 5 IRQ_TYPE_LEVEL_LOW>; /* PL5 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&mmc2_pins_a {
+	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&pio {
+	gmac_phy_reset_pin_bpi_m2: gmac_phy_reset_pin@0 {
+		allwinner,pins = "PA21";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
+
+	led_pins_bpi_m2: led_pins@0 {
+		allwinner,pins = "PG5", "PG10", "PG11";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
+
+	mmc0_cd_pin_bpi_m2: mmc0_cd_pin@0 {
+		allwinner,pins = "PA4";
+		allwinner,function = "gpio_in";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	};
+};
+
+&r_pio {
+	mmc2_pwrseq_pin_bpi_m2: mmc2_pwrseq_pin@0 {
+		allwinner,pins = "PL8";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins_a>;
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
-- 
2.5.0
