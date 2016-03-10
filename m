From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 17/30] ARM: dts: r8a7791: Reference both DMA controllers in SDHI nodes
Date: Thu, 10 Mar 2016 12:36:09 +0100
Message-ID: <1457609782-24108-18-git-send-email-niklas.soderlund+renesas@ragnatech.se>
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
 arch/arm/boot/dts/r8a7791.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791=
=2Edtsi
index 30b78a3..2eb8850 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -538,8 +538,9 @@
 		reg =3D <0 0xee100000 0 0x328>;
 		interrupts =3D <0 165 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7791_CLK_SDHI0>;
-		dmas =3D <&dmac1 0xcd>, <&dmac1 0xce>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac1 0xcd>, <&dmac1 0xce>,
+		       <&dmac0 0xcd>, <&dmac0 0xce>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -549,8 +550,9 @@
 		reg =3D <0 0xee140000 0 0x100>;
 		interrupts =3D <0 167 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7791_CLK_SDHI1>;
-		dmas =3D <&dmac1 0xc1>, <&dmac1 0xc2>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac1 0xc1>, <&dmac1 0xc2>,
+		       <&dmac0 0xc1>, <&dmac0 0xc2>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -560,8 +562,9 @@
 		reg =3D <0 0xee160000 0 0x100>;
 		interrupts =3D <0 168 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7791_CLK_SDHI2>;
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
