From: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH] dt-bindings: display: Convert stm32 display bindings to
 json-schema
Date: Wed, 2 Oct 2019 17:17:14 +0200
Message-ID: <20191002151714.15813-1-benjamin.gaignard@st.com>
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
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com, yannick.fertre@st.com, philippe.cornu@st.com
Cc: devicetree@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Convert the STM32 display binding to DT schema format using json-schema.
Split the original bindings in two yaml files:
- one for display controller (ltdc)
- one for DSI controller

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../devicetree/bindings/display/st,stm32-dsi.yaml  | 130 +++++++++++++++++++
 .../devicetree/bindings/display/st,stm32-ltdc.txt  | 144 ---------------------
 .../devicetree/bindings/display/st,stm32-ltdc.yaml |  82 ++++++++++++
 3 files changed, 212 insertions(+), 144 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
 create mode 100644 Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml

diff --git a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
new file mode 100644
index 000000000000..8143cf6f0ce7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/st,stm32-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 DSI host controller
+
+maintainers:
+  - Philippe Cornu <philippe.cornu@st.com>
+  - Yannick Fertre <yannick.fertre@st.com>
+
+properties:
+  "#address-cells": true
+  "#size-cells": true
+
+  compatible:
+    const: st,stm32-dsi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Module Clock
+      - description: DSI bus clock
+      - description: Pixel clock
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: ref
+      - const: px_clk
+    minItems: 2
+    maxItems: 3
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: apb
+
+  phy-dsi-supply:
+    maxItems: 1
+    description:
+        Phandle of the regulator that provides the supply voltage.
+
+  ports:
+    type: object
+    description:
+        A node containing DSI input & output port nodes with endpoint 
+        definitions as documented in
+        Documentation/devicetree/bindings/media/video-interfaces.txt
+        Documentation/devicetree/bindings/graph.txt
+
+  port:
+    type: object
+    description:
+      "A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+      port@0: DSI input port node, connected to the ltdc rgb output port.
+      port@1: DSI output port node, connected to a panel or a bridge input port"
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - ports
+    
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    #include <dt-bindings/gpio/gpio.h>
+    dsi: dsi@5a000000 {
+        compatible = "st,stm32-dsi";
+        reg = <0x5a000000 0x800>;
+        clocks = <&rcc DSI_K>, <&clk_hse>, <&rcc DSI_PX>;
+        clock-names = "pclk", "ref", "px_clk";
+        resets = <&rcc DSI_R>;
+        reset-names = "apb";
+        phy-dsi-supply = <&reg18>;
+        
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                    reg = <0>;
+                    dsi_in: endpoint {
+                        remote-endpoint = <&ltdc_ep1_out>;
+                    };
+              };
+
+              port@1 {
+                    reg = <1>;
+                    dsi_out: endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+              };
+        };
+
+        panel {
+              compatible = "orisetech,otm8009a";
+              reg = <0>;
+              reset-gpios = <&gpioe 4 GPIO_ACTIVE_LOW>;
+              power-supply = <&v3v3>;
+
+              port {
+                    panel_in: endpoint {
+                        remote-endpoint = <&dsi_out>;
+                    };
+              };
+        };
+    };
+
+...
+
+
diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
deleted file mode 100644
index 60c54da4e526..000000000000
--- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
+++ /dev/null
@@ -1,144 +0,0 @@
-* STMicroelectronics STM32 lcd-tft display controller
-
-- ltdc: lcd-tft display controller host
-  Required properties:
-  - compatible: "st,stm32-ltdc"
-  - reg: Physical base address of the IP registers and length of memory mapped region.
-  - clocks: A list of phandle + clock-specifier pairs, one for each
-    entry in 'clock-names'.
-  - clock-names: A list of clock names. For ltdc it should contain:
-      - "lcd" for the clock feeding the output pixel clock & IP clock.
-  - resets: reset to be used by the device (defined by use of RCC macro).
-  Required nodes:
-  - Video port for DPI RGB output: ltdc has one video port with up to 2
-    endpoints:
-      - for external dpi rgb panel or bridge, using gpios.
-      - for internal dpi input of the MIPI DSI host controller.
-      Note: These 2 endpoints cannot be activated simultaneously.
-
-* STMicroelectronics STM32 DSI controller specific extensions to Synopsys
-  DesignWare MIPI DSI host controller
-
-The STMicroelectronics STM32 DSI controller uses the Synopsys DesignWare MIPI
-DSI host controller. For all mandatory properties & nodes, please refer
-to the related documentation in [5].
-
-Mandatory properties specific to STM32 DSI:
-- #address-cells: Should be <1>.
-- #size-cells: Should be <0>.
-- compatible: "st,stm32-dsi".
-- clock-names:
-  - phy pll reference clock string name, must be "ref".
-- resets: see [5].
-- reset-names: see [5].
-
-Mandatory nodes specific to STM32 DSI:
-- ports: A node containing DSI input & output port nodes with endpoint
-  definitions as documented in [3] & [4].
-  - port@0: DSI input port node, connected to the ltdc rgb output port.
-  - port@1: DSI output port node, connected to a panel or a bridge input port.
-- panel or bridge node: A node containing the panel or bridge description as
-  documented in [6].
-  - port: panel or bridge port node, connected to the DSI output port (port@1).
-Optional properties:
-- phy-dsi-supply: phandle of the regulator that provides the supply voltage.
-
-Note: You can find more documentation in the following references
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/reset/reset.txt
-[3] Documentation/devicetree/bindings/media/video-interfaces.txt
-[4] Documentation/devicetree/bindings/graph.txt
-[5] Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
-[6] Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
-
-Example 1: RGB panel
-/ {
-	...
-	soc {
-	...
-		ltdc: display-controller@40016800 {
-			compatible = "st,stm32-ltdc";
-			reg = <0x40016800 0x200>;
-			interrupts = <88>, <89>;
-			resets = <&rcc STM32F4_APB2_RESET(LTDC)>;
-			clocks = <&rcc 1 CLK_LCD>;
-			clock-names = "lcd";
-
-			port {
-				ltdc_out_rgb: endpoint {
-				};
-			};
-		};
-	};
-};
-
-Example 2: DSI panel
-
-/ {
-	...
-	soc {
-	...
-		ltdc: display-controller@40016800 {
-			compatible = "st,stm32-ltdc";
-			reg = <0x40016800 0x200>;
-			interrupts = <88>, <89>;
-			resets = <&rcc STM32F4_APB2_RESET(LTDC)>;
-			clocks = <&rcc 1 CLK_LCD>;
-			clock-names = "lcd";
-
-			port {
-				ltdc_out_dsi: endpoint {
-					remote-endpoint = <&dsi_in>;
-				};
-			};
-		};
-
-
-		dsi: dsi@40016c00 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-dsi";
-			reg = <0x40016c00 0x800>;
-			clocks = <&rcc 1 CLK_F469_DSI>, <&clk_hse>;
-			clock-names = "pclk", "ref";
-			resets = <&rcc STM32F4_APB2_RESET(DSI)>;
-			reset-names = "apb";
-			phy-dsi-supply = <&reg18>;
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					dsi_in: endpoint {
-						remote-endpoint = <&ltdc_out_dsi>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					dsi_out: endpoint {
-						remote-endpoint = <&dsi_in_panel>;
-					};
-				};
-
-			};
-
-			panel-dsi@0 {
-				reg = <0>; /* dsi virtual channel (0..3) */
-				compatible = ...;
-				enable-gpios = ...;
-
-				port {
-					dsi_in_panel: endpoint {
-						remote-endpoint = <&dsi_out>;
-					};
-				};
-
-			};
-
-		};
-
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
new file mode 100644
index 000000000000..5d01c83234a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/st,stm32-ltdc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 lcd-tft display controller
+
+maintainers:
+  - Philippe Cornu <philippe.cornu@st.com>
+  - Yannick Fertre <yannick.fertre@st.com>
+
+properties:
+  compatible:
+    const: st,stm32-ltdc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+    maxItems: 2
+
+  clocks:
+    items:
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: lcd
+
+  pinctrl-names: true
+
+  resets:
+        maxItems: 1
+
+  port:
+    type: object
+    description:
+      "Video port for DPI RGB output. 
+      ltdc has one video port with up to 2 endpoints:
+      - for external dpi rgb panel or bridge, using gpios.
+      - for internal dpi input of the MIPI DSI host controller.
+      Note: These 2 endpoints cannot be activated simultaneously.
+      Please refer to the bindings defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt."
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
+  - resets
+  - port
+    
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    ltdc: display-controller@40016800 {
+        compatible = "st,stm32-ltdc";
+        reg = <0x5a001000 0x400>;
+        interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&rcc LTDC_PX>;
+        clock-names = "lcd";
+        resets = <&rcc LTDC_R>;
+
+        port {
+             ltdc_out_dsi: endpoint {
+                     remote-endpoint = <&dsi_in>;
+             };
+        };
+    };
+
+...
+
-- 
2.15.0
