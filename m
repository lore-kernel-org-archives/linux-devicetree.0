From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH] of: fix the error message handling
Date: Fri,  2 Dec 2016 15:50:03 +0100
Message-ID: <20161202145003.18965-1-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The previous patch to add back an error message didn't take the
successful case into account. This results in the following trace
showing when a symbol is properly resolved:
OF: resolver: overlay phandle fixup failed: 0

So remove the 'err_out' label and test 'err' value in the 'out' label
before printing the error message.

Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
Hi all,

While experimenting with dt-overlays on linux-next I've realized that
a new trace was showing up:
OF: resolver: overlay phandle fixup failed: 0

This patch should fix it in a simple way.

Regards,
Gary
---
 drivers/of/resolver.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 783bd09..034a61c 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -298,12 +298,12 @@ int of_resolve_phandles(struct device_node *overlay)
 	if (!overlay) {
 		pr_err("null overlay\n");
 		err = -EINVAL;
-		goto err_out;
+		goto out;
 	}
 	if (!of_node_check_flag(overlay, OF_DETACHED)) {
 		pr_err("overlay not detached\n");
 		err = -EINVAL;
-		goto err_out;
+		goto out;
 	}
 
 	phandle_delta = live_tree_max_phandle() + 1;
@@ -315,7 +315,7 @@ int of_resolve_phandles(struct device_node *overlay)
 
 	err = adjust_local_phandle_references(local_fixups, overlay, phandle_delta);
 	if (err)
-		goto err_out;
+		goto out;
 
 	overlay_fixups = NULL;
 
@@ -333,7 +333,7 @@ int of_resolve_phandles(struct device_node *overlay)
 	if (!tree_symbols) {
 		pr_err("no symbols in root of device tree.\n");
 		err = -EINVAL;
-		goto err_out;
+		goto out;
 	}
 
 	for_each_property_of_node(overlay_fixups, prop) {
@@ -345,12 +345,12 @@ int of_resolve_phandles(struct device_node *overlay)
 		err = of_property_read_string(tree_symbols,
 				prop->name, &refpath);
 		if (err)
-			goto err_out;
+			goto out;
 
 		refnode = of_find_node_by_path(refpath);
 		if (!refnode) {
 			err = -ENOENT;
-			goto err_out;
+			goto out;
 		}
 
 		phandle = refnode->phandle;
@@ -361,9 +361,10 @@ int of_resolve_phandles(struct device_node *overlay)
 			break;
 	}
 
-err_out:
-	pr_err("overlay phandle fixup failed: %d\n", err);
 out:
+	if (err)
+		pr_err("overlay phandle fixup failed: %d\n", err);
+
 	of_node_put(tree_symbols);
 
 	return err;
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
