Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 3/6] arm64: dts: qcom: qcs404: Fix voltages for s5 and l3
Date: Sun, 24 Mar 2019 22:02:06 +0530
Message-Id: <20190324163209.17312-4-vkoul@kernel.org>
In-Reply-To: <20190324163209.17312-1-vkoul@kernel.org>
References: <20190324163209.17312-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Khasim Syed Mohammed <khasim.mohammed@linaro.org>, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

PMS405 S5 was upstreamed without a voltage and PMS405 L3 is outside the
acceptable range, causing PCIe to fail. Fix these.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 50b3589c7f15..323f9633084b 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -56,8 +56,8 @@
 		};
 
 		vreg_s5_1p35: s5 {
-			regulator-min-microvolt = <>;
-			regulator-max-microvolt = <>;
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
 		};
 
 		vreg_l1_1p3: l1 {
@@ -71,7 +71,7 @@
 		};
 
 		vreg_l3_1p05: l3 {
-			regulator-min-microvolt = <976000>;
+			regulator-min-microvolt = <1050000>;
 			regulator-max-microvolt = <1160000>;
 		};
 
-- 
2.20.1
