From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [RFC PATCH 08/13] of: Update structure of code, remove BUG_ON()
Date: Tue, 25 Oct 2016 13:59:01 -0700
Message-ID: <1477429146-27039-9-git-send-email-frowand.list@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477429146-27039-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
---
 drivers/of/resolver.c | 48 +++++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 0778747cdd58..708daca1d522 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -136,8 +136,8 @@ static int update_usages_of_a_phandle_reference(struct device_node *overlay,
 			err = -EINVAL;
 			goto err_fail;
 		}
-
 		*s++ = '\0';
+
 		err = kstrtoint(s, 10, &offset);
 		if (err)
 			goto err_fail;
@@ -219,11 +219,9 @@ static int adjust_local_phandle_references(struct device_node *local_fixups,
 			if (off >= prop->length || (off + 4) > prop->length)
 				return -EINVAL;
 
-			if (phandle_delta) {
-				phandle = be32_to_cpu(*(__be32 *)(prop->value + off));
-				phandle += phandle_delta;
-				*(__be32 *)(prop->value + off) = cpu_to_be32(phandle);
-			}
+			phandle = be32_to_cpu(*(__be32 *)(prop->value + off));
+			phandle += phandle_delta;
+			*(__be32 *)(prop->value + off) = cpu_to_be32(phandle);
 		}
 	}
 
@@ -267,48 +265,36 @@ int of_resolve_phandles(struct device_node *overlay)
 	phandle phandle, phandle_delta;
 	int err;
 
-	if (!overlay)
-		pr_err("%s: null overlay\n", __func__);
-	if (overlay && !of_node_check_flag(overlay, OF_DETACHED))
-		pr_err("%s: node %s not detached\n", __func__,
-			 overlay->full_name);
-	if (!overlay || !of_node_check_flag(overlay, OF_DETACHED))
+	if (!overlay) {
+		pr_err("null overlay\n");
+		return -EINVAL;
+	}
+	if (!of_node_check_flag(overlay, OF_DETACHED)) {
+		pr_err("overlay not detached\n");
 		return -EINVAL;
+	}
 
 	phandle_delta = live_tree_max_phandle() + 1;
 	adjust_overlay_phandles(overlay, phandle_delta);
 
-	local_fixups = NULL;
 	for_each_child_of_node(overlay, local_fixups)
 		if (!of_node_cmp(local_fixups->name, "__local_fixups__"))
 			break;
 
-	if (local_fixups != NULL) {
-		err = adjust_local_phandle_references(local_fixups,
-				overlay, 0);
-		if (err)
-			return err;
+	err = adjust_local_phandle_references(local_fixups, overlay, phandle_delta);
+	if (err)
+		return err;
 
-		BUG_ON(adjust_local_phandle_references(local_fixups,
-				overlay, phandle_delta));
-	}
-
-	tree_symbols = NULL;
 	overlay_symbols = NULL;
 	overlay_fixups = NULL;
 
 	tree_symbols = of_find_node_by_path("/__symbols__");
 
 	for_each_child_of_node(overlay, child) {
-
-		if (!overlay_symbols && !of_node_cmp(child->name, "__symbols__"))
+		if (!of_node_cmp(child->name, "__symbols__"))
 			overlay_symbols = child;
-
-		if (!overlay_fixups && !of_node_cmp(child->name, "__fixups__"))
+		if (!of_node_cmp(child->name, "__fixups__"))
 			overlay_fixups = child;
-
-		if (overlay_symbols && overlay_fixups)
-			break;
 	}
 
 	if (!overlay_fixups) {
@@ -317,7 +303,7 @@ int of_resolve_phandles(struct device_node *overlay)
 	}
 
 	if (!tree_symbols) {
-		pr_err("%s: no symbols in root of device tree.\n", __func__);
+		pr_err("no symbols in root of device tree.\n");
 		err = -EINVAL;
 		goto out;
 	}
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
