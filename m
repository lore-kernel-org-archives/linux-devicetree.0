From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH 4/4] arm64: dts: qcom: msm8998-mtp: Add external SD
Date: Thu, 15 Nov 2018 10:18:11 -0700
Message-ID: <1542302291-6864-5-git-send-email-jhugo@codeaurora.org>
References: <1542302291-6864-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542302291-6864-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The externally accessible SD card slot on the MTP is driven by SDCC2.
Wire it up for use.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi     |  1 +
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index b4276da..a90b427 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -241,3 +241,16 @@
 		};
 	};
 };
+
+&sdhc2 {
+	status = "okay";
+        cd-gpios = <&tlmm 95 GPIO_ACTIVE_LOW>;
+
+        vmmc-supply = <&vreg_l21a_2p95>;
+        vqmmc-supply = <&vreg_l13a_2p95>;
+
+        pinctrl-names = "default", "sleep";
+        pinctrl-0 = <&sdc2_clk_on  &sdc2_cmd_on  &sdc2_data_on  &sdc2_cd_on>;
+        pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+};
+
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 94827f4..8e7d788 100644
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
