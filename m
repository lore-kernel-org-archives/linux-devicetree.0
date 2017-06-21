From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V7 1/6] mtd: partitions: add helper for deleting partition
Date: Wed, 21 Jun 2017 08:26:42 +0200
Message-ID: <20170621062647.6072-2-zajec5@gmail.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
 <20170621062647.6072-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170621062647.6072-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

There are two similar functions handling deletion. One handles single
partition and another the whole MTD flash device. They share (duplicate)
some code so it makes sense to add a small helper for that part.

Function del_mtd_partitions has been moved a bit to keep all deleting
stuff together.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
V6: Introduction of this patch. It's needed by "mtd: partitions: add
    support for subpartitions"
V7: Don't move sysfs_remove_files here (see the next patch instead).
---
 drivers/mtd/mtdpart.c | 75 +++++++++++++++++++++++++++++----------------------
 1 file changed, 43 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 7ececd3d7799..bcec72148d0b 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -363,32 +363,6 @@ static inline void free_partition(struct mtd_part *p)
 	kfree(p);
 }
 
-/*
- * This function unregisters and destroy all slave MTD objects which are
- * attached to the given master MTD object.
- */
-
-int del_mtd_partitions(struct mtd_info *master)
-{
-	struct mtd_part *slave, *next;
-	int ret, err = 0;
-
-	mutex_lock(&mtd_partitions_mutex);
-	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
-		if (slave->master == master) {
-			ret = del_mtd_device(&slave->mtd);
-			if (ret < 0) {
-				err = ret;
-				continue;
-			}
-			list_del(&slave->list);
-			free_partition(slave);
-		}
-	mutex_unlock(&mtd_partitions_mutex);
-
-	return err;
-}
-
 static struct mtd_part *allocate_partition(struct mtd_info *master,
 			const struct mtd_partition *part, int partno,
 			uint64_t cur_offset)
@@ -675,6 +649,48 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
 }
 EXPORT_SYMBOL_GPL(mtd_add_partition);
 
+/**
+ * __mtd_del_partition - delete MTD partition
+ *
+ * @priv: internal MTD struct for partition to be deleted
+ *
+ * This function must be called with the partitions mutex locked.
+ */
+static int __mtd_del_partition(struct mtd_part *priv)
+{
+	int err;
+
+	err = del_mtd_device(&priv->mtd);
+	if (err)
+		return err;
+
+	list_del(&priv->list);
+	free_partition(priv);
+
+	return 0;
+}
+
+/*
+ * This function unregisters and destroy all slave MTD objects which are
+ * attached to the given master MTD object.
+ */
+int del_mtd_partitions(struct mtd_info *master)
+{
+	struct mtd_part *slave, *next;
+	int ret, err = 0;
+
+	mutex_lock(&mtd_partitions_mutex);
+	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
+		if (slave->master == master) {
+			ret = __mtd_del_partition(slave);
+			if (ret < 0)
+				err = ret;
+		}
+	mutex_unlock(&mtd_partitions_mutex);
+
+	return err;
+}
+
 int mtd_del_partition(struct mtd_info *master, int partno)
 {
 	struct mtd_part *slave, *next;
@@ -686,12 +702,7 @@ int mtd_del_partition(struct mtd_info *master, int partno)
 		    (slave->mtd.index == partno)) {
 			sysfs_remove_files(&slave->mtd.dev.kobj,
 					   mtd_partition_attrs);
-			ret = del_mtd_device(&slave->mtd);
-			if (ret < 0)
-				break;
-
-			list_del(&slave->list);
-			free_partition(slave);
+			ret = __mtd_del_partition(slave);
 			break;
 		}
 	mutex_unlock(&mtd_partitions_mutex);
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
