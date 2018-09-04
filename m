From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: Populate pm8998 with some nodes
Date: Mon,  3 Sep 2018 22:07:29 -0700
Message-ID: <20180904050729.26738-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add pon, coincell and rtc to the first pm8998 sid.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8998.dtsi | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
index 92bed1e7d4bb..c96d6d018137 100644
--- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/input/linux-event-codes.h>
 
 &spmi_bus {
 	pm8998_lsid0: pmic@0 {
@@ -11,6 +12,36 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8998_pon: pon@800 {
+			compatible = "qcom,pm8916-pon";
+
+			reg = <0x800>;
+			mode-bootloader = <0x2>;
+			mode-recovery = <0x1>;
+
+			pwrkey {
+				compatible = "qcom,pm8941-pwrkey";
+				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				linux,code = <KEY_POWER>;
+			};
+		};
+
+		pm8998_coincell: coincell@2800 {
+			compatible = "qcom,pm8941-coincell";
+			reg = <0x2800>;
+
+			status = "disabled";
+		};
+
+		rtc@6000 {
+			compatible = "qcom,pm8941-rtc";
+			reg = <0x6000>, <0x6100>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		pm8998_gpio: gpios@c000 {
 			compatible = "qcom,pm8998-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
-- 
2.18.0
