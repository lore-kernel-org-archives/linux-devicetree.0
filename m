Return-Path: <SRS0=hFAX=SS=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/6] arm64: dts: r8a774a1: Add VSP instances
Date: Tue, 16 Apr 2019 16:31:52 +0100
Message-Id: <1555428717-18376-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com>
References: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

The r8a774a1 soc has 5 VSP instances similar to r8a7796.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 55 +++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index de282c4..f71bd22 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -1877,6 +1877,61 @@
 			iommus = <&ipmmu_vc0 19>;
 		};
 
+		vspb: vsp@fe960000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe960000 0 0x8000>;
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 626>;
+			power-domains = <&sysc R8A774A1_PD_A3VC>;
+			resets = <&cpg 626>;
+
+			renesas,fcp = <&fcpvb0>;
+		};
+
+		vspd0: vsp@fea20000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea20000 0 0x5000>;
+			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 623>;
+			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
+			resets = <&cpg 623>;
+
+			renesas,fcp = <&fcpvd0>;
+		};
+
+		vspd1: vsp@fea28000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea28000 0 0x5000>;
+			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 622>;
+			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
+			resets = <&cpg 622>;
+
+			renesas,fcp = <&fcpvd1>;
+		};
+
+		vspd2: vsp@fea30000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea30000 0 0x5000>;
+			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 621>;
+			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
+			resets = <&cpg 621>;
+
+			renesas,fcp = <&fcpvd2>;
+		};
+
+		vspi0: vsp@fe9a0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe9a0000 0 0x8000>;
+			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 631>;
+			power-domains = <&sysc R8A774A1_PD_A3VC>;
+			resets = <&cpg 631>;
+
+			renesas,fcp = <&fcpvi0>;
+		};
+
 		csi20: csi2@fea80000 {
 			compatible = "renesas,r8a774a1-csi2";
 			reg = <0 0xfea80000 0 0x10000>;
-- 
2.7.4
