From: Kalyan Kinthada <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: [PATCH 0/2] Implement guideline when NAND, NOR arbitration is enabled
Date: Tue, 26 Sep 2017 17:16:58 +1300
Message-ID: <20170926041700.22663-1-kalyan.kinthada@alliedtelesis.co.nz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org, Kalyan Kinthada <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When the arbitration between NOR and NAND flash is enabled
the <FORCE_CSX> field bit[21] in the Data Flash Control Register
needs to be set to 1 according to guidleine GL-5830741.

This patch series contain the following patches:
* Patch 1: "dt-bindings: mtd: pxa3xx: Add "marvell,nand-force-csx" compatible string"
  * New binding is introduced to implement the guildeline GL-5830741 which will
    be activated in the appropriate device tree files.

* Patch 2: "mtd: nand: pxa3xx: Handle "marvell,nand-force-csx" compatible string"
  * Set the FORCE_CSX bit in Data Flash Control Register if "marvell,nand-force-csx"
    compatible string is activated in the device tree.

-----------------
Kalyan Kinthada (2):
[PATCH 1/2] dt-bindings: mtd: pxa3xx: Add "marvell,nand-force-csx" compatible string
[PATCH 2/2] mtd: nand: pxa3xx: Handle "marvell,nand-force-csx" compatible string

 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt | 1 +
 drivers/mtd/nand/pxa3xx_nand.c                        | 6 ++++++
 include/linux/platform_data/mtd-nand-pxa3xx.h         | 3 +++
 3 files changed, 10 insertions(+)

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
