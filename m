Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr30062.outbound.protection.outlook.com ([40.107.3.62]:4832
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727662AbeK1Uk0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Nov 2018 15:40:26 -0500
From: Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: [PATCH V3 2/3] ARM: dts: imx6sx-sabreauto: add flexcan support
Date: Wed, 28 Nov 2018 09:39:21 +0000
Message-ID: <20181128093658.27990-3-qiangqing.zhang@nxp.com>
References: <20181128093658.27990-1-qiangqing.zhang@nxp.com>
In-Reply-To: <20181128093658.27990-1-qiangqing.zhang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Aisheng DONG <aisheng.dong@nxp.com>, Joakim Zhang <qiangqing.zhang@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Aisheng Dong <aisheng.dong@nxp.com>

The CAN transceiver on MX6SX Sabreauto board seems in sleep mode by default
after power up the board. User has to press the wakeup key on ARD baseboard
before using the transceiver, or it may not work properly when power up the
board at the first time(warm reset does not have such issue).

This patch operates the wake pin too besides stby/en pins by chaining them
together in regulator mode.

Signed-off-by: Aisheng Dong <aisheng.dong@nxp.com>
Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
---
ChangeLog:
V1->V3:
	*no change.
---
 arch/arm/boot/dts/imx6sx-sabreauto.dts | 57 ++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx-sabreauto.dts b/arch/arm/boot/dts/imx=
6sx-sabreauto.dts
index 841a27f3198f..8f3319e7692f 100644
--- a/arch/arm/boot/dts/imx6sx-sabreauto.dts
+++ b/arch/arm/boot/dts/imx6sx-sabreauto.dts
@@ -36,6 +36,35 @@
 		gpio =3D <&gpio2 11 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	reg_can_wake: regulator-can-wake {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "can-wake";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		gpio =3D <&max7310_b 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_can_en: regulator-can-en {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "can-en";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		gpio =3D <&max7310_b 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply =3D <&reg_can_wake>;
+	};
+
+	reg_can_stby: regulator-can-stby {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "can-stby";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		gpio =3D <&max7310_b 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply =3D <&reg_can_en>;
+	};
 };
=20
 &anaclk2 {
@@ -75,6 +104,20 @@
 	status =3D "okay";
 };
=20
+&flexcan1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_flexcan1>;
+	xceiver-supply =3D <&reg_can_stby>;
+	status =3D "okay";
+};
+
+&flexcan2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_flexcan2>;
+	xceiver-supply =3D <&reg_can_stby>;
+	status =3D "okay";
+};
+
 &uart1 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&pinctrl_uart1>;
@@ -149,6 +192,20 @@
 		>;
 	};
=20
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins =3D <
+			MX6SX_PAD_QSPI1B_DQS__CAN1_TX   0x1b020
+			MX6SX_PAD_QSPI1A_SS1_B__CAN1_RX	0x1b020
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins =3D <
+			MX6SX_PAD_QSPI1B_SS1_B__CAN2_RX 0x1b020
+			MX6SX_PAD_QSPI1A_DQS__CAN2_TX	0x1b020
+		>;
+	};
+
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins =3D <
 			MX6SX_PAD_GPIO1_IO03__I2C2_SDA          0x4001b8b1
--=20
2.17.1
