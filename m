From: Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v4 1/2] dt-bindings: clock: Introduce QCOM Graphics clock bindings
Date: Sun, 25 Nov 2018 10:06:07 +0530
Message-ID: <1543120569-14444-2-git-send-email-tdas@codeaurora.org>
References: <1543120569-14444-1-git-send-email-tdas@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543120569-14444-1-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Amit Nischal <anischal@codeaurora.org>
List-Id: devicetree@vger.kernel.org

From: Amit Nischal <anischal@codeaurora.org>

Add device tree bindings for graphics clock controller for
Qualcomm Technology Inc's SDM845 SoCs.

Signed-off-by: Amit Nischal <anischal@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,gpucc.txt       | 18 ++++++++++++++++
 include/dt-bindings/clock/qcom,gpucc-sdm845.h      | 24 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.txt
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sdm845.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
new file mode 100644
index 0000000..93752db
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
@@ -0,0 +1,18 @@
+Qualcomm Graphics Clock & Reset Controller Binding
+--------------------------------------------------
+
+Required properties :
+- compatible : shall contain "qcom,sdm845-gpucc".
+- reg : shall contain base register location and length.
+- #clock-cells : from common clock binding, shall contain 1.
+- #reset-cells : from common reset binding, shall contain 1.
+- #power-domain-cells : from generic power domain binding, shall contain 1.
+
+Example:
+	gpucc: clock-controller@5090000 {
+		compatible = "qcom,sdm845-gpucc";
+		reg = <0x5090000 0x9000>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
diff --git a/include/dt-bindings/clock/qcom,gpucc-sdm845.h b/include/dt-bindings/clock/qcom,gpucc-sdm845.h
new file mode 100644
index 0000000..9690d90
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gpucc-sdm845.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_SDM_GPU_CC_SDM845_H
+#define _DT_BINDINGS_CLK_SDM_GPU_CC_SDM845_H
+
+/* GPU_CC clock registers */
+#define GPU_CC_CX_GMU_CLK			0
+#define GPU_CC_CXO_CLK				1
+#define GPU_CC_GMU_CLK_SRC			2
+#define GPU_CC_PLL1				3
+
+/* GPU_CC Resets */
+#define GPUCC_GPU_CC_CX_BCR			0
+#define GPUCC_GPU_CC_GMU_BCR			1
+#define GPUCC_GPU_CC_XO_BCR			2
+
+/* GPU_CC GDSCRs */
+#define GPU_CX_GDSC				0
+#define GPU_GX_GDSC				1
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
