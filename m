From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 16/20] dt-bindings: display: sun4i: Add HDMI
 display bindings
Date: Wed,  3 May 2017 13:59:53 +0200
Message-ID: <0941a11259b2dba88d235c6ad713e3451d385028.1493812478.git-series.maxime.ripard@free-electrons.com>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBXUMU7EAKGQEKT7PAXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

One of the possible output of the display pipeline, on the SoCs that have
it, is the HDMI controller.

Add a binding for it.

Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 79 +++++++-
 1 file changed, 79 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index 57a8d0610062..91ce2c920750 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -4,6 +4,34 @@ Allwinner A10 Display Pipeline
 The Allwinner A10 Display pipeline is composed of several components
 that are going to be documented below:
 
+HDMI Encoder
+------------
+
+The HDMI Encoder supports the HDMI video and audio outputs, and does
+CEC. It is one end of the pipeline.
+
+Required properties:
+  - compatible: value must be one of:
+    * allwinner,sun5i-a10s-hdmi
+  - reg: base address and size of memory-mapped region
+  - interrupts: interrupt associated to this IP
+  - clocks: phandles to the clocks feeding the HDMI encoder
+    * ahb: the HDMI interface clock
+    * mod: the HDMI module clock
+    * pll-0: the first video PLL
+    * pll-1: the second video PLL
+  - clock-names: the clock names mentioned above
+  - dmas: phandles to the DMA channels used by the HDMI encoder
+    * ddc-tx: The channel for DDC transmission
+    * ddc-rx: The channel for DDC reception
+    * audio-tx: The channel used for audio transmission
+  - dma-names: the channel names mentioned above
+
+  - ports: A ports node with endpoint definitions as defined in
+    Documentation/devicetree/bindings/media/video-interfaces.txt. The
+    first port should be the input endpoint. The second should be the
+    output, usually to an HDMI connector.
+
 TV Encoder
 ----------
 
@@ -173,6 +201,57 @@ panel: panel {
 	};
 };
 
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
+hdmi: hdmi@01c16000 {
+	compatible = "allwinner,sun5i-a10s-hdmi";
+	reg = <0x01c16000 0x1000>;
+	interrupts = <58>;
+	clocks = <&ccu CLK_AHB_HDMI>, <&ccu CLK_HDMI>,
+		 <&ccu CLK_PLL_VIDEO0_2X>,
+		 <&ccu CLK_PLL_VIDEO1_2X>;
+	clock-names = "ahb", "mod", "pll-0", "pll-1";
+	dmas = <&dma SUN4I_DMA_NORMAL 16>,
+	       <&dma SUN4I_DMA_NORMAL 16>,
+	       <&dma SUN4I_DMA_DEDICATED 24>;
+	dma-names = "ddc-tx", "ddc-rx", "audio-tx";
+	status = "disabled";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			hdmi_in_tcon0: endpoint {
+				remote-endpoint = <&tcon0_out_hdmi>;
+			};
+		};
+
+		port@1 {
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
 tve0: tv-encoder@01c0a000 {
 	compatible = "allwinner,sun4i-a10-tv-encoder";
 	reg = <0x01c0a000 0x1000>;
-- 
git-series 0.8.11
