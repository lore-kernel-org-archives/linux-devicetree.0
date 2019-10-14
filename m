From: Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v4 3/5] dt-bindings: clock: Add YAML schemas for the QCOM GCC clock bindings
Date: Mon, 14 Oct 2019 15:53:06 +0530
Message-ID: <20191014102308.27441-4-tdas@codeaurora.org>
References: <20191014102308.27441-1-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191014102308.27441-1-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc: David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The GCC clock provider have a bunch of generic properties that
are needed in a device tree. Add a YAML schemas for those.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,gcc.txt    |  94 ----------
 .../devicetree/bindings/clock/qcom,gcc.yaml   | 174 ++++++++++++++++++
 2 files changed, 174 insertions(+), 94 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
deleted file mode 100644
index d14362ad4132..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
+++ /dev/null
@@ -1,94 +0,0 @@
-Qualcomm Global Clock & Reset Controller Binding
-------------------------------------------------
-
-Required properties :
-- compatible : shall contain only one of the following:
-
-			"qcom,gcc-apq8064"
-			"qcom,gcc-apq8084"
-			"qcom,gcc-ipq8064"
-			"qcom,gcc-ipq4019"
-			"qcom,gcc-ipq8074"
-			"qcom,gcc-msm8660"
-			"qcom,gcc-msm8916"
-			"qcom,gcc-msm8960"
-			"qcom,gcc-msm8974"
-			"qcom,gcc-msm8974pro"
-			"qcom,gcc-msm8974pro-ac"
-			"qcom,gcc-msm8994"
-			"qcom,gcc-msm8996"
-			"qcom,gcc-msm8998"
-			"qcom,gcc-mdm9615"
-			"qcom,gcc-qcs404"
-			"qcom,gcc-sdm630"
-			"qcom,gcc-sdm660"
-			"qcom,gcc-sdm845"
-			"qcom,gcc-sm8150"
-
-- reg : shall contain base register location and length
-- #clock-cells : shall contain 1
-- #reset-cells : shall contain 1
-
-Optional properties :
-- #power-domain-cells : shall contain 1
-- Qualcomm TSENS (thermal sensor device) on some devices can
-be part of GCC and hence the TSENS properties can also be
-part of the GCC/clock-controller node.
-For more details on the TSENS properties please refer
-Documentation/devicetree/bindings/thermal/qcom-tsens.txt
-- protected-clocks : Protected clock specifier list as per common clock
- binding.
-
-For SM8150 only:
-       - clocks: a list of phandles and clock-specifier pairs,
-                 one for each entry in clock-names.
-       - clock-names: "bi_tcxo" (required)
-                      "sleep_clk" (optional)
-                      "aud_ref_clock" (optional)
-
-Example:
-	clock-controller@900000 {
-		compatible = "qcom,gcc-msm8960";
-		reg = <0x900000 0x4000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		#power-domain-cells = <1>;
-	};
-
-Example of GCC with TSENS properties:
-	clock-controller@900000 {
-		compatible = "qcom,gcc-apq8064";
-		reg = <0x00900000 0x4000>;
-		nvmem-cells = <&tsens_calib>, <&tsens_backup>;
-		nvmem-cell-names = "calib", "calib_backup";
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		#thermal-sensor-cells = <1>;
-	};
-
-Example of GCC with protected-clocks properties:
-	clock-controller@100000 {
-		compatible = "qcom,gcc-sdm845";
-		reg = <0x100000 0x1f0000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		#power-domain-cells = <1>;
-		protected-clocks = <GCC_QSPI_CORE_CLK>,
-				   <GCC_QSPI_CORE_CLK_SRC>,
-				   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
-				   <GCC_LPASS_Q6_AXI_CLK>,
-				   <GCC_LPASS_SWAY_CLK>;
-	};
-
-Example of GCC with clocks
-	gcc: clock-controller@100000 {
-		compatible = "qcom,gcc-sm8150";
-		reg = <0x00100000 0x1f0000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		#power-domain-cells = <1>;
-		clock-names = "bi_tcxo",
-		              "sleep_clk";
-		clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
-			 <&sleep_clk>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
new file mode 100644
index 000000000000..b3ef1e24e91a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/clock/qcom,gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains.
+
+properties:
+  compatible :
+    enum:
+       - qcom,gcc-apq8064
+       - qcom,gcc-apq8084
+       - qcom,gcc-ipq8064
+       - qcom,gcc-ipq4019
+       - qcom,gcc-ipq8074
+       - qcom,gcc-msm8660
+       - qcom,gcc-msm8916
+       - qcom,gcc-msm8960
+       - qcom,gcc-msm8974
+       - qcom,gcc-msm8974pro
+       - qcom,gcc-msm8974pro-ac
+       - qcom,gcc-msm8994
+       - qcom,gcc-msm8996
+       - qcom,gcc-msm8998
+       - qcom,gcc-mdm9615
+       - qcom,gcc-qcs404
+       - qcom,gcc-sdm630
+       - qcom,gcc-sdm660
+       - qcom,gcc-sdm845
+       - qcom,gcc-sm8150
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+
+  clock-names:
+    minItems: 1
+    maxItems: 3
+    items:
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+      - const: sleep_clk
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    minItems: 1
+    maxItems: 2
+    description:
+      Qualcomm TSENS (thermal sensor device) on some devices can
+      be part of GCC and hence the TSENS properties can also be part
+      of the GCC/clock-controller node.
+      For more details on the TSENS properties please refer
+      Documentation/devicetree/bindings/thermal/qcom-tsens.txt
+
+  nvmem-cell-names:
+    minItems: 1
+    maxItems: 2
+    description:
+      Names for each nvmem-cells specified.
+    items:
+      - const: calib
+      - const: calib_backup
+
+  'thermal-sensor-cells':
+    const: 1
+
+  protected-clocks:
+    description:
+       Protected clock specifier list as per common clock binding
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: qcom,gcc-apq8064
+
+then:
+  required:
+    - nvmem-cells
+    - nvmem-cell-names
+    - '#thermal-sensor-cells'
+
+else:
+  if:
+    properties:
+      compatible:
+        contains:
+          enum:
+            - qcom,gcc-sm8150
+  then:
+    required:
+       - clocks
+       - clock-names
+
+
+examples:
+  # Example for GCC for MSM8960:
+  - |
+    clock-controller@900000 {
+      compatible = "qcom,gcc-msm8960";
+      reg = <0x900000 0x4000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+
+  # Example of GCC with TSENS properties:
+  - |
+    clock-controller@900000 {
+      compatible = "qcom,gcc-apq8064";
+      reg = <0x00900000 0x4000>;
+      nvmem-cells = <&tsens_calib>, <&tsens_backup>;
+      nvmem-cell-names = "calib", "calib_backup";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      #thermal-sensor-cells = <1>;
+    };
+
+  # Example of GCC with protected-clocks properties:
+  - |
+    clock-controller@100000 {
+      compatible = "qcom,gcc-sdm845";
+      reg = <0x100000 0x1f0000>;
+      protected-clocks = <187>, <188>, <189>, <190>, <191>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+  # Example of GCC with clock node properties for SM8150:
+  - |
+    clock-controller@100000 {
+      compatible = "qcom,gcc-sm8150";
+      reg = <0x00100000 0x1f0000>;
+      clocks = <&rpmhcc 0>, <&rpmhcc 1>, <&sleep_clk>;
+      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+     };
+...
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
