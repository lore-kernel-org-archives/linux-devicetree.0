Return-Path: <SRS0=NOhz=NG=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/2] ARM: dts: r8a77470: Add watchdog support to SoC dtsi
Date: Fri, 26 Oct 2018 10:32:26 +0100
Message-Id: <1540546347-42791-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds watchdog support to the r8a77470 SoC dtsi.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch tested against renesas-dev
---
 arch/arm/boot/dts/r8a77470.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index e40f5a9..872ad3a 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -196,6 +196,16 @@
 			reg = <0 0xe6160000 0 0x100>;
 		};
 
+		rwdt: watchdog@e6020000 {
+			compatible = "renesas,r8a77470-wdt",
+				     "renesas,rcar-gen2-wdt";
+			reg = <0 0xe6020000 0 0x0c>;
+			clocks = <&cpg CPG_MOD 402>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 402>;
+			status = "disabled";
+		};
+
 		sysc: system-controller@e6180000 {
 			compatible = "renesas,r8a77470-sysc";
 			reg = <0 0xe6180000 0 0x200>;
-- 
2.7.4
