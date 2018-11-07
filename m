From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] ARM: dts: imx7d-sdb: add rev-a board support
Date: Wed, 7 Nov 2018 05:18:47 +0000
Message-ID: <1541567625-11812-1-git-send-email-Anson.Huang@nxp.com>
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
 arch/arm/boot/dts/Makefile           |  1 +
 arch/arm/boot/dts/imx7d-sdb-reva.dts | 40 ++++++++++++++++++++++++++++++++=
++++
 arch/arm/boot/dts/imx7d-sdb.dts      | 21 ++++++++++++++++---
 3 files changed, 59 insertions(+), 3 deletions(-)
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
index 0000000..c57c13d
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
+		gpio =3D <&gpio4 7 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&fec2 {
+	pinctrl-0 =3D <&pinctrl_enet2>;
+	/delete-property/pinctrl-assert-gpios;
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
+				MX7D_PAD_UART3_CTS_B__GPIO4_IO7		0x14
+				MX7D_PAD_ECSPI2_SS0__GPIO4_IO23		0x34  /* bt reg on */
+			>;
+		};
+	};
+};
+
+&iomuxc_lpsr {
+	/delete-property/pinctrl-names;
+	/delete-property/pinctrl-0;
+};
diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.=
dts
index f1bafda..b89d9f6 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -73,7 +73,7 @@
 		regulator-name =3D "usb_otg2_vbus";
 		regulator-min-microvolt =3D <5000000>;
 		regulator-max-microvolt =3D <5000000>;
-		gpio =3D <&gpio4 7 GPIO_ACTIVE_HIGH>;
+		gpio =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
=20
@@ -203,7 +203,8 @@
=20
 &fec2 {
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_enet2>;
+	pinctrl-0 =3D <&pinctrl_enet2 &pinctrl_enet2_epdc0_en>;
+	pinctrl-assert-gpios =3D <&gpio1 4 GPIO_ACTIVE_LOW>;
 	assigned-clocks =3D <&clks IMX7D_ENET2_TIME_ROOT_SRC>,
 			  <&clks IMX7D_ENET2_TIME_ROOT_CLK>;
 	assigned-clock-parents =3D <&clks IMX7D_PLL_ENET_MAIN_100M_CLK>;
@@ -491,6 +492,12 @@
 			>;
 		};
=20
+		pinctrl_enet2_epdc0_en: enet2_epdc0_grp {
+			fsl,pins =3D <
+				MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x14
+			>;
+		};
+
 		pinctrl_flexcan2: flexcan2grp {
 			fsl,pins =3D <
 				MX7D_PAD_GPIO1_IO14__FLEXCAN2_RX	0x59
@@ -513,7 +520,6 @@
=20
 		pinctrl_hog: hoggrp {
 			fsl,pins =3D <
-				MX7D_PAD_UART3_CTS_B__GPIO4_IO7		0x14
 				MX7D_PAD_ECSPI2_SS0__GPIO4_IO23		0x34  /* bt reg on */
 			>;
 		};
@@ -724,6 +730,9 @@
 };
=20
 &iomuxc_lpsr {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_hog_2>;
+
 	pinctrl_wdog: wdoggrp {
 		fsl,pins =3D <
 			MX7D_PAD_LPSR_GPIO1_IO00__WDOG1_WDOG_B		0x74
@@ -735,4 +744,10 @@
 			MX7D_PAD_LPSR_GPIO1_IO01__PWM1_OUT		0x30
 		>;
 	};
+
+	pinctrl_hog_2: hoggrp-2 {
+		fsl,pins =3D <
+			MX7D_PAD_LPSR_GPIO1_IO07__GPIO1_IO7	  0x14
+		>;
+	};
 };
--=20
2.7.4
