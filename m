From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6qdl-sabresd: add egalax touch screen support on
 i2c2 bus
Date: Tue, 4 Dec 2018 08:54:10 +0000
Message-ID: <1543913303-6216-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add egalax touch screen support on i2c2 bus.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx=
6qdl-sabresd.dtsi
index 6e46a19..d7389b5 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -272,6 +272,16 @@
 	pinctrl-0 =3D <&pinctrl_i2c2>;
 	status =3D "okay";
=20
+	touchscreen@4 {
+		compatible =3D "eeti,egalax_ts";
+		reg =3D <0x04>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_i2c2_egalax_int>;
+		interrupt-parent =3D <&gpio6>;
+		interrupts =3D <8 IRQ_TYPE_EDGE_FALLING>;
+		wakeup-gpios =3D <&gpio6 8 GPIO_ACTIVE_HIGH>;
+	};
+
 	ov5640: camera@3c {
 		compatible =3D "ovti,ov5640";
 		pinctrl-names =3D "default";
@@ -498,6 +508,12 @@
 			>;
 		};
=20
+		pinctrl_i2c2_egalax_int: i2c2egalaxintgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_NANDF_ALE__GPIO6_IO08	0x1b0b0
+			>;
+		};
+
 		pinctrl_i2c3: i2c3grp {
 			fsl,pins =3D <
 				MX6QDL_PAD_GPIO_3__I2C3_SCL		0x4001b8b1
--=20
2.7.4
