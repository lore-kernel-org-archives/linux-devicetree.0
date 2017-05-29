From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sun7i-a20: Rename bananapi as
 bananapi m1
Date: Tue, 30 May 2017 03:45:02 +0800
Message-ID: <64C21281-E8B6-428E-9480-3B81BE66FC6E@aosc.io>
References: <1496086228-2806-1-git-send-email-jagan@openedev.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBUXUWHEQKGQE4FX3AGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1496086228-2806-1-git-send-email-jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.orgJagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B45=E6=9C=8830=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=883:=
30:26, Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org> =E5=86=99=E5=88=B0:
>From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>
>from BPI(BIPAI KEJI LIMITED) products the Bananapi board
>is named as 'Bananapi M1' and this is the starting
>bananapi board from M1 series.
>
>So rename dts and suffix 'M1' on model for the same,
>so-that next sequence on bananapi starts like M1 Plus, M2 and so..on
>
>Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>---
>Note: Bananapi BPI product site
>http://www.banana-pi.org/product.html
>
> arch/arm/boot/dts/Makefile                  |   2 +-
>arch/arm/boot/dts/sun7i-a20-bananapi-m1.dts | 286
>++++++++++++++++++++++++++++
>arch/arm/boot/dts/sun7i-a20-bananapi.dts    | 286
>----------------------------
> 3 files changed, 287 insertions(+), 287 deletions(-)
> create mode 100644 arch/arm/boot/dts/sun7i-a20-bananapi-m1.dts
> delete mode 100644 arch/arm/boot/dts/sun7i-a20-bananapi.dts
>
>diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>index 45c6e65..1b086f0 100644
>--- a/arch/arm/boot/dts/Makefile
>+++ b/arch/arm/boot/dts/Makefile
>@@ -851,7 +851,7 @@ dtb-$(CONFIG_MACH_SUN6I) +=3D \
> 	sun6i-a31s-sinovoip-bpi-m2.dtb \
> 	sun6i-a31s-yones-toptech-bs1078-v2.dtb
> dtb-$(CONFIG_MACH_SUN7I) +=3D \
>-	sun7i-a20-bananapi.dtb \
>+	sun7i-a20-bananapi-m1.dtb \
> 	sun7i-a20-bananapi-m1-plus.dtb \
> 	sun7i-a20-bananapro.dtb \
> 	sun7i-a20-cubieboard2.dtb \
>diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1.dts
>b/arch/arm/boot/dts/sun7i-a20-bananapi-m1.dts
>new file mode 100644
>index 0000000..8b97b89
>--- /dev/null
>+++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1.dts
>@@ -0,0 +1,286 @@
>+/*
>+ * Copyright 2014 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>+ *
>+ * Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>+ *
>+ * This file is dual-licensed: you can use it either under the terms
>+ * of the GPL or the X11 license, at your option. Note that this dual
>+ * licensing only applies to this file, and not this project as a
>+ * whole.
>+ *
>+ *  a) This file is free software; you can redistribute it and/or
>+ *     modify it under the terms of the GNU General Public License as
>+ *     published by the Free Software Foundation; either version 2 of
>the
>+ *     License, or (at your option) any later version.
>+ *
>+ *     This file is distributed in the hope that it will be useful,
>+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>+ *     GNU General Public License for more details.
>+ *
>+ * Or, alternatively,
>+ *
>+ *  b) Permission is hereby granted, free of charge, to any person
>+ *     obtaining a copy of this software and associated documentation
>+ *     files (the "Software"), to deal in the Software without
>+ *     restriction, including without limitation the rights to use,
>+ *     copy, modify, merge, publish, distribute, sublicense, and/or
>+ *     sell copies of the Software, and to permit persons to whom the
>+ *     Software is furnished to do so, subject to the following
>+ *     conditions:
>+ *
>+ *     The above copyright notice and this permission notice shall be
>+ *     included in all copies or substantial portions of the Software.
>+ *
>+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>+ *     OTHER DEALINGS IN THE SOFTWARE.
>+ */
>+
>+/dts-v1/;
>+#include "sun7i-a20.dtsi"
>+#include "sunxi-common-regulators.dtsi"
>+
>+#include <dt-bindings/gpio/gpio.h>
>+#include <dt-bindings/interrupt-controller/irq.h>
>+
>+/ {
>+	model =3D "LeMaker Banana Pi M1";
>+	compatible =3D "lemaker,bananapi", "allwinner,sun7i-a20";

LeMaker never name this BPI M1.

The M1 tag is made by Sinovoip and Bipai.

I suggest you just set model to "Banana Pi M1" and compatible to
three:
"bananapi,bpi-m1", "lemaker,bananapi" (Sinovoip BPi
M1 is fully compatible with the original Banana Pi by LeMaker,
so here're these compatibles) and "allwinner,sun7i-a20".

>+
>+	aliases {
>+		serial0 =3D &uart0;
>+		serial1 =3D &uart3;
>+		serial2 =3D &uart7;
>+	};
>+
>+	chosen {
>+		stdout-path =3D "serial0:115200n8";
>+	};
>+
>+	leds {
>+		compatible =3D "gpio-leds";
>+		pinctrl-names =3D "default";
>+		pinctrl-0 =3D <&led_pins_bananapi>;
>+
>+		green {
>+			label =3D "bananapi:green:usr";
>+			gpios =3D <&pio 7 24 GPIO_ACTIVE_HIGH>;
>+		};
>+	};
>+
>+	reg_gmac_3v3: gmac-3v3 {
>+		compatible =3D "regulator-fixed";
>+		pinctrl-names =3D "default";
>+		pinctrl-0 =3D <&gmac_power_pin_bananapi>;
>+		regulator-name =3D "gmac-3v3";
>+		regulator-min-microvolt =3D <3300000>;
>+		regulator-max-microvolt =3D <3300000>;
>+		startup-delay-us =3D <100000>;
>+		enable-active-high;
>+		gpio =3D <&pio 7 23 GPIO_ACTIVE_HIGH>;
>+	};
>+};
>+
>+&ahci {
>+	status =3D "okay";
>+};
>+
>+&codec {
>+	status =3D "okay";
>+};
>+
>+&cpu0 {
>+	cpu-supply =3D <&reg_dcdc2>;
>+	operating-points =3D <
>+		/* kHz	  uV */
>+		960000	1400000
>+		912000	1400000
>+		864000	1350000
>+		720000	1250000
>+		528000	1150000
>+		312000	1100000
>+		144000	1050000
>+		>;
>+};
>+
>+&ehci0 {
>+	status =3D "okay";
>+};
>+
>+&ehci1 {
>+	status =3D "okay";
>+};
>+
>+&gmac {
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&gmac_pins_rgmii_a>;
>+	phy =3D <&phy1>;
>+	phy-mode =3D "rgmii";
>+	phy-supply =3D <&reg_gmac_3v3>;
>+	status =3D "okay";
>+
>+	phy1: ethernet-phy@1 {
>+		reg =3D <1>;
>+	};
>+};
>+
>+&i2c0 {
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&i2c0_pins_a>;
>+	status =3D "okay";
>+
>+	axp209: pmic@34 {
>+		reg =3D <0x34>;
>+		interrupt-parent =3D <&nmi_intc>;
>+		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
>+	};
>+};
>+
>+&i2c2 {
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&i2c2_pins_a>;
>+	status =3D "okay";
>+};
>+
>+&ir0 {
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&ir0_rx_pins_a>;
>+	status =3D "okay";
>+};
>+
>+&mmc0 {
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin_bananapi>;
>+	vmmc-supply =3D <&reg_vcc3v3>;
>+	bus-width =3D <4>;
>+	cd-gpios =3D <&pio 7 10 GPIO_ACTIVE_HIGH>; /* PH10 */
>+	cd-inverted;
>+	status =3D "okay";
>+};
>+
>+&ohci0 {
>+	status =3D "okay";
>+};
>+
>+&ohci1 {
>+	status =3D "okay";
>+};
>+
>+&otg_sram {
>+	status =3D "okay";
>+};
>+
>+&pio {
>+	usb0_id_detect_pin: usb0_id_detect_pin@0 {
>+		pins =3D "PH4";
>+		function =3D "gpio_in";
>+		bias-pull-up;
>+	};
>+
>+	mmc0_cd_pin_bananapi: mmc0_cd_pin@0 {
>+		pins =3D "PH10";
>+		function =3D "gpio_in";
>+		bias-pull-up;
>+	};
>+
>+	gmac_power_pin_bananapi: gmac_power_pin@0 {
>+		pins =3D "PH23";
>+		function =3D "gpio_out";
>+	};
>+
>+	led_pins_bananapi: led_pins@0 {
>+		pins =3D "PH24";
>+		function =3D "gpio_out";
>+	};
>+};
>+
>+#include "axp209.dtsi"
>+
>+&reg_dcdc2 {
>+	regulator-always-on;
>+	regulator-min-microvolt =3D <1000000>;
>+	regulator-max-microvolt =3D <1400000>;
>+	regulator-name =3D "vdd-cpu";
>+};
>+
>+&reg_dcdc3 {
>+	regulator-always-on;
>+	regulator-min-microvolt =3D <1000000>;
>+	regulator-max-microvolt =3D <1400000>;
>+	regulator-name =3D "vdd-int-dll";
>+};
>+
>+&reg_ldo1 {
>+	regulator-name =3D "vdd-rtc";
>+};
>+
>+&reg_ldo2 {
>+	regulator-always-on;
>+	regulator-min-microvolt =3D <3000000>;
>+	regulator-max-microvolt =3D <3000000>;
>+	regulator-name =3D "avcc";
>+};
>+
>+&reg_usb0_vbus {
>+	status =3D "okay";
>+};
>+
>+&reg_usb1_vbus {
>+	status =3D "okay";
>+};
>+
>+&reg_usb2_vbus {
>+	status =3D "okay";
>+};
>+
>+&spi0 {
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&spi0_pins_a>,
>+		    <&spi0_cs0_pins_a>,
>+		    <&spi0_cs1_pins_a>;
>+	status =3D "okay";
>+};
>+
>+&uart0 {
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&uart0_pins_a>;
>+	status =3D "okay";
>+};
>+
>+&uart3 {
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&uart3_pins_b>;
>+	status =3D "okay";
>+};
>+
>+&uart7 {
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&uart7_pins_a>;
>+	status =3D "okay";
>+};
>+
>+&usb_otg {
>+	dr_mode =3D "otg";
>+	status =3D "okay";
>+};
>+
>+&usb_power_supply {
>+	status =3D "okay";
>+};
>+
>+&usbphy {
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&usb0_id_detect_pin>;
>+	usb0_id_det-gpio =3D <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
>+	usb0_vbus_power-supply =3D <&usb_power_supply>;
>+	usb0_vbus-supply =3D <&reg_usb0_vbus>;
>+	usb1_vbus-supply =3D <&reg_usb1_vbus>;
>+	usb2_vbus-supply =3D <&reg_usb2_vbus>;
>+	status =3D "okay";
>+};
>diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
>b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
>deleted file mode 100644
>index ed2f35a..0000000
>--- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
>+++ /dev/null
>@@ -1,286 +0,0 @@
>-/*
>- * Copyright 2014 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>- *
>- * Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>- *
>- * This file is dual-licensed: you can use it either under the terms
>- * of the GPL or the X11 license, at your option. Note that this dual
>- * licensing only applies to this file, and not this project as a
>- * whole.
>- *
>- *  a) This file is free software; you can redistribute it and/or
>- *     modify it under the terms of the GNU General Public License as
>- *     published by the Free Software Foundation; either version 2 of
>the
>- *     License, or (at your option) any later version.
>- *
>- *     This file is distributed in the hope that it will be useful,
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>- *     GNU General Public License for more details.
>- *
>- * Or, alternatively,
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use,
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software.
>- *
>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE.
>- */
>-
>-/dts-v1/;
>-#include "sun7i-a20.dtsi"
>-#include "sunxi-common-regulators.dtsi"
>-
>-#include <dt-bindings/gpio/gpio.h>
>-#include <dt-bindings/interrupt-controller/irq.h>
>-
>-/ {
>-	model =3D "LeMaker Banana Pi";
>-	compatible =3D "lemaker,bananapi", "allwinner,sun7i-a20";
>-
>-	aliases {
>-		serial0 =3D &uart0;
>-		serial1 =3D &uart3;
>-		serial2 =3D &uart7;
>-	};
>-
>-	chosen {
>-		stdout-path =3D "serial0:115200n8";
>-	};
>-
>-	leds {
>-		compatible =3D "gpio-leds";
>-		pinctrl-names =3D "default";
>-		pinctrl-0 =3D <&led_pins_bananapi>;
>-
>-		green {
>-			label =3D "bananapi:green:usr";
>-			gpios =3D <&pio 7 24 GPIO_ACTIVE_HIGH>;
>-		};
>-	};
>-
>-	reg_gmac_3v3: gmac-3v3 {
>-		compatible =3D "regulator-fixed";
>-		pinctrl-names =3D "default";
>-		pinctrl-0 =3D <&gmac_power_pin_bananapi>;
>-		regulator-name =3D "gmac-3v3";
>-		regulator-min-microvolt =3D <3300000>;
>-		regulator-max-microvolt =3D <3300000>;
>-		startup-delay-us =3D <100000>;
>-		enable-active-high;
>-		gpio =3D <&pio 7 23 GPIO_ACTIVE_HIGH>;
>-	};
>-};
>-
>-&ahci {
>-	status =3D "okay";
>-};
>-
>-&codec {
>-	status =3D "okay";
>-};
>-
>-&cpu0 {
>-	cpu-supply =3D <&reg_dcdc2>;
>-	operating-points =3D <
>-		/* kHz	  uV */
>-		960000	1400000
>-		912000	1400000
>-		864000	1350000
>-		720000	1250000
>-		528000	1150000
>-		312000	1100000
>-		144000	1050000
>-		>;
>-};
>-
>-&ehci0 {
>-	status =3D "okay";
>-};
>-
>-&ehci1 {
>-	status =3D "okay";
>-};
>-
>-&gmac {
>-	pinctrl-names =3D "default";
>-	pinctrl-0 =3D <&gmac_pins_rgmii_a>;
>-	phy =3D <&phy1>;
>-	phy-mode =3D "rgmii";
>-	phy-supply =3D <&reg_gmac_3v3>;
>-	status =3D "okay";
>-
>-	phy1: ethernet-phy@1 {
>-		reg =3D <1>;
>-	};
>-};
>-
>-&i2c0 {
>-	pinctrl-names =3D "default";
>-	pinctrl-0 =3D <&i2c0_pins_a>;
>-	status =3D "okay";
>-
>-	axp209: pmic@34 {
>-		reg =3D <0x34>;
>-		interrupt-parent =3D <&nmi_intc>;
>-		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
>-	};
>-};
>-
>-&i2c2 {
>-	pinctrl-names =3D "default";
>-	pinctrl-0 =3D <&i2c2_pins_a>;
>-	status =3D "okay";
>-};
>-
>-&ir0 {
>-	pinctrl-names =3D "default";
>-	pinctrl-0 =3D <&ir0_rx_pins_a>;
>-	status =3D "okay";
>-};
>-
>-&mmc0 {
>-	pinctrl-names =3D "default";
>-	pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin_bananapi>;
>-	vmmc-supply =3D <&reg_vcc3v3>;
>-	bus-width =3D <4>;
>-	cd-gpios =3D <&pio 7 10 GPIO_ACTIVE_HIGH>; /* PH10 */
>-	cd-inverted;
>-	status =3D "okay";
>-};
>-
>-&ohci0 {
>-	status =3D "okay";
>-};
>-
>-&ohci1 {
>-	status =3D "okay";
>-};
>-
>-&otg_sram {
>-	status =3D "okay";
>-};
>-
>-&pio {
>-	usb0_id_detect_pin: usb0_id_detect_pin@0 {
>-		pins =3D "PH4";
>-		function =3D "gpio_in";
>-		bias-pull-up;
>-	};
>-
>-	mmc0_cd_pin_bananapi: mmc0_cd_pin@0 {
>-		pins =3D "PH10";
>-		function =3D "gpio_in";
>-		bias-pull-up;
>-	};
>-
>-	gmac_power_pin_bananapi: gmac_power_pin@0 {
>-		pins =3D "PH23";
>-		function =3D "gpio_out";
>-	};
>-
>-	led_pins_bananapi: led_pins@0 {
>-		pins =3D "PH24";
>-		function =3D "gpio_out";
>-	};
>-};
>-
>-#include "axp209.dtsi"
>-
>-&reg_dcdc2 {
>-	regulator-always-on;
>-	regulator-min-microvolt =3D <1000000>;
>-	regulator-max-microvolt =3D <1400000>;
>-	regulator-name =3D "vdd-cpu";
>-};
>-
>-&reg_dcdc3 {
>-	regulator-always-on;
>-	regulator-min-microvolt =3D <1000000>;
>-	regulator-max-microvolt =3D <1400000>;
>-	regulator-name =3D "vdd-int-dll";
>-};
>-
>-&reg_ldo1 {
>-	regulator-name =3D "vdd-rtc";
>-};
>-
>-&reg_ldo2 {
>-	regulator-always-on;
>-	regulator-min-microvolt =3D <3000000>;
>-	regulator-max-microvolt =3D <3000000>;
>-	regulator-name =3D "avcc";
>-};
>-
>-&reg_usb0_vbus {
>-	status =3D "okay";
>-};
>-
>-&reg_usb1_vbus {
>-	status =3D "okay";
>-};
>-
>-&reg_usb2_vbus {
>-	status =3D "okay";
>-};
>-
>-&spi0 {
>-	pinctrl-names =3D "default";
>-	pinctrl-0 =3D <&spi0_pins_a>,
>-		    <&spi0_cs0_pins_a>,
>-		    <&spi0_cs1_pins_a>;
>-	status =3D "okay";
>-};
>-
>-&uart0 {
>-	pinctrl-names =3D "default";
>-	pinctrl-0 =3D <&uart0_pins_a>;
>-	status =3D "okay";
>-};
>-
>-&uart3 {
>-	pinctrl-names =3D "default";
>-	pinctrl-0 =3D <&uart3_pins_b>;
>-	status =3D "okay";
>-};
>-
>-&uart7 {
>-	pinctrl-names =3D "default";
>-	pinctrl-0 =3D <&uart7_pins_a>;
>-	status =3D "okay";
>-};
>-
>-&usb_otg {
>-	dr_mode =3D "otg";
>-	status =3D "okay";
>-};
>-
>-&usb_power_supply {
>-	status =3D "okay";
>-};
>-
>-&usbphy {
>-	pinctrl-names =3D "default";
>-	pinctrl-0 =3D <&usb0_id_detect_pin>;
>-	usb0_id_det-gpio =3D <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
>-	usb0_vbus_power-supply =3D <&usb_power_supply>;
>-	usb0_vbus-supply =3D <&reg_usb0_vbus>;
>-	usb1_vbus-supply =3D <&reg_usb1_vbus>;
>-	usb2_vbus-supply =3D <&reg_usb2_vbus>;
>-	status =3D "okay";
>-};

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
