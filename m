From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 1/4] mtd: nand: add common DT init code
Date: Wed, 18 Mar 2015 19:49:15 -0700
Message-ID: <1426733358-15596-2-git-send-email-computersforpeace@gmail.com>
References: <1426733358-15596-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426733358-15596-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

These are already-documented common bindings for NAND chips. Let's
handle them in nand_base.

If NAND controller drivers need to act on this data before bringing up
the NAND chip (e.g., fill out ECC callback functions, change HW modes,
etc.), then they can do so between calling nand_scan_ident() and
nand_scan_tail().

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 41 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |  5 +++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d4cec2f8a016..692142da62e7 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -48,6 +48,7 @@
 #include <linux/leds.h>
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
+#include <linux/of_mtd.h>
 
 /* Define default oob placement schemes for large and small page devices */
 static struct nand_ecclayout nand_oob_8 = {
@@ -3779,6 +3780,39 @@ ident_done:
 	return type;
 }
 
+static int nand_dt_init(struct mtd_info *mtd, struct nand_chip *chip,
+			struct device_node *dn)
+{
+	int ecc_mode, ecc_strength, ecc_step;
+
+	if (of_get_nand_bus_width(dn) == 16)
+		chip->options |= NAND_BUSWIDTH_16;
+
+	if (of_get_nand_on_flash_bbt(dn))
+		chip->bbt_options |= NAND_BBT_USE_FLASH;
+
+	ecc_mode = of_get_nand_ecc_mode(dn);
+	ecc_strength = of_get_nand_ecc_strength(dn);
+	ecc_step = of_get_nand_ecc_step_size(dn);
+
+	if ((ecc_step >= 0 && !(ecc_strength >= 0)) ||
+	    (!(ecc_step >= 0) && ecc_strength >= 0)) {
+		pr_err("must set both strength and step size in DT\n");
+		return -EINVAL;
+	}
+
+	if (ecc_mode >= 0)
+		chip->ecc.mode = ecc_mode;
+
+	if (ecc_strength >= 0)
+		chip->ecc.strength = ecc_strength;
+
+	if (ecc_step > 0)
+		chip->ecc.size = ecc_step;
+
+	return 0;
+}
+
 /**
  * nand_scan_ident - [NAND Interface] Scan for the NAND device
  * @mtd: MTD device structure
@@ -3796,6 +3830,13 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	int i, nand_maf_id, nand_dev_id;
 	struct nand_chip *chip = mtd->priv;
 	struct nand_flash_dev *type;
+	int ret;
+
+	if (chip->dn) {
+		ret = nand_dt_init(mtd, chip, chip->dn);
+		if (ret)
+			return ret;
+	}
 
 	/* Set the default functions */
 	nand_set_defaults(chip, chip->options & NAND_BUSWIDTH_16);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3d4ea7eb2b68..e0f40e12a2c8 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -26,6 +26,8 @@
 
 struct mtd_info;
 struct nand_flash_dev;
+struct device_node;
+
 /* Scan and identify a NAND device */
 extern int nand_scan(struct mtd_info *mtd, int max_chips);
 /*
@@ -542,6 +544,7 @@ struct nand_buffers {
  *			flash device
  * @IO_ADDR_W:		[BOARDSPECIFIC] address to write the 8 I/O lines of the
  *			flash device.
+ * @dn:			[BOARDSPECIFIC] device node describing this instance
  * @read_byte:		[REPLACEABLE] read one byte from the chip
  * @read_word:		[REPLACEABLE] read one word from the chip
  * @write_byte:		[REPLACEABLE] write a single byte to the chip on the
@@ -644,6 +647,8 @@ struct nand_chip {
 	void __iomem *IO_ADDR_R;
 	void __iomem *IO_ADDR_W;
 
+	struct device_node *dn;
+
 	uint8_t (*read_byte)(struct mtd_info *mtd);
 	u16 (*read_word)(struct mtd_info *mtd);
 	void (*write_byte)(struct mtd_info *mtd, uint8_t byte);
-- 
1.9.1
