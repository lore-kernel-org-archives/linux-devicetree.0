From: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/8] dt-bindings: display: xlnx: Add bindings for Xilinx display pipeline
Date: Fri, 12 Jan 2018 18:03:21 -0800
Message-ID: <1515809008-14518-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The dt binding for Xilinx display pipeline. The pipeline can be
composed with multiple and different types of sub-devices. This node
is to represent the entire pipeline as a single entity.

Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
v2
- Remove linux specific terms
- Elaborate details, ex regarding port binding
- Rename xlnx,kms to xlnx,display
- Rename the file name to xlnx,display.txt
- Add examples of hardware blocks
---
---
 .../bindings/display/xlnx/xlnx,display.txt         | 68 ++++++++++++++++++=
++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,dis=
play.txt

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,display.tx=
t b/Documentation/devicetree/bindings/display/xlnx/xlnx,display.txt
new file mode 100644
index 0000000..fde1a35
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,display.txt
@@ -0,0 +1,68 @@
+Xilinx Display Pipeline
+-----------------------
+
+Xilinx display pipeline can be designed with various types of multiple IPs=
:
+IPs hardened on chip, ob board IPs, and soft IPs in programmable logic.
+While each component would need its own node, this node represents
+a whole display pipeline as a single entity by integrating individual subd=
evice
+with glue logics.
+
+The following illustrates some examples of topology:
+
+A linear pipeline with multiple blocks:
+
+       SoC DMA -> SoC display controller -> SoC display enc
+or,
+       FPGA DMA -> FPGA display controller -> FPGA display enc
+
+A pipeline with branches:
+
+       SoC DMA -> SoC display controller -> SoC display enc
+               |
+       FPGA DMA->
+or,
+       SoC DMA -> SoC display controller -> SoC display enc
+                                         |
+                                         -> FPAG display enc
+
+or,
+
+                       SoC DMA -> SoC display controller -> SoC display en=
c
+                               |                         |
+       FPGA display controller ->                        -> FPGA display e=
nc
+
+Required properties:
+
+- compatible: Must be "xlnx,display".
+
+- ports: phandles for ports of display controller subdevice.
+  In the display controller port nodes, topology for entire pipeline
+  should be described using the DT bindings defined in
+  Documentation/devicetree/bindings/graph.txt.
+
+Example:
+
+       xlnx_display {
+               compatible =3D "xlnx,display";
+               ports =3D <&display_controller_port>;
+       };
+
+       display_controller {
+               ...
+               display_controller_port: port@0 {
+                       display_controller_ep: endpoint {
+                               remote-endpoint =3D <&dp_controller_ep>;
+                       };
+               };
+               ...
+       };
+
+       dp_controller {
+               ...
+               dp_controller_port: port@0 {
+                       dp_controller_ep: endpoint {
+                               remote-endpoint =3D <&display_controller_ep=
>;
+                       };
+               };
+               ...
+       };
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
