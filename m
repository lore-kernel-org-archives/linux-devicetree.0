From: Haikun Wang <haikun.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v1] Documentation: fsl-quadspi: Add an entry for the ls1 compatible string
Date: Fri, 24 Apr 2015 18:24:26 +0800
Message-ID: <1429871066-36552-1-git-send-email-haikun.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Haikun Wang <haikun.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

"fsl,ls1-qspi" is also a valid compatible string, so add an entry for it.

Signed-off-by: Haikun Wang <haikun.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index 4461dc7..81478ec 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -1,7 +1,7 @@
 * Freescale Quad Serial Peripheral Interface(QuadSPI)
 
 Required properties:
-  - compatible : Should be "fsl,vf610-qspi" or "fsl,imx6sx-qspi"
+  - compatible : Should be "fsl,vf610-qspi", "fsl,ls1-qspi" or "fsl,imx6sx-qspi"
   - reg : the first contains the register location and length,
           the second contains the memory mapping address and length
   - reg-names: Should contain the reg names "QuadSPI" and "QuadSPI-memory"
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
