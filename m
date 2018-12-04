From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v5 7/8] arm64: dts: sdm845: Add rpmh powercontroller node
Date: Tue,  4 Dec 2018 10:51:18 +0530
Message-ID: <20181204052119.806-8-rnayak@codeaurora.org>
References: <20181204052119.806-1-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204052119.806-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add the DT node for the rpmhpd powercontroller.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 51 ++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b72bdb0a31a5..a6d0cd8d17b0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/reset/qcom,sdm845-aoss.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -1324,6 +1325,56 @@
 				compatible = "qcom,sdm845-rpmh-clk";
 				#clock-cells = <1>;
 			};
+
+			rpmhpd: power-controller {
+				compatible = "qcom,sdm845-rpmhpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmhpd_opp_table>;
+			};
+
+			rpmhpd_opp_table: opp-table {
+				compatible = "operating-points-v2-qcom-level";
+
+				rpmhpd_opp_ret: opp1 {
+					qcom,level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+				};
+
+				rpmhpd_opp_min_svs: opp2 {
+					qcom,level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				};
+
+				rpmhpd_opp_low_svs: opp3 {
+					qcom,level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				rpmhpd_opp_svs: opp4 {
+					qcom,level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				rpmhpd_opp_svs_l1: opp5 {
+					qcom,level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				rpmhpd_opp_nom: opp6 {
+					qcom,level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+
+				rpmhpd_opp_nom_l1: opp7 {
+					qcom,level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+				};
+
+				rpmhpd_opp_nom_l2: opp8 {
+					qcom,level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+				};
+
+				rpmhpd_opp_turbo: opp9 {
+					qcom,level = <RPMH_REGULATOR_LEVEL_TURBO>;
+				};
+
+				rpmhpd_opp_turbo_l1: opp10 {
+					qcom,level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+				};
+			};
 		};
 
 		intc: interrupt-controller@17a00000 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
