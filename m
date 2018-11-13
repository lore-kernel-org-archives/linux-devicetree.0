From: Todor Tomov <todor.tomov@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: Add pinctrls for camera sensors
Date: Tue, 13 Nov 2018 11:19:13 +0200
Message-ID: <1542100753-27816-2-git-send-email-todor.tomov@linaro.org>
References: <1542100753-27816-1-git-send-email-todor.tomov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542100753-27816-1-git-send-email-todor.tomov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vinod.koul@linaro.org, Todor Tomov <todor.tomov@linaro.org>
List-Id: devicetree@vger.kernel.org

Add pinctrls required for camera sensors:
- power down signal;
- reset signal;
- camera external clock.

Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 64 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi | 96 ++++++++++++++++++++++++++++++
 2 files changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index 990120c..aa9a0ff 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -701,4 +701,68 @@
 			bias-disable;
 		};
 	};
+
+	camera_front_default: camera_front_default {
+		pinmux_pwdn {
+			function = "gpio";
+			pins = "gpio33";
+		};
+		pinconf_pwdn {
+			pins = "gpio33";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		pinmux_rst {
+			function = "gpio";
+			pins = "gpio28";
+		};
+		pinconf_rst {
+			pins = "gpio28";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		pinmux_mclk1 {
+			function = "cam_mclk1";
+			pins = "gpio27";
+		};
+		pinconf_mclk1 {
+			pins = "gpio27";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	camera_rear_default: camera_rear_default {
+		pinmux_pwdn {
+			function = "gpio";
+			pins = "gpio34";
+		};
+		pinconf_pwdn {
+			pins = "gpio34";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		 pinmux_rst {
+			function = "gpio";
+			pins = "gpio35";
+		};
+		pinconf_rst {
+			pins = "gpio35";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		pinmux_mclk0 {
+			function = "cam_mclk0";
+			pins = "gpio26";
+		};
+		pinconf_mclk0 {
+			pins = "gpio26";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
index d6a0a4a..8d5114d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
@@ -519,4 +519,100 @@
 			bias-disable;
 		};
 	};
+
+	camera_board_default: camera_board_default {
+		mux_pwdn {
+			function = "gpio";
+			pins = "gpio98";
+		};
+		config_pwdn {
+			pins = "gpio98";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		mux_rst {
+			function = "gpio";
+			pins = "gpio104";
+		};
+		config_rst {
+			pins = "gpio104";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		mux_mclk1 {
+			function = "cam_mclk";
+			pins = "gpio14";
+		};
+		config_mclk1 {
+			pins = "gpio14";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	camera_front_default: camera_front_default {
+		mux_pwdn {
+			function = "gpio";
+			pins = "gpio133";
+		};
+		config_pwdn {
+			pins = "gpio133";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		mux_rst {
+			function = "gpio";
+			pins = "gpio23";
+		};
+		config_rst {
+			pins = "gpio23";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		mux_mclk2 {
+			function = "cam_mclk";
+			pins = "gpio15";
+		};
+		config_mclk2 {
+			pins = "gpio15";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	camera_rear_default: camera_rear_default {
+		mux_pwdn {
+			function = "gpio";
+			pins = "gpio26";
+		};
+		config_pwdn {
+			pins = "gpio26";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		mux_rst {
+			function = "gpio";
+			pins = "gpio25";
+		};
+		config_rst {
+			pins = "gpio25";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		mux_mclk0 {
+			function = "cam_mclk";
+			pins = "gpio13";
+		};
+		config_mclk0 {
+			pins = "gpio13";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
 };
-- 
2.7.4
