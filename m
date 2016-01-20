From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv2 02/16] ARM: dts: imx6ul: move tsc node to appropriate place in the DTB
Date: Wed, 20 Jan 2016 11:08:55 +0100
Message-ID: <1453284549-16363-3-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <b20788@freescale.com>, Bai Ping <b51503@freescale.com>, Frank Li <Frank.Li@freescale.com>, Fugang Duan <B38611@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Move the tsc node to keep the nodes sorted in ascending order by unit
address.

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6ul.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.d=
tsi
index 99b6465..7e27d76 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -236,6 +236,17 @@
 				};
 			};
=20
+			tsc: tsc@02040000 {
+				compatible =3D "fsl,imx6ul-tsc";
+				reg =3D <0x02040000 0x4000>, <0x0219c000 0x4000>;
+				interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clks IMX6UL_CLK_IPG>,
+					 <&clks IMX6UL_CLK_ADC2>;
+				clock-names =3D "tsc", "adc";
+				status =3D "disabled";
+			};
+
 			gpt1: gpt@02098000 {
 				compatible =3D "fsl,imx6ul-gpt", "fsl,imx6sx-gpt";
 				reg =3D <0x02098000 0x4000>;
@@ -590,17 +601,6 @@
 				status =3D "disabled";
 			};
=20
-			tsc: tsc@02040000 {
-				compatible =3D "fsl,imx6ul-tsc";
-				reg =3D <0x02040000 0x4000>, <0x0219c000 0x4000>;
-				interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6UL_CLK_IPG>,
-					 <&clks IMX6UL_CLK_ADC2>;
-				clock-names =3D "tsc", "adc";
-				status =3D "disabled";
-			};
-
 			usdhc1: usdhc@02190000 {
 				compatible =3D "fsl,imx6ul-usdhc", "fsl,imx6sx-usdhc";
 				reg =3D <0x02190000 0x4000>;
--=20
2.1.4
