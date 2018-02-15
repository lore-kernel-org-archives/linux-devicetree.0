From: Kieran Bingham <kbingham@kernel.org>
Subject: [PATCH 5/8] arm64: dts: renesas: r8a77995: Add LVDS support
Date: Thu, 15 Feb 2018 08:38:20 +0000
Message-ID: <1518683903-10681-6-git-send-email-kbingham@kernel.org>
References: <1518683903-10681-1-git-send-email-kbingham@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518683903-10681-1-git-send-email-kbingham@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms@verge.net.au>, geert@glider.be, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The r8a77995 D3 platform has 2 LVDS channels connected to the DU.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 52 +++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index a57d5fecf79c..7851e37cfff1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -773,18 +773,70 @@
 				port@1 {
 					reg = <1>;
 					du_out_lvds0: endpoint {
+						remote-endpoint = <&du_out_lvds0>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 					du_out_lvds1: endpoint {
+						remote-endpoint = <&du_out_lvds1>;
 					};
 				};
 			};
 		};
 	};
 
+	lvds0: lvds@feb90000 {
+		compatible = "renesas,lvds-r8a77995";
+		reg = <0 0xfeb90000 0 0x20>;
+		clocks = <&cpg CPG_MOD 727>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lvds0_in: endpoint {
+					remote-endpoint = <&du_out_lvds0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				lvds0_out: endpoint {
+				};
+			};
+		};
+	};
+
+	lvds1: lvds@feb90100 {
+		compatible = "renesas,lvds-r8a77995";
+		reg = <0 0xfeb90100 0 0x20>;
+		clocks = <&cpg CPG_MOD 727>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lvds1_in: endpoint {
+					remote-endpoint = <&du_out_lvds1>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				lvds1_out: endpoint {
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.7.4
