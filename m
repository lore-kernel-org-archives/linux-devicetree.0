From: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3] mtd: gpmi: add a new DT property to use the datasheet's minimum required ECC
Date: Thu, 7 Nov 2013 18:07:38 +0800
Message-ID: <1383818858-5410-1-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In default way, we use the ecc_strength/ecc_step size calculated by ourselves
and use all the OOB area.

This patch adds a new property : "fsl,use-minimum-ecc"

If we enable it, we will firstly try to use the datasheet's minimum required
ECC provided by the MTD layer (the ecc_strength_ds/ecc_step_ds fields
in the nand_chip{}). So we may have free space in the OOB area by using the
minimum ECC, and we may support JFFS2 with some SLC NANDs, such as Micron's
SLC NAND.

If we fail to use the minimum ECC, we will use the legacy method to calculate
the ecc_strength and ecc_step size.

Signed-off-by: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
v1 -- > v2: rebase this patch on the latest l2-mtd.
v2 -- > v3: change the descriptions.
---
 .../devicetree/bindings/mtd/gpmi-nand.txt          |    8 ++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |    3 +++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
index 551b2a1..458d596 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
@@ -17,6 +17,14 @@ Required properties:
 Optional properties:
   - nand-on-flash-bbt: boolean to enable on flash bbt option if not
                        present false
+  - fsl,use-minimum-ecc: Protect this NAND flash with the minimum ECC
+                       strength required. The required ECC strength is
+                       automatically discoverable for some flash
+                       (e.g., according to the ONFI standard).
+                       However, note that if this strength is not
+                       discoverable or this property is not enabled,
+                       the software may chooses an implementation-defined
+                       ECC scheme.
 
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 8f4e5b1..b849b92 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -353,6 +353,9 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 
 int common_nfc_set_geometry(struct gpmi_nand_data *this)
 {
+	if (of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc")
+		&& set_geometry_by_ecc_info(this))
+		return 0;
 	return legacy_set_geometry(this);
 }
 
-- 
1.7.2.rc3


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
