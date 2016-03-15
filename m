From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 25/31] ARM: dts: r8a7794: Reference both DMA controllers in SCIFA nodes
Date: Tue, 15 Mar 2016 13:42:02 +0100
Message-ID: <1458045728-4758-26-git-send-email-niklas.soderlund+renesas@ragnatech.se>
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
 arch/arm/boot/dts/r8a7794.dtsi | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794=
=2Edtsi
index eacb2b2..4256557 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -296,8 +296,9 @@
 		interrupts =3D <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7794_CLK_SCIFA0>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x21>, <&dmac0 0x22>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x21>, <&dmac0 0x22>,
+		       <&dmac1 0x21>, <&dmac1 0x22>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -309,8 +310,9 @@
 		interrupts =3D <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7794_CLK_SCIFA1>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x25>, <&dmac0 0x26>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x25>, <&dmac0 0x26>,
+		       <&dmac1 0x25>, <&dmac1 0x26>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -322,8 +324,9 @@
 		interrupts =3D <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7794_CLK_SCIFA2>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x27>, <&dmac0 0x28>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x27>, <&dmac0 0x28>,
+		       <&dmac1 0x27>, <&dmac1 0x28>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -335,8 +338,9 @@
 		interrupts =3D <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp11_clks R8A7794_CLK_SCIFA3>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x1b>, <&dmac0 0x1c>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x1b>, <&dmac0 0x1c>,
+		       <&dmac1 0x1b>, <&dmac1 0x1c>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -348,8 +352,9 @@
 		interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp11_clks R8A7794_CLK_SCIFA4>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x1f>, <&dmac0 0x20>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x1f>, <&dmac0 0x20>,
+		       <&dmac1 0x1f>, <&dmac1 0x20>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -361,8 +366,9 @@
 		interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp11_clks R8A7794_CLK_SCIFA5>;
 		clock-names =3D "fck";
-		dmas =3D <&dmac0 0x23>, <&dmac0 0x24>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x23>, <&dmac0 0x24>,
+		       <&dmac1 0x23>, <&dmac1 0x24>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
--=20
2.7.2
