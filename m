From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 09/19] drm: sun4i: Add DT bindings documentation
Date: Fri, 30 Oct 2015 15:20:55 +0100
Message-ID: <1446214865-3972-10-git-send-email-maxime.ripard@free-electrons.com>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBAX2ZWYQKGQEC2G64QI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1446214865-3972-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The display pipeline of the Allwinner A10 is involving several loosely
coupled components.

Add a documentation for the bindings.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../devicetree/bindings/drm/sunxi/sun4i-drm.txt    | 122 +++++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/sunxi/sun4i-drm.txt

diff --git a/Documentation/devicetree/bindings/drm/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/drm/sunxi/sun4i-drm.txt
new file mode 100644
index 000000000000..dbdccef787b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/sunxi/sun4i-drm.txt
@@ -0,0 +1,122 @@
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
+TCON
+----
+
+The TCON acts as a CRTC and encoder for RGB / LVDS interfaces.
+
+Required properties:
+ - compatible: value should be "allwinner,sun4i-a10-tcon".
+ - reg: base address and size of memory-mapped region
+ - interrupts: interrupt associated to this IP
+ - clocks: phandles to the clocks feeding the TCON. Three are needed:
+   - 'ahb': the interface clocks
+   - 'tcon-ch0': The clock driving the TCON channel 0
+   - 'tcon-ch1': The clock driving the TCON channel 0
+
+ - clock-names: the clock names mentionned above
+ - clock-output-names: Name of the pixel clock created
+
+
+Display Engine Backend
+----------------------
+
+The display engine backend exposes layers and sprites to the
+system. It's split into two components, the frontend and backend, the
+frontend doing formats conversion, scaling, deinterlacing, while the
+backend actually manages the layers.
+
+Required properties:
+  - compatible: value must be one of:
+    * allwinner,sun5i-a13-display-engine
+
+  - reg: base address and size of the memory-mapped region. Two are needed:
+    * backend0: registers of the display engine backend
+    * frontend0: registers of the display engine frontend
+  - reg_names: the region names mentionned above.
+
+  - interrupts: frontend interrupt phandle
+
+  - clocks: phandles to the clocks feeding the frontend and backend
+    * backend0-bus: the backend interface clock
+    * backend0-mod: the backend module clock
+    * backend0-ram: the backend DRAM clock
+    * frontend0-bus: the frontend interface clock
+    * frontend0-mod: the frontend module clock
+    * frontend0-ram: the frontend DRAM clock
+  - clock-names: the clock names mentionned above
+
+  - resets: phandles to the reset controllers. Two are needed:
+    * backend0: backend reset controller
+    * frontend0: frontend reset controller
+  - reset-names: the reset names mentionned above
+
+  - allwinner,tcon: phandle to the TCON in our pipeline
+
+Optional properties:
+  - allwinner,tv-encoder: phandle to the TV Encoder in our pipeline
+  - allwinner,panel: phandle to the panel used in our RGB interface
+
+Example:
+
+panel: panel {
+	compatible = "olimex,lcd-olinuxino-43-ts";
+};
+
+tve: encoder@01c0a000 {
+	compatible = "allwinner,sun4i-a10-tv-encoder";
+	reg = <0x01c0a000 0x1000>;
+	clocks = <&ahb_gates 34>;
+};
+
+tcon: lcd-controller@01c0c000 {
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
+};
+
+de: display-engine@01e00000 {
+	compatible = "allwinner,sun5i-a13-display-engine";
+	reg = <0x01e00000 0x20000>,
+	      <0x01e60000 0x10000>;
+	reg-names = "frontend0",
+		    "backend0";
+	interrupts = <47>;
+	interrupt-names = "engine0";
+	clocks = <&ahb_gates 46>, <&de_fe_clk>,
+		 <&dram_gates 25>, <&ahb_gates 44>,
+		 <&de_be_clk>, <&dram_gates 26>;
+	clock-names = "frontend0-bus", "frontend0-mod",
+		      "frontend0-ram", "backend0-bus",
+		      "backend0-mod", "backend0-ram";
+	resets = <&de_fe_clk>,
+		 <&de_be_clk>;
+	reset-names = "frontend0",
+		      "backend0";
+
+	allwinner,tcon = <&tcon>;
+	allwinner,tv-encoder = <&tve>;
+	allwinner,panel = <&panel>;
+};
-- 
2.6.2
