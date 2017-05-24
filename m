From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V5 1/4] mtd: partitions: rename allocate_partition master argument to the parent
Date: Wed, 24 May 2017 11:44:34 +0200
Message-ID: <20170524094437.2174-2-zajec5@gmail.com>
References: <20170524094437.2174-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170524094437.2174-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

This prepares mtd subsystem for the new feature: subpartitions. In some
cases flash device partition can be a container with extra subpartitions
(volumes).

Supporting this will require updating allocate_partition function. First
of all we should distinct master (flash device) and parent (flash device
*or* parent partition). This patch handles a proper renaming.

In allocate_partition we need to accept *parent* as an argument. This is
required to perform all boundary checks against the parent so in case of
subpartitions we make sure they don't exceed their parent.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
V5: Introduction of this patch to prepare allocate_partition for further
    modification.
---
 drivers/mtd/mtdpart.c | 116 +++++++++++++++++++++++++-------------------------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 6960e66eb7a6..92acd89e07cb 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -389,7 +389,7 @@ int del_mtd_partitions(struct mtd_info *master)
 	return err;
 }
 
-static struct mtd_part *allocate_partition(struct mtd_info *master,
+static struct mtd_part *allocate_partition(struct mtd_info *parent,
 			const struct mtd_partition *part, int partno,
 			uint64_t cur_offset)
 {
@@ -401,25 +401,25 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	name = kstrdup(part->name, GFP_KERNEL);
 	if (!name || !slave) {
 		printk(KERN_ERR"memory allocation error while creating partitions for \"%s\"\n",
-		       master->name);
+		       parent->name);
 		kfree(name);
 		kfree(slave);
 		return ERR_PTR(-ENOMEM);
 	}
 
 	/* set up the MTD object for this partition */
-	slave->mtd.type = master->type;
-	slave->mtd.flags = master->flags & ~part->mask_flags;
+	slave->mtd.type = parent->type;
+	slave->mtd.flags = parent->flags & ~part->mask_flags;
 	slave->mtd.size = part->size;
-	slave->mtd.writesize = master->writesize;
-	slave->mtd.writebufsize = master->writebufsize;
-	slave->mtd.oobsize = master->oobsize;
-	slave->mtd.oobavail = master->oobavail;
-	slave->mtd.subpage_sft = master->subpage_sft;
-	slave->mtd.pairing = master->pairing;
+	slave->mtd.writesize = parent->writesize;
+	slave->mtd.writebufsize = parent->writebufsize;
+	slave->mtd.oobsize = parent->oobsize;
+	slave->mtd.oobavail = parent->oobavail;
+	slave->mtd.subpage_sft = parent->subpage_sft;
+	slave->mtd.pairing = parent->pairing;
 
 	slave->mtd.name = name;
-	slave->mtd.owner = master->owner;
+	slave->mtd.owner = parent->owner;
 
 	/* NOTE: Historically, we didn't arrange MTDs as a tree out of
 	 * concern for showing the same data in multiple partitions.
@@ -430,79 +430,79 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	 * distinguish between the master and the partition in sysfs.
 	 */
 	slave->mtd.dev.parent = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) ?
-				&master->dev :
-				master->dev.parent;
+				&parent->dev :
+				parent->dev.parent;
 	slave->mtd.dev.of_node = part->of_node;
 
 	slave->mtd._read = part_read;
 	slave->mtd._write = part_write;
 
-	if (master->_panic_write)
+	if (parent->_panic_write)
 		slave->mtd._panic_write = part_panic_write;
 
-	if (master->_point && master->_unpoint) {
+	if (parent->_point && parent->_unpoint) {
 		slave->mtd._point = part_point;
 		slave->mtd._unpoint = part_unpoint;
 	}
 
-	if (master->_get_unmapped_area)
+	if (parent->_get_unmapped_area)
 		slave->mtd._get_unmapped_area = part_get_unmapped_area;
-	if (master->_read_oob)
+	if (parent->_read_oob)
 		slave->mtd._read_oob = part_read_oob;
-	if (master->_write_oob)
+	if (parent->_write_oob)
 		slave->mtd._write_oob = part_write_oob;
-	if (master->_read_user_prot_reg)
+	if (parent->_read_user_prot_reg)
 		slave->mtd._read_user_prot_reg = part_read_user_prot_reg;
-	if (master->_read_fact_prot_reg)
+	if (parent->_read_fact_prot_reg)
 		slave->mtd._read_fact_prot_reg = part_read_fact_prot_reg;
-	if (master->_write_user_prot_reg)
+	if (parent->_write_user_prot_reg)
 		slave->mtd._write_user_prot_reg = part_write_user_prot_reg;
-	if (master->_lock_user_prot_reg)
+	if (parent->_lock_user_prot_reg)
 		slave->mtd._lock_user_prot_reg = part_lock_user_prot_reg;
-	if (master->_get_user_prot_info)
+	if (parent->_get_user_prot_info)
 		slave->mtd._get_user_prot_info = part_get_user_prot_info;
-	if (master->_get_fact_prot_info)
+	if (parent->_get_fact_prot_info)
 		slave->mtd._get_fact_prot_info = part_get_fact_prot_info;
-	if (master->_sync)
+	if (parent->_sync)
 		slave->mtd._sync = part_sync;
-	if (!partno && !master->dev.class && master->_suspend &&
-	    master->_resume) {
+	if (!partno && !parent->dev.class && parent->_suspend &&
+	    parent->_resume) {
 			slave->mtd._suspend = part_suspend;
 			slave->mtd._resume = part_resume;
 	}
-	if (master->_writev)
+	if (parent->_writev)
 		slave->mtd._writev = part_writev;
-	if (master->_lock)
+	if (parent->_lock)
 		slave->mtd._lock = part_lock;
-	if (master->_unlock)
+	if (parent->_unlock)
 		slave->mtd._unlock = part_unlock;
-	if (master->_is_locked)
+	if (parent->_is_locked)
 		slave->mtd._is_locked = part_is_locked;
-	if (master->_block_isreserved)
+	if (parent->_block_isreserved)
 		slave->mtd._block_isreserved = part_block_isreserved;
-	if (master->_block_isbad)
+	if (parent->_block_isbad)
 		slave->mtd._block_isbad = part_block_isbad;
-	if (master->_block_markbad)
+	if (parent->_block_markbad)
 		slave->mtd._block_markbad = part_block_markbad;
-	if (master->_max_bad_blocks)
+	if (parent->_max_bad_blocks)
 		slave->mtd._max_bad_blocks = part_max_bad_blocks;
 
-	if (master->_get_device)
+	if (parent->_get_device)
 		slave->mtd._get_device = part_get_device;
-	if (master->_put_device)
+	if (parent->_put_device)
 		slave->mtd._put_device = part_put_device;
 
 	slave->mtd._erase = part_erase;
-	slave->master = master;
+	slave->master = parent;
 	slave->offset = part->offset;
 
 	if (slave->offset == MTDPART_OFS_APPEND)
 		slave->offset = cur_offset;
 	if (slave->offset == MTDPART_OFS_NXTBLK) {
 		slave->offset = cur_offset;
-		if (mtd_mod_by_eb(cur_offset, master) != 0) {
+		if (mtd_mod_by_eb(cur_offset, parent) != 0) {
 			/* Round up to next erasesize */
-			slave->offset = (mtd_div_by_eb(cur_offset, master) + 1) * master->erasesize;
+			slave->offset = (mtd_div_by_eb(cur_offset, parent) + 1) * parent->erasesize;
 			printk(KERN_NOTICE "Moving partition %d: "
 			       "0x%012llx -> 0x%012llx\n", partno,
 			       (unsigned long long)cur_offset, (unsigned long long)slave->offset);
@@ -510,25 +510,25 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	}
 	if (slave->offset == MTDPART_OFS_RETAIN) {
 		slave->offset = cur_offset;
-		if (master->size - slave->offset >= slave->mtd.size) {
-			slave->mtd.size = master->size - slave->offset
+		if (parent->size - slave->offset >= slave->mtd.size) {
+			slave->mtd.size = parent->size - slave->offset
 							- slave->mtd.size;
 		} else {
 			printk(KERN_ERR "mtd partition \"%s\" doesn't have enough space: %#llx < %#llx, disabled\n",
-				part->name, master->size - slave->offset,
+				part->name, parent->size - slave->offset,
 				slave->mtd.size);
 			/* register to preserve ordering */
 			goto out_register;
 		}
 	}
 	if (slave->mtd.size == MTDPART_SIZ_FULL)
-		slave->mtd.size = master->size - slave->offset;
+		slave->mtd.size = parent->size - slave->offset;
 
 	printk(KERN_NOTICE "0x%012llx-0x%012llx : \"%s\"\n", (unsigned long long)slave->offset,
 		(unsigned long long)(slave->offset + slave->mtd.size), slave->mtd.name);
 
 	/* let's do some sanity checks */
-	if (slave->offset >= master->size) {
+	if (slave->offset >= parent->size) {
 		/* let's register it anyway to preserve ordering */
 		slave->offset = 0;
 		slave->mtd.size = 0;
@@ -536,16 +536,16 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 			part->name);
 		goto out_register;
 	}
-	if (slave->offset + slave->mtd.size > master->size) {
-		slave->mtd.size = master->size - slave->offset;
+	if (slave->offset + slave->mtd.size > parent->size) {
+		slave->mtd.size = parent->size - slave->offset;
 		printk(KERN_WARNING"mtd: partition \"%s\" extends beyond the end of device \"%s\" -- size truncated to %#llx\n",
-			part->name, master->name, (unsigned long long)slave->mtd.size);
+			part->name, parent->name, (unsigned long long)slave->mtd.size);
 	}
-	if (master->numeraseregions > 1) {
+	if (parent->numeraseregions > 1) {
 		/* Deal with variable erase size stuff */
-		int i, max = master->numeraseregions;
+		int i, max = parent->numeraseregions;
 		u64 end = slave->offset + slave->mtd.size;
-		struct mtd_erase_region_info *regions = master->eraseregions;
+		struct mtd_erase_region_info *regions = parent->eraseregions;
 
 		/* Find the first erase regions which is part of this
 		 * partition. */
@@ -564,7 +564,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 		BUG_ON(slave->mtd.erasesize == 0);
 	} else {
 		/* Single erase size */
-		slave->mtd.erasesize = master->erasesize;
+		slave->mtd.erasesize = parent->erasesize;
 	}
 
 	if ((slave->mtd.flags & MTD_WRITEABLE) &&
@@ -584,17 +584,17 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	}
 
 	mtd_set_ooblayout(&slave->mtd, &part_ooblayout_ops);
-	slave->mtd.ecc_step_size = master->ecc_step_size;
-	slave->mtd.ecc_strength = master->ecc_strength;
-	slave->mtd.bitflip_threshold = master->bitflip_threshold;
+	slave->mtd.ecc_step_size = parent->ecc_step_size;
+	slave->mtd.ecc_strength = parent->ecc_strength;
+	slave->mtd.bitflip_threshold = parent->bitflip_threshold;
 
-	if (master->_block_isbad) {
+	if (parent->_block_isbad) {
 		uint64_t offs = 0;
 
 		while (offs < slave->mtd.size) {
-			if (mtd_block_isreserved(master, offs + slave->offset))
+			if (mtd_block_isreserved(parent, offs + slave->offset))
 				slave->mtd.ecc_stats.bbtblocks++;
-			else if (mtd_block_isbad(master, offs + slave->offset))
+			else if (mtd_block_isbad(parent, offs + slave->offset))
 				slave->mtd.ecc_stats.badblocks++;
 			offs += slave->mtd.erasesize;
 		}
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
