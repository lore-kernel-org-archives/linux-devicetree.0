From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 10/30] ARM: dts: r8a7791: Reference both DMA controllers in SCIFA nodes
Date: Thu, 10 Mar 2016 12:36:02 +0100
Message-ID: <1457609782-24108-11-git-send-email-niklas.soderlund+renesas@ragnatech.se>
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
 arch/arm/boot/dts/r8a7791.dtsi | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791=
=2Edtsi
index 2a369dd..db5d6a5 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -569,8 +569,9 @@
 		interrupts =3D <0 144 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7791_CLK_SCIFA0>;
 		clock-names =3D "sci_ick";
-		dmas =3D <&dmac0 0x21>, <&dmac0 0x22>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x21>, <&dmac0 0x22>,
+		       <&dmac1 0x21>, <&dmac1 0x22>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -581,8 +582,9 @@
 		interrupts =3D <0 145 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7791_CLK_SCIFA1>;
 		clock-names =3D "sci_ick";
-		dmas =3D <&dmac0 0x25>, <&dmac0 0x26>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x25>, <&dmac0 0x26>,
+		       <&dmac1 0x25>, <&dmac1 0x26>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -593,8 +595,9 @@
 		interrupts =3D <0 151 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7791_CLK_SCIFA2>;
 		clock-names =3D "sci_ick";
-		dmas =3D <&dmac0 0x27>, <&dmac0 0x28>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x27>, <&dmac0 0x28>,
+		       <&dmac1 0x27>, <&dmac1 0x28>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -605,8 +608,9 @@
 		interrupts =3D <0 29 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp11_clks R8A7791_CLK_SCIFA3>;
 		clock-names =3D "sci_ick";
-		dmas =3D <&dmac0 0x1b>, <&dmac0 0x1c>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x1b>, <&dmac0 0x1c>,
+		       <&dmac1 0x1b>, <&dmac1 0x1c>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -617,8 +621,9 @@
 		interrupts =3D <0 30 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp11_clks R8A7791_CLK_SCIFA4>;
 		clock-names =3D "sci_ick";
-		dmas =3D <&dmac0 0x1f>, <&dmac0 0x20>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x1f>, <&dmac0 0x20>,
+		       <&dmac1 0x1f>, <&dmac1 0x20>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -629,8 +634,9 @@
 		interrupts =3D <0 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp11_clks R8A7791_CLK_SCIFA5>;
 		clock-names =3D "sci_ick";
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
