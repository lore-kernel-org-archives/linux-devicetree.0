From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 1/7] dt-bindings: power: Add qcom rpm power domain driver bindings
Date: Tue, 12 Jun 2018 10:10:46 +0530
Message-ID: <20180612044052.4402-2-rnayak@codeaurora.org>
References: <20180612044052.4402-1-rnayak@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612044052.4402-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, collinsd@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add DT bindings to describe the rpm power domains found on Qualcomm
Technologies, Inc. SoCs. These power domains communicate a performance
state to RPM, which then translates it into corresponding voltage on a
PMIC rail.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.txt  | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.txt

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
new file mode 100644
index 000000000000..61a0e2687940
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
@@ -0,0 +1,49 @@
+Qualcomm RPM Power domains
+
+For RPM Power domains, we communicate a performance state to RPM
+which then translates it into a corresponding voltage on a rail
+
+Required Properties:
+ - compatible: Should be one of the following
+	* qcom,msm8996-rpmpd: RPM Power domain for the msm8996 family of SoC
+ - power-domain-cells: number of cells in Power domain specifier
+	must be 1.
+ - operating-points-v2: Phandle to the OPP table for the Power domain.
+	Refer to Documentation/devicetree/bindings/power/power_domain.txt
+	and Documentation/devicetree/bindings/opp/qcom-opp.txt for more details
+
+Example:
+
+	rpmpd: power-controller {
+		compatible = "qcom,msm8996-rpmpd";
+		#power-domain-cells = <1>;
+		operating-points-v2 = <&rpmpd_opp_table>;
+	};
+
+	rpmpd_opp_table: opp-table {
+		compatible = "operating-points-v2-qcom-level";
+
+		rpmpd_opp1: opp1 {
+			qcom,level = <1>;
+		};
+
+		rpmpd_opp2: opp2 {
+			qcom,level = <2>;
+		};
+
+		rpmpd_opp3: opp3 {
+			qcom,level = <3>;
+		};
+
+		rpmpd_opp4: opp4 {
+			qcom,level = <4>;
+		};
+
+		rpmpd_opp5: opp5 {
+			qcom,level = <5>;
+		};
+
+		rpmpd_opp6: opp6 {
+			qcom,level = <6>;
+		};
+	};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
