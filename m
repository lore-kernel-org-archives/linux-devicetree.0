From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [RFC PATCH 9/9] arm64: dts: qcom: qcs404: Add CPR and populate OPP tables
Date: Thu,  4 Apr 2019 07:09:30 +0200
Message-ID: <20190404050931.9812-10-niklas.cassel@linaro.org>
References: <20190404050931.9812-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404050931.9812-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 152 ++++++++++++++++++++++++++-
 1 file changed, 148 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 5747beb8d55a..3643dae09eb4 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -33,6 +33,8 @@
 			next-level-cache = <&L2_0>;
 			clocks = <&apcs_glb>;
 			operating-points-v2 = <&cpu_opp_table>;
+			power-domains = <&cprpd>;
+			power-domain-names = "cpr";
 		};
 
 		CPU1: cpu@101 {
@@ -43,6 +45,8 @@
 			next-level-cache = <&L2_0>;
 			clocks = <&apcs_glb>;
 			operating-points-v2 = <&cpu_opp_table>;
+			power-domains = <&cprpd>;
+			power-domain-names = "cpr";
 		};
 
 		CPU2: cpu@102 {
@@ -53,6 +57,8 @@
 			next-level-cache = <&L2_0>;
 			clocks = <&apcs_glb>;
 			operating-points-v2 = <&cpu_opp_table>;
+			power-domains = <&cprpd>;
+			power-domain-names = "cpr";
 		};
 
 		CPU3: cpu@103 {
@@ -63,6 +69,8 @@
 			next-level-cache = <&L2_0>;
 			clocks = <&apcs_glb>;
 			operating-points-v2 = <&cpu_opp_table>;
+			power-domains = <&cprpd>;
+			power-domain-names = "cpr";
 		};
 
 		L2_0: l2-cache {
@@ -72,17 +80,17 @@
 	};
 
 	cpu_opp_table: cpu_opp_table {
-		compatible = "operating-points-v2";
+		compatible = "operating-points-v2-qcom-cpu";
+		nvmem-cells = <&cpr_efuse_speedbin>;
 		opp-shared;
 
 		opp-1094400000 {
 			opp-hz = /bits/ 64 <1094400000>;
+			required-opps = <&cpr_opp1>;
 		};
 		opp-1248000000 {
 			opp-hz = /bits/ 64 <1248000000>;
-		};
-		opp-1401600000 {
-			opp-hz = /bits/ 64 <1401600000>;
+			required-opps = <&cpr_opp2>;
 		};
 	};
 
@@ -411,6 +419,11 @@
 			assigned-clock-rates = <19200000>;
 		};
 
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-qcs404", "syscon";
+			reg = <0x1937000 0x25000>;
+		};
+
 		tcsr_mutex_regs: syscon@1905000 {
 			compatible = "syscon";
 			reg = <0x01905000 0x20000>;
@@ -812,6 +825,137 @@
 				status = "disabled";
 			};
 		};
+
+		qfprom: qfprom@a4000 {
+			compatible = "qcom,qfprom";
+			reg = <0xa4000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			cpr_efuse_speedbin: speedbin@13c {
+				reg = <0x13c 0x4>;
+				bits = <2 3>;
+			};
+			cpr_efuse_quot_offset1: qoffset1@231 {
+				reg = <0x231 0x4>;
+				bits = <4 7>;
+			};
+			cpr_efuse_quot_offset2: qoffset2@232 {
+				reg = <0x232 0x4>;
+				bits = <3 7>;
+			};
+			cpr_efuse_quot_offset3: qoffset3@233 {
+				reg = <0x233 0x4>;
+				bits = <2 7>;
+			};
+			cpr_efuse_init_voltage1: ivoltage1@229 {
+				reg = <0x229 0x4>;
+				bits = <4 6>;
+			};
+			cpr_efuse_init_voltage2: ivoltage2@22a {
+				reg = <0x22a 0x4>;
+				bits = <2 6>;
+			};
+			cpr_efuse_init_voltage3: ivoltage3@22b {
+				reg = <0x22b 0x4>;
+				bits = <0 6>;
+			};
+			cpr_efuse_quot1: quot1@22b {
+				reg = <0x22b 0x4>;
+				bits = <6 12>;
+			};
+			cpr_efuse_quot2: quot2@22d {
+				reg = <0x22d 0x4>;
+				bits = <2 12>;
+			};
+			cpr_efuse_quot3: quot3@230 {
+				reg = <0x230 0x4>;
+				bits = <0 12>;
+			};
+			cpr_efuse_ring1: ring1@228 {
+				reg = <0x228 0x4>;
+				bits = <0 3>;
+			};
+			cpr_efuse_ring2: ring2@228 {
+				reg = <0x228 0x4>;
+				bits = <4 3>;
+			};
+			cpr_efuse_ring3: ring3@229 {
+				reg = <0x229 0x4>;
+				bits = <0 3>;
+			};
+			cpr_efuse_revision: revision@218 {
+				reg = <0x218 0x4>;
+				bits = <3 3>;
+			};
+		};
+
+		cprpd: cpr@b018000 {
+			compatible = "qcom,qcs404-cpr", "qcom,cpr";
+			reg = <0xb018000 0x1000>;
+			interrupts = <0 15 IRQ_TYPE_EDGE_RISING>;
+			vdd-apc-supply = <&pms405_s3>;
+			#power-domain-cells = <0>;
+			operating-points-v2 = <&cpr_opp_table>;
+			acc-syscon = <&tcsr>;
+
+			nvmem-cells = <&cpr_efuse_quot_offset1>,
+				<&cpr_efuse_quot_offset2>,
+				<&cpr_efuse_quot_offset3>,
+				<&cpr_efuse_init_voltage1>,
+				<&cpr_efuse_init_voltage2>,
+				<&cpr_efuse_init_voltage3>,
+				<&cpr_efuse_quot1>,
+				<&cpr_efuse_quot2>,
+				<&cpr_efuse_quot3>,
+				<&cpr_efuse_ring1>,
+				<&cpr_efuse_ring2>,
+				<&cpr_efuse_ring3>,
+				<&cpr_efuse_revision>;
+			nvmem-cell-names = "cpr_quotient_offset1",
+				"cpr_quotient_offset2",
+				"cpr_quotient_offset3",
+				"cpr_init_voltage1",
+				"cpr_init_voltage2",
+				"cpr_init_voltage3",
+				"cpr_quotient1",
+				"cpr_quotient2",
+				"cpr_quotient3",
+				"cpr_ring_osc1",
+				"cpr_ring_osc2",
+				"cpr_ring_osc3",
+				"cpr_fuse_revision";
+
+			qcom,cpr-ref-clk = <19200>;
+			qcom,cpr-timer-delay-us = <5000>;
+			qcom,cpr-timer-cons-up = <0>;
+			qcom,cpr-timer-cons-down = <2>;
+			qcom,cpr-up-threshold = <1>;
+			qcom,cpr-down-threshold = <3>;
+			qcom,cpr-idle-clocks = <15>;
+			qcom,cpr-gcnt-us = <1>;
+			qcom,vdd-apc-step-up-limit = <1>;
+			qcom,vdd-apc-step-down-limit = <1>;
+		};
+
+		cpr_opp_table: opp-table {
+			compatible = "operating-points-v2-qcom-level";
+
+			cpr_opp1: opp1 {
+				opp-level = <1>;
+				qcom,opp-fuse-level = <1>;
+				opp-hz = /bits/ 64 <1094400000>;
+			};
+			cpr_opp2: opp2 {
+				opp-level = <2>;
+				qcom,opp-fuse-level = <2>;
+				opp-hz = /bits/ 64 <1248000000>;
+			};
+			cpr_opp3: opp3 {
+				opp-level = <3>;
+				qcom,opp-fuse-level = <3>;
+				opp-hz = /bits/ 64 <1401600000>;
+			};
+		};
 	};
 
 	timer {
-- 
2.20.1
