From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCH v4] of: Fix issue where code would fall through to error case.
Date: Thu,  1 Dec 2016 22:10:25 -0800
Message-ID: <1480659025-18836-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, frowand.list@gmail.com, robh+dt@kernel.org, pantelis.antoniou@konsulko.com, Moritz Fischer <mdf@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Moritz Fischer <mdf@kernel.org>

No longer fall through into the error case that prints out
an error if no error (err = 0) occurred.

Fixes d9181b20a83(of: Add back an error message, restructured)
Signed-off-by: Moritz Fischer <mdf@kernel.org>
Reviewed-by: Frank Rowand <frank.rowand@am.sony.com>
---
Hi Frank, Rob

sorry for the noise before.

Thanks,
Moritz
---
 drivers/of/resolver.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 783bd09..8bf12e9 100644
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
@@ -361,9 +361,9 @@ int of_resolve_phandles(struct device_node *overlay)
 			break;
 	}
 
-err_out:
-	pr_err("overlay phandle fixup failed: %d\n", err);
 out:
+	if (err)
+		pr_err("overlay phandle fixup failed: %d\n", err);
 	of_node_put(tree_symbols);
 
 	return err;
-- 
2.7.4
