From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V3] ARM: dts: imx7d-sdb: add rev-a board support
Date: Tue, 20 Nov 2018 01:35:34 +0000
Message-ID: <1542677411-27825-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Current imx7d-sdb.dts has some incorrect settings about
Rev-A and Rev-B boards, some of the settings are based on
Rev-A board but some are based on Rev-B board, clean up it
by adding i.MX7D SDB Rev-A board support, make default
imx7d-sdb.dts for Rev-B board as usual, and introduce
imx7d-sdb-reva.dts for Rev-A board. Below are the affected
differences of Rev-A and Rev-B board:

                Rev-A           Rev-B
USB_OTG2_PWR:   UART3_CTS_B     GPIO1_IO07
ENET_EN_B:      None            GPIO1_IO04
TP_INT_B:       EPDC_DATA13     EPDC_BDR1

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
changes since V2:
	use USB OTG2 VBUS fix regulator to reference GPIO pinctrl entry instead of=
 hog group.
 arch/arm/boot/dts/Makefile           |  1 +
 arch/arm/boot/dts/imx7d-sdb-reva.dts | 40 ++++++++++++++++++++++++++++++++=
++++
 arch/arm/boot/dts/imx7d-sdb.dts      | 28 +++++++++++++++++++++++--
 3 files changed, 67 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx7d-sdb-reva.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index ef9ffa4..6d133b9 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -572,6 +572,7 @@ dtb-$(CONFIG_SOC_IMX7D) +=3D \
 	imx7d-pico-pi.dtb \
 	imx7d-sbc-imx7.dtb \
 	imx7d-sdb.dtb \
+	imx7d-sdb-reva.dtb \
 	imx7d-sdb-sht11.dtb \
 	imx7s-colibri-eval-v3.dtb \
 	imx7s-warp.dtb
diff --git a/arch/arm/boot/dts/imx7d-sdb-reva.dts b/arch/arm/boot/dts/imx7d=
-sdb-reva.dts
new file mode 100644
index 0000000..7ce9d8c
--- /dev/null
+++ b/arch/arm/boot/dts/imx7d-sdb-reva.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+//
+// Copyright (C) 2015 Freescale Semiconductor, Inc.
+
+/dts-v1/;
+
+#include "imx7d-sdb.dts"
+
+/ {
+	reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
+		pinctrl-0 =3D <&pinctrl_usb_otg2_vbus_reg_reva>;
+		gpio =3D <&gpio4 7 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&fec2 {
+	/delete-property/phy-supply;
+};
+
+&iomuxc {
+	imx7d-sdb {
+		pinctrl_tsc2046_pendown: tsc2046_pendown {
+			fsl,pins =3D <
+				MX7D_PAD_EPDC_DATA13__GPIO2_IO13	0x59
+			>;
+		};
+
+		pinctrl_hog: hoggrp {
+			fsl,pins =3D <
+				MX7D_PAD_ECSPI2_SS0__GPIO4_IO23		0x34  /* bt reg on */
+			>;
+		};
+
+		pinctrl_usb_otg2_vbus_reg_reva: usbotg2vbusregrevagrp {
+			fsl,pins =3D <
+				MX7D_PAD_UART3_CTS_B__GPIO4_IO7		0x14
+			>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.=
dts
index b1b613b..202922e 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -72,9 +72,11 @@
 	reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		compatible =3D "regulator-fixed";
 		regulator-name =3D "usb_otg2_vbus";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_usb_otg2_vbus_reg>;
 		regulator-min-microvolt =3D <5000000>;
 		regulator-max-microvolt =3D <5000000>;
-		gpio =3D <&gpio4 7 GPIO_ACTIVE_HIGH>;
+		gpio =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
=20
@@ -115,6 +117,16 @@
 		gpio =3D <&gpio2 14 GPIO_ACTIVE_LOW>;
 	};
=20
+	reg_fec2_3v3: regulator-fec2-3v3 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "fec2-3v3";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_enet2_reg>;
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		gpio =3D <&gpio1 4 GPIO_ACTIVE_LOW>;
+	};
+
 	backlight: backlight {
 		compatible =3D "pwm-backlight";
 		pwms =3D <&pwm1 0 5000000 0>;
@@ -211,6 +223,7 @@
 	assigned-clock-rates =3D <0>, <100000000>;
 	phy-mode =3D "rgmii";
 	phy-handle =3D <&ethphy1>;
+	phy-supply =3D <&reg_fec2_3v3>;
 	fsl,magic-packet;
 	status =3D "okay";
 };
@@ -492,6 +505,12 @@
 			>;
 		};
=20
+		pinctrl_enet2_reg: enet2reggrp {
+			fsl,pins =3D <
+				MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x14
+			>;
+		};
+
 		pinctrl_flexcan2: flexcan2grp {
 			fsl,pins =3D <
 				MX7D_PAD_GPIO1_IO14__FLEXCAN2_RX	0x59
@@ -514,7 +533,6 @@
=20
 		pinctrl_hog: hoggrp {
 			fsl,pins =3D <
-				MX7D_PAD_UART3_CTS_B__GPIO4_IO7		0x14
 				MX7D_PAD_ECSPI2_SS0__GPIO4_IO23		0x34  /* bt reg on */
 			>;
 		};
@@ -736,4 +754,10 @@
 			MX7D_PAD_LPSR_GPIO1_IO01__PWM1_OUT		0x30
 		>;
 	};
+
+	pinctrl_usb_otg2_vbus_reg: usbotg2vbusreggrp {
+		fsl,pins =3D <
+			MX7D_PAD_LPSR_GPIO1_IO07__GPIO1_IO7	  0x14
+		>;
+	};
 };
--=20
2.7.4
