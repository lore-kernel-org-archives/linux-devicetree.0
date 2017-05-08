From: Kieran Bingham <kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Documentation: of: Fix grammar usge in graph bindings
Date: Mon,  8 May 2017 11:31:45 +0100
Message-ID: <1494239506-8057-1-git-send-email-kbingham@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

Some minor tweaks to the language and formatting used in the
documentation identified while I was reading up on the subject matter.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
---
 Documentation/devicetree/bindings/graph.txt | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/graph.txt b/Documentation/devicetree/bindings/graph.txt
index fcb1c6a4787b..0415e2c53ba0 100644
--- a/Documentation/devicetree/bindings/graph.txt
+++ b/Documentation/devicetree/bindings/graph.txt
@@ -34,7 +34,7 @@ remote device, an 'endpoint' child node must be provided for each link.
 If more than one port is present in a device node or there is more than one
 endpoint at a port, or a port node needs to be associated with a selected
 hardware interface, a common scheme using '#address-cells', '#size-cells'
-and 'reg' properties is used number the nodes.
+and 'reg' properties is used to number the nodes.
 
 device {
         ...
@@ -89,9 +89,9 @@ Links between endpoints
 
 Each endpoint should contain a 'remote-endpoint' phandle property that points
 to the corresponding endpoint in the port of the remote device. In turn, the
-remote endpoint should contain a 'remote-endpoint' property. If it has one,
-it must not point to another than the local endpoint. Two endpoints with their
-'remote-endpoint' phandles pointing at each other form a link between the
+remote endpoint should contain a 'remote-endpoint' property. If it has one, it
+must not point to anything other than the local endpoint. Two endpoints with
+their 'remote-endpoint' phandles pointing at each other form a link between the
 containing ports.
 
 device-1 {
@@ -110,13 +110,12 @@ device-2 {
         };
 };
 
-
 Required properties
 -------------------
 
 If there is more than one 'port' or more than one 'endpoint' node or 'reg'
-property is present in port and/or endpoint nodes the following properties
-are required in a relevant parent node:
+property present in the port and/or endpoint nodes then the following
+properties are required in a relevant parent node:
 
  - #address-cells : number of cells required to define port/endpoint
                     identifier, should be 1.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
