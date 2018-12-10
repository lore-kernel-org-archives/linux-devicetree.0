Return-Path: <SRS0=cC9Q=OT=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] ARM: dts: r8a7743: Remove generic compatible string from iic3
Date: Mon, 10 Dec 2018 11:57:57 +0000
Message-Id: <1544443077-49827-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

The iic3 block on RZ/G1M does not support automatic transmission, unlike
other R-Car SoC's. So dropping the compatibility with the generic version.

Fixes: f523405f2a22cc0c307 ("ARM: dts: r8a7743: Add IIC cores to dtsi")

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7743.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 7b731c7..182464d 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -564,9 +564,7 @@
 			/* doesn't need pinmux */
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "renesas,iic-r8a7743",
-				     "renesas,rcar-gen2-iic",
-				     "renesas,rmobile-iic";
+			compatible = "renesas,iic-r8a7743";
 			reg = <0 0xe60b0000 0 0x425>;
 			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 926>;
-- 
2.7.4
