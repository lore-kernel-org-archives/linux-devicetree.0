From: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH][v3] dt-bindings: ifc: Update endianness usage
Date: Thu, 30 Nov 2017 13:36:36 +0530
Message-ID: <1512029196-7158-1-git-send-email-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

IFC controller version < 2.0 support IFC register access as
big endian. These controller version also require IFC NOR signals to
be connected in reverse order with NOR flash.

IFC >= 2.0 is other way around.

So updating IFC binding to take care of both using endianness field.

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
---
Changes for v2: updated subject
Changes for v3: fixed typo for "big-endian"

 Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
index 89427b0..824a2ca 100644
--- a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
@@ -18,8 +18,10 @@ Properties:
               interrupt (NAND_EVTER_STAT).  If there is only one,
               that interrupt reports both types of event.
 
-- little-endian : If this property is absent, the big-endian mode will
-                  be in use as default for registers.
+- little-endian or big-endian : It represents how IFC registers to be accessed.
+			It also represents connection between controller and
+			NOR flash. If this property is absent, the big-endian
+			mode will be in use as default.
 
 - ranges : Each range corresponds to a single chipselect, and covers
            the entire access window as configured.
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
