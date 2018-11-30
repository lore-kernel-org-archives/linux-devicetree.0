From: Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v11 2/3] dt-bindings: clock: Introduce QCOM LPASS clock bindings
Date: Fri, 30 Nov 2018 23:51:28 +0530
Message-ID: <1543602089-21086-3-git-send-email-tdas@codeaurora.org>
References: <1543602089-21086-1-git-send-email-tdas@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543602089-21086-1-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for Low Power Audio subsystem clock controller for
Qualcomm Technology Inc's SDM845 SoCs.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,gcc.txt         |  4 +++-
 .../devicetree/bindings/clock/qcom,lpasscc.txt     | 26 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdm845.h        |  2 ++
 include/dt-bindings/clock/qcom,lpass-sdm845.h      | 15 +++++++++++++
 4 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
 create mode 100644 include/dt-bindings/clock/qcom,lpass-sdm845.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
index 5e37de9..8661c3c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
@@ -67,5 +67,7 @@ Example of GCC with protected-clocks properties:
 		#power-domain-cells = <1>;
 		protected-clocks = <GCC_QSPI_CORE_CLK>,
 				   <GCC_QSPI_CORE_CLK_SRC>,
-				   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
+				   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+				   <GCC_LPASS_Q6_AXI_CLK>,
+				   <GCC_LPASS_SWAY_CLK>;
 	};
diff --git a/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
new file mode 100644
index 0000000..b9e9787
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
@@ -0,0 +1,26 @@
+Qualcomm LPASS Clock Controller Binding
+-----------------------------------------------
+
+Required properties :
+- compatible		: shall contain "qcom,sdm845-lpasscc"
+- #clock-cells		: from common clock binding, shall contain 1.
+- reg			: shall contain base register address and size,
+			  in the order
+			Index-0 maps to LPASS_CC register region
+			Index-1 maps to LPASS_QDSP6SS register region
+
+Optional properties :
+- reg-names	: register names of LPASS domain
+		 "cc", "qdsp6ss".
+
+Example:
+
+The below node has to be defined in the cases where the LPASS peripheral loader
+would bring the subsystem out of reset.
+
+	lpasscc: clock-controller@17014000 {
+		compatible = "qcom,sdm845-lpasscc";
+		reg = <0x17014000 0x1f004>, <0x17300000 0x200>;
+		reg-names = "cc", "qdsp6ss";
+		#clock-cells = <1>;
+	};
diff --git a/include/dt-bindings/clock/qcom,gcc-sdm845.h b/include/dt-bindings/clock/qcom,gcc-sdm845.h
index b8eae5a..968fa65 100644
--- a/include/dt-bindings/clock/qcom,gcc-sdm845.h
+++ b/include/dt-bindings/clock/qcom,gcc-sdm845.h
@@ -197,6 +197,8 @@
 #define GCC_QSPI_CORE_CLK_SRC					187
 #define GCC_QSPI_CORE_CLK					188
 #define GCC_QSPI_CNOC_PERIPH_AHB_CLK				189
+#define GCC_LPASS_Q6_AXI_CLK					190
+#define GCC_LPASS_SWAY_CLK					191

 /* GCC Resets */
 #define GCC_MMSS_BCR						0
diff --git a/include/dt-bindings/clock/qcom,lpass-sdm845.h b/include/dt-bindings/clock/qcom,lpass-sdm845.h
new file mode 100644
index 0000000..6590508
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lpass-sdm845.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_SDM_LPASS_SDM845_H
+#define _DT_BINDINGS_CLK_SDM_LPASS_SDM845_H
+
+#define LPASS_Q6SS_AHBM_AON_CLK				0
+#define LPASS_Q6SS_AHBS_AON_CLK				1
+#define LPASS_QDSP6SS_XO_CLK				2
+#define LPASS_QDSP6SS_SLEEP_CLK				3
+#define LPASS_QDSP6SS_CORE_CLK				4
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
