From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [RFC PATCH 4/7] dt-bindings: Document Allwinner DWC
 HDMI TX node
Date: Wed, 20 Sep 2017 21:38:28 +0200
Message-ID: <20170920193831.20268-5-jernej.skrabec@siol.net>
References: <20170920193831.20268-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBTMHRPHAKGQE4NBZSRI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170920193831.20268-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add documentation about Allwinner DWC HDMI TX node, found in H3 SoC.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 .../bindings/display/sunxi/sun4i-drm.txt           | 158 ++++++++++++++++++++-
 1 file changed, 157 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index 92512953943e..cb6aee5c486f 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -60,6 +60,40 @@ Required properties:
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
+    * "allwinner,sun8i-h3-dw-hdmi"
+  - reg: two pairs of base address and size of memory-mapped region, first
+    for controller and second for PHY
+    registers.
+  - reg-io-width: See dw_hdmi.txt. Shall be 1.
+  - interrupts: HDMI interrupt number
+  - clocks: phandles to the clocks feeding the HDMI encoder
+    * iahb: the HDMI interface clock
+    * isfr: the HDMI module clock
+    * ddc: the HDMI ddc clock
+  - clock-names: the clock names mentioned above
+  - resets: phandles to the reset controllers driving the encoder
+    * hdmi: the reset line for the HDMI
+    * ddc: the reset line for the DDC
+  - reset-names: the reset names mentioned above
+
+  - ports: A ports node with endpoint definitions as defined in
+    Documentation/devicetree/bindings/media/video-interfaces.txt. The
+    first port should be the input endpoint. The second should be the
+    output, usually to an HDMI connector.
+
 TV Encoder
 ----------
 
@@ -255,7 +289,7 @@ Required properties:
   - allwinner,pipelines: list of phandle to the display engine
     frontends (DE 1.0) or mixers (DE 2.0) available.
 
-Example:
+Example 1:
 
 panel: panel {
 	compatible = "olimex,lcd-olinuxino-43-ts";
@@ -455,3 +489,125 @@ display-engine {
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
+	compatible = "allwinner,sun8i-h3-display-engine";
+	allwinner,pipelines = <&mixer0>;
+};
+
+hdmi: hdmi@1ee0000 {
+	compatible = "allwinner,h3-dw-hdmi";
+	reg = <0x01ee0000 0x10000>,
+	      <0x01ef0000 0x10000>;
+	reg-io-width = <1>;
+	interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI>,
+		 <&ccu CLK_HDMI_DDC>;
+	clock-names = "iahb", "isfr", "ddc";
+	resets = <&ccu RST_BUS_HDMI0>, <&ccu RST_BUS_HDMI1>;
+	reset-names = "hdmi", "ddc";
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
+			hdmi_in_tcon0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&tcon0_out_hdmi>;
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
+
+mixer0: mixer@1100000 {
+	compatible = "allwinner,sun8i-h3-de2-mixer0";
+	reg = <0x01100000 0x100000>;
+	clocks = <&display_clocks CLK_BUS_MIXER0>,
+		 <&display_clocks CLK_MIXER0>;
+	clock-names = "bus",
+		      "mod";
+	resets = <&display_clocks RST_MIXER0>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mixer0_out: port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			mixer0_out_tcon0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&tcon0_in_mixer0>;
+			};
+		};
+	};
+};
+
+tcon0: lcd-controller@1c0c000 {
+	compatible = "allwinner,sun8i-h3-tcon";
+	reg = <0x01c0c000 0x1000>;
+	interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&ccu CLK_BUS_TCON0>,
+		 <&ccu CLK_TCON0>;
+	clock-names = "ahb",
+		      "tcon-ch1";
+	resets = <&ccu RST_BUS_TCON0>;
+	reset-names = "lcd";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		tcon0_in: port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			tcon0_in_mixer0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&mixer0_out_tcon0>;
+			};
+		};
+
+		tcon0_out: port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			tcon0_out_hdmi: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&hdmi_in_tcon0>;
+			};
+		};
+	};
+};
-- 
2.14.1
