Return-Path: <SRS0=so6l=OM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr10062.outbound.protection.outlook.com ([40.107.1.62]:25184
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725790AbeLCEe5 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 2 Dec 2018 23:34:57 -0500
From: Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: [PATCH] ARM: dts: imx6ul: add flexcan support
Date: Mon, 3 Dec 2018 04:34:50 +0000
Message-ID: <20181203043230.32385-1-qiangqing.zhang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "mkl@pengutronix.de" <mkl@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Aisheng DONG <aisheng.dong@nxp.com>, Joakim Zhang <qiangqing.zhang@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Aisheng Dong <aisheng.dong@nxp.com>

Add flexcan support for i.MX6UL and i.MX6ULL boards.

Signed-off-by: Aisheng Dong <aisheng.dong@nxp.com>
Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
---
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi | 54 +++++++++++++++++++++++++
 arch/arm/boot/dts/imx6ulz-14x14-evk.dts |  2 +
 arch/arm/boot/dts/imx6ulz.dtsi          |  2 -
 3 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/im=
x6ul-14x14-evk.dtsi
index 095568b30d30..ae29c059d627 100644
--- a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
+++ b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
@@ -30,6 +30,14 @@
 		enable-active-high;
 	};
=20
+	reg_can_3v3: regulator-can-3v3 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "can-3v3";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		gpios =3D <&gpio_spi 3 GPIO_ACTIVE_LOW>;
+	};
+
 	sound {
 		compatible =3D "simple-audio-card";
 		simple-audio-card,name =3D "mx6ul-wm8960";
@@ -64,6 +72,29 @@
 		};
 	};
=20
+	spi4 {
+		compatible =3D "spi-gpio";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_spi4>;
+		status =3D "okay";
+		gpio-sck =3D <&gpio5 11 0>;
+		gpio-mosi =3D <&gpio5 10 0>;
+		cs-gpios =3D <&gpio5 7 0>;
+		num-chipselects =3D <1>;
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		gpio_spi: gpio_spi@0 {
+			compatible =3D "fairchild,74hc595";
+			gpio-controller;
+			#gpio-cells =3D <2>;
+			reg =3D <0>;
+			registers-number =3D <1>;
+			registers-default =3D /bits/ 8 <0x57>;
+			spi-max-frequency =3D <100000>;
+		};
+	};
+
 	panel {
 		compatible =3D "innolux,at043tn24";
 		backlight =3D <&backlight_display>;
@@ -130,6 +161,20 @@
 	};
 };
=20
+&can1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_flexcan1>;
+	xceiver-supply =3D <&reg_can_3v3>;
+	status =3D "okay";
+};
+
+&can2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_flexcan2>;
+	xceiver-supply =3D <&reg_can_3v3>;
+	status =3D "okay";
+};
+
 &i2c1 {
 	clock-frequency =3D <100000>;
 	pinctrl-names =3D "default";
@@ -415,6 +460,15 @@
 		>;
 	};
=20
+	pinctrl_spi4: spi4grp {
+		fsl,pins =3D <
+			MX6UL_PAD_BOOT_MODE0__GPIO5_IO10	0x70a1
+			MX6UL_PAD_BOOT_MODE1__GPIO5_IO11	0x70a1
+			MX6UL_PAD_SNVS_TAMPER7__GPIO5_IO07	0x70a1
+			MX6UL_PAD_SNVS_TAMPER8__GPIO5_IO08	0x80000000
+		>;
+	};
+
 	pinctrl_tsc: tscgrp {
 		fsl,pins =3D <
 			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01		0xb0
diff --git a/arch/arm/boot/dts/imx6ulz-14x14-evk.dts b/arch/arm/boot/dts/im=
x6ulz-14x14-evk.dts
index 6f1af240e0ce..483d9732c002 100644
--- a/arch/arm/boot/dts/imx6ulz-14x14-evk.dts
+++ b/arch/arm/boot/dts/imx6ulz-14x14-evk.dts
@@ -9,6 +9,8 @@
=20
 /delete-node/ &fec1;
 /delete-node/ &fec2;
+/delete-node/ &can1;
+/delete-node/ &can2;
 /delete-node/ &lcdif;
 /delete-node/ &tsc;
=20
diff --git a/arch/arm/boot/dts/imx6ulz.dtsi b/arch/arm/boot/dts/imx6ulz.dts=
i
index ae6d7e593769..0b5f1a763567 100644
--- a/arch/arm/boot/dts/imx6ulz.dtsi
+++ b/arch/arm/boot/dts/imx6ulz.dtsi
@@ -20,8 +20,6 @@
 };
=20
 /delete-node/ &adc1;
-/delete-node/ &can1;
-/delete-node/ &can2;
 /delete-node/ &ecspi3;
 /delete-node/ &ecspi4;
 /delete-node/ &epit2;
--=20
2.17.1
