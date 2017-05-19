From: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 4/5] dt-bindings: display: Add STM32 DSI host driver
Date: Fri, 19 May 2017 17:20:17 +0200
Message-ID: <1495207218-11372-5-git-send-email-philippe.cornu@st.com>
References: <1495207218-11372-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495207218-11372-1-git-send-email-philippe.cornu-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds documentation of device tree bindings for the STM32
DSI host driver based on the Synopsys DW MIPI DSI driver from Rockchip.

Signed-off-by: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/display/st,stm32-ltdc.txt  | 102 ++++++++++++++++++++-
 1 file changed, 100 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
index 8e14769..18a57a2 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
+++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
@@ -1,7 +1,6 @@
 * STMicroelectronics STM32 lcd-tft display controller
 
 - ltdc: lcd-tft display controller host
-  must be a sub-node of st-display-subsystem
   Required properties:
   - compatible: "st,stm32-ltdc"
   - reg: Physical base address of the IP registers and length of memory mapped region.
@@ -13,8 +12,37 @@
   Required nodes:
     - Video port for RGB output.
 
-Example:
+* STMicroelectronics STM32 specific extensions to Synopsys DesignWare MIPI DSI
 
+Required properties:
+- #address-cells: Should be <1>.
+- #size-cells: Should be <0>.
+- compatible: "st,stm32-dsi".
+- reg: Memory mapped base address and length of the DWC MIPI DSI registers.
+- clocks: References to all the clocks specified in the clock-names property
+  as specified in [1].
+- clock-names: The DWC MIPI DSI host uses the following clocks.
+  - "pclk" is the peripheral clock for either AHB and APB (mandatory).
+  - "ref" is the pll reference clock (mandatory).
+- resets: References to all the resets specified in the reset-names property
+  as specified in [2]. (optional)
+- reset-names: string reset name, must be "apb" if used. (optional)
+- ports: The connectivity of the DWC MIPI DSI host controller
+  with the rest of the system is expressed in using ports as specified in the
+  device graph bindings in [2].
+  - port@0 is the dsi input, connected to the ltdc output port.
+  - port@1 is the dsi output, connected to the dsi panel or bridge.
+
+Note: You can find more documentation related to the Synopsys DesignWare MIPI
+DSI host controller in [5].
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+[2] Documentation/devicetree/bindings/reset/reset.txt
+[3] Documentation/devicetree/bindings/media/video-interfaces.txt
+[4] Documentation/devicetree/bindings/graph.txt
+[5] Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
+
+Example 1: RGB panel
 / {
 	...
 	soc {
@@ -34,3 +62,73 @@ Example:
 		};
 	};
 };
+
+Example 2: DSI panel
+
+/ {
+	...
+	soc {
+	...
+		ltdc: display-controller@40016800 {
+			compatible = "st,stm32-ltdc";
+			reg = <0x40016800 0x200>;
+			interrupts = <88>, <89>;
+			resets = <&rcc STM32F4_APB2_RESET(LTDC)>;
+			clocks = <&rcc 1 CLK_LCD>;
+			clock-names = "lcd";
+
+			port {
+				ltdc_out_dsi: endpoint {
+					remote-endpoint = <&dsi_in>;
+				};
+			};
+		};
+
+
+		dsi: dsi@40016C00 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-dsi";
+			reg = <0x40016C00 0x800>;
+			clocks = <&rcc 1 CLK_F469_DSI>, <&clk_hse>;
+			clock-names = "ref", "pclk";
+			resets = <&rcc STM32F4_APB2_RESET(DSI)>;
+			reset-names = "apb";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in: endpoint {
+						remote-endpoint = <&ltdc_out_dsi>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi_out_panel: endpoint {
+						remote-endpoint = <&dsi_in_panel>;
+					};
+				};
+
+			};
+
+			panel-dsi@0 {
+				reg = <0>; /* dsi virtual channel (0..3) */
+				compatible = ...;
+				enable-gpios = ...;
+
+				port {
+					dsi_in_panel: endpoint {
+						remote-endpoint = <&dsi_out_panel>;
+					};
+				};
+
+			};
+
+		};
+
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
