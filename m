From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 17/26] drm: sun4i: Add DT bindings documentation
Date: Thu, 14 Jan 2016 16:25:00 +0100
Message-ID: <1452785109-6172-18-git-send-email-maxime.ripard@free-electrons.com>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBH74322AKGQEWGIQ4ZQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1452785109-6172-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The display pipeline of the Allwinner A10 is involving several loosely
coupled components.

Add a documentation for the bindings.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../bindings/display/sunxi/sun4i-drm.txt           | 228 +++++++++++++++++++++
 1 file changed, 228 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
new file mode 100644
index 000000000000..061bc87147a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -0,0 +1,228 @@
+Allwinner A10 Display Pipeline
+==============================
+
+The Allwinner A10 Display pipeline is composed of several components
+that are going to be documented below:
+
+TV Encoder
+----------
+
+The TV Encoder supports the composite and VGA output. It is one end of
+the pipeline.
+
+Required properties:
+ - compatible: value should be "allwinner,sun4i-a10-tv-encoder".
+ - reg: base address and size of memory-mapped region
+ - clocks: the clocks driving the TV encoder
+
+- ports: A ports node with endpoint definitions as defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt. The
+  first port should be the input endpoint.
+
+TCON
+----
+
+The TCON acts as a timing controller for RGB, LVDS and TV interfaces.
+
+Required properties:
+ - compatible: value should be "allwinner,sun4i-a10-tcon".
+ - reg: base address and size of memory-mapped region
+ - interrupts: interrupt associated to this IP
+ - clocks: phandles to the clocks feeding the TCON. Three are needed:
+   - 'ahb': the interface clocks
+   - 'tcon-ch0': The clock driving the TCON channel 0
+   - 'tcon-ch1': The clock driving the TCON channel 1
+
+ - clock-names: the clock names mentioned above
+ - clock-output-names: Name of the pixel clock created
+
+- ports: A ports node with endpoint definitions as defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt. The
+  first port should be the input endpoint, the second one the output
+
+Optional properties:
+  - allwinner,panel: phandle to the panel used in our RGB interface
+
+
+Display Engine Backend
+----------------------
+
+The display engine backend exposes layers and sprites to the
+system.
+
+Required properties:
+  - compatible: value must be one of:
+    * allwinner,sun5i-a13-display-backend
+  - reg: base address and size of the memory-mapped region.
+  - clocks: phandles to the clocks feeding the frontend and backend
+    * ahb: the backend interface clock
+    * mod: the backend module clock
+    * ram: the backend DRAM clock
+  - clock-names: the clock names mentioned above
+  - resets: phandles to the reset controllers driving the backend
+
+- ports: A ports node with endpoint definitions as defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt. The
+  first port should be the input endpoints, the second one the output
+
+Display Engine Frontend
+-----------------------
+
+The display engine frontend does formats conversion, scaling,
+deinterlacing and color space conversion.
+
+Required properties:
+  - compatible: value must be one of:
+    * allwinner,sun5i-a13-display-frontend
+  - reg: base address and size of the memory-mapped region.
+  - interrupts: interrupt associated to this IP
+  - clocks: phandles to the clocks feeding the frontend and backend
+    * ahb: the backend interface clock
+    * mod: the backend module clock
+    * ram: the backend DRAM clock
+  - clock-names: the clock names mentioned above
+  - resets: phandles to the reset controllers driving the backend
+
+Display Engine Pipeline
+-----------------------
+
+The display engine pipeline (and its entry point, since it can be
+either directly the backend or the frontend) is represented as an
+extra node.
+
+Required properties:
+  - compatible: value must be one of:
+    * allwinner,sun5i-a13-display-engine
+  - allwinner,pipelines: list of phandle to the entry points of the
+    pipelines (either to the frontend or backend)
+
+Example:
+
+panel: panel {
+	compatible = "olimex,lcd-olinuxino-43-ts";
+};
+
+tve0: tv-encoder@01c0a000 {
+	compatible = "allwinner,sun4i-a10-tv-encoder";
+	reg = <0x01c0a000 0x1000>;
+	clocks = <&ahb_gates 34>;
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		tve0_in_tcon0: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&tcon0_out_tve0>;
+		};
+	};
+};
+
+tcon0: lcd-controller@01c0c000 {
+	compatible = "allwinner,sun4i-a10-tcon";
+	reg = <0x01c0c000 0x1000>;
+	interrupts = <44>;
+	clocks = <&ahb_gates 36>,
+		 <&tcon_ch0_clk>,
+		 <&tcon_ch1_clk>;
+	clock-names = "ahb",
+		      "tcon-ch0",
+		      "tcon-ch1";
+	clock-output-names = "tcon-pixel-clock";
+	allwinner,panel = <&panel>;
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
+			tcon0_in_be0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&be0_out_tcon0>;
+			};
+		};
+
+		tcon0_out: port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			tcon0_out_tve0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&tve0_in_tcon0>;
+			};
+		};
+	};
+};
+
+fe0: display-frontend@01e00000 {
+	compatible = "allwinner,sun5i-a13-display-frontend";
+	reg = <0x01e00000 0x20000>;
+	interrupts = <47>;
+	clocks = <&ahb_gates 46>, <&de_fe_clk>,
+		 <&dram_gates 25>;
+	clock-names = "ahb", "mod",
+		      "ram";
+	resets = <&de_fe_clk>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		fe0_out: port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			fe0_out_be0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&be0_in_fe0>;
+			};
+		};
+	};
+};
+
+be0: display-backend@01e60000 {
+	compatible = "allwinner,sun5i-a13-display-backend";
+	reg = <0x01e60000 0x10000>;
+	clocks = <&ahb_gates 44>, <&de_be_clk>,
+		 <&dram_gates 26>;
+	clock-names = "ahb", "mod",
+		      "ram";
+	resets = <&de_be_clk>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		be0_in: port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			be0_in_fe0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&fe0_out_be0>;
+			};
+		};
+
+		be0_out: port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			be0_out_tcon0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&tcon0_in_be0>;
+		};
+	};
+};
+
+display-engine {
+	compatible = "allwinner,sun5i-a13-display-engine";
+	pipelines = <&be0>;
+};
-- 
2.6.4
