From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] of: undeclared variable when CONFIG_DEBUG_LOCK_ALLOC
Date: Sun, 30 Apr 2017 13:45:28 -0700
Message-ID: <1493585128-12716-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

An undeclared variable was used in a macro that evaluates to nothing
when CONFIG_DEBUG_LOCK_ALLOC is not defined.  Change to use the correct
variable that does exist.

---

reported by kbuild test robot on on robh/for-next
   https://lkml.org/lkml/2017/4/29/134

   drivers/of/base.c: In function '__of_add_phandle_sysfs':
>> drivers/of/base.c:198:23: error: 'pp' undeclared (first use in this function)
     sysfs_bin_attr_init(&pp->attr);

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 drivers/of/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 9fe42346925b..8a7ca2a49ba8 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -195,7 +195,7 @@ int __of_add_phandle_sysfs(struct device_node *np)
 	if (!np->phandle || np->phandle == 0xffffffff)
 		return 0;
 
-	sysfs_bin_attr_init(&pp->attr);
+	sysfs_bin_attr_init(&np->attr_phandle);
 	np->attr_phandle.attr.name = "phandle";
 	np->attr_phandle.attr.mode = 0444;
 	np->attr_phandle.size = sizeof(np->phandle);
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
