From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 1/2] ARM: dts: qcom: msm8974-hammerhead: add touchscreen support
Date: Sun,  2 Jun 2019 21:04:54 -0400
Message-ID: <20190603010455.17060-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org
Cc: bjorn.andersson@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linus.walleij@linaro.org, frank.rowand@sony.com, miquel.raynal@bootlin.com, absahu@codeaurora.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jonathan Marek <jonathan@marek.ca>
List-Id: devicetree@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add support for the Synaptics RMI4 touchscreen that is found on the
Nexus 5.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Brian Masney <masneyb@onstation.org>
---
This is to be applied on top of the display patch series:
https://lore.kernel.org/lkml/20190531094619.31704-1-masneyb@onstation.org/

 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index c92ea01e3918..06c33bd71620 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -280,6 +280,16 @@
 			};
 		};
 
+		i2c2_pins: i2c2 {
+			mux {
+				pins = "gpio6", "gpio7";
+				function = "blsp_i2c2";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+
 		i2c3_pins: i2c3 {
 			mux {
 				pins = "gpio10", "gpio11";
@@ -326,6 +336,25 @@
 				bias-disable;
 			};
 		};
+
+		touch_pin: touch {
+			int {
+				pins = "gpio5";
+				function = "gpio";
+
+				drive-strength = <2>;
+				bias-disable;
+				input-enable;
+			};
+
+			reset {
+				pins = "gpio8";
+				function = "gpio";
+
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+		};
 	};
 
 	sdhci@f9824900 {
@@ -468,6 +497,41 @@
 		};
 	};
 
+	i2c@f9924000 {
+		status = "ok";
+
+		clock-frequency = <355000>;
+		qcom,src-freq = <50000000>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c2_pins>;
+
+		synaptics@70 {
+			compatible = "syna,rmi4-i2c";
+			reg = <0x70>;
+
+			interrupts-extended = <&msmgpio 5 IRQ_TYPE_EDGE_FALLING>;
+			vdd-supply = <&pm8941_l22>;
+			vio-supply = <&pm8941_lvs3>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&touch_pin>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			rmi4-f01@1 {
+				reg = <0x1>;
+				syna,nosleep-mode = <1>;
+			};
+
+			rmi4-f12@12 {
+				reg = <0x12>;
+				syna,sensor-type = <1>;
+			};
+		};
+	};
+
 	i2c@f9925000 {
 		status = "ok";
 		pinctrl-names = "default";
-- 
2.20.1
