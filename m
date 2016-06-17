From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 01/16] arm64: dts: msm8996: add msmgpio label
Date: Fri, 17 Jun 2016 16:13:58 +0100
Message-ID: <1466176454-28084-2-git-send-email-srinivas.kandagatla@linaro.org>
References: <1466176454-28084-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1466176454-28084-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds msmgpio label for pin and gpio controller so that
it can referenced in dedicated pins file and other board level gpios.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 0506fb8..8bf382f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -161,7 +161,7 @@
 			status = "disabled";
 		};
 
-		pinctrl@1010000 {
+		msmgpio: pinctrl@1010000 {
 			compatible = "qcom,msm8996-pinctrl";
 			reg = <0x01010000 0x300000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.7.4
