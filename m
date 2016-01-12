From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 12/14] ARM: dts: imx6ul: add lcdif support
Date: Tue, 12 Jan 2016 18:21:29 +0100
Message-ID: <1452619291-13625-13-git-send-email-LW@KARO-electronics.de>
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
 <1452619291-13625-12-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452619291-13625-12-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6ul.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.d=
tsi
index 3d43321f..0123480 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -805,6 +805,17 @@
 				reg =3D <0x021b0000 0x4000>;
 			};
=20
+			lcdif: lcdif@021c8000 {
+				compatible =3D "fsl,imx6ul-lcdif", "fsl,imx28-lcdif";
+				reg =3D <0x021c8000 0x4000>;
+				interrupts =3D <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clks IMX6UL_CLK_LCDIF_PIX>,
+					 <&clks IMX6UL_CLK_LCDIF_APB>,
+					 <&clks IMX6UL_CLK_DUMMY>;
+				clock-names =3D "pix", "axi", "disp_axi";
+				status =3D "disabled";
+			};
+
 			qspi: qspi@021e0000 {
 				#address-cells =3D <1>;
 				#size-cells =3D <0>;
--=20
2.1.4
