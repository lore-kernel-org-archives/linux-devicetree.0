From: Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: [PATCH V2 3/3] ARM: dts: sabreauto: Add flexcan support
Date: Tue, 30 Oct 2018 08:42:47 +0000
Message-ID: <20181030083954.26440-4-qiangqing.zhang@nxp.com>
References: <20181030083954.26440-1-qiangqing.zhang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030083954.26440-1-qiangqing.zhang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "A.s. Dong" <aisheng.dong@nxp.com>, Joakim Zhang <qiangqing.zhang@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Dong Aisheng <aisheng.dong@nxp.com>

The flexcan1 is pin conflict with fec. So we add a new dts file with
flexcan1 enabled with fec disabled for user to use.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
---
 .../boot/dts/imx6dl-sabreauto-flexcan1.dts    | 14 ++++++
 .../arm/boot/dts/imx6q-sabreauto-flexcan1.dts | 14 ++++++
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi      | 47 +++++++++++++++++++
 3 files changed, 75 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-sabreauto-flexcan1.dts
 create mode 100644 arch/arm/boot/dts/imx6q-sabreauto-flexcan1.dts

diff --git a/arch/arm/boot/dts/imx6dl-sabreauto-flexcan1.dts b/arch/arm/boo=
t/dts/imx6dl-sabreauto-flexcan1.dts
new file mode 100644
index 000000000000..4ebcc283f549
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-sabreauto-flexcan1.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2013 Freescale Semiconductor, Inc.
+
+#include "imx6dl-sabreauto.dts"
+
+&can1{
+	status =3D "okay";
+};
+
+&fec {
+	/* pin conflict with flexcan1 */
+	status =3D "disabled";
+};
diff --git a/arch/arm/boot/dts/imx6q-sabreauto-flexcan1.dts b/arch/arm/boot=
/dts/imx6q-sabreauto-flexcan1.dts
new file mode 100644
index 000000000000..e7e684656f09
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-sabreauto-flexcan1.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2013 Freescale Semiconductor, Inc.
+
+#include "imx6q-sabreauto.dts"
+
+&can1{
+	status =3D "okay";
+};
+
+&fec {
+	/* pin conflict with flexcan1 */
+	status =3D "disabled";
+};
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
