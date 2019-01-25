From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcs404: evb: Fix voltages for s5 and l3
Date: Fri, 25 Jan 2019 15:29:54 -0800
Message-ID: <20190125232954.26166-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Khasim Syed Mohammed <khasim.mohammed@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>
List-Id: devicetree@vger.kernel.org

PMS405 S5 was upstreamed without a voltage and PMS405 L3 is outside the
acceptable range, causing PCIe to fail. Fix these.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 579ddaf4f5fa..072061aa1b79 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -72,8 +72,8 @@
 		};
 
 		vreg_s5_1p35: s5 {
-			regulator-min-microvolt = <>;
-			regulator-max-microvolt = <>;
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
 		};
 
 		vreg_l1_1p3: l1 {
@@ -87,7 +87,7 @@
 		};
 
 		vreg_l3_1p05: l3 {
-			regulator-min-microvolt = <976000>;
+			regulator-min-microvolt = <1050000>;
 			regulator-max-microvolt = <1160000>;
 		};
 
-- 
2.18.0
