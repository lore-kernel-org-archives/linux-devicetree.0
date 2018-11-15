From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH 3/4] arm64: dts: qcom: msm8998: Add SDC2 control pins
Date: Thu, 15 Nov 2018 10:18:10 -0700
Message-ID: <1542302291-6864-4-git-send-email-jhugo@codeaurora.org>
References: <1542302291-6864-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542302291-6864-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The SDC2 control pins are typically used to manage sleep.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi | 78 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi      |  2 +
 2 files changed, 80 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
new file mode 100644
index 0000000..a22abf9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
+
+&tlmm {
+	sdc2_clk_on: sdc2_clk_on {
+		config {
+			pins = "sdc2_clk";
+			bias-disable;           /* NO pull */
+			drive-strength = <16>;  /* 16 MA */
+		};
+	};
+
+	sdc2_clk_off: sdc2_clk_off {
+		config {
+			pins = "sdc2_clk";
+			bias-disable;           /* NO pull */
+			drive-strength = <2>;   /* 2 MA */
+		};
+	};
+
+	sdc2_cmd_on: sdc2_cmd_on {
+		config {
+			pins = "sdc2_cmd";
+			bias-pull-up;           /* pull up */
+			drive-strength = <10>;  /* 10 MA */
+		};
+	};
+
+	sdc2_cmd_off: sdc2_cmd_off {
+		config {
+			pins = "sdc2_cmd";
+			bias-pull-up;           /* pull up */
+			drive-strength = <2>;   /* 2 MA */
+		};
+	};
+
+	sdc2_data_on: sdc2_data_on {
+		config {
+			pins = "sdc2_data";
+			bias-pull-up;           /* pull up */
+			drive-strength = <10>;  /* 10 MA */
+		};
+	};
+
+	sdc2_data_off: sdc2_data_off {
+		config {
+			pins = "sdc2_data";
+			bias-pull-up;           /* pull up */
+			drive-strength = <2>;   /* 2 MA */
+		};
+	};
+
+	sdc2_cd_on: sdc2_cd_on {
+		mux {
+			pins = "gpio95";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio95";
+			bias-pull-up;           /* pull up */
+			drive-strength = <2>;   /* 2 MA */
+		};
+	};
+
+	sdc2_cd_off: sdc2_cd_off {
+		mux {
+			pins = "gpio95";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio95";
+			bias-pull-up;           /* pull up */
+			drive-strength = <2>;   /* 2 MA */
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 09deee0..94827f4 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -705,3 +705,5 @@
 		};
 	};
 };
+
+#include "msm8998-pins.dtsi"
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
