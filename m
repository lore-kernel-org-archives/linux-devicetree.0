From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH RESEND 3/3] arm64: dts: imx8mm: add clock for GPIO node
Date: Sun, 12 May 2019 10:17:19 +0000
Message-ID: <1557655926-12915-3-git-send-email-Anson.Huang@nxp.com>
References: <1557655926-12915-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557655926-12915-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-ID: <D71E0B23D8290D4EB06ADDAEEBBE7193@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX8MM has clock gate for each GPIO bank, add clock info
to GPIO node for clock management.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
No change, just resend patch with correct encoding.
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mm.dtsi
index 6b407a94..f32d4e9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -206,6 +206,7 @@
 				reg =3D <0x30200000 0x10000>;
 				interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MM_CLK_GPIO1_ROOT>;
 				gpio-controller;
 				#gpio-cells =3D <2>;
 				interrupt-controller;
@@ -217,6 +218,7 @@
 				reg =3D <0x30210000 0x10000>;
 				interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MM_CLK_GPIO2_ROOT>;
 				gpio-controller;
 				#gpio-cells =3D <2>;
 				interrupt-controller;
@@ -228,6 +230,7 @@
 				reg =3D <0x30220000 0x10000>;
 				interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MM_CLK_GPIO3_ROOT>;
 				gpio-controller;
 				#gpio-cells =3D <2>;
 				interrupt-controller;
@@ -239,6 +242,7 @@
 				reg =3D <0x30230000 0x10000>;
 				interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MM_CLK_GPIO4_ROOT>;
 				gpio-controller;
 				#gpio-cells =3D <2>;
 				interrupt-controller;
@@ -250,6 +254,7 @@
 				reg =3D <0x30240000 0x10000>;
 				interrupts =3D <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MM_CLK_GPIO5_ROOT>;
 				gpio-controller;
 				#gpio-cells =3D <2>;
 				interrupt-controller;
--=20
2.7.4
