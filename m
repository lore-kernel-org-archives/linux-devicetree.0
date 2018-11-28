Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr60078.outbound.protection.outlook.com ([40.107.6.78]:32245
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727519AbeK1WFz (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Nov 2018 17:05:55 -0500
From: Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: [PATCH V4 3/3] ARM: dts: imx6qdl-sabreauto: add flexcan support
Date: Wed, 28 Nov 2018 11:03:56 +0000
Message-ID: <20181128110138.587-4-qiangqing.zhang@nxp.com>
References: <20181128110138.587-1-qiangqing.zhang@nxp.com>
In-Reply-To: <20181128110138.587-1-qiangqing.zhang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "mkl@pengutronix.de" <mkl@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Aisheng DONG <aisheng.dong@nxp.com>, Joakim Zhang <qiangqing.zhang@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Aisheng Dong <aisheng.dong@nxp.com>

The flexcan1 is pin conflict with fec. User would make flexcan1 enabled
with fec disabled to use CAN.

Signed-off-by: Aisheng Dong <aisheng.dong@nxp.com>
Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
---
V1->V2:
	*using SPDX tag for new files and remove pinctrl-assert-gpios property.
V2->V3:
	*remove the new files due to a pile of DTS files for a single
	 development board with pin sharing among different devices not
	 maintained.
V3->V4:
	*remove pinctrl-assert-gpios proverty in V3.
---
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/i=
mx6qdl-sabreauto.dtsi
index a10f0ad0bfb1..c1111b972b46 100644
--- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
@@ -101,6 +101,25 @@
 		enable-active-high;
 	};
=20
+	reg_can_en: regulator-can-en {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "can-en";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		gpio =3D <&max7310_b 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_can_stby: regulator-can-stby {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "can-stby";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		gpio =3D <&max7310_b 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply =3D <&reg_can_en>;
+	};
+
 	sound-cs42888 {
 		compatible =3D "fsl,imx6-sabreauto-cs42888",
 			"fsl,imx-audio-cs42888";
@@ -279,6 +298,20 @@
 	status =3D "okay";
 };
=20
+&can1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_flexcan1>;
+	xceiver-supply =3D <&reg_can_stby>;
+	status =3D "disabled"; /* pin conflict with fec */
+};
+
+&can2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_flexcan2>;
+	xceiver-supply =3D <&reg_can_stby>;
+	status =3D "okay";
+};
+
 &gpmi {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
@@ -494,6 +527,20 @@
 			>;
 		};
=20
+		pinctrl_flexcan1: flexcan1grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX        0x17059
+				MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x17059
+			>;
+		};
+
+		pinctrl_flexcan2: flexcan2grp {
+			fsl,pins =3D <
+				MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX	0x17059
+				MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX	0x17059
+			>;
+		};
+
 		pinctrl_gpio_keys: gpiokeysgrp {
 			fsl,pins =3D <
 				MX6QDL_PAD_SD2_CMD__GPIO1_IO11		0x1b0b0
--=20
2.17.1
