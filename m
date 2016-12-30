From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] bus: imx-weim: Place 'fsl,weim-cs-timing' under the required properties section
Date: Fri, 30 Dec 2016 08:46:12 -0200
Message-ID: <1483094772-14904-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Property 'fsl,weim-cs-timing' is a required one, so place it under
"Required properties" section.

Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 Documentation/devicetree/bindings/bus/imx-weim.txt | 27 ++++++++++------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/imx-weim.txt b/Documentation/devicetree/bindings/bus/imx-weim.txt
index 6630d84..a9a125b 100644
--- a/Documentation/devicetree/bindings/bus/imx-weim.txt
+++ b/Documentation/devicetree/bindings/bus/imx-weim.txt
@@ -23,6 +23,18 @@ Required properties:
 			integer values for each chip-select line in use:
 
 			   <cs-number> 0 <physical address of mapping> <size>
+ - fsl,weim-cs-timing:	The timing array, contains timing values for the
+			child node. We can get the CS index from the child
+			node's "reg" property. The number of registers depends
+			on the selected chip.
+			For i.MX1, i.MX21 ("fsl,imx1-weim") there are two
+			registers: CSxU, CSxL.
+			For i.MX25, i.MX27, i.MX31 and i.MX35 ("fsl,imx27-weim")
+			there are three registers: CSCRxU, CSCRxL, CSCRxA.
+			For i.MX50, i.MX53 ("fsl,imx50-weim"),
+			i.MX51 ("fsl,imx51-weim") and i.MX6Q ("fsl,imx6q-weim")
+			there are six registers: CSxGCR1, CSxGCR2, CSxRCR1,
+			CSxRCR2, CSxWCR1, CSxWCR2.
 
 Optional properties:
 
@@ -44,21 +56,6 @@ Optional properties:
 			what bootloader sets up in IOMUXC_GPR1[11:0] will be
 			used.
 
-Timing property for child nodes. It is mandatory, not optional.
-
- - fsl,weim-cs-timing:	The timing array, contains timing values for the
-			child node. We can get the CS index from the child
-			node's "reg" property. The number of registers depends
-			on the selected chip.
-			For i.MX1, i.MX21 ("fsl,imx1-weim") there are two
-			registers: CSxU, CSxL.
-			For i.MX25, i.MX27, i.MX31 and i.MX35 ("fsl,imx27-weim")
-			there are three registers: CSCRxU, CSCRxL, CSCRxA.
-			For i.MX50, i.MX53 ("fsl,imx50-weim"),
-			i.MX51 ("fsl,imx51-weim") and i.MX6Q ("fsl,imx6q-weim")
-			there are six registers: CSxGCR1, CSxGCR2, CSxRCR1,
-			CSxRCR2, CSxWCR1, CSxWCR2.
-
 Example for an imx6q-sabreauto board, the NOR flash connected to the WEIM:
 
 	weim: weim@021b8000 {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
