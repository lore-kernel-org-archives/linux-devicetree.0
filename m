From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6sll-evk: add debug LED support
Date: Wed, 21 Nov 2018 07:03:44 +0000
Message-ID: <1542783500-19546-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On i.MX6SLL EVK board, there is a debug LED controlled
by MX6SLL_PAD_EPDC_VCOM1__GPIO2_IO04 pin, add support
for it.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6sll-evk.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sll-evk.dts b/arch/arm/boot/dts/imx6sll-=
evk.dts
index c8e1155..9c90cbd 100644
--- a/arch/arm/boot/dts/imx6sll-evk.dts
+++ b/arch/arm/boot/dts/imx6sll-evk.dts
@@ -31,6 +31,18 @@
 		status =3D "okay";
 	};
=20
+	leds {
+		compatible =3D "gpio-leds";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_led>;
+
+		user {
+			label =3D "debug";
+			gpios =3D <&gpio2 4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger =3D "heartbeat";
+		};
+	};
+
 	reg_usb_otg1_vbus: regulator-otg1-vbus {
 		compatible =3D "regulator-fixed";
 		pinctrl-names =3D "default";
@@ -455,6 +467,12 @@
 		>;
 	};
=20
+	pinctrl_led: ledgrp {
+		fsl,pins =3D <
+			MX6SLL_PAD_EPDC_VCOM1__GPIO2_IO04	0x17059
+		>;
+	};
+
 	pinctrl_pwm1: pmw1grp {
 		fsl,pins =3D <
 			MX6SLL_PAD_PWM1__PWM1_OUT   0x110b0
--=20
2.7.4
