Return-Path: <SRS0=J41Z=KE=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] ARM: dts: r8a77470: Add PFC support
Date: Fri, 20 Jul 2018 14:09:46 +0100
Message-Id: <1532092186-3313-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Define the generic R8A77470 part of the PFC device node.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
Commit 73dacc3403436fc2 ("pinctrl: sh-pfc: Add r8a77470 PFC support") 
is in Linus' tree
---
 arch/arm/boot/dts/r8a77470.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 9b218c3..af65fa0 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -61,6 +61,11 @@
 		#size-cells = <2>;
 		ranges;
 
+		pfc: pin-controller@e6060000 {
+			compatible = "renesas,pfc-r8a77470";
+			reg = <0 0xe6060000 0 0x118>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a77470-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
-- 
2.7.4
