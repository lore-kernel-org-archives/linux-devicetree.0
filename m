From: Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH] dt-bindings: display: stm32: add pixel clock mandatory property
Date: Sun, 21 Jan 2018 22:13:15 +0100
Message-ID: <20180121211315.31562-1-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the DPI/RGB input pixel clock in mandatory properties
because it really offers a better preciseness for timing
computations.

Signed-off-by: Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>
---
Please apply "dt-bindings: display: stm32: correct clock-names
in dsi panel example" before this patch.

Changes in v3: remove the note regarding swapped clock names
  (now in a separate patch).
Changes in v2: put new clock in last position (Rob Herring)

 Documentation/devicetree/bindings/display/st,stm32-ltdc.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
index 3eb1b48b47dd..942b7237ae87 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
+++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
@@ -29,6 +29,7 @@ Mandatory properties specific to STM32 DSI:
 - compatible: "st,stm32-dsi".
 - clock-names:
   - phy pll reference clock string name, must be "ref".
+  - DPI/RGB input pixel clock string name, must be "px_clk".
 - resets: see [5].
 - reset-names: see [5].
 
@@ -97,8 +98,9 @@ Example 2: DSI panel
 			#size-cells = <0>;
 			compatible = "st,stm32-dsi";
 			reg = <0x40016c00 0x800>;
-			clocks = <&rcc 1 CLK_F469_DSI>, <&clk_hse>;
-			clock-names = "pclk", "ref";
+			clocks = <&rcc 1 CLK_F469_DSI>, <&clk_hse>,
+				 <&rcc 1 CLK_LCD>;
+			clock-names = "pclk", "ref", "px_clk";
 			resets = <&rcc STM32F4_APB2_RESET(DSI)>;
 			reset-names = "apb";
 
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
