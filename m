From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH 5/7] arm64: dts: qcom: apq8016-sbc: Don't hog client driver pins
Date: Thu,  4 Jun 2015 12:19:04 +0300
Message-ID: <1433409546-23995-6-git-send-email-ivan.ivanov@linaro.org>
References: <1433409546-23995-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1433409546-23995-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hogging pins from pinctrl driver prevents client drivers
to probe.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi | 3 ---
 arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi  | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
index 535532b..37ca2ed 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
@@ -2,9 +2,6 @@

 &pm8916_gpios {

-	pinctrl-names = "default";
-	pinctrl-0 = <&pm8916_gpios_default>;
-
 	pm8916_gpios_default: default {
 		usb_hub_reset_pm {
 			pins = "gpio1";
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi
index 5f7023f..27087cf 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi
@@ -3,9 +3,6 @@

 &msmgpio {

-	pinctrl-names = "default";
-	pinctrl-0 = <&soc_gpios_default>;
-
 	soc_gpios_default: default {
 		usr_led_1_ctrl_default: usr_led_1_ctrl_default {
 			pins = "gpio21";
--
1.9.1
