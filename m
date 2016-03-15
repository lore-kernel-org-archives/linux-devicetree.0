From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 05/31] ARM: dts: r8a7790: Reference both DMA controllers in MSIOF nodes
Date: Tue, 15 Mar 2016 13:41:42 +0100
Message-ID: <1458045728-4758-6-git-send-email-niklas.soderlund+renesas@ragnatech.se>
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
index fe1e995..102973c 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1508,8 +1508,9 @@
 		reg =3D <0 0xe6e20000 0 0x0064>;
 		interrupts =3D <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp0_clks R8A7790_CLK_MSIOF0>;
-		dmas =3D <&dmac0 0x51>, <&dmac0 0x52>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x51>, <&dmac0 0x52>,
+		       <&dmac1 0x51>, <&dmac1 0x52>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
@@ -1521,8 +1522,9 @@
 		reg =3D <0 0xe6e10000 0 0x0064>;
 		interrupts =3D <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7790_CLK_MSIOF1>;
-		dmas =3D <&dmac0 0x55>, <&dmac0 0x56>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x55>, <&dmac0 0x56>,
+		       <&dmac1 0x55>, <&dmac1 0x56>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
@@ -1534,8 +1536,9 @@
 		reg =3D <0 0xe6e00000 0 0x0064>;
 		interrupts =3D <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7790_CLK_MSIOF2>;
-		dmas =3D <&dmac0 0x41>, <&dmac0 0x42>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x41>, <&dmac0 0x42>,
+		       <&dmac1 0x41>, <&dmac1 0x42>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
@@ -1547,8 +1550,9 @@
 		reg =3D <0 0xe6c90000 0 0x0064>;
 		interrupts =3D <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp2_clks R8A7790_CLK_MSIOF3>;
-		dmas =3D <&dmac0 0x45>, <&dmac0 0x46>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x45>, <&dmac0 0x46>,
+		       <&dmac1 0x45>, <&dmac1 0x46>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
--=20
2.7.2
