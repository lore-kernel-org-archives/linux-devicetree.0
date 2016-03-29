From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v2] mtd: nand: denali: allow to override max_banks from DT property
Date: Tue, 29 Mar 2016 11:33:07 +0900
Message-ID: <1459218787-15197-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Commit 271707b1d817 ("mtd: nand: denali: max_banks calculation
changed in revision 5.1") supported the new encoding of the "n_banks"
bits of the "features" register, but there is an unfortunate case
not covered by that commit.

Panasonic (its System LSI Business Division is now Socionext) bought
a couple of versions of this IP.  The IP released for Panasonic
around Feb. 2012 is revision 5 and uses the old encoding for n_banks
(2 << n_banks).  While the one released around Nov. 2012 is also
revision 5, but it uses the new encoding (1 << n_banks).

The revision register cannot distinguish these two incompatible
hardware.  I guess this IP series is not well-organized.  I could not
find any solution but giving max_banks from DT property.

This commit works around the problem by allowing DT to set the
max_banks forcibly.  Of course, this DT property can be optional if
the auto detection based on the hardware registers works well.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---

Changes in v2:
  - rebase on v4.6-rc1
  - add Rob's Acked-by
  - Rephrase git-log slightly

 Documentation/devicetree/bindings/mtd/denali-nand.txt | 4 ++++
 drivers/mtd/nand/denali.c                             | 3 ++-
 drivers/mtd/nand/denali_dt.c                          | 3 +++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index b04d03a..6154c77 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -7,6 +7,10 @@ Required properties:
   - interrupts : The interrupt number.
   - dm-mask : DMA bit mask
 
+Optional properties:
+  - max-banks : Maximum number of banks supported by hardware.  If not
+    specified, it is determined based on the "features" register of hardware.
+
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
 
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 30bf5f6..e18b569 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1353,7 +1353,8 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	 */
 	denali->bbtskipbytes = ioread32(denali->flash_reg +
 						SPARE_AREA_SKIP_BYTES);
-	detect_max_banks(denali);
+	if (!denali->max_banks)
+		detect_max_banks(denali);
 	denali_nand_reset(denali);
 	iowrite32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
 	iowrite32(CHIP_EN_DONT_CARE__FLAG,
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 0cb1e8d..be55db8 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -85,6 +85,9 @@ static int denali_dt_probe(struct platform_device *ofdev)
 		denali->dev->dma_mask = NULL;
 	}
 
+	of_property_read_u32(ofdev->dev.of_node, "max-banks",
+			     &denali->max_banks);
+
 	dt->clk = devm_clk_get(&ofdev->dev, NULL);
 	if (IS_ERR(dt->clk)) {
 		dev_err(&ofdev->dev, "no clk available\n");
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
