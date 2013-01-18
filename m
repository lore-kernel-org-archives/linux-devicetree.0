From: Stefan Roese <sr@denx.de>
Subject: [PATCH v3] mtd: cfi_cmdset_0002: Support Persistent Protection Bits
 (PPB) locking
Date: Fri, 18 Jan 2013 13:10:05 +0100
Message-ID: <1358511005-23258-1-git-send-email-sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org
Cc: devicetree-discuss@ozlabs.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: devicetree@vger.kernel.org

Currently cfi_cmdset_0002.c does not support PPB locking of sectors. This
patch adds support for this locking/unlocking mechanism. It is needed on
some platforms, since newer U-Boot versions do support this PPB locking
and protect for example their environment sector(s) this way.

This PPB locking/unlocking will be enabled for all devices supported by
cfi_cmdset_0002 reporting 8 in the CFI word 0x49 (Sector Protect/Unprotect
scheme).

Please note that PPB locking does support sector-by-sector locking. But
the whole chip can only be unlocked together. So unlocking one sector
will automatically unlock all sectors of this device. Because of this
chip limitation, the PPB unlocking function saves the current locking
status of all sectors before unlocking the whole device. After unlocking
the saved locking status is re-configured. This way only the addressed
sectors will be unlocked.

To selectively enable this advanced sector protection mechanism, the
device-tree property "use-advanced-sector-protection" has been created.
To enable support for this locking this property needs to be present in the
flash DT node. E.g.:

nor_flash@0,0 {
	compatible = "amd,s29gl256n", "cfi-flash";
	bank-width = <2>;
	use-advanced-sector-protection;
	...

Tested with Spanion S29GL512S10THI and Micron JS28F512M29EWx flash
devices.

Signed-off-by: Stefan Roese <sr@denx.de>
Tested-by: Holger Brunck <holger.brunck@keymile.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
---
v3:
- Added #ifdef CONFIG_OF to of_property_read_bool() probing code
- Rebased upon l2-mtd master branch

v2:
- Use msecs_to_jiffies
- Use UDELAY macro

 .../devicetree/bindings/mtd/mtd-physmap.txt        |   3 +
 drivers/mtd/chips/cfi_cmdset_0002.c                | 212 +++++++++++++++++++++
 drivers/mtd/maps/physmap_of.c                      |   1 +
 include/linux/mtd/map.h                            |   1 +
 4 files changed, 217 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
index dab7847..61c5ec8 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
@@ -26,6 +26,9 @@ file systems on embedded devices.
  - linux,mtd-name: allow to specify the mtd name for retro capability with
    physmap-flash drivers as boot loader pass the mtd partition via the old
    device name physmap-flash.
+ - use-advanced-sector-protection: boolean to enable support for the
+   advanced sector protection (Spansion: PPB - Persistent Protection
+   Bits) locking.
 
 For JEDEC compatible devices, the following additional properties
 are defined:
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index b861972..5d5ed93 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -33,6 +33,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/reboot.h>
+#include <linux/of_platform.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/cfi.h>
@@ -74,6 +75,10 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 static int cfi_atmel_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 
+static int cfi_ppb_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+static int cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+static int cfi_ppb_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+
 static struct mtd_chip_driver cfi_amdstd_chipdrv = {
 	.probe		= NULL, /* Not usable directly */
 	.destroy	= cfi_amdstd_destroy,
@@ -496,6 +501,7 @@ static void cfi_fixup_m29ew_delay_after_resume(struct cfi_private *cfi)
 struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
+	struct device_node *np = map->device_node;
 	struct mtd_info *mtd;
 	int i;
 
@@ -570,6 +576,17 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 			cfi_tell_features(extp);
 #endif
 
+#ifdef CONFIG_OF
+			if (np && of_property_read_bool(
+				    np, "use-advanced-sector-protection")
+			    && extp->BlkProtUnprot == 8) {
+				printk(KERN_INFO "  Advanced Sector Protection (PPB Locking) supported\n");
+				mtd->_lock = cfi_ppb_lock;
+				mtd->_unlock = cfi_ppb_unlock;
+				mtd->_is_locked = cfi_ppb_is_locked;
+			}
+#endif
+
 			bootloc = extp->TopBottom;
 			if ((bootloc < 2) || (bootloc > 5)) {
 				printk(KERN_WARNING "%s: CFI contains unrecognised boot "
@@ -2172,6 +2189,201 @@ static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return cfi_varsize_frob(mtd, do_atmel_unlock, ofs, len, NULL);
 }
 
+/*
+ * Advanced Sector Protection - PPB (Persistent Protection Bit) locking
+ */
+
+struct ppb_lock {
+	struct flchip *chip;
+	loff_t offset;
+	int locked;
+};
+
+#define MAX_SECTORS			512
+
+#define DO_XXLOCK_ONEBLOCK_LOCK		((void *)1)
+#define DO_XXLOCK_ONEBLOCK_UNLOCK	((void *)2)
+#define DO_XXLOCK_ONEBLOCK_GETLOCK	((void *)3)
+
+static int do_ppb_xxlock(struct map_info *map, struct flchip *chip,
+			 unsigned long adr, int len, void *thunk)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	unsigned long timeo;
+	int ret;
+
+	mutex_lock(&chip->mutex);
+	ret = get_chip(map, chip, adr + chip->start, FL_LOCKING);
+	if (ret) {
+		mutex_unlock(&chip->mutex);
+		return ret;
+	}
+
+	pr_debug("MTD %s(): XXLOCK 0x%08lx len %d\n", __func__, adr, len);
+
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+	/* PPB entry command */
+	cfi_send_gen_cmd(0xC0, cfi->addr_unlock1, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+
+	if (thunk == DO_XXLOCK_ONEBLOCK_LOCK) {
+		chip->state = FL_LOCKING;
+		map_write(map, CMD(0xA0), chip->start + adr);
+		map_write(map, CMD(0x00), chip->start + adr);
+	} else if (thunk == DO_XXLOCK_ONEBLOCK_UNLOCK) {
+		/*
+		 * Unlocking of one specific sector is not supported, so we
+		 * have to unlock all sectors of this device instead
+		 */
+		chip->state = FL_UNLOCKING;
+		map_write(map, CMD(0x80), chip->start);
+		map_write(map, CMD(0x30), chip->start);
+	} else if (thunk == DO_XXLOCK_ONEBLOCK_GETLOCK) {
+		chip->state = FL_JEDEC_QUERY;
+		/* Return locked status: 0->locked, 1->unlocked */
+		ret = !cfi_read_query(map, adr);
+	} else
+		BUG();
+
+	/*
+	 * Wait for some time as unlocking of all sectors takes quite long
+	 */
+	timeo = jiffies + msecs_to_jiffies(2000);	/* 2s max (un)locking */
+	for (;;) {
+		if (chip_ready(map, adr))
+			break;
+
+		if (time_after(jiffies, timeo)) {
+			printk(KERN_ERR "Waiting for chip to be ready timed out.\n");
+			ret = -EIO;
+			break;
+		}
+
+		UDELAY(map, chip, adr, 1);
+	}
+
+	/* Exit BC commands */
+	map_write(map, CMD(0x90), chip->start);
+	map_write(map, CMD(0x00), chip->start);
+
+	chip->state = FL_READY;
+	put_chip(map, chip, adr + chip->start);
+	mutex_unlock(&chip->mutex);
+
+	return ret;
+}
+
+static int cfi_ppb_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	return cfi_varsize_frob(mtd, do_ppb_xxlock, ofs, len,
+				DO_XXLOCK_ONEBLOCK_LOCK);
+}
+
+static int cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	struct mtd_erase_region_info *regions = mtd->eraseregions;
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	struct ppb_lock *sect;
+	unsigned long adr;
+	loff_t offset;
+	uint64_t length;
+	int chipnum;
+	int i;
+	int sectors;
+	int ret;
+
+	/*
+	 * PPB unlocking always unlocks all sectors of the flash chip.
+	 * We need to re-lock all previously locked sectors. So lets
+	 * first check the locking status of all sectors and save
+	 * it for future use.
+	 */
+	sect = kzalloc(MAX_SECTORS * sizeof(struct ppb_lock), GFP_KERNEL);
+	if (!sect)
+		return -ENOMEM;
+
+	/*
+	 * This code to walk all sectors is a slightly modified version
+	 * of the cfi_varsize_frob() code.
+	 */
+	i = 0;
+	chipnum = 0;
+	adr = 0;
+	sectors = 0;
+	offset = 0;
+	length = mtd->size;
+
+	while (length) {
+		int size = regions[i].erasesize;
+
+		/*
+		 * Only test sectors that shall not be unlocked. The other
+		 * sectors shall be unlocked, so lets keep their locking
+		 * status at "unlocked" (locked=0) for the final re-locking.
+		 */
+		if ((adr < ofs) || (adr >= (ofs + len))) {
+			sect[sectors].chip = &cfi->chips[chipnum];
+			sect[sectors].offset = offset;
+			sect[sectors].locked = do_ppb_xxlock(
+				map, &cfi->chips[chipnum], adr, 0,
+				DO_XXLOCK_ONEBLOCK_GETLOCK);
+		}
+
+		adr += size;
+		offset += size;
+		length -= size;
+
+		if (offset == regions[i].offset + size * regions[i].numblocks)
+			i++;
+
+		if (adr >> cfi->chipshift) {
+			adr = 0;
+			chipnum++;
+
+			if (chipnum >= cfi->numchips)
+				break;
+		}
+
+		sectors++;
+		if (sectors >= MAX_SECTORS) {
+			printk(KERN_ERR "Only %d sectors for PPB locking supported!\n",
+			       MAX_SECTORS);
+			kfree(sect);
+			return -EINVAL;
+		}
+	}
+
+	/* Now unlock the whole chip */
+	ret = cfi_varsize_frob(mtd, do_ppb_xxlock, ofs, len,
+			       DO_XXLOCK_ONEBLOCK_UNLOCK);
+	if (ret) {
+		kfree(sect);
+		return ret;
+	}
+
+	/*
+	 * PPB unlocking always unlocks all sectors of the flash chip.
+	 * We need to re-lock all previously locked sectors.
+	 */
+	for (i = 0; i < sectors; i++) {
+		if (sect[i].locked)
+			do_ppb_xxlock(map, sect[i].chip, sect[i].offset, 0,
+				      DO_XXLOCK_ONEBLOCK_LOCK);
+	}
+
+	kfree(sect);
+	return ret;
+}
+
+static int cfi_ppb_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	return cfi_varsize_frob(mtd, do_ppb_xxlock, ofs, len,
+				DO_XXLOCK_ONEBLOCK_GETLOCK) ? 1 : 0;
+}
 
 static void cfi_amdstd_sync (struct mtd_info *mtd)
 {
diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 67cc73c..263d9e1 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -241,6 +241,7 @@ static int of_flash_probe(struct platform_device *dev)
 		info->list[i].map.phys = res.start;
 		info->list[i].map.size = res_size;
 		info->list[i].map.bankwidth = be32_to_cpup(width);
+		info->list[i].map.device_node = dp;
 
 		err = -ENOMEM;
 		info->list[i].map.virt = ioremap(info->list[i].map.phys,
diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index f6eb433..8b9bfd7 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -245,6 +245,7 @@ struct map_info {
 	unsigned long pfow_base;
 	unsigned long map_priv_1;
 	unsigned long map_priv_2;
+	struct device_node *device_node;
 	void *fldrv_priv;
 	struct mtd_chip_driver *fldrv;
 };
-- 
1.8.1.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
