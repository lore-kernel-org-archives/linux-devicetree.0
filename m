From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] dts: arm64: db820c: add pmic pins specific dts file
Date: Fri, 16 Sep 2016 18:41:21 +0100
Message-ID: <1474047681-6821-3-git-send-email-srinivas.kandagatla@linaro.org>
References: <1474047681-6821-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474047681-6821-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds pmic specific dts which are configured specially
for db820c. One of such pin is GPIO_F on the Low Speed expansion
which has default output voltage of 2.7v. This patch fixes setup
for that pin to have an output voltage of 1.8v to comply with
96boards LS expansion specs.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi           |  2 ++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi
new file mode 100644
index 0000000..0938191
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi
@@ -0,0 +1,15 @@
+
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+&pm8994_gpios {
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&ls_exp_gpio_f>;
+
+	ls_exp_gpio_f: pm8916_mpp4 {
+		pinconf {
+			pins = "gpio5";
+			output-low;
+			power-source = <PM8994_GPIO_S4>; // 1.8V
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index afb218c..422959b 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -12,7 +12,9 @@
  */
 
 #include "msm8996.dtsi"
+#include "pm8994.dtsi"
 #include "apq8096-db820c-pins.dtsi"
+#include "apq8096-db820c-pmic-pins.dtsi"
 
 / {
 	aliases {
-- 
2.7.4
