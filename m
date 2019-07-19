From: David Dai <daidavid1@codeaurora.org>
Subject: [PATCH 2/2] arm64: dts: sdm845: Redefine interconnect provider DT nodes
Date: Fri, 19 Jul 2019 13:32:24 -0700
Message-ID: <1563568344-1274-3-git-send-email-daidavid1@codeaurora.org>
References: <1563568344-1274-1-git-send-email-daidavid1@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563568344-1274-1-git-send-email-daidavid1@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: georgi.djakov@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: David Dai <daidavid1@codeaurora.org>, evgreen@google.com, ilina@codeaurora.org, seansw@qti.qualcomm.com, elder@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the DT nodes for each of the Network-On-Chip interconnect
buses found on SDM845 based platform and redefine the rsc_hlos
child node as a bcm-voter device to better represent the hardware.

Signed-off-by: David Dai <daidavid1@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 61 ++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index e7d78bc..204222e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -610,6 +610,62 @@
 			#power-domain-cells = <1>;
 		};
 
+		aggre1_noc: interconnect@16e0000 {
+			compatible = "qcom,sdm845-aggre1_noc";
+			reg = <0 0x16e0000 0 0xd080>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voter = <&apps_bcm_voter>;
+		};
+
+		aggre2_noc: interconnect@1700000 {
+			compatible = "qcom,sdm845-aggre2_noc";
+			reg = <0 0x1700000 0 0x3b100>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voter = <&apps_bcm_voter>;
+		};
+
+		config_noc: interconnect@1500000 {
+			compatible = "qcom,sdm845-config_noc";
+			reg = <0 0x1500000 0 0x5080>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voter = <&apps_bcm_voter>;
+		};
+
+		dc_noc: interconnect@14e0000 {
+			compatible = "qcom,sdm845-dc_noc";
+			reg = <0 0x14e0000 0 0x400>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voter = <&apps_bcm_voter>;
+		};
+
+		gladiator_noc: interconnect@17900000 {
+			compatible = "qcom,sdm845-gladiator_noc";
+			reg = <0 0x17900000 0 0xd080>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voter = <&apps_bcm_voter>;
+		};
+
+		mem_noc: interconnect@1380000 {
+			compatible = "qcom,sdm845-mem_noc";
+			reg = <0 0x1380000 0 0x27200>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voter = <&apps_bcm_voter>;
+		};
+
+		mmss_noc: interconnect@1740000 {
+			compatible = "qcom,sdm845-mmss_noc";
+			reg = <0 0x1740000 0 0x1c1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voter = <&apps_bcm_voter>;
+		};
+
+		system_noc: interconnect@1620000 {
+			compatible = "qcom,sdm845-system_noc";
+			reg = <0 0x1620000 0 0x18080>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voter = <&apps_bcm_voter>;
+		};
+
 		qfprom@784000 {
 			compatible = "qcom,qfprom";
 			reg = <0 0x00784000 0 0x8ff>;
@@ -2801,9 +2857,8 @@
 				};
 			};
 
-			rsc_hlos: interconnect {
-				compatible = "qcom,sdm845-rsc-hlos";
-				#interconnect-cells = <1>;
+			apps_bcm_voter: bcm_voter {
+				compatible = "qcom,sdm845-bcm-voter";
 			};
 		};
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
