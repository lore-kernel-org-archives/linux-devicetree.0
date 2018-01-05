From: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 06/10] dt-bindings: display: xlnx: Add ZynqMP DP subsystem bindings
Date: Thu, 4 Jan 2018 18:05:55 -0800
Message-ID: <1515117959-18068-7-git-send-email-hyun.kwon@xilinx.com>
References: <1515117959-18068-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515117959-18068-1-git-send-email-hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This add a dt binding for ZynqMP DP subsystem.

Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/display/xlnx/xlnx,zynqmp-dpsub.txt    | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.txt

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.txt b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.txt
new file mode 100644
index 0000000..4e478ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.txt
@@ -0,0 +1,94 @@
+Xilinx ZynqMP DisplayPort subsystem
+-----------------------------------
+
+Required properties:
+
+- compatible: Must be "xlnx,zynqmp-dpsub-1.7".
+
+- reg: Physical base address and length of the registers set for the device.
+- reg-names: Must be "dp", "blend", "av_buf", and "aud" to map logical register
+  partitions.
+
+- interrupts: Interrupt number.
+- interrupts-parent: phandle for interrupt controller.
+
+- clocks: phandles for axi, audio, non-live video, and live video clocks.
+  axi clock is required. Audio clock is optional. If not present, audio will
+  be disabled. One of non-live or live video clock should be present.
+- clock-names: The identification strings are required. "aclk" for axi clock.
+  "dp_aud_clk" for audio clock. "dp_vtc_pixel_clk_in" for non-live video clock.
+  "dp_live_video_in_clk" for live video clock (clock from programmable logic).
+
+- phys: phandles for phy specifier.
+- phy-names: The identifier strings. "dp-phy" followed by index.
+
+- power-domains: phandle for the corresponding power domain
+
+- ports: crtc and encoder ports are required using DT bindings defined in
+  Documentation/devicetree/bindings/graph.txt.
+
+- vid-layer, gfx-layer: Required to represent available layers
+
+Required layer properties
+
+- dmas: phandles for DMA channels as defined in
+  Documentation/devicetree/bindings/dma/dma.txt.
+- dma-names: The identifier strings are required. "graphics0" for graphics
+  layer. "video" followed by index for video layer
+
+Optional child node
+
+- The driver populates any child device node in this node. This can be used,
+  for example, to populate the sound device from the DisplayPort subsystem
+  driver.
+
+Example:
+	zynqmp_dpsub: zynqmp_dpsub@fd4a0000 {
+		compatible = "xlnx,zynqmp-dpsub-1.7";
+		reg = <0x0 0xfd4a0000 0x0 0x1000>,
+		      <0x0 0xfd4aa000 0x0 0x1000>,
+		      <0x0 0xfd4ab000 0x0 0x1000>,
+		      <0x0 0xfd4ac000 0x0 0x1000>;
+		reg-names = "dp", "blend", "av_buf", "aud";
+		interrupts = <0 119 4>;
+		interrupt-parent = <&gic>;
+
+		clock-names = "dp_apb_clk", "dp_aud_clk", "dp_live_video_in_clk";
+		clocks = <&dp_aclk>, <&clkc 17>, <&si570_1>;
+
+		phys = <&lane1 PHY_TYPE_DP 0 1 27000000>,
+		       <&lane0 PHY_TYPE_DP 1 1 27000000>;
+		phy-names = "dp-phy0", "dp-phy1";
+
+		power-domains = <&pd_dp>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vid-layer {
+			dma-names = "vid0", "vid1", "vid2";
+			dmas = <&xlnx_dpdma 0>,
+			       <&xlnx_dpdma 1>,
+			       <&xlnx_dpdma 2>;
+		};
+
+		gfx-layer {
+			dma-names = "gfx0";
+			dmas = <&xlnx_dpdma 3>;
+		};
+
+		crtc_port: port@0 {
+			reg = <0>;
+			crtc: endpoint {
+				remote-endpoint = <&encoder>;
+			};
+		};
+		port@1 {
+			reg = <1>;
+			encoder: endpoint {
+				remote-endpoint = <&crtc>;
+			};
+		};
+	};
+};
+
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
