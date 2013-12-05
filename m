From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] Add support for the eukrea-cpuimx28.
Date: Thu,  5 Dec 2013 14:28:06 +0100
Message-ID: <1386250086-4666-3-git-send-email-denis@eukrea.com>
References: <1386250086-4666-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386250086-4666-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=46rom: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>

The following devices/functionalities were tested:
 * Main UART.
 * Ethernet0.
 * Ethernet1.
 * SD.
 * USB host.
 * USB otg.
 * Display(and its backlight).
 * Touchscreen.
 * Audio.
 * nand.
 * i2c and the pcf8563 device.
 * The gpio buttons.
 * The gpio leds.
 * Watchdog

Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                   |    2 +
 arch/arm/boot/dts/imx28-eukrea-mbmx283lc.dts |   71 ++++++
 arch/arm/boot/dts/imx28-eukrea-mbmx287lc.dts |   50 ++++
 arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi |  326 ++++++++++++++++++=
++++++++
 arch/arm/mach-mxs/mach-mxs.c                 |    8 +
 5 files changed, 457 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx28-eukrea-mbmx283lc.dts
 create mode 100644 arch/arm/boot/dts/imx28-eukrea-mbmx287lc.dts
 create mode 100644 arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b14bb11..dec6e93 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -178,6 +178,8 @@ dtb-$(CONFIG_ARCH_MXS) +=3D imx23-evk.dtb \
 	imx28-cfa10057.dtb \
 	imx28-cfa10058.dtb \
 	imx28-duckbill.dtb \
+	imx28-eukrea-mbmx283lc.dtb \
+	imx28-eukrea-mbmx287lc.dtb \
 	imx28-evk.dtb \
 	imx28-m28cu3.dtb \
 	imx28-m28evk.dtb \
diff --git a/arch/arm/boot/dts/imx28-eukrea-mbmx283lc.dts b/arch/arm/bo=
ot/dts/imx28-eukrea-mbmx283lc.dts
new file mode 100644
index 0000000..7c1572c
--- /dev/null
+++ b/arch/arm/boot/dts/imx28-eukrea-mbmx283lc.dts
@@ -0,0 +1,71 @@
+/*
+ * Copyright 2013 Eukr=C3=A9a Electromatique <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
+ * Copyright 2013 Eukr=C3=A9a Electromatique <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/*
+ * Module contains : i.MX282 + 64MB DDR2 + NAND + Ethernet PHY + RTC
+ */
+
+/dts-v1/;
+#include "imx28-eukrea-mbmx28lc.dtsi"
+
+/ {
+	model =3D "Eukrea Electromatique MBMX283LC";
+	compatible =3D "eukrea,mbmx283lc", "eukrea,mbmx28lc", "fsl,imx28";
+
+	memory {
+		reg =3D <0x40000000 0x04000000>;
+	};
+};
+
+&gpmi {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&gpmi_pins_a>;
+	status =3D "okay";
+};
+
+&i2c0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&i2c0_pins_a>;
+	status =3D "okay";
+
+	pcf8563: rtc@51 {
+		compatible =3D "nxp,pcf8563";
+		reg =3D <0x51>;
+	};
+};
+
+
+&mac0 {
+	phy-mode =3D "rmii";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&mac0_pins_a>;
+	phy-reset-gpios =3D <&gpio4 13 GPIO_ACTIVE_LOW>;
+	status =3D "okay";
+};
+
+&pinctrl{
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&hog_pins_cpuimx283>;
+
+	hog_pins_cpuimx283: hog-cpuimx283@0 {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_ENET0_RX_CLK__GPIO_4_13
+			MX28_PAD_ENET0_TX_CLK__GPIO_4_5
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_ENABLE>;
+	};
+};
diff --git a/arch/arm/boot/dts/imx28-eukrea-mbmx287lc.dts b/arch/arm/bo=
ot/dts/imx28-eukrea-mbmx287lc.dts
new file mode 100644
index 0000000..e773144
--- /dev/null
+++ b/arch/arm/boot/dts/imx28-eukrea-mbmx287lc.dts
@@ -0,0 +1,50 @@
+/*
+ * Copyright 2013 Eukr=C3=A9a Electromatique <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
+ * Copyright 2013 Eukr=C3=A9a Electromatique <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/*
+ * Module contains : i.MX287 + 128MB DDR2 + NAND + 2 x Ethernet PHY + =
RTC
+ */
+
+#include "imx28-eukrea-mbmx283lc.dts"
+
+/ {
+	model =3D "Eukrea Electromatique MBMX287LC";
+	compatible =3D "eukrea,mbmx287lc", "eukrea,mbmx283lc", "eukrea,mbmx28=
lc", "fsl,imx28";
+
+	memory {
+		reg =3D <0x40000000 0x08000000>;
+	};
+};
+
+&mac1 {
+	phy-mode =3D "rmii";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&mac1_pins_a>;
+	phy-reset-gpios =3D <&gpio3 27 GPIO_ACTIVE_HIGH>;
+	status =3D "okay";
+};
+
+&pinctrl {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&hog_pins_cpuimx283 &hog_pins_cpuimx287>;
+	hog_pins_cpuimx287: hog-cpuimx287@0 {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_SPDIF__GPIO_3_27
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_ENABLE>;
+	};
+};
diff --git a/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi b/arch/arm/bo=
ot/dts/imx28-eukrea-mbmx28lc.dtsi
new file mode 100644
index 0000000..927b391
--- /dev/null
+++ b/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi
@@ -0,0 +1,326 @@
+/*
+ * Copyright 2013 Eukr=C3=A9a Electromatique <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
+ * Copyright 2013 Eukr=C3=A9a Electromatique <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "imx28.dtsi"
+
+/ {
+	model =3D "Eukrea Electromatique MBMX28LC";
+	compatible =3D "eukrea,mbmx28lc", "fsl,imx28";
+
+	backlight {
+		compatible =3D "pwm-backlight";
+		pwms =3D <&pwm 4 1000000>;
+		brightness-levels =3D <0 25 50 75 100 125 150 175 200 225 255>;
+		default-brightness-level =3D <10>;
+	};
+
+	button-sw3 {
+		compatible =3D "gpio-keys";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&gpio_button_sw3_pins_mbmx28lc>;
+
+		sw3 {
+			label =3D "SW3";
+			gpios =3D <&gpio1 21 GPIO_ACTIVE_LOW>;
+			linux,code =3D <BTN_MISC>;
+			gpio-key,wakeup;
+		};
+	};
+
+	button-sw4 {
+		compatible =3D "gpio-keys";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&gpio_button_sw4_pins_mbmx28lc>;
+
+		sw4 {
+			label =3D "SW4";
+			gpios =3D <&gpio1 20 GPIO_ACTIVE_LOW>;
+			linux,code =3D <BTN_MISC>;
+			gpio-key,wakeup;
+		};
+	};
+
+	led-d6 {
+		compatible =3D "gpio-leds";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&led_d6_pins_mbmx28lc>;
+
+		led1 {
+			label =3D "d6";
+			gpios =3D <&gpio1 23 GPIO_ACTIVE_LOW>;
+			linux,default-trigger =3D "heartbeat";
+		};
+	};
+
+	led-d7 {
+		compatible =3D "gpio-leds";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&led_d7_pins_mbmx28lc>;
+
+		led1 {
+			label =3D "d7";
+			gpios =3D <&gpio1 22 GPIO_ACTIVE_LOW>;
+			linux,default-trigger =3D "default-on";
+		};
+	};
+
+	regulators {
+		compatible =3D "simple-bus";
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		reg_3p3v: regulator@0 {
+			compatible =3D "regulator-fixed";
+			regulator-name =3D "3P3V";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			regulator-always-on;
+		};
+
+		reg_lcd_3v3: regulator@1 {
+			compatible =3D "regulator-fixed";
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&reg_lcd_3v3_pins_mbmx28lc>;
+			regulator-name =3D "lcd-3v3";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			gpio =3D <&gpio3 30 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		reg_usb0_vbus: regulator@2 {
+			compatible =3D "regulator-fixed";
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&reg_usb0_vbus_pins_mbmx28lc>;
+			regulator-name =3D "usb0_vbus";
+			regulator-min-microvolt =3D <5000000>;
+			regulator-max-microvolt =3D <5000000>;
+			gpio =3D <&gpio1 18 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		reg_usb1_vbus: regulator@3 {
+			compatible =3D "regulator-fixed";
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&reg_usb1_vbus_pins_mbmx28lc>;
+			regulator-name =3D "usb1_vbus";
+			regulator-min-microvolt =3D <5000000>;
+			regulator-max-microvolt =3D <5000000>;
+			gpio =3D <&gpio1 19 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+	};
+
+	sound {
+		compatible =3D "fsl,imx28-mbmx28lc-sgtl5000",
+			     "fsl,mxs-audio-sgtl5000";
+		model =3D "imx28-mbmx28lc-sgtl5000";
+		saif-controllers =3D <&saif0 &saif1>;
+		audio-codec =3D <&sgtl5000>;
+	};
+};
+
+&duart {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&duart_4pins_a>;
+	status =3D "okay";
+};
+
+&i2c0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&i2c0_pins_a>;
+	status =3D "okay";
+
+	sgtl5000: codec@0a {
+		compatible =3D "fsl,sgtl5000";
+		reg =3D <0x0a>;
+		VDDA-supply =3D <&reg_3p3v>;
+		VDDIO-supply =3D <&reg_3p3v>;
+		clocks =3D <&saif0>;
+	};
+};
+
+&lcdif {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&lcdif_18bit_pins_a &lcdif_pins_mbmx28lc>;
+	lcd-supply =3D <&reg_lcd_3v3>;
+	display =3D <&display0>;
+	status =3D "okay";
+
+	display0: display0 {
+		model =3D "43WVF1G-0";
+		bits-per-pixel =3D <16>;
+		bus-width =3D <18>;
+
+		display-timings {
+			native-mode =3D <&timing0>;
+			timing0: timing0 {
+				clock-frequency =3D <9072000>;
+				hactive =3D <480>;
+				vactive =3D <272>;
+				hback-porch =3D <10>;
+				hfront-porch =3D <5>;
+				vback-porch =3D <8>;
+				vfront-porch =3D <8>;
+				hsync-len =3D <40>;
+				vsync-len =3D <10>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
+			};
+		};
+	};
+};
+
+&lradc {
+	fsl,lradc-touchscreen-wires =3D <4>;
+	status =3D "okay";
+};
+
+&pinctrl {
+	gpio_button_sw3_pins_mbmx28lc: gpio-button-sw3-mbmx28lc@0 {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_LCD_D21__GPIO_1_21
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+	gpio_button_sw4_pins_mbmx28lc: gpio-button-sw4-mbmx28lc@0 {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_LCD_D20__GPIO_1_20
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+	lcdif_pins_mbmx28lc: lcdif-mbmx28lc@0 {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_LCD_VSYNC__LCD_VSYNC
+			MX28_PAD_LCD_HSYNC__LCD_HSYNC
+			MX28_PAD_LCD_DOTCLK__LCD_DOTCLK
+			MX28_PAD_LCD_ENABLE__LCD_ENABLE
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+	led_d6_pins_mbmx28lc: led-d6-mbmx28lc@0 {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_LCD_D23__GPIO_1_23
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+	led_d7_pins_mbmx28lc: led-d7-mbmx28lc@0 {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_LCD_D22__GPIO_1_22
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+	reg_lcd_3v3_pins_mbmx28lc: lcd-3v3-mbmx28lc@0 {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_LCD_RESET__GPIO_3_30
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+	reg_usb0_vbus_pins_mbmx28lc: reg-usb0-vbus-mbmx28lc@0 {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_LCD_D18__GPIO_1_18
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
+	reg_usb1_vbus_pins_mbmx28lc: reg-usb1-vbus-mbmx28lc@0 {
+		reg =3D <0>;
+		fsl,pinmux-ids =3D <
+			MX28_PAD_LCD_D19__GPIO_1_19
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_4mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+};
+
+&pwm {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pwm4_pins_a>;
+	status =3D "okay";
+};
+
+&saif0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&saif0_pins_a>;
+	status =3D "okay";
+};
+
+&saif1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&saif1_pins_a>;
+	fsl,saif-master =3D <&saif0>;
+	status =3D "okay";
+};
+
+&ssp0 {
+	compatible =3D "fsl,imx28-mmc";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&mmc0_4bit_pins_a &mmc0_cd_cfg &mmc0_sck_cfg>;
+	bus-width =3D <4>;
+	cd-inverted;
+	status =3D "okay";
+};
+
+&usb0 {
+	disable-over-current;
+	vbus-supply =3D <&reg_usb0_vbus>;
+	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&usb0_id_pins_b>;
+};
+
+&usb1 {
+	vbus-supply =3D <&reg_usb1_vbus>;
+	status =3D "okay";
+};
+
+&usbphy0 {
+	status =3D "okay";
+};
+
+&usbphy1 {
+	status =3D "okay";
+};
diff --git a/arch/arm/mach-mxs/mach-mxs.c b/arch/arm/mach-mxs/mach-mxs.=
c
index 02b17f7..3b5f57e 100644
--- a/arch/arm/mach-mxs/mach-mxs.c
+++ b/arch/arm/mach-mxs/mach-mxs.c
@@ -448,6 +448,12 @@ static int __init mxs_restart_init(void)
 	return 0;
 }
=20
+static void __init eukrea_mbmx283lc_init(void)
+{
+	enable_clk_enet_out();
+	mxs_saif_clkmux_select(MXS_DIGCTL_SAIF_CLKMUX_EXTMSTR0);
+}
+
 static void __init mxs_machine_init(void)
 {
 	struct device_node *root;
@@ -486,6 +492,8 @@ static void __init mxs_machine_init(void)
 		apx4devkit_init();
 	else if (of_machine_is_compatible("crystalfontz,cfa10036"))
 		crystalfontz_init();
+	else if (of_machine_is_compatible("eukrea,mbmx283lc"))
+		eukrea_mbmx283lc_init();
 	else if (of_machine_is_compatible("i2se,duckbill"))
 		duckbill_init();
 	else if (of_machine_is_compatible("msr,m28cu3"))
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
