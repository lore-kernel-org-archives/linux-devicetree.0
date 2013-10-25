From: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] mtd: gpmi: add a new DT property to use the datasheet's minimum required ECC
Date: Fri, 25 Oct 2013 16:36:24 +0800
Message-ID: <1382690184-27124-1-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In default way, we use the ecc-strength/ecc-step-size calculated by ourselves
and use all the OOB area.

This patch adds a new property : "fsl,use-minimum-ecc"

If we enable it, we will use the datasheet's minimum required ECC provided by
the MTD layer (the ecc_strength_ds/ecc_strength_ds fields in the nand_chip{}).
So we may have free space in the OOB area by using the minimum ECC, and we may
support JFFS2 with some SLC NANDs, such as Micron's SLC NAND.

Signed-off-by: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 .../devicetree/bindings/mtd/gpmi-nand.txt          |    6 ++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |    4 ++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
index 551b2a1..7a5afa8 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
@@ -17,6 +17,12 @@ Required properties:
 Optional properties:
   - nand-on-flash-bbt: boolean to enable on flash bbt option if not
                        present false
+  - fsl,use-minimum-ecc: By enabling this boolean property, the gpmi will try
+                       to use the datasheet's minimum required ECC provided by
+                       the MTD layer (the ecc_strength_ds/ecc_strength_ds fields
+                       in the nand_chip{}). So we may have free space in the OOB
+                       area by using the minimum ECC, and we may support JFFS2
+                       with some SLC NANDs, such as Micron's SLC NAND.
 
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 43a62e8..d0ae7f4 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -352,6 +352,10 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 
 int common_nfc_set_geometry(struct gpmi_nand_data *this)
 {
+	if (of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc"))
+		return set_geometry_by_ecc_info(this) ? 0 :
+						legacy_set_geometry(this);
+
 	return legacy_set_geometry(this) ?
 		(!set_geometry_by_ecc_info(this)) : 0;
 }
-- 
1.7.2.rc3


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
