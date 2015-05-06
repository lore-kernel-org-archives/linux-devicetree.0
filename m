From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v3 01/10] mtd: nand: add common DT init code
Date: Wed,  6 May 2015 10:59:45 -0700
Message-ID: <1430935194-7579-2-git-send-email-computersforpeace@gmail.com>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>, Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>, Jonathan Richardson <jonathar@broadcom.com>, Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>
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
index c2e1232cd45c..c6cf775ee431 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -48,6 +48,7 @@
 #include <linux/leds.h>
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
+#include <linux/of_mtd.h>
 
 /* Define default oob placement schemes for large and small page devices */
 static struct nand_ecclayout nand_oob_8 = {
@@ -3798,6 +3799,39 @@ ident_done:
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
@@ -3815,6 +3849,13 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
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


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
