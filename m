From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 2/2] dt-bindings: reset: pdc: Convert PDC Global bindings to yaml
Date: Sun,  1 Sep 2019 23:14:07 +0530
Message-ID: <20190901174407.30756-3-sibis@codeaurora.org>
References: <20190901174407.30756-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190901174407.30756-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc: agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sboyd@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Convert PDC Global bindings to yaml and add SC7180 PDC global to the list
of possible bindings.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../bindings/reset/qcom,pdc-global.txt        | 52 -------------------
 .../bindings/reset/qcom,pdc-global.yaml       | 47 +++++++++++++++++
 2 files changed, 47 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
 create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml

diff --git a/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt b/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
deleted file mode 100644
index a62a492843e70..0000000000000
--- a/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-PDC Global
-======================================
-
-This binding describes a reset-controller found on PDC-Global (Power Domain
-Controller) block for Qualcomm Technologies Inc SDM845 SoCs.
-
-Required properties:
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be:
-		    "qcom,sdm845-pdc-global"
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: must specify the base address and size of the register
-	            space.
-
-- #reset-cells:
-	Usage: required
-	Value type: <uint>
-	Definition: must be 1; cell entry represents the reset index.
-
-Example:
-
-pdc_reset: reset-controller@b2e0000 {
-	compatible = "qcom,sdm845-pdc-global";
-	reg = <0xb2e0000 0x20000>;
-	#reset-cells = <1>;
-};
-
-PDC reset clients
-======================================
-
-Device nodes that need access to reset lines should
-specify them as a reset phandle in their corresponding node as
-specified in reset.txt.
-
-For a list of all valid reset indices see
-<dt-bindings/reset/qcom,sdm845-pdc.h>
-
-Example:
-
-modem-pil@4080000 {
-	...
-
-	resets = <&pdc_reset PDC_MODEM_SYNC_RESET>;
-	reset-names = "pdc_reset";
-
-	...
-};
diff --git a/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml b/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
new file mode 100644
index 0000000000000..d7d8cec9419fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/qcom,pdc-global.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PDC Global
+
+maintainers:
+  - Sibi Sankar <sibis@codeaurora.org>
+
+description:
+  The bindings describes the reset-controller found on PDC-Global (Power Domain
+  Controller) block for Qualcomm Technologies Inc SoCs.
+
+properties:
+  compatible:
+    oneOf:
+      - description: on SC7180 SoCs the following compatibles must be specified
+        items:
+          - const: "qcom,sc7180-pdc-global"
+          - const: "qcom,sdm845-pdc-global"
+
+      - description: on SDM845 SoCs the following compatibles must be specified
+        items:
+          - const: "qcom,sdm845-pdc-global"
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    pdc_reset: reset-controller@b2e0000 {
+      compatible = "qcom,sdm845-pdc-global";
+      reg = <0xb2e0000 0x20000>;
+      #reset-cells = <1>;
+    };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
