Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr60060.outbound.protection.outlook.com ([40.107.6.60]:51776
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727662AbeK1UkV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Nov 2018 15:40:21 -0500
From: Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: [PATCH V3 1/3] ARM: dts: imx6sx-sdb: add flexcan support
Date: Wed, 28 Nov 2018 09:39:17 +0000
Message-ID: <20181128093658.27990-2-qiangqing.zhang@nxp.com>
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

CAN transceiver is different on RevA and RevB board.
It's active high on RevA while active low on Rev B.

Signed-off-by: Aisheng Dong <aisheng.dong@nxp.com>
Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
---
ChangeLog:
V1->V2:
	*no change.
V2->V3:
	*use label node like:
	 &reg_can_en{
	     ...
	 };
---
 arch/arm/boot/dts/imx6sx-sdb-reva.dts | 12 ++++++++
 arch/arm/boot/dts/imx6sx-sdb.dts      |  5 ++++
 arch/arm/boot/dts/imx6sx-sdb.dtsi     | 42 +++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx-sdb-reva.dts b/arch/arm/boot/dts/imx6=
sx-sdb-reva.dts
index 9cc6ff206aea..82ca8d7c7b9d 100644
--- a/arch/arm/boot/dts/imx6sx-sdb-reva.dts
+++ b/arch/arm/boot/dts/imx6sx-sdb-reva.dts
@@ -142,3 +142,15 @@
 		spi-max-frequency =3D <66000000>;
 	};
 };
+
+&reg_can_en {
+	/* Transceiver EN/STBY is active high on RevA board */
+	gpio =3D <&gpio4 25 GPIO_ACTIVE_HIGH>;
+	enable-active-high;
+};
+
+&reg_can_stby {
+	gpio =3D <&gpio4 27 GPIO_ACTIVE_HIGH>;
+	enable-active-high;
+	vin-supply =3D <&reg_can_en>;
+};
diff --git a/arch/arm/boot/dts/imx6sx-sdb.dts b/arch/arm/boot/dts/imx6sx-sd=
b.dts
index 6dd9bebfe027..24a4b4eec29b 100644
--- a/arch/arm/boot/dts/imx6sx-sdb.dts
+++ b/arch/arm/boot/dts/imx6sx-sdb.dts
@@ -136,3 +136,8 @@
 &reg_soc {
 	vin-supply =3D <&sw1a_reg>;
 };
+
+&reg_can_stby {
+	/* Transceiver EN/STBY is active low on RevB board */
+	gpio =3D <&gpio4 27 GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm/boot/dts/imx6sx-sdb.dtsi b/arch/arm/boot/dts/imx6sx-s=
db.dtsi
index 7d7d679945d2..5506a8258816 100644
--- a/arch/arm/boot/dts/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/imx6sx-sdb.dtsi
@@ -140,6 +140,20 @@
 		regulator-max-microvolt =3D <5000000>;
 	};
=20
+	reg_can_en: regulator-can-en {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "can-en";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+	};
+
+	reg_can_stby: regulator-can-stby {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "can-stby";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+	};
+
 	sound {
 		compatible =3D "fsl,imx6sx-sdb-wm8962", "fsl,imx-audio-wm8962";
 		model =3D "wm8962-audio";
@@ -207,6 +221,20 @@
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
 &i2c3 {
 	clock-frequency =3D <100000>;
 	pinctrl-names =3D "default";
@@ -404,6 +432,20 @@
 			>;
 		};
=20
+		pinctrl_flexcan1: flexcan1grp {
+			fsl,pins =3D <
+				MX6SX_PAD_QSPI1B_DQS__CAN1_TX		0x1b020
+				MX6SX_PAD_QSPI1A_SS1_B__CAN1_RX		0x1b020
+			>;
+		};
+
+		pinctrl_flexcan2: flexcan2grp {
+			fsl,pins =3D <
+				MX6SX_PAD_QSPI1B_SS1_B__CAN2_RX		0x1b020
+				MX6SX_PAD_QSPI1A_DQS__CAN2_TX		0x1b020
+			>;
+		};
+
 		pinctrl_gpio_keys: gpio_keysgrp {
 			fsl,pins =3D <
 				MX6SX_PAD_CSI_DATA04__GPIO1_IO_18 0x17059
--=20
2.17.1
