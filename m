Return-Path: <SRS0=vcRE=OH=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 5/5] ARM: dts: r8a7744: Add TPU support
Date: Wed, 28 Nov 2018 16:38:31 +0000
Message-Id: <1543423111-19745-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543423111-19745-1-git-send-email-biju.das@bp.renesas.com>
References: <1543423111-19745-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add TPU support to SoC DT.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7744.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 43da6a0..40de227 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -272,6 +272,16 @@
 			reg = <0 0xe6060000 0 0x164>;
 		};
 
+		tpu: pwm@e60f0000 {
+			compatible = "renesas,tpu-r8a7744", "renesas,tpu";
+			reg = <0 0xe60f0000 0 0x148>;
+			clocks = <&cpg CPG_MOD 304>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 304>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a7744-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
-- 
2.7.4
