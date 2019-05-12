From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH RESEND 1/2] ARM: dts: imx6sl: Assign corresponding clocks
 instead of dummy clock
Date: Sun, 12 May 2019 10:02:10 +0000
Message-ID: <1557655028-12654-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <CD1BEFEE427A5F45AF85F55BD5282B8B@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX6SL's KPP and WDOG use IMX6SL_CLK_IPG as clock root,
assign IMX6SL_CLK_IPG to them instead of IMX6SL_CLK_DUMMY.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
No code change, just resend patch with correct encoding.
---
 arch/arm/boot/dts/imx6sl.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index 9ddbeea..9393f03 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -495,7 +495,7 @@
 				compatible =3D "fsl,imx6sl-kpp", "fsl,imx21-kpp";
 				reg =3D <0x020b8000 0x4000>;
 				interrupts =3D <0 82 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6SL_CLK_DUMMY>;
+				clocks =3D <&clks IMX6SL_CLK_IPG>;
 				status =3D "disabled";
 			};
=20
@@ -503,14 +503,14 @@
 				compatible =3D "fsl,imx6sl-wdt", "fsl,imx21-wdt";
 				reg =3D <0x020bc000 0x4000>;
 				interrupts =3D <0 80 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6SL_CLK_DUMMY>;
+				clocks =3D <&clks IMX6SL_CLK_IPG>;
 			};
=20
 			wdog2: wdog@20c0000 {
 				compatible =3D "fsl,imx6sl-wdt", "fsl,imx21-wdt";
 				reg =3D <0x020c0000 0x4000>;
 				interrupts =3D <0 81 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6SL_CLK_DUMMY>;
+				clocks =3D <&clks IMX6SL_CLK_IPG>;
 				status =3D "disabled";
 			};
=20
--=20
2.7.4
