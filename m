From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [RFC PATCH 13/13] of: Remove unused variable overlay_symbols
Date: Tue, 25 Oct 2016 13:59:06 -0700
Message-ID: <1477429146-27039-14-git-send-email-frowand.list@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477429146-27039-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

This unused variable is a reminder that symbols in overlays are
not available to subsequent overlays.  If such a feature is
desired then there are several ways it could be implemented.

Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
---
 drivers/of/resolver.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 3f7cf569c7ea..b48d16200ccd 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -272,7 +272,7 @@ static int adjust_local_phandle_references(struct device_node *local_fixups,
 int of_resolve_phandles(struct device_node *overlay)
 {
 	struct device_node *child, *local_fixups, *refnode;
-	struct device_node *tree_symbols, *overlay_symbols, *overlay_fixups;
+	struct device_node *tree_symbols, *overlay_fixups;
 	struct property *prop;
 	const char *refpath;
 	phandle phandle, phandle_delta;
@@ -302,12 +302,9 @@ int of_resolve_phandles(struct device_node *overlay)
 	if (err)
 		goto err_out;
 
-	overlay_symbols = NULL;
 	overlay_fixups = NULL;
 
 	for_each_child_of_node(overlay, child) {
-		if (!of_node_cmp(child->name, "__symbols__"))
-			overlay_symbols = child;
 		if (!of_node_cmp(child->name, "__fixups__"))
 			overlay_fixups = child;
 	}
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
