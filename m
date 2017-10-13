From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of: unittest: Remove redundant OF_DETACHED flag setting
Date: Fri, 13 Oct 2017 00:44:51 -0700
Message-ID: <20171013074451.14176-1-stephen.boyd@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

of_fdt_unflatten_tree() already sets the flag on the node to
OF_DETACHED, because of_fdt_unflatten_tree() calls
__unflatten_device_tree() with the detached bool set to true.

Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/unittest.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 35bf9617ae59..8795478a4754 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1112,7 +1112,6 @@ static int __init unittest_data_add(void)
 		pr_warn("%s: No tree to attach; not running tests\n", __func__);
 		return -ENODATA;
 	}
-	of_node_set_flag(unittest_data_node, OF_DETACHED);
 	rc = of_resolve_phandles(unittest_data_node);
 	if (rc) {
 		pr_err("%s: Failed to resolve phandles (rc=%i)\n", __func__, rc);
@@ -2262,7 +2261,6 @@ static int __init overlay_data_add(int onum)
 		ret = 0;
 		goto out_free_data;
 	}
-	of_node_set_flag(info->np_overlay, OF_DETACHED);
 
 	ret = of_resolve_phandles(info->np_overlay);
 	if (ret) {
-- 
2.14.GIT

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
