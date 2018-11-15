From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: msm8998-mtp: Add external SD
Date: Thu, 15 Nov 2018 13:44:55 -0700
Message-ID: <1542314695-24071-4-git-send-email-jhugo@codeaurora.org>
References: <1542314695-24071-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542314695-24071-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The externally accessible SD card slot on the MTP is driven by SDCC2.
Wire it up for use.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 65 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi     |  1 +
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index b4276da..cf74883 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -241,3 +241,68 @@
 		};
 	};
 };
+
+&tlmm {
+	sdc2_clk_on: sdc2-clk-on {
+		pins = "sdc2_clk";
+		bias-disable;           /* NO pull */
+		drive-strength = <16>;  /* 16 MA */
+	};
+
+	sdc2_clk_off: sdc2-clk-off {
+		pins = "sdc2_clk";
+		bias-disable;           /* NO pull */
+		drive-strength = <2>;   /* 2 MA */
+	};
+
+	sdc2_cmd_on: sdc2-cmd-on {
+		pins = "sdc2_cmd";
+		bias-pull-up;           /* pull up */
+		drive-strength = <10>;  /* 10 MA */
+	};
+
+	sdc2_cmd_off: sdc2-cmd-off {
+		pins = "sdc2_cmd";
+		bias-pull-up;           /* pull up */
+		drive-strength = <2>;   /* 2 MA */
+	};
+
+	sdc2_data_on: sdc2-data-on {
+		pins = "sdc2_data";
+		bias-pull-up;           /* pull up */
+		drive-strength = <10>;  /* 10 MA */
+	};
+
+	sdc2_data_off: sdc2-data-off {
+		pins = "sdc2_data";
+		bias-pull-up;           /* pull up */
+		drive-strength = <2>;   /* 2 MA */
+	};
+
+	sdc2_cd_on: sdc2-cd-on {
+		function = "gpio";
+		pins = "gpio95";
+		bias-pull-up;           /* pull up */
+		drive-strength = <2>;   /* 2 MA */
+	};
+
+	sdc2_cd_off: sdc2-cd-off {
+		function = "gpio";
+		pins = "gpio95";
+		bias-pull-up;           /* pull up */
+		drive-strength = <2>;   /* 2 MA */
+	};
+};
+
+&sdhc2 {
+	status = "okay";
+	cd-gpios = <&tlmm 95 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l21a_2p95>;
+	vqmmc-supply = <&vreg_l13a_2p95>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_clk_on  &sdc2_cmd_on  &sdc2_data_on  &sdc2_cd_on>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+};
+
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 09deee0..82f6472 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	interrupt-parent = <&intc>;
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
