Return-Path: <SRS0=pfTY=L7=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 2/2] ARM: dts: r8a77470: Add APMU node and second CPU core
Date: Mon, 17 Sep 2018 09:44:10 +0100
Message-Id: <1537173850-5310-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1537173850-5310-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1537173850-5310-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add DT node for the Advanced Power Management Unit (APMU), add the
second CPU core, and use "renesas,apmu" as "enable-method".

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/boot/dts/r8a77470.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index c053a28..9aba350 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -17,6 +17,7 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -28,6 +29,15 @@
 			next-level-cache = <&L2_CA7>;
 		};
 
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <1>;
+			clock-frequency = <1000000000>;
+			clocks = <&cpg CPG_CORE R8A77470_CLK_Z2>;
+			power-domains = <&sysc R8A77470_PD_CA7_CPU1>;
+			next-level-cache = <&L2_CA7>;
+		};
 
 		L2_CA7: cache-controller-0 {
 			compatible = "cache";
@@ -167,6 +177,12 @@
 			#reset-cells = <1>;
 		};
 
+		apmu@e6151000 {
+			compatible = "renesas,r8a77470-apmu", "renesas,apmu";
+			reg = <0 0xe6151000 0 0x188>;
+			cpus = <&cpu0 &cpu1>;
+		};
+
 		rst: reset-controller@e6160000 {
 			compatible = "renesas,r8a77470-rst";
 			reg = <0 0xe6160000 0 0x100>;
-- 
2.7.4
