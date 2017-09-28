From: Kalyan Kinthada <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: [PATCH v3 0/1] Set FORCE_CSX bit when arbitration between NAND and NOR is enabled.
Date: Thu, 28 Sep 2017 13:57:55 +1300
Message-ID: <20170928005756.3938-1-kalyan.kinthada@alliedtelesis.co.nz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org, Kalyan Kinthada <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When the arbitration between NOR and NAND flash is enabled
the <FORCE_CSX> field bit[21] in the Data Flash Control Register
needs to be set to 1 according to guidleine GL-5830741
mentioned in Marvell Errata document MV-S501377-00, Rev. D.

Set the FORCE_CSX bit in NDCR for ARMADA370 variants as the arbitration
is always enabled by default. This change does not apply for pxa3xx
variants because FORCE_CSX bit does not exist/reserved on the NFCv1.

Ran the "flash_speed" tool on NAND flash on a board with
Armada-xp based SoC which uses only one NAND chip and not using
the arbiter. There is no regression or speed penalty
introduced due to this change.

Changes since v2:
Thanks Miquel RAYNAL for the suggestion.

* "mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370 variants."
  Modified commit message to mention that this change does not apply
  for pxa3xx variants.
  Fixed the missing space in comments.
  Removed unused macros "NDCR_ND_MODE" and "NDCR_NAND_MODE".

Changes since v1:
Thanks Miquel RAYNAL for the suggestion.

* Deleted: "dt-bindings: mtd: pxa3xx: Add "marvell,nand-force-csx" compatible string"
  Not necessary to create a new compatible string.

* "mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370 variants."
  Modified commit message.
  This commit sets the FORCE_CSX bit for all ARMADA370 variants.

-----

Kalyan Kinthada (1):
  mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370 variants.

 drivers/mtd/nand/pxa3xx_nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
