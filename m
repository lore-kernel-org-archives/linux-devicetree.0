From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8][ 4/5] ARM: dts: Add support for the cpuimx35 board from Eukrea and its baseboard.
Date: Tue, 12 Nov 2013 12:24:18 +0100
Message-ID: <1384255459-15134-4-git-send-email-denis@eukrea.com>
References: <1384255459-15134-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384255459-15134-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The following devices/functionalities were added:
 * Main and secondary UARTs.
 * i2c and the pcf8563 device.
 * Ethernet.
 * NAND.
 * The BP1 button.
 * The LED.
 * Watchdog
 * SD.

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
Acked-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
ChangeLog v7->v8:
- The commit message was improved.
- The board specific iomuxc pins group configuration that were in imx35=
=2Edtsi were moved here.
- The rest of the patch was updated accordingly.

ChangeLog v6->v7:
- Added Grant Likely in the Cc list.
- Shortened the license.
- The tsc2007 pads were moved in another patch.

ChangeLog v5->v6:
- Shawn Guo was added in the Cc.
---
 arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi       |   58 +++++++++
 .../boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts  |  124 ++++++++++++=
++++++++
 2 files changed, 182 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi
 create mode 100644 arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.=
dts

diff --git a/arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi b/arch/arm/bo=
ot/dts/imx35-eukrea-cpuimx35.dtsi
new file mode 100644
index 0000000..3260678
--- /dev/null
+++ b/arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi
@@ -0,0 +1,58 @@
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
+#include "imx35.dtsi"
+
+/ {
+	model =3D "Eukrea CPUIMX35";
+	compatible =3D "eukrea,cpuimx35", "fsl,imx35";
+
+	memory {
+		reg =3D <0x80000000 0x8000000>; /* 128M */
+	};
+};
+
+&fec {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_fec>;
+	status =3D "okay";
+};
+
+&i2c1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c1>;
+	status =3D "okay";
+	pcf8563@51 {
+		compatible =3D "nxp,pcf8563";
+		reg =3D <0x51>;
+	};
+};
+
+&iomuxc {
+	imx35-eukrea {
+		pinctrl_fec: fecgrp {
+			fsl,pins =3D <MX35_FEC_PINGRP1>;
+		};
+
+		pinctrl_i2c1: i2c1grp {
+			fsl,pins =3D <MX35_I2C1_PINGRP1>;
+		};
+	};
+};
+
+&nfc {
+	nand-bus-width =3D <8>;
+	nand-ecc-mode =3D "hw";
+	nand-on-flash-bbt;
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts b/a=
rch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts
new file mode 100644
index 0000000..fe0f3fa
--- /dev/null
+++ b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts
@@ -0,0 +1,124 @@
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
+#include "imx35-eukrea-cpuimx35.dtsi"
+
+/ {
+	model =3D "Eukrea CPUIMX35";
+	compatible =3D "eukrea,mbimxsd35-baseboard", "eukrea,cpuimx35", "fsl,=
imx35";
+
+	gpio_keys {
+		compatible =3D "gpio-keys";
+
+		bp1 {
+			label =3D "BP1";
+			gpios =3D <&gpio3 25 1>;
+			linux,code =3D <256>;
+			gpio-key,wakeup;
+			linux,input-type =3D <1>;
+		};
+	};
+
+	leds {
+		compatible =3D "gpio-leds";
+
+		led1 {
+			label =3D "led1";
+			gpios =3D <&gpio3 29 1>;
+			linux,default-trigger =3D "heartbeat";
+		};
+	};
+};
+
+&audmux {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_audmux>;
+	status =3D "okay";
+};
+
+&esdhc1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_esdhc1>;
+	cd-gpios =3D <&gpio3 24 0>;
+	status =3D "okay";
+};
+
+&i2c1 {
+	tlv320aic23: codec@1a {
+		compatible =3D "ti,tlv320aic23";
+		reg =3D <0x1a>;
+	};
+};
+
+&iomuxc {
+        pinctrl-names =3D "default";
+        pinctrl-0 =3D <&pinctrl_hog>;
+
+	imx35-eukrea {
+		pinctrl_hog: hoggrp {
+			fsl,pins =3D <
+				MX35_PAD_LD18__GPIO3_24  0x80000000
+				MX35_PAD_LD19__GPIO3_25  0x80000000
+				MX35_PAD_LD23__GPIO3_29  0x80000000
+			>;
+		};
+
+		pinctrl_audmux: audmuxgrp {
+			fsl,pins =3D <MX35_AUDMUX_PINGRP1>;
+		};
+
+		pinctrl_esdhc1: esdhc1grp {
+			fsl,pins =3D <MX35_ESDHC1_PINGRP1>;
+		};
+
+		pinctrl_fec: fecgrp {
+			fsl,pins =3D <MX35_FEC_PINGRP1>;
+		};
+
+		pinctrl_i2c1: i2c1grp {
+			fsl,pins =3D <MX35_I2C1_PINGRP1>;
+		};
+
+		pinctrl_reg_lcd_3v3: reg_lcd_3v3 {
+			fsl,pins =3D <MX35_PAD_D3_CLS__GPIO1_4 0x80000000>;
+		};
+
+		pinctrl_uart1: uart1grp {
+			fsl,pins =3D <MX35_UART1_PINGRP1>;
+		};
+
+		pinctrl_uart2: uart2grp {
+			fsl,pins =3D <MX35_UART2_PINGRP1>;
+		};
+	};
+};
+
+&ssi1 {
+	fsl,mode =3D "i2s-slave";
+	status =3D "okay";
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
