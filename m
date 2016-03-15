From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 08/31] ARM: dts: r8a7790: Reference both DMA controllers in SDHI nodes
Date: Tue, 15 Mar 2016 13:41:45 +0100
Message-ID: <1458045728-4758-9-git-send-email-niklas.soderlund+renesas@ragnatech.se>
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
index cfa91f0..31b9b0a 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -591,8 +591,9 @@
 		reg =3D <0 0xee100000 0 0x328>;
 		interrupts =3D <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_SDHI0>;
-		dmas =3D <&dmac1 0xcd>, <&dmac1 0xce>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac1 0xcd>, <&dmac1 0xce>,
+		       <&dmac0 0xcd>, <&dmac0 0xce>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -602,8 +603,9 @@
 		reg =3D <0 0xee120000 0 0x328>;
 		interrupts =3D <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_SDHI1>;
-		dmas =3D <&dmac1 0xc9>, <&dmac1 0xca>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac1 0xc9>, <&dmac1 0xca>,
+		       <&dmac0 0xc9>, <&dmac0 0xca>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -613,8 +615,9 @@
 		reg =3D <0 0xee140000 0 0x100>;
 		interrupts =3D <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_SDHI2>;
-		dmas =3D <&dmac1 0xc1>, <&dmac1 0xc2>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac1 0xc1>, <&dmac1 0xc2>,
+		       <&dmac0 0xc1>, <&dmac0 0xc2>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -624,8 +627,9 @@
 		reg =3D <0 0xee160000 0 0x100>;
 		interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_SDHI3>;
-		dmas =3D <&dmac1 0xd3>, <&dmac1 0xd4>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac1 0xd3>, <&dmac1 0xd4>,
+		       <&dmac0 0xd3>, <&dmac0 0xd4>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
--=20
2.7.2
