From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] mtd: assign mtd->dev.of_node when creating partition
 devices
Date: Wed, 11 Nov 2015 17:04:57 -0800
Message-ID: <20151112010457.GE96199@google.com>
References: <1447287964-63309-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447287964-63309-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

MTD partitions may have been created from a DT definition, and in this case
the ->of_node of the struct device embedded in mtd_info should point to
the DT node that was used to create the partition.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v2: drop most of the get/put node handling; allow the MTD core to do
    this in {add,del}_mtd_device()

    depends on: http://patchwork.ozlabs.org/patch/543159/

v1: http://patchwork.ozlabs.org/patch/538838/

 drivers/mtd/mtdpart.c          | 1 +
 drivers/mtd/ofpart.c           | 2 +-
 include/linux/mtd/partitions.h | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index f8ba153f63bf..c2b6e967a160 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -391,6 +391,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	slave->mtd.dev.parent = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) ?
 				&master->dev :
 				master->dev.parent;
+	mtd_set_of_node(&slave->mtd, part->of_node);
 
 	slave->mtd._read = part_read;
 	slave->mtd._write = part_write;
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index f78d2aea5545..dacf4c405dec 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -111,6 +111,7 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 		if (of_get_property(pp, "lock", &len))
 			(*pparts)[i].mask_flags |= MTD_POWERUP_LOCK;
 
+		(*pparts)[i].of_node = pp;
 		i++;
 	}
 
@@ -124,7 +125,6 @@ ofpart_fail:
 	       master->name, pp->full_name, mtd_node->full_name);
 	ret = -EINVAL;
 ofpart_none:
-	of_node_put(pp);
 	kfree(*pparts);
 	*pparts = NULL;
 	return ret;
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 773975a3c9e6..282644c0c5c0 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -42,6 +42,7 @@ struct mtd_partition {
 	uint64_t offset;		/* offset within the master MTD space */
 	uint32_t mask_flags;		/* master MTD flags to mask out for this partition */
 	struct nand_ecclayout *ecclayout;	/* out of band layout for this partition (NAND only) */
+	struct device_node *of_node;	/* OF node attached to the partition */
 };
 
 #define MTDPART_OFS_RETAIN	(-3)
-- 
2.6.0.rc2.230.g3dd15c0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
