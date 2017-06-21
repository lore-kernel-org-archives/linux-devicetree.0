From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V7 2/6] mtd: partitions: remove sysfs files when deleting all master's partitions
Date: Wed, 21 Jun 2017 08:26:43 +0200
Message-ID: <20170621062647.6072-3-zajec5@gmail.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
 <20170621062647.6072-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170621062647.6072-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

When support for sysfs "offset" file was added it missed to update the
del_mtd_partitions function. It deletes partitions just like
mtd_del_partition does so both should also take care of removing sysfs
files.

This change moves sysfs_remove_files call to the shared function to fix
this issue.

Fixes: a62c24d755291 ("mtd: part: Add sysfs variable for offset of partition")
Cc: Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
V7: Introduction of this patch, it was separated from the 1/6. It should
    be clear now that this change is introduced. If something goes wrong
    it should also be easier to revert it this way.
---
 drivers/mtd/mtdpart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index bcec72148d0b..9434050accc7 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -660,6 +660,8 @@ static int __mtd_del_partition(struct mtd_part *priv)
 {
 	int err;
 
+	sysfs_remove_files(&priv->mtd.dev.kobj, mtd_partition_attrs);
+
 	err = del_mtd_device(&priv->mtd);
 	if (err)
 		return err;
@@ -700,8 +702,6 @@ int mtd_del_partition(struct mtd_info *master, int partno)
 	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
 		if ((slave->master == master) &&
 		    (slave->mtd.index == partno)) {
-			sysfs_remove_files(&slave->mtd.dev.kobj,
-					   mtd_partition_attrs);
 			ret = __mtd_del_partition(slave);
 			break;
 		}
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
