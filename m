From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2][ 2/2] ARM: dts: Add support for the cpuimx53 board from Eukrea and its baseboard.
Date: Fri,  6 Dec 2013 10:59:18 +0100
Message-ID: <1386323958-783-2-git-send-email-denis@eukrea.com>
References: <1386323958-783-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386323958-783-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The following devices/functionalities were added:
 * Main and secondary UARTs.
 * i2c and the pcf8563 device.
 * Ethernet.
 * NAND.
 * The BP1 button.
 * The LED.
 * Watchdog.
 * SD.
 * USB host.

Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
---
ChangeLog v1->v2:
- Added the board target in arch/arm/boot/dts/Makefile
- Fixed the gpios to now use the gpios defines.
- Fixed the button linux code to now use an input define.
- Fixed the regulator.
---
 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/imx53-eukrea-cpuimx53.dtsi       |   81 ++++++++++++=
++
 .../boot/dts/imx53-eukrea-mbimxsd53-baseboard.dts  |  112 ++++++++++++=
++++++++
 3 files changed, 194 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx53-eukrea-cpuimx53.dtsi
 create mode 100644 arch/arm/boot/dts/imx53-eukrea-mbimxsd53-baseboard.=
dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 648c016..89aec16 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -135,6 +135,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D \
 	imx51-babbage.dtb \
 	imx51-eukrea-mbimxsd51-baseboard.dtb \
 	imx53-ard.dtb \
+	imx53-eukrea-mbimxsd53-baseboard.dts \
 	imx53-evk.dtb \
 	imx53-m53evk.dtb \
 	imx53-mba53.dtb \
diff --git a/arch/arm/boot/dts/imx53-eukrea-cpuimx53.dtsi b/arch/arm/bo=
ot/dts/imx53-eukrea-cpuimx53.dtsi
new file mode 100644
index 0000000..bf0cf86
--- /dev/null
+++ b/arch/arm/boot/dts/imx53-eukrea-cpuimx53.dtsi
@@ -0,0 +1,81 @@
+/*
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
+#include "imx53.dtsi"
+
+/ {
+	model =3D "Eukrea CPUIMX53";
+	compatible =3D "eukrea,cpuimx53", "fsl,imx53";
+
+	memory {
+		reg =3D <0x70000000 0x20000000>; /* 512M */
+	};
+};
+
+&fec {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_fec>;
+	phy-reset-gpios =3D <&gpio2 30 GPIO_ACTIVE_LOW>;
+	phy-mode =3D "rmii";
+	status =3D "okay";
+};
+
+&i2c1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c1>;
+	status =3D "okay";
+
+	pcf8563@51 {
+		compatible =3D "nxp,pcf8563";
+		reg =3D <0x51>;
+	};
+};
+
+&iomuxc {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_hog>;
+
+	imx53-eukrea {
+		pinctrl_hog: hoggrp {
+			fsl,pins =3D <
+				MX53_PAD_EIM_EB2__GPIO2_30 0x1e4
+			>;
+		};
+
+		pinctrl_fec: fecgrp {
+			fsl,pins =3D <MX53_FEC_PINGRP1>;
+		};
+
+		pinctrl_i2c1: i2c1grp {
+			fsl,pins =3D <MX53_I2C1_PINGRP1>;
+		};
+
+		pinctrl_nand: nandgrp {
+			fsl,pins =3D <MX53_NAND_PINGRP1>;
+
+		};
+	};
+};
+
+&nfc {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_nand>;
+	nand-bus-width =3D <8>;
+	nand-ecc-mode =3D "hw";
+	status =3D "okay";
+};
+
+&usbh1 {
+	phy_type =3D "utmi";
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx53-eukrea-mbimxsd53-baseboard.dts b/a=
rch/arm/boot/dts/imx53-eukrea-mbimxsd53-baseboard.dts
new file mode 100644
index 0000000..39d4351
--- /dev/null
+++ b/arch/arm/boot/dts/imx53-eukrea-mbimxsd53-baseboard.dts
@@ -0,0 +1,112 @@
+/*
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
+/dts-v1/;
+#include "imx53-eukrea-cpuimx53.dtsi"
+
+/ {
+	model =3D "Eukrea MBIMX53SD";
+	compatible =3D "eukrea,mbimxsd53","eukrea,cpuimx53", "fsl,imx53";
+
+	gpio_keys {
+		compatible =3D "gpio-keys";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_gpiokeys>;
+
+		button-1 {
+			label =3D "BP1";
+			gpios =3D <&gpio4 14 GPIO_ACTIVE_LOW>;
+			linux,code =3D <BTN_MISC>;
+			gpio-key,wakeup;
+		};
+	};
+
+	leds {
+		compatible =3D "gpio-leds";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_gpioled>;
+
+		led1 {
+			label =3D "led1";
+			gpios =3D <&gpio4 15 GPIO_ACTIVE_LOW>;
+			linux,default-trigger =3D "heartbeat";
+		};
+	};
+
+	regulators {
+		compatible =3D "simple-bus";
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		reg_3p3v: regulator@0 {
+			reg =3D <0>;
+			compatible =3D "regulator-fixed";
+			regulator-name =3D "3P3V";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			regulator-always-on;
+		};
+	};
+};
+
+
+&esdhc1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_esdhc1 &pinctrl_esdhc1_cd>;
+	cd-gpios =3D <&gpio5 17 GPIO_ACTIVE_LOW>;
+	vqmmc-supply =3D <&reg_3p3v>;
+	vmmc-supply =3D <&reg_3p3v>;
+	status =3D "okay";
+};
+
+&iomuxc {
+	imx53-eukrea {
+		pinctrl_esdhc1: esdhc1 {
+			fsl,pins =3D <MX53_ESDHC1_PINGRP1>;
+		};
+
+		pinctrl_esdhc1_cd: esdhc1_cd {
+			fsl,pins =3D <MX53_PAD_DISP0_DAT23__GPIO5_17 0x80000000>;
+		};
+
+		pinctrl_gpiokeys: gpiokeysgrp {
+			fsl,pins =3D <MX53_PAD_KEY_COL4__GPIO4_14 0x80000000>;
+		};
+
+		pinctrl_gpioled: gpioledgrp {
+			fsl,pins =3D <MX53_PAD_KEY_ROW4__GPIO4_15 0x80000000>;
+		};
+
+		pinctrl_uart1: uart1grp {
+			fsl,pins =3D <MX53_UART1_PINGRP2>;
+		};
+
+		pinctrl_uart2: uart2grp {
+			fsl,pins =3D <MX53_UART2_PINGRP2>;
+		};
+	};
+};
+
+&uart1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart1>;
+	fsl,uart-has-rtscts;
+	status =3D "okay";
+};
+
+&uart2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart2>;
+	fsl,uart-has-rtscts;
+	status =3D "okay";
+};
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
