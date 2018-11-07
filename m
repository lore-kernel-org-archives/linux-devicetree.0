From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6sx: specify proper clock for nodes with dummy
 clock
Date: Wed, 7 Nov 2018 08:51:07 +0000
Message-ID: <1541580363-3968-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

>From i.MX6SX reference manual CCM chapter, KPP and
WDOGn use IPG clock as their clock, specify IPG
clock for KPP and WDOGn instead of DUMMY clock.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6sx.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 84b7687..07ea7d9 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -558,7 +558,7 @@
 				compatible =3D "fsl,imx6sx-kpp", "fsl,imx21-kpp";
 				reg =3D <0x020b8000 0x4000>;
 				interrupts =3D <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6SX_CLK_DUMMY>;
+				clocks =3D <&clks IMX6SX_CLK_IPG>;
 				status =3D "disabled";
 			};
=20
@@ -566,14 +566,14 @@
 				compatible =3D "fsl,imx6sx-wdt", "fsl,imx21-wdt";
 				reg =3D <0x020bc000 0x4000>;
 				interrupts =3D <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6SX_CLK_DUMMY>;
+				clocks =3D <&clks IMX6SX_CLK_IPG>;
 			};
=20
 			wdog2: wdog@20c0000 {
 				compatible =3D "fsl,imx6sx-wdt", "fsl,imx21-wdt";
 				reg =3D <0x020c0000 0x4000>;
 				interrupts =3D <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6SX_CLK_DUMMY>;
+				clocks =3D <&clks IMX6SX_CLK_IPG>;
 				status =3D "disabled";
 			};
=20
@@ -1270,7 +1270,7 @@
 				compatible =3D "fsl,imx6sx-wdt", "fsl,imx21-wdt";
 				reg =3D <0x02288000 0x4000>;
 				interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6SX_CLK_DUMMY>;
+				clocks =3D <&clks IMX6SX_CLK_IPG>;
 				status =3D "disabled";
 			};
=20
--=20
2.7.4
