From: Todor Tomov <todor.tomov@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: Add Camera Control Interface pinctrls
Date: Tue, 13 Nov 2018 11:19:12 +0200
Message-ID: <1542100753-27816-1-git-send-email-todor.tomov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vinod.koul@linaro.org, Todor Tomov <todor.tomov@linaro.org>
List-Id: devicetree@vger.kernel.org

Add pinctrls required for Camera Control Interface.

Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi | 24 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index 390a2fa..990120c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -689,4 +689,16 @@
 			bias-pull-up;
 		};
 	};
+
+	cci0_default: cci0_default {
+		pinmux {
+			function = "cci_i2c";
+			pins = "gpio29", "gpio30";
+		};
+		pinconf {
+			pins = "gpio29", "gpio30";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
index c5c42e9..d6a0a4a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
@@ -495,4 +495,28 @@
 			bias-disable;
 		};
 	};
+
+	cci0_default: cci0_default {
+		pinmux {
+			function = "cci_i2c";
+			pins = "gpio17", "gpio18";
+		};
+		pinconf {
+			pins = "gpio17", "gpio18";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	cci1_default: cci1_default {
+		pinmux {
+			function = "cci_i2c";
+			pins = "gpio19", "gpio20";
+		};
+		pinconf {
+			pins = "gpio19", "gpio20";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
 };
-- 
2.7.4
