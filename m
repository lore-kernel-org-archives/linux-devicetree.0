From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v6 02/10] dt-bindings: power: Add qcom rpm power domain driver bindings
Date: Tue, 11 Dec 2018 15:19:30 +0530
Message-ID: <20181211094938.25086-3-rnayak@codeaurora.org>
References: <20181211094938.25086-1-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211094938.25086-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, robh@kernel.org, viresh.kumar@linaro.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add DT bindings to describe the rpm/rpmh power domains found on Qualcomm
Technologies, Inc. SoCs. These power domains communicate a performance
state to RPM/RPMh, which then translates it into corresponding voltage on a
PMIC rail.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.txt  | 146 ++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        |  39 +++++
 2 files changed, 185 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.txt
 create mode 100644 include/dt-bindings/power/qcom-rpmpd.h

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
new file mode 100644
index 000000000000..a776e4407f09
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
@@ -0,0 +1,146 @@
+Qualcomm RPM/RPMh Power domains
+
+For RPM/RPMh Power domains, we communicate a performance state to RPM/RPMh
+which then translates it into a corresponding voltage on a rail
+
+Required Properties:
+ - compatible: Should be one of the following
+	* qcom,msm8996-rpmpd: RPM Power domain for the msm8996 family of SoC
+	* qcom,sdm845-rpmhpd: RPMh Power domain for the sdm845 family of SoC
+ - power-domain-cells: number of cells in Power domain specifier
+	must be 1.
+ - operating-points-v2: Phandle to the OPP table for the Power domain.
+	Refer to Documentation/devicetree/bindings/power/power_domain.txt
+	and Documentation/devicetree/bindings/opp/qcom-opp.txt for more details
+
+Refer to <dt-bindings/power/qcom-rpmpd.h> for the level values for
+various OPPs for different platforms as well as Power domain indexes
+
+Example: rpmh power domain controller and OPP table
+
+#include <dt-bindings/power/qcom-rpmhpd.h>
+
+qcom,level values specified in the OPP tables for RPMh power domains
+should use the RPMH_REGULATOR_LEVEL_* constants from
+<dt-bindings/power/qcom-rpmhpd.h>
+
+	rpmhpd: power-controller {
+		compatible = "qcom,sdm845-rpmhpd";
+		#power-domain-cells = <1>;
+		operating-points-v2 = <&rpmhpd_opp_table>;
+
+		rpmhpd_opp_table: opp-table {
+			compatible = "operating-points-v2-qcom-level";
+
+			rpmhpd_opp_ret: opp1 {
+				qcom,level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+			};
+
+			rpmhpd_opp_min_svs: opp2 {
+				qcom,level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+			};
+
+			rpmhpd_opp_low_svs: opp3 {
+				qcom,level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+			};
+
+			rpmhpd_opp_svs: opp4 {
+				qcom,level = <RPMH_REGULATOR_LEVEL_SVS>;
+			};
+
+			rpmhpd_opp_svs_l1: opp5 {
+				qcom,level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			};
+
+			rpmhpd_opp_nom: opp6 {
+				qcom,level = <RPMH_REGULATOR_LEVEL_NOM>;
+			};
+
+			rpmhpd_opp_nom_l1: opp7 {
+				qcom,level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+			};
+
+			rpmhpd_opp_nom_l2: opp8 {
+				qcom,level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+			};
+
+			rpmhpd_opp_turbo: opp9 {
+				qcom,level = <RPMH_REGULATOR_LEVEL_TURBO>;
+			};
+
+			rpmhpd_opp_turbo_l1: opp10 {
+				qcom,level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+			};
+		};
+	};
+
+Example: rpm power domain controller and OPP table
+
+	rpmpd: power-controller {
+		compatible = "qcom,msm8996-rpmpd";
+		#power-domain-cells = <1>;
+		operating-points-v2 = <&rpmpd_opp_table>;
+
+		rpmpd_opp_table: opp-table {
+			compatible = "operating-points-v2-qcom-level";
+
+			rpmpd_opp_low: opp1 {
+				qcom,level = <1>;
+			};
+
+			rpmpd_opp_ret: opp2 {
+				qcom,level = <2>;
+			};
+
+			rpmpd_opp_svs: opp3 {
+				qcom,level = <3>;
+			};
+
+			rpmpd_opp_normal: opp4 {
+				qcom,level = <4>;
+			};
+
+			rpmpd_opp_high: opp5 {
+				qcom,level = <5>;
+			};
+
+			rpmpd_opp_turbo: opp6 {
+				qcom,level = <6>;
+			};
+		};
+	};
+
+Example: Client/Consumer device using OPP table
+
+	leaky-device0@12350000 {
+		compatible = "foo,i-leak-current";
+		reg = <0x12350000 0x1000>;
+		power-domains = <&rpmhpd SDM845_MX>;
+		operating-points-v2 = <&leaky_opp_table>;
+	};
+
+
+	leaky_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp1 {
+			opp-hz = /bits/ 64 <144000>;
+			required-opps = <&rpmhpd_opp_low>;
+		};
+
+		opp2 {
+			opp-hz = /bits/ 64 <400000>;
+			required-opps = <&rpmhpd_opp_ret>;
+		};
+
+		opp3 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmpd_opp_svs>;
+		};
+
+		opp4 {
+			opp-hz = /bits/ 64 <25000000>;
+			required-opps = <&rpmpd_opp_normal>;
+		};
+
+	};
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
new file mode 100644
index 000000000000..87d9c6611682
--- /dev/null
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
+
+#ifndef _DT_BINDINGS_POWER_QCOM_RPMPD_H
+#define _DT_BINDINGS_POWER_QCOM_RPMPD_H
+
+/* SDM845 Power Domain Indexes */
+#define SDM845_EBI	0
+#define SDM845_MX	1
+#define SDM845_MX_AO	2
+#define SDM845_CX	3
+#define SDM845_CX_AO	4
+#define SDM845_LMX	5
+#define SDM845_LCX	6
+#define SDM845_GFX	7
+#define SDM845_MSS	8
+
+/* SDM845 Power Domain performance levels */
+#define RPMH_REGULATOR_LEVEL_RETENTION	16
+#define RPMH_REGULATOR_LEVEL_MIN_SVS	48
+#define RPMH_REGULATOR_LEVEL_LOW_SVS	64
+#define RPMH_REGULATOR_LEVEL_SVS	128
+#define RPMH_REGULATOR_LEVEL_SVS_L1	192
+#define RPMH_REGULATOR_LEVEL_NOM	256
+#define RPMH_REGULATOR_LEVEL_NOM_L1	320
+#define RPMH_REGULATOR_LEVEL_NOM_L2	336
+#define RPMH_REGULATOR_LEVEL_TURBO	384
+#define RPMH_REGULATOR_LEVEL_TURBO_L1	416
+
+/* MSM8996 Power Domain Indexes */
+#define MSM8996_VDDCX		0
+#define MSM8996_VDDCX_AO	1
+#define MSM8996_VDDCX_VFC	2
+#define MSM8996_VDDMX		3
+#define MSM8996_VDDMX_AO	4
+#define MSM8996_VDDSSCX		5
+#define MSM8996_VDDSSCX_VFC	6
+
+#endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
