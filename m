From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 3/5] arm64: dts: remove s2 regulator from smd regulators.
Date: Tue, 12 Jan 2016 13:47:03 +0000
Message-ID: <1452606423-24701-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1452606358-24569-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452606358-24569-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

s2 is spmi controller regulator on msm8916 according to downstream 3.10
kernel, so remove it from the dt to avoid confusion an use of it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 9153214..405ea67 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -519,7 +519,6 @@
 					compatible = "qcom,rpm-pm8916-regulators";
 
 					pm8916_s1: s1 {};
-					pm8916_s2: s2 {};
 					pm8916_s3: s3 {};
 					pm8916_s4: s4 {};
 
-- 
1.9.1
