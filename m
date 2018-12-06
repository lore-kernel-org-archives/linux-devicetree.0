From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V2 4/4] ARM: dts: imx6qdl-sabresd: add accelerometer sensor
 support
Date: Thu, 6 Dec 2018 01:42:42 +0000
Message-ID: <1544060203-22163-4-git-send-email-Anson.Huang@nxp.com>
References: <1544060203-22163-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544060203-22163-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add accelerometer sensor mma8451 support on i2c1 bus.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx=
6qdl-sabresd.dtsi
index b8a2fd8..174db44 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -242,6 +242,15 @@
 		>;
 	};
=20
+	accelerometer@1c {
+		compatible =3D "fsl,mma8451";
+		reg =3D <0x1c>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_i2c1_mma8451_int>;
+		interrupt-parent =3D <&gpio1>;
+		interrupts =3D <18 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	ov5642: camera@3c {
 		compatible =3D "ovti,ov5642";
 		pinctrl-names =3D "default";
@@ -521,6 +530,12 @@
 			>;
 		};
=20
+		pinctrl_i2c1_mma8451_int: i2c1mma8451intgrp {
+			fsl,pins =3D <
+				MX6QDL_PAD_SD1_CMD__GPIO1_IO18		0xb0b1
+			>;
+		};
+
 		pinctrl_i2c2: i2c2grp {
 			fsl,pins =3D <
 				MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
--=20
2.7.4
