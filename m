Return-Path: <SRS0=5gDw=OO=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 3/5] ARM: dts: r8a7744: Add DU support
Date: Wed,  5 Dec 2018 09:06:53 +0000
Message-Id: <1544000815-28069-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
References: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add du node to r8a7744 SoC DT. Boards that want to enable the DU
need to specify the output topology.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
	* Removed LVDS encoder definition from DU node.
---
 arch/arm/boot/dts/r8a7744.dtsi | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 04148d6..6a51b16 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -1645,8 +1645,14 @@
 		};
 
 		du: display@feb00000 {
-			reg = <0 0xfeb00000 0 0x40000>,
-			      <0 0xfeb90000 0 0x1c>;
+			compatible = "renesas,du-r8a7744";
+			reg = <0 0xfeb00000 0 0x40000>;
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 724>,
+				 <&cpg CPG_MOD 723>;
+			clock-names = "du.0", "du.1";
+			status = "disabled";
 
 			ports {
 				#address-cells = <1>;
@@ -1663,7 +1669,6 @@
 					};
 				};
 			};
-			/* placeholder */
 		};
 
 		prr: chipid@ff000044 {
-- 
2.7.4
