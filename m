From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 1/2] powerpc/qman: Change fsl,qman-channel-id to cell-index
Date: Fri, 17 Apr 2015 17:53:06 -0500
Message-ID: <1429311187-19062-1-git-send-email-scottwood@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Madalin-Cristian Bucur <madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It turns out that existing U-Boots will dereference NULL pointers
if the device tree does not have cell-index in the portal nodes.

No patch has yet been merged adding device tree nodes for this binding
(except a dtsi that has not yet been referenced), nor has any driver
yet been merged making use of the binding, so it's not too late to
change the binding in order to keep compatibility with existing
U-Boots.

Signed-off-by: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Madalin-Cristian Bucur <madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/soc/fsl/qman-portals.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/qman-portals.txt b/Documentation/devicetree/bindings/soc/fsl/qman-portals.txt
index 48c4dae..47e46cc 100644
--- a/Documentation/devicetree/bindings/soc/fsl/qman-portals.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/qman-portals.txt
@@ -47,7 +47,7 @@ PROPERTIES
 
 	For additional details about the PAMU/LIODN binding(s) see pamu.txt
 
-- fsl,qman-channel-id
+- cell-index
 	Usage:		Required
 	Value type:	<u32>
 	Definition:	The hardware index of the channel. This can also be
@@ -136,7 +136,7 @@ The example below shows a (P4080) QMan portals container/bus node with two porta
 			reg = <0x4000 0x4000>, <0x101000 0x1000>;
 			interrupts = <106 2 0 0>;
 			fsl,liodn = <3 4>;
-			fsl,qman-channel-id = <1>;
+			cell-index = <1>;
 
 			fman0 {
 				fsl,liodn = <0x22>;
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
