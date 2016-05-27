From: Kieran Bingham <kieran@ksquared.org.uk>
Subject: [PATCH 4/4] arm64: dts: r8a7795: add FCPF device nodes
Date: Fri, 27 May 2016 18:19:25 +0100
Message-ID: <1464369565-12259-6-git-send-email-kieran@bingham.xyz>
References: <1464369565-12259-1-git-send-email-kieran@bingham.xyz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464369565-12259-1-git-send-email-kieran@bingham.xyz>
Sender: linux-kernel-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, linux-renesas-soc@vger.kernel.org, kieran@ksquared.org.uk
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Provide nodes for the FCP devices dedicated to the FDP device channels.

Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 26df3001617e..14f086b9036d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1610,5 +1610,26 @@
 			interrupts = <0 436 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 728>;
 		};
+
+		fcpf0: fcp@fe950000 {
+			compatible = "renesas,r8a7795-fcpf", "renesas,fcpf";
+			reg = <0 0xfe950000 0 0x200>;
+			clocks = <&cpg CPG_MOD 615>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+		};
+
+		fcpf1: fcp@fe951000 {
+			compatible = "renesas,r8a7795-fcpf", "renesas,fcpf";
+			reg = <0 0xfe951000 0 0x200>;
+			clocks = <&cpg CPG_MOD 614>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+		};
+
+		fcpf2: fcp@fe952000 {
+			compatible = "renesas,r8a7795-fcpf", "renesas,fcpf";
+			reg = <0 0xfe952000 0 0x200>;
+			clocks = <&cpg CPG_MOD 613>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+		};
 	};
 };
-- 
2.5.0
