From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 07/31] ARM: dts: r8a7790: Reference both DMA controllers in IIC nodes
Date: Tue, 15 Mar 2016 13:41:44 +0100
Message-ID: <1458045728-4758-8-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1458045728-4758-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1458045728-4758-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: devicetree@vger.kernel.org

R-Car Gen2 have two DMA controllers, which are equivalent. Add
references to both dmac0 and dmac1 so the driver can fallback to the
later if the first one is unavailable.

Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7790.dtsi | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790=
=2Edtsi
index a80791a..cfa91f0 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -506,8 +506,9 @@
 		reg =3D <0 0xe6500000 0 0x425>;
 		interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_IIC0>;
-		dmas =3D <&dmac0 0x61>, <&dmac0 0x62>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x61>, <&dmac0 0x62>,
+		       <&dmac1 0x61>, <&dmac1 0x62>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -519,8 +520,9 @@
 		reg =3D <0 0xe6510000 0 0x425>;
 		interrupts =3D <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_IIC1>;
-		dmas =3D <&dmac0 0x65>, <&dmac0 0x66>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x65>, <&dmac0 0x66>,
+		       <&dmac1 0x65>, <&dmac1 0x66>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -532,8 +534,9 @@
 		reg =3D <0 0xe6520000 0 0x425>;
 		interrupts =3D <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_IIC2>;
-		dmas =3D <&dmac0 0x69>, <&dmac0 0x6a>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x69>, <&dmac0 0x6a>,
+		       <&dmac1 0x69>, <&dmac1 0x6a>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -545,8 +548,9 @@
 		reg =3D <0 0xe60b0000 0 0x425>;
 		interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp9_clks R8A7790_CLK_IICDVFS>;
-		dmas =3D <&dmac0 0x77>, <&dmac0 0x78>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x77>, <&dmac0 0x78>,
+		       <&dmac1 0x77>, <&dmac1 0x78>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
--=20
2.7.2
