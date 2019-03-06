From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 1/3] dt-bindings: clock: Introduce Qualcomm Turing Clock controller
Date: Wed,  6 Mar 2019 09:47:56 -0800
Message-ID: <20190306174758.22462-2-bjorn.andersson@linaro.org>
References: <20190306174758.22462-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306174758.22462-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add devicetree binding for the turing clock controller found in QCS404.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/clock/qcom,turingcc.txt          | 19 +++++++++++++++++++
 .../dt-bindings/clock/qcom,turingcc-qcs404.h  | 15 +++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,turingcc.txt
 create mode 100644 include/dt-bindings/clock/qcom,turingcc-qcs404.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,turingcc.txt b/Documentation/devicetree/bindings/clock/qcom,turingcc.txt
new file mode 100644
index 000000000000..126517de5f9a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,turingcc.txt
@@ -0,0 +1,19 @@
+Qualcomm Turing Clock & Reset Controller Binding
+------------------------------------------------
+
+Required properties :
+- compatible: shall contain "qcom,qcs404-turingcc".
+- reg: shall contain base register location and length.
+- clocks: ahb clock for the TuringCC
+- #clock-cells: from common clock binding, shall contain 1.
+- #reset-cells: from common reset binding, shall contain 1.
+
+Example:
+	turingcc: clock-controller@800000 {
+		compatible = "qcom,qcs404-turingcc";
+		reg = <0x00800000 0x30000>;
+		clocks = <&gcc GCC_CDSP_CFG_AHB_CLK>;
+
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
diff --git a/include/dt-bindings/clock/qcom,turingcc-qcs404.h b/include/dt-bindings/clock/qcom,turingcc-qcs404.h
new file mode 100644
index 000000000000..838faef57c67
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,turingcc-qcs404.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019, Linaro Ltd
+ */
+
+#ifndef _DT_BINDINGS_CLK_TURING_QCS404_H
+#define _DT_BINDINGS_CLK_TURING_QCS404_H
+
+#define TURING_Q6SS_Q6_AXIM_CLK		0
+#define TURING_Q6SS_AHBM_AON_CLK	1
+#define TURING_WRAPPER_AON_CLK		2
+#define TURING_Q6SS_AHBS_AON_CLK	3
+#define TURING_WRAPPER_QOS_AHBS_AON_CLK	4
+
+#endif
-- 
2.18.0
