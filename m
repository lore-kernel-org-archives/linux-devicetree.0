From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 8/8] arm64: dts: qcom: Fix MPP's function used for LED control
Date: Wed, 10 Feb 2016 11:37:24 +0000
Message-ID: <1455104244-10813-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1455104164-29356-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455104164-29356-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
List-Id: devicetree@vger.kernel.org

From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>

The qcom-spmi-mpp driver is now using string "digital" to denote
old "normal" functionality. Update DTS file.
Also update the powersource.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
index e03c11d..f881437 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
@@ -33,7 +33,7 @@
 	pm8916_mpps_leds: pm8916_mpps_leds {
 		pinconf {
 			pins = "mpp2", "mpp3";
-			function = PMIC_GPIO_FUNC_NORMAL;
+			function = "digital";
 			output-low;
 		};
 	};
-- 
1.9.1
