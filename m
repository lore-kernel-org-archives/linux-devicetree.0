From: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 2/5] dt-bindings: display: xlnx: Add ZynqMP DP subsystem bindings
Date: Tue, 6 Feb 2018 17:36:37 -0800
Message-ID: <1517967400-16993-2-git-send-email-hyun.kwon@xilinx.com>
References: <1517967400-16993-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517967400-16993-1-git-send-email-hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This add a dt binding for ZynqMP DP subsystem.

Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v4
- Specify phy related descriptions
- Specify dma related descriptions
- Remove ports
- Remove child nodes for layers
- Update the example accordingly
v2
- Group multiple ports under 'ports'
- Replace linux specific terms with generic hardware descriptions
---
---
 .../bindings/display/xlnx/xlnx,zynqmp-dpsub.txt    | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.txt

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.txt b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.txt
new file mode 100644
index 0000000..f4a2e6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.txt
@@ -0,0 +1,67 @@
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
+- phys: phandles for phy specifier. The number of lanes is configurable
+  between 1 and 2. The number of phandles should be 1 or 2.
+- phy-names: The identifier strings. "dp-phy" followed by index, 0 or 1.
+  For single lane, only "dp-phy0" is required. For dual lane, both "dp-phy0"
+  and "dp-phy1" are required where "dp-phy0" is the primary lane.
+
+- power-domains: phandle for the corresponding power domain
+
+- dmas: phandles for DMA channels as defined in
+  Documentation/devicetree/bindings/dma/dma.txt.
+- dma-names: The identifier strings are required. "gfx0" for graphics layer
+  dma channel. "vid" followed by index (0 - 2) for video layer dma channels.
+
+Optional child node
+
+- The driver populates any child device node in this node. This can be used,
+  for example, to populate the sound device from the DisplayPort subsystem
+  driver.
+
+Example:
+	zynqmp-display-subsystem@fd4a0000 {
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
+		phys = <&lane1>, <&lane0>;
+		phy-names = "dp-phy0", "dp-phy1";
+
+		power-domains = <&pd_dp>;
+
+		dma-names = "vid0", "vid1", "vid2", "gfx0";
+		dmas = <&xlnx_dpdma 0>,
+		       <&xlnx_dpdma 1>,
+		       <&xlnx_dpdma 2>,
+		       <&xlnx_dpdma 3>;
+	};
+};
+
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
