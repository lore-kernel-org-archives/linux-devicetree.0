From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 09/34] dt-bindings: arm: Convert primecell binding to
 json-schema
Date: Mon,  3 Dec 2018 15:31:58 -0600
Message-ID: <20181203213223.16986-10-robh@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181203213223.16986-1-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@arm.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Convert ARM Primecell binding to DT schema format using json-schema.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/primecell.txt     | 46 -------------------
 .../devicetree/bindings/arm/primecell.yaml    | 36 +++++++++++++++
 2 files changed, 36 insertions(+), 46 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/primecell.txt
 create mode 100644 Documentation/devicetree/bindings/arm/primecell.yaml

diff --git a/Documentation/devicetree/bindings/arm/primecell.txt b/Documentation/devicetree/bindings/arm/primecell.txt
deleted file mode 100644
index 0df6acacfaea..000000000000
--- a/Documentation/devicetree/bindings/arm/primecell.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-* ARM Primecell Peripherals
-
-ARM, Ltd. Primecell peripherals have a standard id register that can be used to
-identify the peripheral type, vendor, and revision. This value can be used for
-driver matching.
-
-Required properties:
-
-- compatible : should be a specific name for the peripheral and
-               "arm,primecell".  The specific name will match the ARM
-               engineering name for the logic block in the form: "arm,pl???"
-
-Optional properties:
-
-- arm,primecell-periphid : Value to override the h/w value with
-- clocks : From common clock binding. First clock is phandle to clock for apb
-	pclk. Additional clocks are optional and specific to those peripherals.
-- clock-names : From common clock binding. Shall be "apb_pclk" for first clock.
-- dmas : From common DMA binding. If present, refers to one or more dma channels.
-- dma-names : From common DMA binding, needs to match the 'dmas' property.
-              Devices with exactly one receive and transmit channel shall name
-              these "rx" and "tx", respectively.
-- pinctrl-<n> : Pinctrl states as described in bindings/pinctrl/pinctrl-bindings.txt
-- pinctrl-names : Names corresponding to the numbered pinctrl states
-- interrupts : one or more interrupt specifiers
-- interrupt-names : names corresponding to the interrupts properties
-
-Example:
-
-serial@fff36000 {
-	compatible = "arm,pl011", "arm,primecell";
-	arm,primecell-periphid = <0x00341011>;
-
-	clocks = <&pclk>;
-	clock-names = "apb_pclk";
-
-	dmas = <&dma-controller 4>, <&dma-controller 5>;
-	dma-names = "rx", "tx";	
-
-	pinctrl-0 = <&uart0_default_mux>, <&uart0_default_mode>;
-	pinctrl-1 = <&uart0_sleep_mode>;
-	pinctrl-names = "default","sleep";
-
-	interrupts = <0 11 0x4>;
-};
-
diff --git a/Documentation/devicetree/bindings/arm/primecell.yaml b/Documentation/devicetree/bindings/arm/primecell.yaml
new file mode 100644
index 000000000000..5aae37f1c563
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/primecell.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/primecell.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Primecell Peripherals
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |+
+  ARM, Ltd. Primecell peripherals have a standard id register that can be used to
+  identify the peripheral type, vendor, and revision. This value can be used for
+  driver matching.
+
+properties:
+  compatible:
+    contains:
+      const: arm,primecell
+    description:
+      Should be a specific name for the peripheral followed by "arm,primecell".
+      The specific name will match the ARM engineering name for the logic block
+      in the form "arm,pl???"
+
+  arm,primecell-periphid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Value to override the h/w ID value
+  clocks:
+    minItems: 1
+    maxItems: 32
+  clock-names:
+    contains:
+      const: apb_pclk
+    additionalItems: true
+...
-- 
2.19.1
