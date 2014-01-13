From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv11] ARM: dts: Add support for the cpuimx35 board from Eukrea and its baseboard.
Date: Mon, 13 Jan 2014 15:22:05 +0100
Message-ID: <1389622925-21628-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
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

Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Acked-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
ChangeLog v10->v11:
- The other patches in this serie have already been applied in the for-=
next branch
  in Shawn Guo's tree at git://git.linaro.org/people/shawnguo/linux-2.6=
=2Egit :
    4449d01 ARM i.MX35: build in pinctrl support.
    cd01fd4 ARM: imx_v6_v7_defconfig: Enable some drivers used on the c=
puimx35.
- Reordered the Cc list and dropped the Cc to the devicetree binding ma=
intainers.
- Moved the pins of the hoggrp inside their respective node, the bp1 an=
d led1 nodes
  were updated accordingly.
- The esdhc1's gpio was fixed: the card detect code will never uses the=
 gpio "active"
  high/low setting, instead it uses that GPIO as an IRQ.
- Cosmetic fixes in the uart pinctrl nodes.

ChangeLog v9->v10:
- Added Fabio Estevam To the Cc list

ChangeLog v8->v9:
- Added the dtb target into arch/arm/boot/dts/Makefile.
- Added a blank line before the pcf8563 node in the i2c1 node.
- Whitespace cleanups as requested by Shawn Guo.
- _' was used in label, it's now fixed (it has been replaced with '-').
- The recently introduced defines for input and gpios are now used.
- The uarts had the fsl,uart-has-rtscts property set, but they didn't u=
se=20
  any rts and cts pins in the uart pinctrl nodes.

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
 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi       |   59 +++++++++
 .../boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts  |  137 ++++++++++++=
++++++++
 3 files changed, 197 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi
 create mode 100644 arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.=
dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 059d280..d41edc7 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -143,6 +143,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D \
 	imx27-phytec-phycard-s-som.dtb \
 	imx27-phytec-phycard-s-rdk.dtb \
 	imx31-bug.dtb \
+	imx35-eukrea-mbimxsd35-baseboard.dtb \
 	imx50-evk.dtb \
 	imx51-apf51.dtb \
 	imx51-apf51dev.dtb \
diff --git a/arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi b/arch/arm/bo=
ot/dts/imx35-eukrea-cpuimx35.dtsi
new file mode 100644
index 0000000..303f789
--- /dev/null
+++ b/arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi
@@ -0,0 +1,59 @@
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
+
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
index 0000000..833bd1f
--- /dev/null
+++ b/arch/arm/boot/dts/imx35-eukrea-mbimxsd35-baseboard.dts
@@ -0,0 +1,137 @@
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
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
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
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_bp1>;
+			label =3D "BP1";
+			gpios =3D <&gpio3 25 GPIO_ACTIVE_LOW>;
+			linux,code =3D <BTN_MISC>;
+			gpio-key,wakeup;
+			linux,input-type =3D <1>;
+		};
+	};
+
+	leds {
+		compatible =3D "gpio-leds";
+
+		led1 {
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_led1>;
+			label =3D "led1";
+			gpios =3D <&gpio3 29 GPIO_ACTIVE_LOW>;
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
+	cd-gpios =3D <&gpio3 24>;
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
+	imx35-eukrea {
+		pinctrl_audmux: audmuxgrp {
+			fsl,pins =3D <MX35_AUDMUX_PINGRP1>;
+		};
+
+		pinctrl_bp1: bp1grp {
+			fsl,pins =3D <MX35_PAD_LD19__GPIO3_25  0x80000000>;
+		};
+
+		pinctrl_esdhc1: esdhc1grp {
+			fsl,pins =3D <
+				  MX35_ESDHC1_PINGRP1
+				  MX35_PAD_LD18__GPIO3_24  0x80000000 /* CD */
+			>;
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
+		pinctrl_led1: led1grp {
+			fsl,pins =3D <MX35_PAD_LD23__GPIO3_29  0x80000000>;
+		};
+
+		pinctrl_reg_lcd_3v3: reg-lcd-3v3 {
+			fsl,pins =3D <MX35_PAD_D3_CLS__GPIO1_4 0x80000000>;
+		};
+
+		pinctrl_uart1: uart1grp {
+			fsl,pins =3D <
+				MX35_UART1_PINGRP1
+				MX35_UART1_RTSCTS_PINGRP1
+			>;
+		};
+
+		pinctrl_uart2: uart2grp {
+			fsl,pins =3D <
+				MX35_UART2_PINGRP1
+				MX35_UART2_RTSCTS_PINGRP1
+			>;
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
