From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 4/6] arm64: dts: msm8996: Add rpmpd device node
Date: Fri, 25 May 2018 15:31:19 +0530
Message-ID: <20180525100121.28214-5-rnayak@codeaurora.org>
References: <20180525100121.28214-1-rnayak@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180525100121.28214-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, collinsd@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add rpmpd device node and its OPP table

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 40 +++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 37b7152cb064..e1bc86b2a230 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -308,6 +308,46 @@
 				#clock-cells = <1>;
 			};
 
+			rpmpd: power-controller {
+				compatible = "qcom,msm8996-rpmpd";
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
+				compatible = "operating-points-v2-qcom-level", "operating-points-v2";
+
+				rpmpd_opp1: opp@1 {
+					qcom,level = <1>;
+				};
+
+				rpmpd_opp2: opp@2 {
+					qcom,level = <2>;
+				};
+
+				rpmpd_opp3: opp@3 {
+					qcom,level = <3>;
+				};
+
+				rpmpd_opp4: opp@4 {
+					qcom,level = <4>;
+				};
+
+				rpmpd_opp5: opp@5 {
+					qcom,level = <5>;
+				};
+
+				rpmpd_opp6: opp@6 {
+					qcom,level = <6>;
+				};
+			};
+
 			pm8994-regulators {
 				compatible = "qcom,rpm-pm8994-regulators";
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
