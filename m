From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v8 05/10] arm64: dts: msm8996: Add rpmpd device node
Date: Fri, 21 Dec 2018 14:26:17 +0530
Message-ID: <20181221085622.25573-6-rnayak@codeaurora.org>
References: <20181221085622.25573-1-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181221085622.25573-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, robh@kernel.org, viresh.kumar@linaro.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add rpmpd device node and its OPP table

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 34 +++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 99b7495455a6..cac70623600f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -306,6 +306,40 @@
 				#clock-cells = <1>;
 			};
 
+			rpmpd: power-controller {
+				compatible = "qcom,msm8996-rpmpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmpd_opp_table>;
+
+				rpmpd_opp_table: opp-table {
+					compatible = "operating-points-v2-qcom-level";
+
+					rpmpd_opp1: opp1 {
+						qcom,level = <1>;
+					};
+
+					rpmpd_opp2: opp2 {
+						qcom,level = <2>;
+					};
+
+					rpmpd_opp3: opp3 {
+						qcom,level = <3>;
+					};
+
+					rpmpd_opp4: opp4 {
+						qcom,level = <4>;
+					};
+
+					rpmpd_opp5: opp5 {
+						qcom,level = <5>;
+					};
+
+					rpmpd_opp6: opp6 {
+						qcom,level = <6>;
+					};
+				};
+			};
+
 			pm8994-regulators {
 				compatible = "qcom,rpm-pm8994-regulators";
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
