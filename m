From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: dts: sun7i: Add dts file for the Jesurun
 Q5 top set box
Date: Thu, 23 Apr 2015 14:16:17 +0200
Message-ID: <1429791377-9786-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDRZXY4CYYORBGGF4OUQKGQEQ6BPY7Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

The Jesurun Q5 has a black plastic casing with the approximate dimensions
of 100mm x 100mm x 24mm with rounded edges. In terms of hardware it
features an Allwinner A10 SoC with 1GB RAM and 8GB of NAND flash. The
external connectors are: 2x USB-A female supporting USB2.0, 3.5mm female
jack for audio, HDMI female, SPDIF, RJ45 LAN and Power. In addition the
device has 1x red LED (hard wired to power) and an programmable green led.
On the board there is also an unpopulated IR receiver and the UART.
The devices is equipped with an AXP209 PMU.

For more details see: http://linux-sunxi.org/Jesurun_Q5

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                 |   1 +
 arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts | 186 +++++++++++++++++++++++++=
++++
 2 files changed, 187 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 13de5d6..29883fe 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -518,6 +518,7 @@ dtb-$(CONFIG_MACH_SUN4I) +=3D \
 	sun4i-a10-hackberry.dtb \
 	sun4i-a10-hyundai-a7hd.dtb \
 	sun4i-a10-inet97fv2.dtb \
+	sun4i-a10-jesurun-q5.dtb \
 	sun4i-a10-marsboard.dtb \
 	sun4i-a10-mini-xplus.dtb \
 	sun4i-a10-mk802.dtb \
diff --git a/arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts b/arch/arm/boot/dts=
/sun4i-a10-jesurun-q5.dts
new file mode 100644
index 0000000..402df46
--- /dev/null
+++ b/arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts
@@ -0,0 +1,186 @@
+/*
+ * Copyright 2015 G=C3=A1bor Nyers
+ *
+ * G=C3=A1bor Nyers <gabor.nyers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
+#include "sun4i-a10.dtsi"
+#include "sunxi-common-regulators.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/sun4i-a10.h>
+
+/ {
+	model =3D "Jesurun Q5";
+	compatible =3D "jesurun,q5", "allwinner,sun4i-a10";
+
+	leds {
+		compatible =3D "gpio-leds";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&led_pins_q5>;
+
+		green {
+			label =3D "q5:green:usr";
+			gpios =3D <&pio 7 20 GPIO_ACTIVE_HIGH>;  /* PH20 */
+		};
+
+	};
+
+	reg_emac_3v3: emac-3v3 {
+		compatible =3D "regulator-fixed";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&emac_power_pin_q5>;
+		regulator-name =3D "emac-3v3";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		enable-active-high;
+		gpio =3D <&pio 7 19 GPIO_ACTIVE_HIGH>;   /* PH19 */
+	};
+};
+
+&ahci {
+	status =3D "okay";
+};
+
+&ehci0 {
+	status =3D "okay";
+};
+
+&ehci1 {
+	status =3D "okay";
+};
+
+&emac {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&emac_pins_a>;
+	phy =3D <&phy1>;
+	status =3D "okay";
+};
+
+&i2c0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&i2c0_pins_a>;
+	status =3D "okay";
+
+	axp209: pmic@34 {
+		compatible =3D "x-powers,axp209";
+		reg =3D <0x34>;
+		interrupts =3D <0>;
+
+		interrupt-controller;
+		#interrupt-cells =3D <1>;
+	};
+};
+
+&ir0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&ir0_pins_a>;
+	status =3D "okay";
+};
+
+&mdio {
+	phy-supply =3D <&reg_emac_3v3>;
+	status =3D "okay";
+
+	phy1: ethernet-phy@1 {
+		reg =3D <1>;
+	};
+};
+
+&mmc0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin_reference_design>;
+	vmmc-supply =3D <&reg_vcc3v3>;
+	bus-width =3D <4>;
+	cd-gpios =3D <&pio 7 1 GPIO_ACTIVE_HIGH>; /* PH1 */
+	cd-inverted;
+	status =3D "okay";
+};
+
+&ohci0 {
+	status =3D "okay";
+};
+
+&ohci1 {
+	status =3D "okay";
+};
+
+&pio {
+	emac_power_pin_q5: emac_power_pin@0 {
+		allwinner,pins =3D "PH19";
+		allwinner,function =3D "gpio_out";
+		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
+	};
+
+	led_pins_q5: led_pins@0 {
+		allwinner,pins =3D "PH20";
+		allwinner,function =3D "gpio_out";
+		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
+	};
+};
+
+&reg_usb1_vbus {
+	status =3D "okay";
+};
+
+&reg_usb2_vbus {
+	status =3D "okay";
+};
+
+&uart0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&uart0_pins_a>;
+	status =3D "okay";
+};
+
+&usbphy {
+	usb1_vbus-supply =3D <&reg_usb1_vbus>;
+	usb2_vbus-supply =3D <&reg_usb2_vbus>;
+	status =3D "okay";
+};
--=20
2.3.5

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
