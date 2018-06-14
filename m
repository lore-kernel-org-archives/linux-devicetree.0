From: Taniya Das <tdas@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: clock: Introduce QCOM LPASS clock bindings
Date: Thu, 14 Jun 2018 13:09:02 +0530
Message-ID: <1528961943-12506-2-git-send-email-tdas@codeaurora.org>
References: <1528961943-12506-1-git-send-email-tdas@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528961943-12506-1-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh@kernel.org
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rohit Kumar <rohitkr@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for Low Power Audio subsystem clock controller for
Qualcomm Technology Inc's SDM845 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,lpasscc.txt     | 46 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,lpass-sdm845.h      | 18 +++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
 create mode 100644 include/dt-bindings/clock/qcom,lpass-sdm845.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
new file mode 100644
index 0000000..16cabc4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
@@ -0,0 +1,46 @@
+Qualcomm LPASS Clock Controller Binding
+-----------------------------------------------
+
+Required properties :
+- compatible	: shall contain "qcom,sdm845-lpasscc"
+- #clock-cells	: from common clock binding, shall contain 1.
+
+Note that #address-cells, #size-cells, and ranges shall be present to ensure
+the lpasscc can address the various lpass cc registers.
+
+Child Node Properties :
+The Low Pass Audio clock controller would need to define the following child
+nodes with the properties.
+- compatible	: shall contain all of the below for clocks in each LPASS domain
+			"qcom,sdm845-lpass-gcc",
+			"qcom,sdm845-lpass-cc",
+			"qcom,sdm845-lpass-qdsp6ss"
+- reg		: shall contain base register address and size,
+
+Example:
+
+The below node has to be defined in the cases where the LPASS peripheral loader
+would bring the subsystem out of reset.
+
+	lpasscc: clock-controller {
+		compatible = "qcom,sdm845-lpasscc";
+			#clock-cells = <1>;
+	                #address-cells = <1>;
+		        #size-cells = <1>;
+			ranges;
+
+			lpass_gcc@100000 {
+				compatible = "qcom,sdm845-lpass-gcc";
+				reg = <0x00147000 0x20>;
+			};
+
+			lpass@17014000 {
+				compatible = "qcom,sdm845-lpass-cc";
+				reg = <0x17014000 0x1f004>;
+			};
+
+			lpass_q6@17300020 {
+				compatible = "qcom,sdm845-lpass-qdsp6ss";
+				reg = <0x17300020 0x20>;
+			};
+		 };
diff --git a/include/dt-bindings/clock/qcom,lpass-sdm845.h b/include/dt-bindings/clock/qcom,lpass-sdm845.h
new file mode 100644
index 0000000..b9d816e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lpass-sdm845.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_SDM_LPASS_SDM845_H
+#define _DT_BINDINGS_CLK_SDM_LPASS_SDM845_H
+
+#define GCC_LPASS_Q6_AXI_CLK				0
+#define GCC_LPASS_SWAY_CLK				1
+#define LPASS_AUDIO_WRAPPER_AON_CLK			2
+#define LPASS_Q6SS_AHBM_AON_CLK				3
+#define LPASS_Q6SS_AHBS_AON_CLK				4
+#define LPASS_QDSP6SS_XO_CLK				5
+#define LPASS_QDSP6SS_SLEEP_CLK				6
+#define LPASS_QDSP6SS_CORE_CLK				7
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
