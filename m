From: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v10 1/2] dt-bindings: media: Add Allwinner V3s
 Camera Sensor Interface (CSI)
Date: Fri,  4 May 2018 14:46:23 +0800
Message-ID: <1525416383-36184-1-git-send-email-yong.deng@magewell.com>
Reply-To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD2JNYHK4MEBB5MDWDLQKGQEXCVURAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-med
List-Id: devicetree@vger.kernel.org

Add binding documentation for Allwinner V3s CSI.

Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/media/sun6i-csi.txt        | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/sun6i-csi.txt

diff --git a/Documentation/devicetree/bindings/media/sun6i-csi.txt b/Documentation/devicetree/bindings/media/sun6i-csi.txt
new file mode 100644
index 000000000000..2ff47a9507a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/sun6i-csi.txt
@@ -0,0 +1,59 @@
+Allwinner V3s Camera Sensor Interface
+-------------------------------------
+
+Allwinner V3s SoC features two CSI module. CSI0 is used for MIPI CSI-2
+interface and CSI1 is used for parallel interface.
+
+Required properties:
+  - compatible: value must be "allwinner,sun8i-v3s-csi"
+  - reg: base address and size of the memory-mapped region.
+  - interrupts: interrupt associated to this IP
+  - clocks: phandles to the clocks feeding the CSI
+    * bus: the CSI interface clock
+    * mod: the CSI module clock
+    * ram: the CSI DRAM clock
+  - clock-names: the clock names mentioned above
+  - resets: phandles to the reset line driving the CSI
+
+Each CSI node should contain one 'port' child node with one child 'endpoint'
+node, according to the bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt. As mentioned
+above, the endpoint's bus type should be MIPI CSI-2 for CSI0 and parallel or
+Bt656 for CSI1.
+
+Endpoint node properties for CSI1
+---------------------------------
+
+- remote-endpoint	: (required) a phandle to the bus receiver's endpoint
+			   node
+- bus-width:		: (required) must be 8, 10, 12 or 16
+- pclk-sample		: (optional) (default: sample on falling edge)
+- hsync-active		: (only required for parallel)
+- vsync-active		: (only required for parallel)
+
+Example:
+
+csi1: csi@1cb4000 {
+	compatible = "allwinner,sun8i-v3s-csi";
+	reg = <0x01cb4000 0x1000>;
+	interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&ccu CLK_BUS_CSI>,
+		 <&ccu CLK_CSI1_SCLK>,
+		 <&ccu CLK_DRAM_CSI>;
+	clock-names = "bus", "mod", "ram";
+	resets = <&ccu RST_BUS_CSI>;
+
+	port {
+		/* Parallel bus endpoint */
+		csi1_ep: endpoint {
+			remote-endpoint = <&adv7611_ep>;
+			bus-width = <16>;
+
+			/* If hsync-active/vsync-active are missing,
+			   embedded BT.656 sync is used */
+			hsync-active = <0>; /* Active low */
+			vsync-active = <0>; /* Active low */
+			pclk-sample = <1>;  /* Rising */
+		};
+	};
+};
-- 
1.8.3.1
