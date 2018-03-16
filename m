From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 5/7] arm64: dts: msm8996: Add rpmpd device node
Date: Fri, 16 Mar 2018 09:38:22 +0530
Message-ID: <20180316040824.21472-6-rnayak@codeaurora.org>
References: <20180316040824.21472-1-rnayak@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180316040824.21472-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add rpmpd device node and its OPP table

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 46 +++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 0a6f7952bbb1..43757a078146 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -297,6 +297,52 @@
 				#clock-cells = <1>;
 			};
 
+			rpmpd: qcom,rpmpd {
+				compatible = "qcom,rpmpd-msm8996";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmpd_opp_table>, /* cx */
+						      <&rpmpd_opp_table>, /* cx_ao */
+						      <&rpmpd_opp_table>, /* cx_vfc */
+						      <&rpmpd_opp_table>, /* mx */
+						      <&rpmpd_opp_table>, /* mx_ao */
+						      <&rpmpd_opp_table>, /* sscx */
+						      <&rpmpd_opp_table>; /* sscx_vfc */
+			};
+
+			rpmpd_opp_table: opp-table {
+				compatible = "operating-points-v2", "operating-points-v2-qcom";
+
+				rpmpd_opp1: opp@1 {
+					opp-hz = /bits/ 64 <1>;
+					qcom,level = <1>;
+				};
+
+				rpmpd_opp2: opp@2 {
+					opp-hz = /bits/ 64 <2>;
+					qcom,level = <2>;
+				};
+
+				rpmpd_opp3: opp@3 {
+					opp-hz = /bits/ 64 <3>;
+					qcom,level = <3>;
+				};
+
+				rpmpd_opp4: opp@4 {
+					opp-hz = /bits/ 64 <4>;
+					qcom,level = <4>;
+				};
+
+				rpmpd_opp5: opp@5 {
+					opp-hz = /bits/ 64 <5>;
+					qcom,level = <5>;
+				};
+
+				rpmpd_opp6: opp@6 {
+					opp-hz = /bits/ 64 <6>;
+					qcom,level = <6>;
+				};
+			};
+
 			pm8994-regulators {
 				compatible = "qcom,rpm-pm8994-regulators";
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
