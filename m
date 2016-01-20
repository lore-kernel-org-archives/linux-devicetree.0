From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv2 05/16] ARM: dts: imx6ul: specify proper clocks for the PWM nodes
Date: Wed, 20 Jan 2016 11:08:58 +0100
Message-ID: <1453284549-16363-6-git-send-email-LW@KARO-electronics.de>
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

i.MX6UL PWMs require real clocks. Define the appropriate clocks for
the PWM units.

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6ul.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.d=
tsi
index e6e3e54..3aba0bb 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -508,8 +508,8 @@
 				compatible =3D "fsl,imx6ul-pwm", "fsl,imx27-pwm";
 				reg =3D <0x020f0000 0x4000>;
 				interrupts =3D <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6UL_CLK_DUMMY>,
-					 <&clks IMX6UL_CLK_DUMMY>;
+				clocks =3D <&clks IMX6UL_CLK_PWM5>,
+					 <&clks IMX6UL_CLK_PWM5>;
 				clock-names =3D "ipg", "per";
 				#pwm-cells =3D <2>;
 			};
@@ -518,8 +518,8 @@
 				compatible =3D "fsl,imx6ul-pwm", "fsl,imx27-pwm";
 				reg =3D <0x020f4000 0x4000>;
 				interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6UL_CLK_DUMMY>,
-					 <&clks IMX6UL_CLK_DUMMY>;
+				clocks =3D <&clks IMX6UL_CLK_PWM6>,
+					 <&clks IMX6UL_CLK_PWM6>;
 				clock-names =3D "ipg", "per";
 				#pwm-cells =3D <2>;
 			};
@@ -528,8 +528,8 @@
 				compatible =3D "fsl,imx6ul-pwm", "fsl,imx27-pwm";
 				reg =3D <0x020f8000 0x4000>;
 				interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6UL_CLK_DUMMY>,
-					 <&clks IMX6UL_CLK_DUMMY>;
+				clocks =3D <&clks IMX6UL_CLK_PWM7>,
+					 <&clks IMX6UL_CLK_PWM7>;
 				clock-names =3D "ipg", "per";
 				#pwm-cells =3D <2>;
 			};
@@ -538,8 +538,8 @@
 				compatible =3D "fsl,imx6ul-pwm", "fsl,imx27-pwm";
 				reg =3D <0x020fc000 0x4000>;
 				interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
-				clocks =3D <&clks IMX6UL_CLK_DUMMY>,
-					 <&clks IMX6UL_CLK_DUMMY>;
+				clocks =3D <&clks IMX6UL_CLK_PWM8>,
+					 <&clks IMX6UL_CLK_PWM8>;
 				clock-names =3D "ipg", "per";
 				#pwm-cells =3D <2>;
 			};
--=20
2.1.4

