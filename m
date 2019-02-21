From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 3/3] arm64: dts: qcom: qcs404: Add rpmpd node
Date: Wed, 20 Feb 2019 22:44:34 -0800
Message-ID: <20190221064434.2760-4-bjorn.andersson@linaro.org>
References: <20190221064434.2760-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221064434.2760-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the rpmpd node on the qcs404 and define the available levels.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 6c86b267da82..1ceb0432af55 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-qcs404.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -240,6 +241,40 @@
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
+					rpmpd_opp1: opp1 {
+						opp-level = <1>;
+					};
+
+					rpmpd_opp2: opp2 {
+						opp-level = <2>;
+					};
+
+					rpmpd_opp3: opp3 {
+						opp-level = <3>;
+					};
+
+					rpmpd_opp4: opp4 {
+						opp-level = <4>;
+					};
+
+					rpmpd_opp5: opp5 {
+						opp-level = <5>;
+					};
+
+					rpmpd_opp6: opp6 {
+						opp-level = <6>;
+					};
+				};
+			};
 		};
 	};
 
-- 
2.18.0
