From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: [PATCH 2/4] dts: Add Evatronix NAND flash driver to ARTPEC-6 dtsi
Date: Thu, 2 Jun 2016 09:47:59 +0200
Message-ID: <alpine.DEB.2.02.1606020947300.19416@lnxricardw1.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>David Woodhouse <dwmw2@infradead.org>
Cc: Linux mtd <linux-mtd@lists.infradead.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Add Evatronix NANDFLASH-CTRL NAND flash controller to ARTPEC-6 SoC.

ONFi mode 2 timing has been set as this is compatible also with non-ONF=
i
SLC NAND flashes, with higher throughput than the default ONFi mode 0.

Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
---
 arch/arm/boot/dts/artpec6.dtsi |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/artpec6.dtsi b/arch/arm/boot/dts/artpec6=
=2Edtsi
index 3043016..17f6924 100644
--- a/arch/arm/boot/dts/artpec6.dtsi
+++ b/arch/arm/boot/dts/artpec6.dtsi
@@ -266,5 +266,24 @@
 			clock-names =3D "uart_clk", "apb_pclk";
 			status =3D "disabled";
 		};
+		nand: nand@f801e000 {
+			compatible =3D "evatronix,nandflash-ctrl";
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+			reg =3D <0xf801e000 0x0200>;
+			interrupts =3D <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			/* ONFi mode 2 timing */
+			/* Order is TIME_SEQ_0, TIME_SEQ_1, TIMINGS_ASYN,
+			 * TIME_GEN_SEQ_0, _1, _2, _3
+			 */
+			evatronix,timings =3D <0x080a0a32 0x0007020a 0x00000023
+					     0x00000000 0x00000000 0x00000000
+					     0x00000000>;
+			nand-ecc-mode =3D "hw";
+			nand-ecc-algo =3D "bch";
+			nand-on-flash-bbt;
+			nand-ecc-strength =3D <8>;
+			nand-ecc-step-size =3D <512>;
+		};
 	};
 };
--=20
1.7.10.4

--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
