From: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 3/8] dt-bindings: display: xlnx: Add ZynqMP DP subsystem bindings
Date: Mon, 15 Jan 2018 17:57:06 -0800
Message-ID: <1516067831-11382-3-git-send-email-hyun.kwon@xilinx.com>
References: <1516067831-11382-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516067831-11382-1-git-send-email-hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This add a dt binding for ZynqMP DP subsystem.

Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
v2
- Group multiple ports under 'ports'
- Replace linux specific terms with generic hardware descriptions
---
---
 .../bindings/display/xlnx/xlnx,zynqmp-dpsub.txt    | 98 ++++++++++++++++++=
++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,zyn=
qmp-dpsub.txt

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dps=
ub.txt b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.t=
xt
new file mode 100644
index 0000000..dbcbde5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.txt
@@ -0,0 +1,98 @@
+Xilinx ZynqMP DisplayPort subsystem
+-----------------------------------
+
+Required properties:
+
+- compatible: Must be "xlnx,zynqmp-dpsub-1.7".
+
+- reg: Physical base address and length of the registers set for the devic=
e.
+- reg-names: Must be "dp", "blend", "av_buf", and "aud" to map logical reg=
ister
+  partitions.
+
+- interrupts: Interrupt number.
+- interrupts-parent: phandle for interrupt controller.
+
+- clocks: phandles for axi, audio, non-live video, and live video clocks.
+  axi clock is required. Audio clock is optional. If not present, audio wi=
ll
+  be disabled. One of non-live or live video clock should be present.
+- clock-names: The identification strings are required. "aclk" for axi clo=
ck.
+  "dp_aud_clk" for audio clock. "dp_vtc_pixel_clk_in" for non-live video c=
lock.
+  "dp_live_video_in_clk" for live video clock (clock from programmable log=
ic).
+
+- phys: phandles for phy specifier.
+- phy-names: The identifier strings. "dp-phy" followed by index.
+
+- power-domains: phandle for the corresponding power domain
+
+- ports: There are 2 logical blocks in the IP: display controller and
+  DisplayPort encoder. Each block can be used / connected independently wi=
th
+  external device, hence ports for each block are required using DT bindin=
gs
+  defined in Documentation/devicetree/bindings/graph.txt. Refer to
+  ./xlnx,display.txt for how topology for entire pipeline is described.
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
+- The driver populates any child device node in this node. This can be use=
d,
+  for example, to populate the sound device from the DisplayPort subsystem
+  driver.
+
+Example:
+       zynqmp_dpsub: zynqmp_dpsub@fd4a0000 {
+               compatible =3D "xlnx,zynqmp-dpsub-1.7";
+               reg =3D <0x0 0xfd4a0000 0x0 0x1000>,
+                     <0x0 0xfd4aa000 0x0 0x1000>,
+                     <0x0 0xfd4ab000 0x0 0x1000>,
+                     <0x0 0xfd4ac000 0x0 0x1000>;
+               reg-names =3D "dp", "blend", "av_buf", "aud";
+               interrupts =3D <0 119 4>;
+               interrupt-parent =3D <&gic>;
+
+               clock-names =3D "dp_apb_clk", "dp_aud_clk", "dp_live_video_=
in_clk";
+               clocks =3D <&dp_aclk>, <&clkc 17>, <&si570_1>;
+
+               phys =3D <&lane1>, <&lane0>;
+               phy-names =3D "dp-phy0", "dp-phy1";
+
+               power-domains =3D <&pd_dp>;
+
+               vid-layer {
+                       dma-names =3D "vid0", "vid1", "vid2";
+                       dmas =3D <&xlnx_dpdma 0>,
+                              <&xlnx_dpdma 1>,
+                              <&xlnx_dpdma 2>;
+               };
+
+               gfx-layer {
+                       dma-names =3D "gfx0";
+                       dmas =3D <&xlnx_dpdma 3>;
+               };
+
+               ports {
+                       #address-cells =3D <1>;
+                       #size-cells =3D <0>;
+
+                       display_port: port@0 {
+                               reg =3D <0>;
+                               display_port: endpoint {
+                                       remote-endpoint =3D <&dp_port>;
+                               };
+                       };
+                       port@1 {
+                               reg =3D <1>;
+                               dp_port: endpoint {
+                                       remote-endpoint =3D <&display_port>=
;
+                               };
+                       };
+               }
+       };
+};
+
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
