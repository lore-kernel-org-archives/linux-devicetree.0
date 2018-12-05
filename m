From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 1/3] ARM: dts: imx6qdl-sabresd: add light sensor support
Date: Wed, 5 Dec 2018 09:19:48 +0000
Message-ID: <1544001240-18622-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add isl29023 light sensor support on i2c3 bus, the light
sensor's power is controlled by a fixed regulator, since
the isl29023 driver and most of other sensors on same
board like mag3110 and mma8451 do NOT support regulator
operation currently, they are all controlled by this
regulator, so this patch also adds the fixed regulator
support and make it always on.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 34 ++++++++++++++++++++++++++++++=
++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx=
6qdl-sabresd.dtsi
index d7389b5..f96ae54 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -62,6 +62,19 @@
 			gpio =3D <&gpio3 19 0>;
 			enable-active-high;
 		};
+
+		reg_sensor: regulator@4 {
+			compatible =3D "regulator-fixed";
+			reg =3D <4>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&pinctrl_sensor_reg>;
+			regulator-name =3D "sensor-supply";
+			regulator-min-microvolt =3D <3300000>;
+			regulator-max-microvolt =3D <3300000>;
+			gpio =3D <&gpio2 31 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			regulator-always-on;
+		};
 	};
=20
 	gpio-keys {
@@ -420,6 +433,15 @@
 		interrupts =3D <7 2>;
 		wakeup-gpios =3D <&gpio6 7 0>;
 	};
+
+	isl29023@44 {
+		compatible =3D "isil,isl29023";
+		reg =3D <0x44>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_i2c3_isl29023_int>;
+		interrupt-parent =3D <&gpio3>;
+		interrupts =3D <9 IRQ_TYPE_EDGE_FALLING>;
+	};
 };
=20
 &iomuxc {
@@ -521,6 +543,12 @@
 			>;
 		};
=20
+		pinctrl_i2c3_isl29023_int: i2c3isl29023intgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_DA9__GPIO3_IO09		0xb0b1
+			>;
+		};
+
 		pinctrl_ipu1_csi0: ipu1csi0grp {
 			fsl,pins =3D <
 				MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12    0x1b0b0
@@ -569,6 +597,12 @@
 			>;
 		};
=20
+		pinctrl_sensor_reg: sensorreggrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_EIM_EB3__GPIO2_IO31		0x1b0b0
+			>;
+		};
+
 		pinctrl_uart1: uart1grp {
 			fsl,pins =3D <
 				MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
--=20
2.7.4
