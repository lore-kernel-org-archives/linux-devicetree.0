From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 26/30] ARM: dts: r8a7794: Reference both DMA controllers in HSCIF nodes
Date: Thu, 10 Mar 2016 12:36:18 +0100
Message-ID: <1457609782-24108-27-git-send-email-niklas.soderlund+renesas@ragnatech.se>
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
 arch/arm/boot/dts/r8a7794.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794=
=2Edtsi
index 9cff62b..5afe250 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -476,8 +476,9 @@
 		interrupts =3D <0 154 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp7_clks R8A7794_CLK_HSCIF0>;
 		clock-names =3D "sci_ick";
-		dmas =3D <&dmac0 0x39>, <&dmac0 0x3a>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x39>, <&dmac0 0x3a>,
+		       <&dmac1 0x39>, <&dmac1 0x3a>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -488,8 +489,9 @@
 		interrupts =3D <0 155 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp7_clks R8A7794_CLK_HSCIF1>;
 		clock-names =3D "sci_ick";
-		dmas =3D <&dmac0 0x4d>, <&dmac0 0x4e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x4d>, <&dmac0 0x4e>,
+		       <&dmac1 0x4d>, <&dmac1 0x4e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -500,8 +502,9 @@
 		interrupts =3D <0 21 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp7_clks R8A7794_CLK_HSCIF2>;
 		clock-names =3D "sci_ick";
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
