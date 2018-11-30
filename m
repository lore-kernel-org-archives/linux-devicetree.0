From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: msm8998: Fix compatible of scm node
Date: Thu, 29 Nov 2018 22:56:55 -0800
Message-ID: <20181130065655.26713-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The scm binding and driver was updated to rely on the fallback to the
default qcom,scm for any modern SoC and as such both are required. Add
the default compatible to make the scm instance probe.

Fixes: d850156a226a ("arm64: dts: qcom: msm8998: Add firmware node")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 78227cce16db..a15949d32bad 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -239,7 +239,7 @@
 
 	firmware {
 		scm {
-			compatible = "qcom,scm-msm8998";
+			compatible = "qcom,scm-msm8998", "qcom,scm";
 		};
 	};
 
-- 
2.18.0
