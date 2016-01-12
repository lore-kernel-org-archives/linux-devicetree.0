From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 11/14] ARM: dts: imx6ul: add sai support
Date: Tue, 12 Jan 2016 18:21:28 +0100
Message-ID: <1452619291-13625-12-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-2-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-3-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-4-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-5-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-6-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-7-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-8-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-9-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-10-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-11-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452619291-13625-11-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6ul.dtsi | 45 +++++++++++++++++++++++++++++++++++=
++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.d=
tsi
index f1db53e..3d43321f 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -235,6 +235,51 @@
 					clock-names =3D "ipg", "per";
 					status =3D "disabled";
 				};
+
+				sai1: sai@02028000 {
+					#sound-dai-cells =3D <0>;
+					compatible =3D "fsl,imx6sx-sai";
+					reg =3D <0x02028000 0x4000>;
+					interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+					clocks =3D <&clks IMX6UL_CLK_SAI1_IPG>,
+						 <&clks IMX6UL_CLK_SAI1>,
+						 <&clks 0>, <&clks 0>;
+					clock-names =3D "bus", "mclk1", "mclk2", "mclk3";
+					dmas =3D <&sdma 35 24 0>,
+					       <&sdma 36 24 0>;
+					dma-names =3D "rx", "tx";
+					status =3D "disabled";
+				};
+
+				sai2: sai@0202c000 {
+					#sound-dai-cells =3D <0>;
+					compatible =3D "fsl,imx6sx-sai";
+					reg =3D <0x0202c000 0x4000>;
+					interrupts =3D <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+					clocks =3D <&clks IMX6UL_CLK_SAI2_IPG>,
+						 <&clks IMX6UL_CLK_SAI2>,
+						 <&clks 0>, <&clks 0>;
+					clock-names =3D "bus", "mclk1", "mclk2", "mclk3";
+					dmas =3D <&sdma 37 24 0>,
+					       <&sdma 38 24 0>;
+					dma-names =3D "rx", "tx";
+					status =3D "disabled";
+				};
+
+				sai3: sai@02030000 {
+					#sound-dai-cells =3D <0>;
+					compatible =3D "fsl,imx6sx-sai";
+					reg =3D <0x02030000 0x4000>;
+					interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+					clocks =3D <&clks IMX6UL_CLK_SAI3_IPG>,
+						 <&clks IMX6UL_CLK_SAI3>,
+						 <&clks 0>, <&clks 0>;
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
