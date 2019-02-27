From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH RESEND V2 2/2] arm64: dts: freescale: imx8mq: add clock for
 GPIO node
Date: Wed, 27 Feb 2019 01:28:32 +0000
Message-ID: <1551230622-30660-2-git-send-email-Anson.Huang@nxp.com>
References: <1551230622-30660-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551230622-30660-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX8MQ has clock gate for each GPIO bank, add clock info
to GPIO node for clock management.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No changes.
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mq.dtsi
index 8e9d6d5..6be8849 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -149,6 +149,7 @@
 				reg =3D <0x30200000 0x10000>;
 				interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
 				             <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MQ_CLK_GPIO1_ROOT>;
 				gpio-controller;
 				#gpio-cells =3D <2>;
 				interrupt-controller;
@@ -160,6 +161,7 @@
 				reg =3D <0x30210000 0x10000>;
 				interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
 				             <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MQ_CLK_GPIO2_ROOT>;
 				gpio-controller;
 				#gpio-cells =3D <2>;
 				interrupt-controller;
@@ -171,6 +173,7 @@
 				reg =3D <0x30220000 0x10000>;
 				interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
 				             <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MQ_CLK_GPIO3_ROOT>;
 				gpio-controller;
 				#gpio-cells =3D <2>;
 				interrupt-controller;
@@ -182,6 +185,7 @@
 				reg =3D <0x30230000 0x10000>;
 				interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
 				             <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MQ_CLK_GPIO4_ROOT>;
 				gpio-controller;
 				#gpio-cells =3D <2>;
 				interrupt-controller;
@@ -193,6 +197,7 @@
 				reg =3D <0x30240000 0x10000>;
 				interrupts =3D <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
 				             <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MQ_CLK_GPIO5_ROOT>;
 				gpio-controller;
 				#gpio-cells =3D <2>;
 				interrupt-controller;
--=20
2.7.4
