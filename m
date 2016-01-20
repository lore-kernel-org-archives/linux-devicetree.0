From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv2 12/16] ARM: dts: imx6ul: add gpmi support
Date: Wed, 20 Jan 2016 11:09:05 +0100
Message-ID: <1453284549-16363-13-git-send-email-LW@KARO-electronics.de>
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

Add the device node for the i.MX6UL GPMI interface and the related
APBH DMA which is necessary for the GPMI to work properly.

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6ul.dtsi | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.d=
tsi
index 985c1b1..8499b3d 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -141,6 +141,39 @@
 			reg =3D <0x00900000 0x20000>;
 		};
=20
+		dma_apbh: dma-apbh@01804000 {
+			compatible =3D "fsl,imx6q-dma-apbh", "fsl,imx28-dma-apbh";
+			reg =3D <0x01804000 0x2000>;
+			interrupts =3D <0 13 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 13 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 13 IRQ_TYPE_LEVEL_HIGH>,
+				     <0 13 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names =3D "gpmi0", "gpmi1", "gpmi2", "gpmi3";
+			#dma-cells =3D <1>;
+			dma-channels =3D <4>;
+			clocks =3D <&clks IMX6UL_CLK_APBHDMA>;
+		};
+
+		gpmi: gpmi-nand@01806000         {
+			compatible =3D "fsl,imx6q-gpmi-nand";
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+			reg =3D <0x01806000 0x2000>, <0x01808000 0x2000>;
+			reg-names =3D "gpmi-nand", "bch";
+			interrupts =3D <0 15 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names =3D "bch";
+			clocks =3D <&clks IMX6UL_CLK_GPMI_IO>,
+				 <&clks IMX6UL_CLK_GPMI_APB>,
+				 <&clks IMX6UL_CLK_GPMI_BCH>,
+				 <&clks IMX6UL_CLK_GPMI_BCH_APB>,
+				 <&clks IMX6UL_CLK_PER_BCH>;
+			clock-names =3D "gpmi_io", "gpmi_apb", "gpmi_bch",
+				      "gpmi_bch_apb", "per1_bch";
+			dmas =3D <&dma_apbh 0>;
+			dma-names =3D "rx-tx";
+			status =3D "disabled";
+		};
+
 		aips1: aips-bus@02000000 {
 			compatible =3D "fsl,aips-bus", "simple-bus";
 			#address-cells =3D <1>;
--=20
2.1.4
