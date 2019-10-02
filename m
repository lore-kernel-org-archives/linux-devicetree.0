From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: db845c: Enable LVS 1 and 2
Date: Tue,  1 Oct 2019 21:16:54 -0700
Message-ID: <20191002041654.3620-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

vreg_lvs1a_1p8 and vreg_lvs2a_1p8 are both feeding pins in the low speed
connectors and should as such alway be on, so enable them.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index c314b5d55796..6e97ae7f7a08 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -312,6 +312,18 @@
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
+
+		vreg_lvs1a_1p8: lvs1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
+		vreg_lvs2a_1p8: lvs2 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
 	};
 
 	pmi8998-rpmh-regulators {
-- 
2.18.0
