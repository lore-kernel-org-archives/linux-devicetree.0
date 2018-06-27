From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v6 1/8] dt-bindings: reset: Add AOSS reset bindings for SDM845 SoCs
Date: Wed, 27 Jun 2018 19:54:42 +0530
Message-ID: <20180627142443.1570-1-sibis@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, kyan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add SDM845 AOSS (always on subsystem) reset controller binding

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

Not including Rob's earlier Reviewed-by due to change in compatible 

 .../bindings/reset/qcom,aoss-reset.txt        | 52 +++++++++++++++++++
 include/dt-bindings/reset/qcom,sdm845-aoss.h  | 17 ++++++
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
 create mode 100644 include/dt-bindings/reset/qcom,sdm845-aoss.h

diff --git a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
new file mode 100644
index 000000000000..510c748656ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
@@ -0,0 +1,52 @@
+Qualcomm AOSS Reset Controller
+======================================
+
+This binding describes a reset-controller found on AOSS-CC (always on subsystem)
+for Qualcomm SDM845 SoCs.
+
+Required properties:
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be:
+		    "qcom,sdm845-aoss-cc"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: must specify the base address and size of the register
+	            space.
+
+- #reset-cells:
+	Usage: required
+	Value type: <uint>
+	Definition: must be 1; cell entry represents the reset index.
+
+Example:
+
+aoss_reset: reset-controller@c2a0000 {
+	compatible = "qcom,sdm845-aoss-cc";
+	reg = <0xc2a0000 0x31000>;
+	#reset-cells = <1>;
+};
+
+Specifying reset lines connected to IP modules
+==============================================
+
+Device nodes that need access to reset lines should
+specify them as a reset phandle in their corresponding node as
+specified in reset.txt.
+
+For list of all valid reset indicies see
+<dt-bindings/reset/qcom,sdm845-aoss.h>
+
+Example:
+
+modem-pil@4080000 {
+	...
+
+	resets = <&aoss_reset AOSS_CC_MSS_RESTART>;
+	reset-names = "mss_restart";
+
+	...
+};
diff --git a/include/dt-bindings/reset/qcom,sdm845-aoss.h b/include/dt-bindings/reset/qcom,sdm845-aoss.h
new file mode 100644
index 000000000000..476c5fc873b6
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,sdm845-aoss.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_RESET_AOSS_SDM_845_H
+#define _DT_BINDINGS_RESET_AOSS_SDM_845_H
+
+#define AOSS_CC_MSS_RESTART	0
+#define AOSS_CC_CAMSS_RESTART	1
+#define AOSS_CC_VENUS_RESTART	2
+#define AOSS_CC_GPU_RESTART	3
+#define AOSS_CC_DISPSS_RESTART	4
+#define AOSS_CC_WCSS_RESTART	5
+#define AOSS_CC_LPASS_RESTART	6
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
