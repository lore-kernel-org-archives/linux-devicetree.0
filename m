From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 02/14] ARM: dts: imx6ul: move tsc node to appropriate place in the DTB
Date: Tue, 12 Jan 2016 18:21:19 +0100
Message-ID: <1452619291-13625-3-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-2-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452619291-13625-2-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

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
