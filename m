From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 1/3] mtd: brcmnand: factor out CFG and CFG_EXT bitfields
Date: Fri, 30 Oct 2015 11:48:56 +0530
Message-ID: <1446185938-17520-2-git-send-email-anup.patel@broadcom.com>
References: <1446185938-17520-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446185938-17520-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux MTD <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pramod KUMAR <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Use enum instead of magic numbers for CFG and CFG_EXT bitfields.

Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 38 +++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 4cba03d..dda96fa 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -344,6 +344,28 @@ static const u8 brcmnand_cs_offsets_cs0[] = {
 	[BRCMNAND_CS_TIMING2]		= 0x14,
 };
 
+/*
+ * Bitfields for the CFG and CFG_EXT registers. Pre-v7.1 controllers only had
+ * one config register, but once the bitfields overflowed, newer controllers
+ * (v7.1 and newer) added a CFG_EXT register and shuffled a few fields around.
+ */
+enum {
+	CFG_BLK_ADR_BYTES_SHIFT		= 8,
+	CFG_COL_ADR_BYTES_SHIFT		= 12,
+	CFG_FUL_ADR_BYTES_SHIFT		= 16,
+	CFG_BUS_WIDTH_SHIFT		= 23,
+	CFG_BUS_WIDTH			= BIT(CFG_BUS_WIDTH_SHIFT),
+	CFG_DEVICE_SIZE_SHIFT		= 24,
+
+	/* Only for pre-v7.1 (with no CFG_EXT register) */
+	CFG_PAGE_SIZE_SHIFT		= 20,
+	CFG_BLK_SIZE_SHIFT		= 28,
+
+	/* Only for v7.1+ (with CFG_EXT register) */
+	CFG_EXT_PAGE_SIZE_SHIFT		= 0,
+	CFG_EXT_BLK_SIZE_SHIFT		= 4,
+};
+
 /* BRCMNAND_INTFC_STATUS */
 enum {
 	INTFC_FLASH_STATUS		= GENMASK(7, 0),
@@ -1720,17 +1742,19 @@ static int brcmnand_set_cfg(struct brcmnand_host *host,
 	}
 	device_size = fls64(cfg->device_size) - fls64(BRCMNAND_MIN_DEVSIZE);
 
-	tmp = (cfg->blk_adr_bytes << 8) |
-		(cfg->col_adr_bytes << 12) |
-		(cfg->ful_adr_bytes << 16) |
-		(!!(cfg->device_width == 16) << 23) |
-		(device_size << 24);
+	tmp = (cfg->blk_adr_bytes << CFG_BLK_ADR_BYTES_SHIFT) |
+		(cfg->col_adr_bytes << CFG_COL_ADR_BYTES_SHIFT) |
+		(cfg->ful_adr_bytes << CFG_FUL_ADR_BYTES_SHIFT) |
+		(!!(cfg->device_width == 16) << CFG_BUS_WIDTH_SHIFT) |
+		(device_size << CFG_DEVICE_SIZE_SHIFT);
 	if (cfg_offs == cfg_ext_offs) {
-		tmp |= (page_size << 20) | (block_size << 28);
+		tmp |= (page_size << CFG_PAGE_SIZE_SHIFT) |
+		       (block_size << CFG_BLK_SIZE_SHIFT);
 		nand_writereg(ctrl, cfg_offs, tmp);
 	} else {
 		nand_writereg(ctrl, cfg_offs, tmp);
-		tmp = page_size | (block_size << 4);
+		tmp = (page_size << CFG_EXT_PAGE_SIZE_SHIFT) |
+		      (block_size << CFG_EXT_BLK_SIZE_SHIFT);
 		nand_writereg(ctrl, cfg_ext_offs, tmp);
 	}
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
