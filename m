From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 20/30] ARM: dts: r8a7793: Reference both DMA controllers in SCIFB nodes
Date: Thu, 10 Mar 2016 12:36:12 +0100
Message-ID: <1457609782-24108-21-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1457609782-24108-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1457609782-24108-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: devicetree@vger.kernel.org

R-Car Gen2 have two DMA controllers, which are equivalent. Add
references to both dmac0 and dmac1 so the driver can fallback to the
later if the first one is unavailable.

Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
---
 arch/arm/boot/dts/r8a7793.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793=
=2Edtsi
index 322d290..445ab3a 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -381,8 +381,9 @@
 		interrupts =3D <0 148 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7793_CLK_SCIFB0>;
 		clock-names =3D "sci_ick";
-		dmas =3D <&dmac0 0x3d>, <&dmac0 0x3e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x3d>, <&dmac0 0x3e>,
+		       <&dmac1 0x3d>, <&dmac1 0x3e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -393,8 +394,9 @@
 		interrupts =3D <0 149 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7793_CLK_SCIFB1>;
 		clock-names =3D "sci_ick";
-		dmas =3D <&dmac0 0x19>, <&dmac0 0x1a>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x19>, <&dmac0 0x1a>,
+		       <&dmac1 0x19>, <&dmac1 0x1a>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -405,8 +407,9 @@
 		interrupts =3D <0 150 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7793_CLK_SCIFB2>;
 		clock-names =3D "sci_ick";
-		dmas =3D <&dmac0 0x1d>, <&dmac0 0x1e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x1d>, <&dmac0 0x1e>,
+		       <&dmac1 0x1d>, <&dmac1 0x1e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
--=20
2.7.2
