Return-Path: <SRS0=Y/5d=WT=codeaurora.org=govinds@kernel.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH_v3 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock controller bindings
Date: Fri, 23 Aug 2019 18:44:00 +0530
Message-Id: <20190823131401.4011-2-govinds@codeaurora.org>
In-Reply-To: <20190823131401.4011-1-govinds@codeaurora.org>
References: <20190823131401.4011-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: sboyd@kernel.org, robh@kernel.org
Cc: bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

Add devicetree binding for the Q6SSTOP clock controller found in QCS404.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 .../bindings/clock/qcom,q6sstopcc.yaml        | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
new file mode 100644
index 000000000000..39621e2e2f4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,q6sstopcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Q6SSTOP clock Controller
+
+maintainers:
+  - Govind Singh <govinds@codeaurora.org>
+
+description:
+   Q6SSTOP clock controller is used by WCSS remoteproc driver
+   to bring WDSP out of reset.
+
+properties:
+  compatible:
+    const: "qcom,qcs404-q6sstopcc"
+
+  reg:
+    items:
+      - description: Q6SSTOP clocks register region
+      - description: Q6SSTOP_TCSR register region
+
+  clocks:
+    items:
+      - description: ahb clock for the q6sstopCC
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    q6sstopcc: clock-controller@7500000 {
+      compatible = "qcom,qcs404-q6sstopcc";
+      reg = <0x07500000 0x4e000>, <0x07550000 0x10000>;
+      clocks = <&gcc 141>;
+      #clock-cells = <1>;
+    };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
