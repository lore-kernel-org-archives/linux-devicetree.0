From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 10/14] ARM: dts: imx6ul: add flexcan support
Date: Tue, 12 Jan 2016 18:21:27 +0100
Message-ID: <1452619291-13625-11-git-send-email-LW@KARO-electronics.de>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452619291-13625-10-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6ul.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.d=
tsi
index 96b78a9..f1db53e 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -292,6 +292,26 @@
 				status =3D "disabled";
 			};
=20
+			can1: flexcan@02090000 {
+				compatible =3D "fsl,imx6q-flexcan";
+				reg =3D <0x02090000 0x4000>;
+				interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clks IMX6UL_CLK_CAN1_IPG>,
+					 <&clks IMX6UL_CLK_CAN1_SERIAL>;
+				clock-names =3D "ipg", "per";
+				status =3D "disabled";
+			};
+
+			can2: flexcan@02094000 {
+				compatible =3D "fsl,imx6q-flexcan";
+				reg =3D <0x02094000 0x4000>;
+				interrupts =3D <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clks IMX6UL_CLK_CAN2_IPG>,
+					 <&clks IMX6UL_CLK_CAN2_SERIAL>;
+				clock-names =3D "ipg", "per";
+				status =3D "disabled";
+			};
+
 			gpt1: gpt@02098000 {
 				compatible =3D "fsl,imx6ul-gpt", "fsl,imx6sx-gpt";
 				reg =3D <0x02098000 0x4000>;
--=20
2.1.4
