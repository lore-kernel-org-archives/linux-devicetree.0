From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V5 2/4] mtd: partitions: add support for allocating subpartition
Date: Wed, 24 May 2017 11:44:35 +0200
Message-ID: <20170524094437.2174-3-zajec5@gmail.com>
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

Some flash device partitions can be containers with extra subpartitions
(volumes). When allocating subpartition it should be validated against
its parent but its master pointer has to point flash device. It's needed
to make all callbacks like part_read work as expected. It also has to
have offset calculated correctly.

This patch modifies allocate_partition to detect if provided parent is
an existing partition and sets "master" and "offset" correctly if so.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
V5: Introduction of this patch to handle offset in allocate_partition
    and avoid casting const to non-const in mtd_parse_part.
---
 drivers/mtd/mtdpart.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 92acd89e07cb..8a0629449804 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -37,7 +37,13 @@
 static LIST_HEAD(mtd_partitions);
 static DEFINE_MUTEX(mtd_partitions_mutex);
 
-/* Our partition node structure */
+/**
+ * struct mtd_part - our partition node structure
+ *
+ * @mtd: struct holding partition details
+ * @master: pointer to the flash device MTD struct
+ * @offset: partition offset relative to the *flash device*
+ */
 struct mtd_part {
 	struct mtd_info mtd;
 	struct mtd_info *master;
@@ -393,9 +399,18 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 			const struct mtd_partition *part, int partno,
 			uint64_t cur_offset)
 {
+	struct mtd_info *master = parent;
 	struct mtd_part *slave;
+	uint64_t parent_offset = 0;
 	char *name;
 
+	if (mtd_is_partition(parent)) {
+		struct mtd_part *parent_part = mtd_to_part(parent);
+
+		master = parent_part->master;
+		parent_offset = parent_part->offset;
+	}
+
 	/* allocate the partition structure */
 	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
 	name = kstrdup(part->name, GFP_KERNEL);
@@ -493,12 +508,12 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 		slave->mtd._put_device = part_put_device;
 
 	slave->mtd._erase = part_erase;
-	slave->master = parent;
-	slave->offset = part->offset;
+	slave->master = master;
+	slave->offset = parent_offset + part->offset;
 
-	if (slave->offset == MTDPART_OFS_APPEND)
+	if (part->offset == MTDPART_OFS_APPEND)
 		slave->offset = cur_offset;
-	if (slave->offset == MTDPART_OFS_NXTBLK) {
+	if (part->offset == MTDPART_OFS_NXTBLK) {
 		slave->offset = cur_offset;
 		if (mtd_mod_by_eb(cur_offset, parent) != 0) {
 			/* Round up to next erasesize */
@@ -508,7 +523,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 			       (unsigned long long)cur_offset, (unsigned long long)slave->offset);
 		}
 	}
-	if (slave->offset == MTDPART_OFS_RETAIN) {
+	if (part->offset == MTDPART_OFS_RETAIN) {
 		slave->offset = cur_offset;
 		if (parent->size - slave->offset >= slave->mtd.size) {
 			slave->mtd.size = parent->size - slave->offset
@@ -536,8 +551,8 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 			part->name);
 		goto out_register;
 	}
-	if (slave->offset + slave->mtd.size > parent->size) {
-		slave->mtd.size = parent->size - slave->offset;
+	if (slave->offset + slave->mtd.size > parent_offset + parent->size) {
+		slave->mtd.size = parent_offset + parent->size - slave->offset;
 		printk(KERN_WARNING"mtd: partition \"%s\" extends beyond the end of device \"%s\" -- size truncated to %#llx\n",
 			part->name, parent->name, (unsigned long long)slave->mtd.size);
 	}
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
