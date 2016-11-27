From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCH v3 1/2] of: Fix issue where code would fall through to error case.
Date: Sun, 27 Nov 2016 12:20:57 -0800
Message-ID: <1480278058-19688-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, frowand.list@gmail.com, robh+dt@kernel.org, pantelis.antoniou@konsulko.com, mdf@kernel.org, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

No longer fall through into the error case that prints out
an error if no error (err = 0) occurred.

Rework error handling to print error where it occured instead
of having a global catch-all at the end of the function.

Fixes d9181b20a83(of: Add back an error message, restructured)
Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
Reviewed-by: Frank Rowand <frank.rowand@am.sony.com>
---
Hi Rob, Frank

this has already Frank's Reviewed-by: tag on it, but since I changed around the
earlier part (before tree_node gets assigned) Frank might wanna take another look
at this.

Changes from v2:
* Change error printouts to print error where it's produced
* Before tree_symbols gets assigned a non-NULL value, directly return error
  instead of goto out, since of_put_node will be a no-op for !tree_symbols

Changes from  v1:
* Implemented Frank's suggestion

Cheers,

Moritz
---

 drivers/of/resolver.c | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 783bd09..5f51a4a 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -296,14 +296,12 @@ int of_resolve_phandles(struct device_node *overlay)
 	tree_symbols = NULL;
 
 	if (!overlay) {
-		pr_err("null overlay\n");
-		err = -EINVAL;
-		goto err_out;
+		pr_err("overlay phandle fixup failed: null overlay\n");
+		return -EINVAL;
 	}
 	if (!of_node_check_flag(overlay, OF_DETACHED)) {
-		pr_err("overlay not detached\n");
-		err = -EINVAL;
-		goto err_out;
+		pr_err("overlay phandle fixup failed: overlay not detached\n");
+		return -EINVAL;
 	}
 
 	phandle_delta = live_tree_max_phandle() + 1;
@@ -314,8 +312,10 @@ int of_resolve_phandles(struct device_node *overlay)
 			break;
 
 	err = adjust_local_phandle_references(local_fixups, overlay, phandle_delta);
-	if (err)
-		goto err_out;
+	if (err) {
+		pr_err("overlay phandle fixup failed: %d\n", err);
+		return err;
+	}
 
 	overlay_fixups = NULL;
 
@@ -324,16 +324,13 @@ int of_resolve_phandles(struct device_node *overlay)
 			overlay_fixups = child;
 	}
 
-	if (!overlay_fixups) {
-		err = 0;
-		goto out;
-	}
+	if (!overlay_fixups)
+		return 0;
 
 	tree_symbols = of_find_node_by_path("/__symbols__");
 	if (!tree_symbols) {
-		pr_err("no symbols in root of device tree.\n");
-		err = -EINVAL;
-		goto err_out;
+		pr_err("overlay phandle fixup failed: no symbols in root\n");
+		return -EINVAL;
 	}
 
 	for_each_property_of_node(overlay_fixups, prop) {
@@ -344,13 +341,16 @@ int of_resolve_phandles(struct device_node *overlay)
 
 		err = of_property_read_string(tree_symbols,
 				prop->name, &refpath);
-		if (err)
-			goto err_out;
+		if (err) {
+			pr_err("overlay phandle fixup failed: %d\n", err);
+			goto out;
+		}
 
 		refnode = of_find_node_by_path(refpath);
 		if (!refnode) {
 			err = -ENOENT;
-			goto err_out;
+			pr_err("overlay phandle fixup failed: !refnode\n");
+			goto out;
 		}
 
 		phandle = refnode->phandle;
@@ -361,8 +361,6 @@ int of_resolve_phandles(struct device_node *overlay)
 			break;
 	}
 
-err_out:
-	pr_err("overlay phandle fixup failed: %d\n", err);
 out:
 	of_node_put(tree_symbols);
 
-- 
2.7.4
