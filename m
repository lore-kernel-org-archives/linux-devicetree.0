From: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH] dt-bindings: media: Convert stm32 cec bindings to json-schema
Date: Wed, 2 Oct 2019 17:14:10 +0200
Message-ID: <20191002151410.15306-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mchehab@kernel.org, robh+dt@kernel.org, alexandre.torgue@st.com, yannick.fertre@st.com
Cc: devicetree@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Convert the STM32 cec binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../devicetree/bindings/media/st,stm32-cec.txt     | 19 --------
 .../devicetree/bindings/media/st,stm32-cec.yaml    | 57 ++++++++++++++++++++++
 2 files changed, 57 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.txt
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.yaml

diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.txt b/Documentation/devicetree/bindings/media/st,stm32-cec.txt
deleted file mode 100644
index 6be2381c180d..000000000000
--- a/Documentation/devicetree/bindings/media/st,stm32-cec.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-STMicroelectronics STM32 CEC driver
-
-Required properties:
- - compatible : value should be "st,stm32-cec"
- - reg : Physical base address of the IP registers and length of memory
-	 mapped region.
- - clocks : from common clock binding: handle to CEC clocks
- - clock-names : from common clock binding: must be "cec" and "hdmi-cec".
- - interrupts : CEC interrupt number to the CPU.
-
-Example for stm32f746:
-
-cec: cec@40006c00 {
-	compatible = "st,stm32-cec";
-	reg = <0x40006C00 0x400>;
-	interrupts = <94>;
-	clocks = <&rcc 0 STM32F7_APB1_CLOCK(CEC)>, <&rcc 1 CLK_HDMI_CEC>;
-	clock-names = "cec", "hdmi-cec";
-};
diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
new file mode 100644
index 000000000000..c99144107185
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/st,stm32-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 CEC bindings
+
+maintainers:
+  - Benjamin Gaignard <benjamin.gaignard@st.com>
+  - Yannick Fertre <yannick.fertre@st.com>
+
+properties:
+  compatible:
+    const: st,stm32-cec
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Module Clock
+      - description: Bus Clock
+
+  clock-names:
+    items:
+      - const: cec
+      - const: hdmi-cec
+
+  pinctrl-names: true
+
+patternProperties:
+  "^pinctrl-[0-9]+$": true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    cec: cec@40006c00 {
+        compatible = "st,stm32-cec";
+        reg = <0x40006c00 0x400>;
+        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&rcc CEC_K>, <&clk_lse>;
+        clock-names = "cec", "hdmi-cec";
+    };
+
+...
-- 
2.15.0
