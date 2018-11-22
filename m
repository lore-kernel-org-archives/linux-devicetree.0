From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6sll-evk: use WDOG_B pin reset
Date: Thu, 22 Nov 2018 02:55:45 +0000
Message-ID: <1542855018-30217-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX6SLL EVK board has WDOG_B pin connected to the PMIC;

Add the WDOG_B pinctrl entry and 'fsl,ext-reset-output'
property to wdog node to let watchdog trigger a system
POR reset via the PMIC.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6sll-evk.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sll-evk.dts b/arch/arm/boot/dts/imx6sll-=
evk.dts
index 9c90cbd..d8ad2a2 100644
--- a/arch/arm/boot/dts/imx6sll-evk.dts
+++ b/arch/arm/boot/dts/imx6sll-evk.dts
@@ -313,6 +313,12 @@
 	status =3D "okay";
 };
=20
+&wdog1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_wdog1>;
+	fsl,ext-reset-output;
+};
+
 &iomuxc {
 	pinctrl_reg_sd3_vmmc: sd3vmmcgrp {
 		fsl,pins =3D <
@@ -478,4 +484,10 @@
 			MX6SLL_PAD_PWM1__PWM1_OUT   0x110b0
 		>;
 	};
+
+	pinctrl_wdog1: wdog1grp	{
+		fsl,pins =3D <
+			MX6SLL_PAD_WDOG_B__WDOG1_B   0x170b0
+		>;
+	};
 };
--=20
2.7.4
