From: frowand.list@gmail.com
Subject: [RFC PATCH 11/13] of: Add back an error message, restructured
Date: Tue, 25 Oct 2016 13:59:04 -0700
Message-ID: <1477429146-27039-12-git-send-email-frowand.list@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@am.sony.com>

Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
---
 drivers/of/resolver.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 4e6df385118b..664c97e1ecb4 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -278,13 +278,17 @@ int of_resolve_phandles(struct device_node *overlay)
 	phandle phandle, phandle_delta;
 	int err;
 
+	tree_symbols = NULL;
+
 	if (!overlay) {
 		pr_err("null overlay\n");
-		return -EINVAL;
+		err = -EINVAL;
+		goto err_out;
 	}
 	if (!of_node_check_flag(overlay, OF_DETACHED)) {
 		pr_err("overlay not detached\n");
-		return -EINVAL;
+		err = -EINVAL;
+		goto err_out;
 	}
 
 	phandle_delta = live_tree_max_phandle() + 1;
@@ -296,7 +300,7 @@ int of_resolve_phandles(struct device_node *overlay)
 
 	err = adjust_local_phandle_references(local_fixups, overlay, phandle_delta);
 	if (err)
-		return err;
+		goto err_out;
 
 	overlay_symbols = NULL;
 	overlay_fixups = NULL;
@@ -318,7 +322,7 @@ int of_resolve_phandles(struct device_node *overlay)
 	if (!tree_symbols) {
 		pr_err("no symbols in root of device tree.\n");
 		err = -EINVAL;
-		goto out;
+		goto err_out;
 	}
 
 	for_each_property_of_node(overlay_fixups, prop) {
@@ -330,12 +334,12 @@ int of_resolve_phandles(struct device_node *overlay)
 		err = of_property_read_string(tree_symbols,
 				prop->name, &refpath);
 		if (err)
-			goto out;
+			goto err_out;
 
 		refnode = of_find_node_by_path(refpath);
 		if (!refnode) {
 			err = -ENOENT;
-			goto out;
+			goto err_out;
 		}
 
 		phandle = refnode->phandle;
@@ -346,6 +350,8 @@ int of_resolve_phandles(struct device_node *overlay)
 			break;
 	}
 
+err_out:
+	pr_err("overlay phandle fixup failed: %d\n", err);
 out:
 	of_node_put(tree_symbols);
 
-- 
1.9.1
