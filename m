From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv2 10/16] ARM: dts: imx6ul: add sai support
Date: Wed, 20 Jan 2016 11:09:03 +0100
Message-ID: <1453284549-16363-11-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-clk-owner@vger.kernel.org
To: Anson Huang <b20788@freescale.com>, Bai Ping <b51503@freescale.com>, Frank Li <Frank.Li@freescale.com>, Fugang Duan <B38611@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add device nodes for the i.MX6UL synchronous audio interfaces (SAI).

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6ul.dtsi | 45 +++++++++++++++++++++++++++++++++++=
++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.d=
tsi
index 9c873a6..e1fda39e 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -235,6 +235,51 @@
 					clock-names =3D "ipg", "per";
 					status =3D "disabled";
 				};
+
+				sai1: sai@02028000 {
+					#sound-dai-cells =3D <0>;
+					compatible =3D "fsl,imx6ul-sai", "fsl,imx6sx-sai";
+					reg =3D <0x02028000 0x4000>;
+					interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+					clocks =3D <&clks IMX6UL_CLK_SAI1_IPG>,
+						 <&clks IMX6UL_CLK_SAI1>,
+						 <&clks IMX6UL_CLK_DUMMY>, <&clks IMX6UL_CLK_DUMMY>;
+					clock-names =3D "bus", "mclk1", "mclk2", "mclk3";
+					dmas =3D <&sdma 35 24 0>,
+					       <&sdma 36 24 0>;
+					dma-names =3D "rx", "tx";
+					status =3D "disabled";
+				};
+
+				sai2: sai@0202c000 {
+					#sound-dai-cells =3D <0>;
+					compatible =3D "fsl,imx6ul-sai", "fsl,imx6sx-sai";
+					reg =3D <0x0202c000 0x4000>;
+					interrupts =3D <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+					clocks =3D <&clks IMX6UL_CLK_SAI2_IPG>,
+						 <&clks IMX6UL_CLK_SAI2>,
+						 <&clks IMX6UL_CLK_DUMMY>, <&clks IMX6UL_CLK_DUMMY>;
+					clock-names =3D "bus", "mclk1", "mclk2", "mclk3";
+					dmas =3D <&sdma 37 24 0>,
+					       <&sdma 38 24 0>;
+					dma-names =3D "rx", "tx";
+					status =3D "disabled";
+				};
+
+				sai3: sai@02030000 {
+					#sound-dai-cells =3D <0>;
+					compatible =3D "fsl,imx6ul-sai", "fsl,imx6sx-sai";
+					reg =3D <0x02030000 0x4000>;
+					interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+					clocks =3D <&clks IMX6UL_CLK_SAI3_IPG>,
+						 <&clks IMX6UL_CLK_SAI3>,
+						 <&clks IMX6UL_CLK_DUMMY>, <&clks IMX6UL_CLK_DUMMY>;
+					clock-names =3D "bus", "mclk1", "mclk2", "mclk3";
+					dmas =3D <&sdma 39 24 0>,
+					       <&sdma 40 24 0>;
+					dma-names =3D "rx", "tx";
+					status =3D "disabled";
+				};
 			};
=20
 			tsc: tsc@02040000 {
--=20
2.1.4

