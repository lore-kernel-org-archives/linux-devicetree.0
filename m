From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH RESEND] ARM: dts: qcom: msm8974-hammerhead: add device tree bindings for vibrator
Date: Thu, 16 May 2019 04:50:18 -0400
Message-ID: <20190516085018.2207-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org, david.brown@linaro.org
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds device device tree bindings for the vibrator found on
the LG Nexus 5 (hammerhead) phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
This is a resend of the following patch that has missed the last two
merge windows:

https://lore.kernel.org/lkml/20190206013329.18195-4-masneyb@onstation.org/

 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index b3b04736a159..1fd9f429f34a 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -5,6 +5,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/clock/qcom,mmcc-msm8974.h>
 
 / {
 	model = "LGE MSM 8974 HAMMERHEAD";
@@ -306,6 +307,36 @@
 				input-enable;
 			};
 		};
+
+		vibrator_pin: vibrator {
+			pwm {
+				pins = "gpio27";
+				function = "gp1_clk";
+
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			enable {
+				pins = "gpio60";
+				function = "gpio";
+			};
+		};
+	};
+
+	vibrator@fd8c3450 {
+		compatible = "qcom,msm8974-vibrator";
+		reg = <0xfd8c3450 0x400>;
+
+		vcc-supply = <&pm8941_l19>;
+
+		clocks = <&mmcc CAMSS_GP1_CLK>;
+		clock-names = "pwm";
+
+		enable-gpios = <&msmgpio 60 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&vibrator_pin>;
 	};
 
 	sdhci@f9824900 {
-- 
2.17.2
