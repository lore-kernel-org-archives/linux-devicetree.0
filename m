From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 1/2] arm64: dts: imx8mm: Add SAI nodes
Date: Wed, 15 May 2019 14:42:28 +0000
Message-ID: <20190515144210.25596-2-daniel.baluta@nxp.com>
References: <20190515144210.25596-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190515144210.25596-1-daniel.baluta@nxp.com>
Content-Language: en-US
Content-ID: <9DD38CC770A78C4284E799FF968FF418@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX8MM has 5 SAI instances with the following base
addresses according to RM.

SAI1 base address: 3001_0000h
SAI2 base address: 3002_0000h
SAI3 base address: 3003_0000h
SAI5 base address: 3005_0000h
SAI6 base address: 3006_0000h

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 66 +++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mm.dtsi
index 6b407a94c06e..52abe2d03f31 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -201,6 +201,72 @@
 			#size-cells =3D <1>;
 			ranges;
=20
+			sai1: sai@30010000 {
+				compatible =3D "fsl,imx8mm-sai", "fsl,imx8mq-sai";
+				reg =3D <0x30010000 0x10000>;
+				interrupts =3D <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MM_CLK_SAI1_IPG>,
+					 <&clk IMX8MM_CLK_SAI1_ROOT>,
+					 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
+				clock-names =3D "bus", "mclk1", "mclk2", "mclk3";
+				dmas =3D <&sdma2 0 2 0>, <&sdma2 1 2 0>;
+				dma-names =3D "rx", "tx";
+				status =3D "disabled";
+			};
+
+			sai2: sai@30020000 {
+				compatible =3D "fsl,imx8mm-sai", "fsl,imx8mq-sai";
+				reg =3D <0x30020000 0x10000>;
+				interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MM_CLK_SAI2_IPG>,
+					<&clk IMX8MM_CLK_SAI2_ROOT>,
+					<&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
+				clock-names =3D "bus", "mclk1", "mclk2", "mclk3";
+				dmas =3D <&sdma2 2 2 0>, <&sdma2 3 2 0>;
+				dma-names =3D "rx", "tx";
+				status =3D "disabled";
+			};
+
+			sai3: sai@30030000 {
+				#sound-dai-cells =3D <0>;
+				compatible =3D "fsl,imx8mm-sai", "fsl,imx8mq-sai";
+				reg =3D <0x30030000 0x10000>;
+				interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MM_CLK_SAI3_IPG>,
+					 <&clk IMX8MM_CLK_SAI3_ROOT>,
+					 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
+				clock-names =3D "bus", "mclk1", "mclk2", "mclk3";
+				dmas =3D <&sdma2 4 2 0>, <&sdma2 5 2 0>;
+				dma-names =3D "rx", "tx";
+				status =3D "disabled";
+			};
+
+			sai5: sai@30050000 {
+				compatible =3D "fsl,imx8mm-sai", "fsl,imx8mq-sai";
+				reg =3D <0x30050000 0x10000>;
+				interrupts =3D <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MM_CLK_SAI5_IPG>,
+					 <&clk IMX8MM_CLK_SAI5_ROOT>,
+					 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
+				clock-names =3D "bus", "mclk1", "mclk2", "mclk3";
+				dmas =3D <&sdma2 8 2 0>, <&sdma2 9 2 0>;
+				dma-names =3D "rx", "tx";
+				status =3D "disabled";
+			};
+
+			sai6: sai@30060000 {
+				compatible =3D "fsl,imx8mm-sai", "fsl,imx8mq-sai";
+				reg =3D <0x30060000 0x10000>;
+				interrupts =3D <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MM_CLK_SAI6_IPG>,
+					 <&clk IMX8MM_CLK_SAI6_ROOT>,
+					 <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_CLK_DUMMY>;
+				clock-names =3D "bus", "mclk1", "mclk2", "mclk3";
+				dmas =3D <&sdma2 10 2 0>, <&sdma2 11 2 0>;
+				dma-names =3D "rx", "tx";
+				status =3D "disabled";
+			};
+
 			gpio1: gpio@30200000 {
 				compatible =3D "fsl,imx8mm-gpio", "fsl,imx35-gpio";
 				reg =3D <0x30200000 0x10000>;
--=20
2.17.1
