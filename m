From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] powerpc/fsl: Update fman dt binding with clock name and qbman link
Date: Thu, 6 Nov 2014 21:01:34 -0600
Message-ID: <1415329294-22011-1-git-send-email-scottwood@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The clock name "fmanclk" was given in the example, but not specified
in the binding itself.  Made clock-names mandatory as otherwise there's
not much point having it.

Added a reference to the fsl,qman and fsl,bman properties proposed
in http://patchwork.ozlabs.org/patch/407034/ and
http://patchwork.ozlabs.org/patch/407035/

Signed-off-by: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
This patch is on top of http://patchwork.ozlabs.org/patch/390351/

 Documentation/devicetree/bindings/powerpc/fsl/fman.txt | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
index da8e5f2..edeea16 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
@@ -79,12 +79,12 @@ PROPERTIES
 - clocks
 		Usage: required
 		Value type: <prop-encoded-array>
-		Definition: phandle for fman clock.
+		Definition: phandle for the fman input clock.
 
 - clock-names
-		usage: optional
+		usage: required
 		Value type: <stringlist>
-		Definition: A standard property
+		Definition: "fmanclk" for the fman input clock.
 
 - interrupts
 		Usage: required
@@ -104,6 +104,11 @@ PROPERTIES
 		"Work Queue (WQ) Channel Assignments in the QMan" section
 		in DPAA Reference Manual.
 
+- fsl,qman
+- fsl,bman
+		Usage: required
+		Definition: See soc/fsl/qman.txt and soc/fsl/bman.txt
+
 =============================================================================
 FMan MURAM Node
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
