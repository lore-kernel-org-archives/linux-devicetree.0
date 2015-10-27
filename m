From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] mtd: ofpart: drop undocumented, nonfunctional 'lock' property
Date: Mon, 26 Oct 2015 18:56:06 -0700
Message-ID: <1445910966-11415-1-git-send-email-computersforpeace@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The 'lock' property of a partition does nothing, because it effectively
only sets the flags for the partition device, not the master device. And
no MTD driver checks for MTD_POWERUP_LOCK in the partition device, only
the master device.

Michal noticed that this flag was undocumented, but rather than document
a non-functioning DT property, let's just kill it, since obviously no
one cared about it.

Note that this logic does not apply to all MTD flags (e.g., the
"read-only" flags above the "lock" one), since certain flags *do* get
checked in the partition, at least in some cases (particularly, when
checking file permissions in mtdchar.c, but notably *not* in the core
APIs like mtd_write()).

Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/mtd/ofpart.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index aa26c32e1bc2..6bab6b5863e5 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -86,9 +86,6 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 		if (of_get_property(pp, "read-only", &len))
 			(*pparts)[i].mask_flags |= MTD_WRITEABLE;
 
-		if (of_get_property(pp, "lock", &len))
-			(*pparts)[i].mask_flags |= MTD_POWERUP_LOCK;
-
 		i++;
 	}
 
-- 
2.6.0.rc2.230.g3dd15c0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
