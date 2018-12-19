From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6sl: correct PWM ipg clock source
Date: Wed, 19 Dec 2018 05:41:31 +0000
Message-ID: <1545197799-9082-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

>From i.MX6SL Reference Manual, the PWMx's ipg clock
for registers access is from perclk, correct them.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6sl.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index e7524e7..4b4813f 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -338,7 +338,7 @@
 				compatible =3D "fsl,imx6sl-pwm", "fsl,imx27-pwm";
 				reg =3D <0x02080000 0x4000>;
 				interrupts =3D <0 83 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6SL_CLK_PWM1>,
+				clocks =3D <&clks IMX6SL_CLK_PERCLK>,
 					 <&clks IMX6SL_CLK_PWM1>;
 				clock-names =3D "ipg", "per";
 			};
@@ -348,7 +348,7 @@
 				compatible =3D "fsl,imx6sl-pwm", "fsl,imx27-pwm";
 				reg =3D <0x02084000 0x4000>;
 				interrupts =3D <0 84 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6SL_CLK_PWM2>,
+				clocks =3D <&clks IMX6SL_CLK_PERCLK>,
 					 <&clks IMX6SL_CLK_PWM2>;
 				clock-names =3D "ipg", "per";
 			};
@@ -358,7 +358,7 @@
 				compatible =3D "fsl,imx6sl-pwm", "fsl,imx27-pwm";
 				reg =3D <0x02088000 0x4000>;
 				interrupts =3D <0 85 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6SL_CLK_PWM3>,
+				clocks =3D <&clks IMX6SL_CLK_PERCLK>,
 					 <&clks IMX6SL_CLK_PWM3>;
 				clock-names =3D "ipg", "per";
 			};
@@ -368,7 +368,7 @@
 				compatible =3D "fsl,imx6sl-pwm", "fsl,imx27-pwm";
 				reg =3D <0x0208c000 0x4000>;
 				interrupts =3D <0 86 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6SL_CLK_PWM4>,
+				clocks =3D <&clks IMX6SL_CLK_PERCLK>,
 					 <&clks IMX6SL_CLK_PWM4>;
 				clock-names =3D "ipg", "per";
 			};
--=20
2.7.4
