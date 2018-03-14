Return-Path: <SRS0=EV7f=GE=codeaurora.org=kramasub@kernel.org>
From: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Subject: [PATCH v4 6/6] arm64: dts: sdm845: Add I2C controller support
Date: Wed, 14 Mar 2018 17:58:51 -0600
Message-Id: <1521071931-9294-7-git-send-email-kramasub@codeaurora.org>
In-Reply-To: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
To: corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wsa@the-dreams.de, gregkh@linuxfoundation.org
Cc: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org
List-ID: <devicetree@vger.kernel.org>

Add I2C master controller support for a built-in test I2C slave.

Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi    | 29 +++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index ea3efc5..69445f1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -27,6 +27,10 @@
 		serial@a84000 {
 			status = "okay";
 		};
+
+		i2c@a88000 {
+			status = "okay";
+		};
 	};
 
 	pinctrl@3400000 {
@@ -50,5 +54,20 @@
 				bias-pull-down;
 			};
 		};
+
+		qup-i2c10-default {
+			pinconf {
+				pins = "gpio55", "gpio56";
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+
+		qup-i2c10-sleep {
+			pinconf {
+				pins = "gpio55", "gpio56";
+				bias-pull-up;
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 59334d9..9ef056f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -209,6 +209,21 @@
 					pins = "gpio4", "gpio5";
 				};
 			};
+
+			qup_i2c10_default: qup-i2c10-default {
+				pinmux {
+					function = "qup10";
+					pins = "gpio55", "gpio56";
+				};
+			};
+
+			qup_i2c10_sleep: qup-i2c10-sleep {
+				pinmux {
+					function = "gpio";
+					pins = "gpio55", "gpio56";
+				};
+			};
+
 		};
 
 		timer@17c90000 {
@@ -309,6 +324,20 @@
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
+
+			i2c10: i2c@a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0xa88000 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				pinctrl-names = "default", "sleep";
+				pinctrl-0 = <&qup_i2c10_default>;
+				pinctrl-1 = <&qup_i2c10_sleep>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
