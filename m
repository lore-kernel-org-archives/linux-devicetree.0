From: Kalyan Kinthada <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: mtd: pxa3xx: Add "marvell,nand-force-csx" compatible string
Date: Tue, 26 Sep 2017 17:16:59 +1300
Message-ID: <20170926041700.22663-2-kalyan.kinthada@alliedtelesis.co.nz>
References: <20170926041700.22663-1-kalyan.kinthada@alliedtelesis.co.nz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170926041700.22663-1-kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org, Kalyan Kinthada <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When the arbitration between NOR and NAND flash is enabled
the <FORCE_CSX> field bit[21] in the Data Flash Control Register
needs to be set to 1 according to guidleine GL-5830741.

This patch introduces a new compatible string "marvell,nand-force-csx"
which is activated through device tree to implement the guideline
GL-5830741.

Signed-off-by: Kalyan Kinthada <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
index d9b655f11048..157ca7efa3d3 100644
--- a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
@@ -20,6 +20,7 @@ Optional properties:
 				not present false
  - nand-ecc-strength:           number of bits to correct per ECC step
  - nand-ecc-step-size:          number of data bytes covered by a single ECC step
+ - marvell,nand-force-csx:      Set to implement guideline when arbitration of NAND and NOR flash is enabled.
 
 The following ECC strength and step size are currently supported:
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
