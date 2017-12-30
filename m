From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH 06/11] dt-bindings: display: sun4i-drm: Add A83T
 HDMI pipeline
Date: Sat, 30 Dec 2017 22:01:58 +0100
Message-ID: <20171230210203.24115-7-jernej.skrabec@siol.net>
References: <20171230210203.24115-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERB2H5T7JAKGQE6U7K7HY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171230210203.24115-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This commit adds all necessary compatibles and descriptions needed to
implement A83T HDMI pipeline.

Mixer is already properly described, so only compatible is added.

However, A83T TCON1, which is connected to HDMI, doesn't have channel 0,
contrary to all TCONs currently described. Because of that, TCON
documentation is extended.

A83T features Synopsys DW HDMI controller with a custom PHY which looks
like Synopsys Gen2 PHY with few additions. Since there is no
documentation, needed properties were found out through experimentation
and reading BSP code.

At the end, example is added for newer SoCs, which features DE2 and DW
HDMI.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 .../bindings/display/sunxi/sun4i-drm.txt           | 188 ++++++++++++++++++++-
 1 file changed, 181 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index 9f073af4c711..3eca258096a5 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -64,6 +64,40 @@ Required properties:
     first port should be the input endpoint. The second should be the
     output, usually to an HDMI connector.
 
+DWC HDMI TX Encoder
+-----------------------------
+
+The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
+with Allwinner's own PHY IP. It supports audio and video outputs and CEC.
+
+These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
+Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
+following device-specific properties.
+
+Required properties:
+
+  - compatible: value must be one of:
+    * "allwinner,sun8i-a83t-dw-hdmi"
+  - reg: two pairs of base address and size of memory-mapped region, first
+    for controller and second for PHY
+    registers.
+  - reg-io-width: See dw_hdmi.txt. Shall be 1.
+  - interrupts: HDMI interrupt number
+  - clocks: phandles to the clocks feeding the HDMI encoder
+    * iahb: the HDMI bus clock
+    * isfr: the HDMI register clock
+    * tmds: the HDMI tmds clock
+  - clock-names: the clock names mentioned above
+  - resets: phandles to the reset controllers driving the encoder
+    * ctrl: the reset line for the controller
+    * phy: the reset line for the PHY
+  - reset-names: the reset names mentioned above
+
+  - ports: A ports node with endpoint definitions as defined in
+    Documentation/devicetree/bindings/media/video-interfaces.txt. The
+    first port should be the input endpoint. The second should be the
+    output, usually to an HDMI connector.
+
 TV Encoder
 ----------
 
@@ -94,18 +128,17 @@ Required properties:
    * allwinner,sun7i-a20-tcon
    * allwinner,sun8i-a33-tcon
    * allwinner,sun8i-a83t-tcon-lcd
+   * allwinner,sun8i-a83t-tcon-tv
    * allwinner,sun8i-v3s-tcon
  - reg: base address and size of memory-mapped region
  - interrupts: interrupt associated to this IP
- - clocks: phandles to the clocks feeding the TCON. Three are needed:
+ - clocks: phandles to the clocks feeding the TCON. One is needed:
    - 'ahb': the interface clocks
-   - 'tcon-ch0': The clock driving the TCON channel 0
  - resets: phandles to the reset controllers driving the encoder
    - "lcd": the reset line for the TCON channel 0
 
  - clock-names: the clock names mentioned above
  - reset-names: the reset names mentioned above
- - clock-output-names: Name of the pixel clock created
 
 - ports: A ports node with endpoint definitions as defined in
   Documentation/devicetree/bindings/media/video-interfaces.txt. The
@@ -119,11 +152,31 @@ Required properties:
   channel the endpoint is associated to. If that property is not
   present, the endpoint number will be used as the channel number.
 
-On SoCs other than the A33 and V3s, there is one more clock required:
+Following compatibles:
+ * allwinner,sun4i-a10-tcon
+ * allwinner,sun5i-a13-tcon
+ * allwinner,sun6i-a31-tcon
+ * allwinner,sun6i-a31s-tcon
+ * allwinner,sun7i-a20-tcon
+ * allwinner,sun8i-a33-tcon
+ * allwinner,sun8i-a83t-tcon-lcd
+ * allwinner,sun8i-v3s-tcon
+have additional required properties:
+ - 'tcon-ch0': The clock driving the TCON channel 0
+ - clock-output-names: Name of the pixel clock created
+
+For following compatibles:
+ * allwinner,sun4i-a10-tcon
+ * allwinner,sun5i-a13-tcon
+ * allwinner,sun6i-a31-tcon
+ * allwinner,sun6i-a31s-tcon
+ * allwinner,sun7i-a20-tcon
+ * allwinner,sun8i-a83t-tcon-tv
+there is one more clock required:
    - 'tcon-ch1': The clock driving the TCON channel 1
 
-On SoCs that support LVDS (all SoCs but the A13, H3, H5 and V3s), you
-need one more reset line:
+On TCONs that support LVDS (all TCONs except the ones found on A13, H3, H5, V3s
+and TCON1 on A83T), you need one more reset line:
    - 'lvds': The reset line driving the LVDS logic
 
 And on the SoCs newer than the A31 (sun6i and sun8i families), you
@@ -227,6 +280,7 @@ supported.
 Required properties:
   - compatible: value must be one of:
     * allwinner,sun8i-a83t-de2-mixer-0
+    * allwinner,sun8i-a83t-de2-mixer-1
     * allwinner,sun8i-v3s-de2-mixer
   - reg: base address and size of the memory-mapped region.
   - clocks: phandles to the clocks feeding the mixer
@@ -262,7 +316,7 @@ Required properties:
   - allwinner,pipelines: list of phandle to the display engine
     frontends (DE 1.0) or mixers (DE 2.0) available.
 
-Example:
+Example 1:
 
 panel: panel {
 	compatible = "olimex,lcd-olinuxino-43-ts";
@@ -461,3 +515,123 @@ display-engine {
 	compatible = "allwinner,sun5i-a13-display-engine";
 	allwinner,pipelines = <&fe0>;
 };
+
+Example 2:
+
+connector {
+	compatible = "hdmi-connector";
+	type = "a";
+
+	port {
+		hdmi_con_in: endpoint {
+			remote-endpoint = <&hdmi_out_con>;
+		};
+	};
+};
+
+de: display-engine {
+	compatible = "allwinner,sun8i-a83t-display-engine";
+	allwinner,pipelines = <&mixer1>;
+};
+
+mixer1: mixer@1200000 {
+	compatible = "allwinner,sun8i-a83t-de2-mixer-1";
+	reg = <0x01200000 0x100000>;
+	clocks = <&display_clocks CLK_BUS_MIXER1>,
+		 <&display_clocks CLK_MIXER1>;
+	clock-names = "bus",
+		      "mod";
+	resets = <&display_clocks RST_WB>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mixer1_out: port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			mixer1_out_tcon1: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&tcon1_in_mixer1>;
+			};
+		};
+	};
+};
+
+tcon1: lcd-controller@1c0d000 {
+	compatible = "allwinner,sun8i-a83t-tcon-tv";
+	reg = <0x01c0d000 0x1000>;
+	interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&ccu CLK_BUS_TCON1>, <&ccu CLK_TCON1>;
+	clock-names = "ahb", "tcon-ch1";
+	resets = <&ccu RST_BUS_TCON1>;
+	reset-names = "lcd";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		tcon1_in: port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			tcon1_in_mixer1: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&mixer1_out_tcon1>;
+			};
+		};
+
+		tcon1_out: port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			tcon1_out_hdmi: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&hdmi_in_tcon1>;
+			};
+		};
+	};
+};
+
+hdmi: hdmi@1ee0000 {
+	compatible = "allwinner,sun8i-a83t-dw-hdmi";
+	reg = <0x01ee0000 0x10000>,
+	      <0x01ef0000 0x10000>;
+	reg-io-width = <1>;
+	interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_SLOW>,
+		 <&ccu CLK_HDMI>;
+	clock-names = "iahb", "isfr", "tmds";
+	resets = <&ccu RST_BUS_HDMI0>, <&ccu RST_BUS_HDMI1>;
+	reset-names = "phy", "ctrl";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hdmi_in: port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			hdmi_in_tcon1: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&tcon1_out_hdmi>;
+			};
+		};
+
+		hdmi_out: port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			hdmi_out_con: endpoint {
+				remote-endpoint = <&hdmi_con_in>;
+			};
+		};
+	};
+};
-- 
2.15.1
