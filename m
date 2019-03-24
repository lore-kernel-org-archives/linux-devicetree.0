From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 6/9] arm64: dts: qcom: qcs404: Add rpmpd node
Date: Sun, 24 Mar 2019 23:20:04 +0530
Message-ID: <20190324175007.29040-7-sibis@codeaurora.org>
References: <20190324175007.29040-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190324175007.29040-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, rnayak@codeaurora.org
Cc: david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add the rpmpd node on the qcs404 and define the available levels.

[sibis: fixup available levels]
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 55 ++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index e8fd26633d57..a7d46647c416 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-qcs404.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -230,6 +231,60 @@
 				compatible = "qcom,rpmcc-qcs404";
 				#clock-cells = <1>;
 			};
+
+			rpmpd: power-controller {
+				compatible = "qcom,qcs404-rpmpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmpd_opp_table>;
+
+				rpmpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmpd_opp_ret: opp1 {
+						opp-level = <RPM_SMD_LEVEL_RETENTION>;
+					};
+
+					rpmpd_opp_ret_plus: opp2 {
+						opp-level = <RPM_SMD_LEVEL_RETENTION_PLUS>;
+					};
+
+					rpmpd_opp_min_svs: opp3 {
+						opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
+					};
+
+					rpmpd_opp_low_svs: opp4 {
+						opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
+					};
+
+					rpmhpd_opp_svs: opp5 {
+						opp-level = <RPM_SMD_LEVEL_SVS>;
+					};
+
+					rpmhpd_opp_svs_plus: opp6 {
+						opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
+					};
+
+					rpmhpd_opp_nom: opp7 {
+						opp-level = <RPM_SMD_LEVEL_NOM>;
+					};
+
+					rpmhpd_opp_nom_plus: opp8 {
+						opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
+					};
+
+					rpmhpd_opp_turbo: opp9 {
+						opp-level = <RPM_SMD_LEVEL_TURBO>;
+					};
+
+					rpmhpd_opp_turbo_no_cpr: opp10 {
+						opp-level = <RPM_SMD_LEVEL_TURBO_NO_CPR>;
+					};
+
+					rpmhpd_opp_turbo_plus: opp11 {
+						opp-level = <RPM_SMD_LEVEL_BINNING>;
+					};
+				};
+			};
 		};
 	};
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
