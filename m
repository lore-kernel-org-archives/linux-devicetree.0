From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 09/30] ARM: dts: r8a7790: Reference both DMA controllers in MMCIF nodes
Date: Thu, 10 Mar 2016 12:36:01 +0100
Message-ID: <1457609782-24108-10-git-send-email-niklas.soderlund+renesas@ragnatech.se>
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
 arch/arm/boot/dts/r8a7790.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790=
=2Edtsi
index ae86a68..108dc4d 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -518,8 +518,9 @@
 		reg =3D <0 0xee200000 0 0x80>;
 		interrupts =3D <0 169 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_MMCIF0>;
-		dmas =3D <&dmac0 0xd1>, <&dmac0 0xd2>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xd1>, <&dmac0 0xd2>,
+		       <&dmac1 0xd1>, <&dmac1 0xd2>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		reg-io-width =3D <4>;
 		status =3D "disabled";
@@ -531,8 +532,9 @@
 		reg =3D <0 0xee220000 0 0x80>;
 		interrupts =3D <0 170 IRQ_TYPE_LEVEL_HIGH>;
 		clocks =3D <&mstp3_clks R8A7790_CLK_MMCIF1>;
-		dmas =3D <&dmac0 0xe1>, <&dmac0 0xe2>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0xe1>, <&dmac0 0xe2>,
+		       <&dmac1 0xe1>, <&dmac1 0xe2>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		reg-io-width =3D <4>;
 		status =3D "disabled";
--=20
2.7.2
