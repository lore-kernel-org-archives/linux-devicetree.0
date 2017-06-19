From: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v4 5/6] dt-bindings: display: stm32: Add DSI host driver
Date: Mon, 19 Jun 2017 18:28:04 +0200
Message-ID: <1497889685-27349-6-git-send-email-philippe.cornu@st.com>
References: <1497889685-27349-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497889685-27349-1-git-send-email-philippe.cornu-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Yao <mark.yao>
Cc: Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds documentation of device tree bindings for the STM32
DSI host driver based on the Synopsys DW MIPI DSI bridge driver.

Signed-off-by: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>
Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/display/st,stm32-ltdc.txt  | 104 ++++++++++++++++++++-
 1 file changed, 103 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
index 90a8459..6353d79 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
+++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
@@ -12,8 +12,40 @@
   Required nodes:
     - Video port for RGB output.
 
-Example:
+* STMicroelectronics STM32 DSI specific extensions to Synopsys DesignWare MIPI
+  DSI host controller
 
+The STMicroelectronics STM32 DSI driver uses the Synopsys DesignWare MIPI
+DSI host controller driver. For all mandatory properties & nodes, please refer
+to the related documentation in [5].
+
+Mandatory properties specific to STM32 DSI:
+- #address-cells: Should be <1>.
+- #size-cells: Should be <0>.
+- compatible: "st,stm32-dsi".
+- clock-names:
+  - phy pll reference clock string name, must be "ref".
+- resets: see [5].
+- reset-names: see [5].
+
+Mandatory nodes specific to STM32 DSI:
+- ports: A node containing DSI input & output port nodes with endpoint
+  definitions as documented in [3] & [4].
+  - port@0: DSI input port node, connected to the ltdc rgb output port.
+  - port@1: DSI output port node, connected to a panel or a bridge input port.
+- panel or bridge node: A node containing the panel or bridge description as
+  documented in [6].
+  - port: panel or bridge port node, connected to the DSI output port (port@1).
+
+Note: You can find more documentation in the following references
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+[2] Documentation/devicetree/bindings/reset/reset.txt
+[3] Documentation/devicetree/bindings/media/video-interfaces.txt
+[4] Documentation/devicetree/bindings/graph.txt
+[5] Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
+[6] Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
+
+Example 1: RGB panel
 / {
 	...
 	soc {
@@ -33,3 +65,73 @@ Example:
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
+		dsi: dsi@40016c00 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-dsi";
+			reg = <0x40016c00 0x800>;
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
+					dsi_out: endpoint {
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
+						remote-endpoint = <&dsi_out>;
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
