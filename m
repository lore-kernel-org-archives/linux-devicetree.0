Return-Path: <SRS0=lXjp=OG=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 11/22] ARM: dts: r8a7744: Add DU support
Date: Tue, 27 Nov 2018 11:56:24 +0000
Message-Id: <1543319795-48325-12-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add du node to r8a7744 SoC DT. Boards that want to enable the DU
need to specify the output topology.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7744.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index d902f76..9c2e8ea 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -1300,8 +1300,17 @@
 		};
 
 		du: display@feb00000 {
+			compatible = "renesas,du-r8a7744";
 			reg = <0 0xfeb00000 0 0x40000>,
 			      <0 0xfeb90000 0 0x1c>;
+			reg-names = "du", "lvds.0";
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 724>,
+				 <&cpg CPG_MOD 723>,
+				 <&cpg CPG_MOD 726>;
+			clock-names = "du.0", "du.1", "lvds.0";
+			status = "disabled";
 
 			ports {
 				#address-cells = <1>;
@@ -1318,7 +1327,6 @@
 					};
 				};
 			};
-			/* placeholder */
 		};
 
 		prr: chipid@ff000044 {
-- 
2.7.4
