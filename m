From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: sun8i: Add dts file for the Polaroid MID2809PXE4 tablet
Date: Mon, 14 Mar 2016 17:32:25 +0100
Message-ID: <1457973145-26203-3-git-send-email-hdegoede@redhat.com>
References: <1457973145-26203-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457973145-26203-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Polaroid MID2809PXE4 is a 9" tablet which is clearly marked
Polaroid MID2809PXE4 on the back. It features a 9" 16:9=C2=A0800x480 LC=
D,
A23 Soc, 1GB RAM, 8GB NAND, gsl3670 touchscreen and esp8089 wifi.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                         |   1 +
 .../boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts   | 243 +++++++++++++=
++++++++
 2 files changed, 244 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.d=
ts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 88f511c..a354f7c 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -689,6 +689,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
 	sun8i-a23-gt90h-v4.dtb \
 	sun8i-a23-ippo-q8h-v5.dtb \
 	sun8i-a23-ippo-q8h-v1.2.dtb \
+	sun8i-a23-polaroid-mid2809pxe04.dtb \
 	sun8i-a23-q8-tablet.dtb \
 	sun8i-a33-et-q8-v1.6.dtb \
 	sun8i-a33-ga10h-v1.1.dtb \
diff --git a/arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts b/ar=
ch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts
new file mode 100644
index 0000000..cb5daaf
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts
@@ -0,0 +1,243 @@
+/*
+ * Copyright 2016 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of =
the
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
+#include "sun8i-a23.dtsi"
+#include "sunxi-common-regulators.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/sun4i-a10.h>
+#include <dt-bindings/pwm/pwm.h>
+
+/ {
+	model =3D "Polaroid MID2809PXE04 tablet";
+	compatible =3D "polaroid,mid2809pxe04", "allwinner,sun8i-a23";
+
+	aliases {
+		serial0 =3D &r_uart;
+	};
+
+	backlight: backlight {
+		compatible =3D "pwm-backlight";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&bl_en_pin_mid2809>;
+		pwms =3D <&pwm 0 50000 PWM_POLARITY_INVERTED>;
+		brightness-levels =3D <0 10 20 30 40 50 60 70 80 90 100>;
+		default-brightness-level =3D <8>;
+		enable-gpios =3D <&pio 7 6 GPIO_ACTIVE_HIGH>; /* PH6 */
+	};
+
+	chosen {
+		stdout-path =3D "serial0:115200n8";
+	};
+};
+
+&ehci0 {
+	status =3D "okay";
+};
+
+&i2c0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&i2c0_pins_a>;
+	status =3D "okay";
+};
+
+&i2c1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&i2c1_pins_a>;
+	status =3D "okay";
+};
+
+&lradc {
+	vref-supply =3D <&reg_vcc3v0>;
+	status =3D "okay";
+
+	button@200 {
+		label =3D "Volume Up";
+		linux,code =3D <KEY_VOLUMEUP>;
+		channel =3D <0>;
+		voltage =3D <200000>;
+	};
+
+	button@400 {
+		label =3D "Volume Down";
+		linux,code =3D <KEY_VOLUMEDOWN>;
+		channel =3D <0>;
+		voltage =3D <400000>;
+	};
+};
+
+&mmc0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin_mid2809>;
+	vmmc-supply =3D <&reg_dcdc1>;
+	bus-width =3D <4>;
+	cd-gpios =3D <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
+	cd-inverted;
+	status =3D "okay";
+};
+
+&pio {
+	bl_en_pin_mid2809: bl_en_pin@0 {
+		allwinner,pins =3D "PH6";
+		allwinner,function =3D "gpio_in";
+		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
+	};
+
+	mmc0_cd_pin_mid2809: mmc0_cd_pin@0 {
+		allwinner,pins =3D "PB4";
+		allwinner,function =3D "gpio_in";
+		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
+	};
+};
+
+&pwm {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pwm0_pins>;
+	status =3D "okay";
+};
+
+&r_rsb {
+	status =3D "okay";
+
+	axp22x: pmic@3a3 {
+		compatible =3D "x-powers,axp223";
+		reg =3D <0x3a3>;
+		interrupt-parent =3D <&nmi_intc>;
+		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
+		eldoin-supply =3D <&reg_dcdc1>;
+	};
+};
+
+&r_uart {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&r_uart_pins_a>;
+	status =3D "okay";
+};
+
+#include "axp22x.dtsi"
+
+&reg_aldo1 {
+	regulator-always-on;
+	regulator-min-microvolt =3D <3000000>;
+	regulator-max-microvolt =3D <3000000>;
+	regulator-name =3D "vcc-io";
+};
+
+&reg_aldo2 {
+	regulator-always-on;
+	regulator-min-microvolt =3D <2350000>;
+	regulator-max-microvolt =3D <2650000>;
+	regulator-name =3D "vdd-dll";
+};
+
+&reg_aldo3 {
+	regulator-always-on;
+	regulator-min-microvolt =3D <2700000>;
+	regulator-max-microvolt =3D <3300000>;
+	regulator-name =3D "vcc-pll-avcc";
+};
+
+&reg_dc1sw {
+	regulator-name =3D "vcc-lcd";
+};
+
+&reg_dc5ldo {
+	regulator-always-on;
+	regulator-min-microvolt =3D <900000>;
+	regulator-max-microvolt =3D <1400000>;
+	regulator-name =3D "vdd-cpus";
+};
+
+&reg_dcdc1 {
+	regulator-always-on;
+	regulator-min-microvolt =3D <3000000>;
+	regulator-max-microvolt =3D <3000000>;
+	regulator-name =3D "vcc-3v0";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt =3D <900000>;
+	regulator-max-microvolt =3D <1400000>;
+	regulator-name =3D "vdd-sys";
+};
+
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-min-microvolt =3D <900000>;
+	regulator-max-microvolt =3D <1400000>;
+	regulator-name =3D "vdd-cpu";
+};
+
+&reg_dcdc5 {
+	regulator-always-on;
+	regulator-min-microvolt =3D <1500000>;
+	regulator-max-microvolt =3D <1500000>;
+	regulator-name =3D "vcc-dram";
+};
+
+&reg_rtc_ldo {
+	regulator-name =3D "vcc-rtc";
+};
+
+&simplefb_lcd {
+	vcc-lcd-supply =3D <&reg_dc1sw>;
+};
+
+/*
+ * FIXME for now we only support host mode and rely on u-boot to have
+ * turned on Vbus which is controlled by the axp223 pmic on the board.
+ *
+ * Once we have axp223 support we should switch to fully supporting ot=
g.
+ */
+&usb_otg {
+	dr_mode =3D "host";
+	status =3D "okay";
+};
+
+&usbphy {
+	status =3D "okay";
+};
--=20
2.7.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
