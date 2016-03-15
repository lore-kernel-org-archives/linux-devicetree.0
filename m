From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 12/31] ARM: dts: r8a7791: Reference both DMA controllers in HSCIF nodes
Date: Tue, 15 Mar 2016 13:41:49 +0100
Message-ID: <1458045728-4758-13-git-send-email-niklas.soderlund+renesas@ragnatech.se>
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
 arch/arm/boot/dts/r8a7791.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791=
=2Edtsi
index 319e34c..7854a4f 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -811,8 +811,9 @@
 		clocks =3D <&mstp7_clks R8A7791_CLK_HSCIF0>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x39>, <&dmac0 0x3a>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x39>, <&dmac0 0x3a>,
+		       <&dmac1 0x39>, <&dmac1 0x3a>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -825,8 +826,9 @@
 		clocks =3D <&mstp7_clks R8A7791_CLK_HSCIF1>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x4d>, <&dmac0 0x4e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x4d>, <&dmac0 0x4e>,
+		       <&dmac1 0x4d>, <&dmac1 0x4e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -839,8 +841,9 @@
 		clocks =3D <&mstp7_clks R8A7791_CLK_HSCIF2>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x3b>, <&dmac0 0x3c>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x3b>, <&dmac0 0x3c>,
+		       <&dmac1 0x3b>, <&dmac1 0x3c>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
--=20
2.7.2
