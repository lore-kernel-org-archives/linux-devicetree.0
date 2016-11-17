From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of: Fix issue where code would fall through to error case.
Date: Thu, 17 Nov 2016 15:25:57 -0800
Message-ID: <1479425157-6235-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, moritz-62aBmqa6xEOcmJEhUYGoYg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

No longer fall through into the error case that prints out
an error if no error (err = 0) occurred.

Fixes d9181b20a83(of: Add back an error message, restructured)
Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
---
 drivers/of/resolver.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 783bd09..785076d 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -358,9 +358,13 @@ int of_resolve_phandles(struct device_node *overlay)
 
 		err = update_usages_of_a_phandle_reference(overlay, prop, phandle);
 		if (err)
-			break;
+			goto err_out;
 	}
 
+	of_node_put(tree_symbols);
+
+	return 0;
+
 err_out:
 	pr_err("overlay phandle fixup failed: %d\n", err);
 out:
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
