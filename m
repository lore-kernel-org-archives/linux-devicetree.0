From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH v2 2/2] ARM: dts: imx6: Add support for Toradex Ixora carrier board
Date: Tue,  5 Jan 2016 17:39:02 +0100
Message-ID: <1452011942-11940-3-git-send-email-marcel.ziswiler@toradex.com>
References: <1452011942-11940-1-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452011942-11940-1-git-send-email-marcel.ziswiler@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Lucas Stach <l.stach@pengutronix.de>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, Shawn Guo <shawn.guo@linaro.org>, Fabio Estevam <festevam@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stefan Agner <stefan@agner.ch>, Joshua Clayton <stillcompiling@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

=46rom: Petr =C5=A0tetiar <ynezz@true.cz>

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---

Changes in v2: None

 arch/arm/boot/dts/Makefile               |   1 +
 arch/arm/boot/dts/imx6q-apalis-ixora.dts | 256 +++++++++++++++++++++++=
++++++++
 2 files changed, 257 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6q-apalis-ixora.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 44508dc..29b1aae 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -315,6 +315,7 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
 	imx6dl-udoo.dtb \
 	imx6dl-wandboard.dtb \
 	imx6dl-wandboard-revb1.dtb \
+	imx6q-apalis-ixora.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-cm-fx6.dtb \
diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora.dts b/arch/arm/boot/d=
ts/imx6q-apalis-ixora.dts
new file mode 100644
index 0000000..5494a13
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
@@ -0,0 +1,256 @@
+/*
+ * Copyright 2014-2016 Toradex AG
+ * Copyright 2012 Freescale Semiconductor, Inc.
+ * Copyright 2011 Linaro Ltd.
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
+ *
+ *     This file is distributed in the hope that it will be useful
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "imx6q.dtsi"
+#include "imx6qdl-apalis.dtsi"
+
+/ {
+	model =3D "Toradex Apalis iMX6Q/D Module on Ixora Carrier Board";
+	compatible =3D "toradex,apalis_imx6q-ixora", "toradex,apalis_imx6q",
+		     "fsl,imx6q";
+
+	aliases {
+		i2c0 =3D &i2cddc;
+		i2c1 =3D &i2c1;
+		i2c2 =3D &i2c2;
+		i2c3 =3D &i2c3;
+	};
+
+	aliases {
+		rtc0 =3D &rtc_i2c;
+		rtc1 =3D "/soc/aips-bus@02000000/snvs@020cc000/snvs-rtc-lp@34";
+	};
+
+	gpio-keys {
+		compatible =3D "gpio-keys";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_gpio_keys>;
+
+		wakeup {
+			label =3D "Wake-Up";
+			gpios =3D <&gpio1 4 GPIO_ACTIVE_LOW>;
+			linux,code =3D <KEY_WAKEUP>;
+			debounce-interval =3D <10>;
+			gpio-key,wakeup;
+		};
+	};
+
+	leds {
+		compatible =3D "gpio-leds";
+
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_leds_ixora>;
+
+		led4-green {
+			label =3D "LED_4_GREEN";
+			gpios =3D <&gpio1 17 GPIO_ACTIVE_HIGH>;
+		};
+
+		led4-red {
+			label =3D "LED_4_RED";
+			gpios =3D <&gpio1 21 GPIO_ACTIVE_HIGH>;
+		};
+
+		led5-green {
+			label =3D "LED_5_GREEN";
+			gpios =3D <&gpio2 1 GPIO_ACTIVE_HIGH>;
+		};
+
+		led5-red {
+			label =3D "LED_5_RED";
+			gpios =3D <&gpio2 2 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	pwmleds {
+		compatible =3D "pwm-leds";
+		ledpwm1 {
+			label =3D "PWM1";
+			pwms =3D <&pwm1 0 50000>;
+			max-brightness =3D <255>;
+		};
+
+		ledpwm2 {
+			label =3D "PWM2";
+			pwms =3D <&pwm2 0 50000>;
+			max-brightness =3D <255>;
+		};
+
+		ledpwm3 {
+			label =3D "PWM3";
+			pwms =3D <&pwm3 0 50000>;
+			max-brightness =3D <255>;
+		};
+	};
+
+	regulators {
+		reg_usb_otg_vbus: usb_otg_vbus {
+			status =3D "okay";
+		};
+
+		reg_usb_host_vbus: usb_host_vbus {
+			status =3D "okay";
+		};
+	};
+};
+
+&backlight {
+	brightness-levels =3D <0 127 191 223 239 247 251 255>;
+	default-brightness-level =3D <1>;
+	status =3D "okay";
+};
+
+&can1 {
+	status =3D "okay";
+};
+
+&can2 {
+	status =3D "okay";
+};
+
+/* GEN1_I2C: I2C1_SDA/SCL on MXM3 209/211 (e.g. RTC on carrier board) =
*/
+&i2c1 {
+	status =3D "okay";
+
+	cat24c02@50 {
+		compatible =3D "atmel,24c02";
+		reg =3D <0x50>;
+	};
+
+	/* M41T0M6 real time clock on carrier board */
+	rtc_i2c: rtc@68 {
+		compatible =3D "st,m41t00";
+		reg =3D <0x68>;
+	};
+};
+
+&iomuxc {
+	/*
+	 * Mux the Apalis GPIOs, GPIO7 used for PCIe reset,
+	 * GPIO5, 6 used by optional fusion_F0710A kernel module
+	 */
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_apalis_gpio1 &pinctrl_apalis_gpio2
+		     &pinctrl_apalis_gpio3 &pinctrl_apalis_gpio4
+		     &pinctrl_apalis_gpio5 &pinctrl_apalis_gpio6
+		     &pinctrl_apalis_gpio7 &pinctrl_apalis_gpio8>;
+
+	leds_ixora {
+		pinctrl_leds_ixora: leds-ixora {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD1_DAT1__GPIO1_IO17 PAD_CTRL_HYS_PU
+				MX6QDL_PAD_SD1_DAT3__GPIO1_IO21 PAD_CTRL_HYS_PU
+				MX6QDL_PAD_NANDF_D1__GPIO2_IO01 PAD_CTRL_HYS_PU
+				MX6QDL_PAD_NANDF_D2__GPIO2_IO02 PAD_CTRL_HYS_PU
+			>;
+		};
+	};
+};
+
+&pcie {
+	/* active-low meaning opposite of regular PERST# active-low polarity =
*/
+	reset-gpio =3D <&gpio1 28 GPIO_ACTIVE_LOW>;
+	status =3D "okay";
+};
+
+&pwm1 {
+	status =3D "okay";
+};
+
+&pwm2 {
+	status =3D "okay";
+};
+
+&pwm3 {
+	status =3D "okay";
+};
+
+&pwm4 {
+	status =3D "okay";
+};
+
+&sata {
+	status =3D "okay";
+};
+
+&sound_spdif {
+	status =3D "okay";
+};
+
+&spdif {
+	status =3D "okay";
+};
+
+&uart1 {
+	status =3D "okay";
+};
+
+&uart2 {
+	status =3D "okay";
+};
+
+&uart4 {
+	status =3D "okay";
+};
+
+&uart5 {
+	status =3D "okay";
+};
+
+&usbh1 {
+	status =3D "okay";
+};
+
+&usbotg {
+	status =3D "okay";
+};
+
+/* SD1 */
+&usdhc2 {
+	status =3D "okay";
+};
--=20
2.5.0
