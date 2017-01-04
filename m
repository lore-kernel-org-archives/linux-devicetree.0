From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/6] arm64: dts: db820c: fix gpio pinctrl name correctly
Date: Wed,  4 Jan 2017 13:34:57 +0000
Message-ID: <1483536902-21450-2-git-send-email-srinivas.kandagatla@linaro.org>
References: <1483536902-21450-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483536902-21450-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Fix typo in node name to reflect the correct pin name.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi
index 0de9517..6c1628c 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi
@@ -5,7 +5,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&ls_exp_gpio_f>;
 
-	ls_exp_gpio_f: pm8916_mpp4 {
+	ls_exp_gpio_f: pm8994_gpio5 {
 		pinconf {
 			pins = "gpio5";
 			output-low;
-- 
2.10.1
