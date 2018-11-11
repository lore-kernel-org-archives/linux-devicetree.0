From: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH] arm64: dts: allwinner: a64: Add mali node
Date: Sun, 11 Nov 2018 13:18:11 +0100
Message-ID: <20181111121811.21638-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, wens@csie.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jernej.skrabec@siol.net
List-Id: devicetree@vger.kernel.org

A64 has Mali400 MP2 GPU. Add a node for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 This node and A64 GPU binary driver was tested with Kodi on LibreELEC.

 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
index f3a66f888205..48cc5451d0eb 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -753,6 +753,28 @@
 			#size-cells =3D <0>;
 		};
=20
+		mali: gpu@1c40000 {
+			compatible =3D "allwinner,sun50i-a64-mali",
+				     "arm,mali-400";
+			reg =3D <0x01c40000 0x10000>;
+			interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names =3D "gp",
+					  "gpmmu",
+					  "pp0",
+					  "ppmmu0",
+					  "pp1",
+					  "ppmmu1",
+					  "pmu";
+			clocks =3D <&ccu CLK_BUS_GPU>, <&ccu CLK_GPU>;
+			clock-names =3D "bus", "core";
+			resets =3D <&ccu RST_BUS_GPU>;
+		};
=20
 		spi0: spi@1c68000 {
 			compatible =3D "allwinner,sun8i-h3-spi";
--=20
2.19.1
