Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] arm64: dts: qcom: qcs404-evb: Fix typo
Date: Thu,  2 May 2019 17:43:06 +0530
Message-Id: <20190502121306.3374-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Fix the typo "dreive-strength" and use correct property drive-strength

Fixes: 7241ab944da3 ("arm64: dts: qcom: qcs404: Add sdcc1 node")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 2c3127167e3c..7cc0b7842ac2 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -200,7 +200,7 @@
 		data {
 			pins = "sdc1_data";
 			bias-pull-up;
-			dreive-strength = <10>;
+			drive-strength = <10>;
 		};
 
 		rclk {
@@ -225,7 +225,7 @@
 		data {
 			pins = "sdc1_data";
 			bias-pull-up;
-			dreive-strength = <2>;
+			drive-strength = <2>;
 		};
 
 		rclk {
-- 
2.20.1
