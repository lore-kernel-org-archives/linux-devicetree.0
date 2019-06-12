From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 2/4] dt-bindings: arm: stm32: Convert STM32 SoC bindings to DT schema
Date: Wed, 12 Jun 2019 13:24:49 +0530
Message-ID: <20190612075451.8643-3-manivannan.sadhasivam@linaro.org>
References: <20190612075451.8643-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612075451.8643-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, robh+dt@kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, loic.pallardy@st.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

This commit converts STM32 SoC bindings to DT schema using jsonschema.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/arm/stm32/stm32.txt   | 10 -------
 .../devicetree/bindings/arm/stm32/stm32.yaml  | 29 +++++++++++++++++++
 2 files changed, 29 insertions(+), 10 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/stm32/stm32.txt
 create mode 100644 Documentation/devicetree/bindings/arm/stm32/stm32.yaml

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.txt b/Documentation/devicetree/bindings/arm/stm32/stm32.txt
deleted file mode 100644
index 6808ed9ddfd5..000000000000
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-STMicroelectronics STM32 Platforms Device Tree Bindings
-
-Each device tree must specify which STM32 SoC it uses,
-using one of the following compatible strings:
-
-  st,stm32f429
-  st,stm32f469
-  st,stm32f746
-  st,stm32h743
-  st,stm32mp157
diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
new file mode 100644
index 000000000000..f53dc0f2d7b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/stm32/stm32.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Platforms Device Tree Bindings
+
+maintainers:
+  - Alexandre Torgue <alexandre.torgue@st.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: st,stm32f429
+
+      - items:
+          - const: st,stm32f469
+
+      - items:
+          - const: st,stm32f746
+
+      - items:
+          - const: st,stm32h743
+
+      - items:
+          - const: st,stm32mp157
+...
-- 
2.17.1
