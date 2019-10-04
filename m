From: Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V1 2/2] ARM: dts: qcom: sc7180-regulator: Add RPMh regulators for SC7180
Date: Fri,  4 Oct 2019 16:20:57 +0530
Message-ID: <1570186257-10254-3-git-send-email-kgunda@codeaurora.org>
References: <1570186257-10254-1-git-send-email-kgunda@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570186257-10254-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kiran Gunda <kgunda@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add regulator devices for SC7180 as RPMh regulators. This ensures
that consumers are able to modify the physical state of PMIC
regulators.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180-regulator.dtsi | 210 +++++++++++++++++++++++++
 1 file changed, 210 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-regulator.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sc7180-regulator.dtsi b/arch/arm64/boot/dts/qcom/sc7180-regulator.dtsi
new file mode 100644
index 0000000..50a675b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-regulator.dtsi
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019, The Linux Foundation. All rights reserved.
+
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+&apps_rsc {
+	pm6150-rpmh-regulators {
+		compatible = "qcom,pm6150-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s1a_1p1: smps1 {
+			regulator-min-microvolt = <1128000>;
+			regulator-max-microvolt = <1128000>;
+		};
+
+		vreg_s4a_1p0: smps4 {
+			regulator-min-microvolt = <824000>;
+			regulator-max-microvolt = <1120000>;
+		};
+
+		vreg_s5a_2p0: smps5 {
+			regulator-min-microvolt = <1744000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_l1a_1p2: ldo1 {
+			regulator-min-microvolt = <1178000>;
+			regulator-max-microvolt = <1256000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l2a_1p0: ldo2 {
+			regulator-min-microvolt = <944000>;
+			regulator-max-microvolt = <1056000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l3a_1p0: ldo3 {
+			regulator-min-microvolt = <968000>;
+			regulator-max-microvolt = <1064000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l4a_0p8: ldo4 {
+			regulator-min-microvolt = <824000>;
+			regulator-max-microvolt = <928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l5a_2p7: ldo5 {
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l6a_0p6: ldo6 {
+			regulator-min-microvolt = <568000>;
+			regulator-max-microvolt = <648000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l9a_0p6: ldo9 {
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l10a_1p8: ldo10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l11a_1p8: ldo11 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1952000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l13a_1p8: ldo13 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l14a_1p8: ldo14 {
+			regulator-min-microvolt = <1728000>;
+			regulator-max-microvolt = <1832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l15a_1p8: ldo15 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l16a_2p7: ldo16 {
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l17a_3p0: ldo17 {
+			regulator-min-microvolt = <2920000>;
+			regulator-max-microvolt = <3232000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l18a_2p8: ldo18 {
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l19a_2p9: ldo19 {
+			regulator-min-microvolt = <2696000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+	};
+
+	pm6150l-rpmh-regulators {
+		compatible = "qcom,pm6150l-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_s8c_1p3: smps8 {
+			regulator-min-microvolt = <1120000>;
+			regulator-max-microvolt = <1408000>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-min-microvolt = <1616000>;
+			regulator-max-microvolt = <1984000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l2c_1p3: ldo2 {
+			regulator-min-microvolt = <1168000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l3c_1p2: ldo3 {
+			regulator-min-microvolt = <1144000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l4c_1p8: ldo4 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l5c_1p8: ldo5 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l6c_2p9: ldo6 {
+			regulator-min-microvolt = <2696000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l7c_3p0: ldo7 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l8c_1p8: ldo8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l9c_2p9: ldo9 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l10c_3p3: ldo10 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l11c_3p3: ldo11 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
