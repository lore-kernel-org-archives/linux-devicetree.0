From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 16/30] ARM: dts: r8a7791: Reference both DMA controllers in IIC nodes
Date: Thu, 10 Mar 2016 12:36:08 +0100
Message-ID: <1457609782-24108-17-git-send-email-niklas.soderlund+renesas@ragnatech.se>
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
index 50ac831..30b78a3 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -480,8 +480,9 @@
 		reg =3D <0 0xe60b0000 0 0x425>;
 		interrupts =3D <0 173 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp9_clks R8A7791_CLK_IICDVFS>;
-		dmas =3D <&dmac0 0x77>, <&dmac0 0x78>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x77>, <&dmac0 0x78>,
+		       <&dmac1 0x77>, <&dmac1 0x78>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -493,8 +494,9 @@
 		reg =3D <0 0xe6500000 0 0x425>;
 		interrupts =3D <0 174 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7791_CLK_IIC0>;
-		dmas =3D <&dmac0 0x61>, <&dmac0 0x62>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x61>, <&dmac0 0x62>,
+		       <&dmac1 0x61>, <&dmac1 0x62>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -506,8 +508,9 @@
 		reg =3D <0 0xe6510000 0 0x425>;
 		interrupts =3D <0 175 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7791_CLK_IIC1>;
-		dmas =3D <&dmac0 0x65>, <&dmac0 0x66>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x65>, <&dmac0 0x66>,
+		       <&dmac1 0x65>, <&dmac1 0x66>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
--=20
2.7.2
