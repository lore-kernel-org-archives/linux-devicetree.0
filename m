From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] Revert "of: search the best compatible match first in __of_match_node()"
Date: Tue, 18 Feb 2014 15:57:29 +0800
Message-ID: <1392710250-29913-2-git-send-email-haokexin@gmail.com>
References: <1392710250-29913-1-git-send-email-haokexin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392710250-29913-1-git-send-email-haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This reverts commit 06b29e76a74b2373e6f8b5a7938b3630b9ae98b2.
As pointed out by Grant Likely, we should also take the type and name
into account when searching the best compatible match. That means the
match with compatible, type and name should be better than the match
just with the same compatible string. So revert this and we will
implement another method to find the best match entry.

Signed-off-by: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/base.c | 43 +------------------------------------------
 1 file changed, 1 insertion(+), 42 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 10b51106c854..ba195fbce4c6 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -730,49 +730,13 @@ out:
 }
 EXPORT_SYMBOL(of_find_node_with_property);
 
-static const struct of_device_id *
-of_match_compatible(const struct of_device_id *matches,
-			const struct device_node *node)
-{
-	const char *cp;
-	int cplen, l;
-	const struct of_device_id *m;
-
-	cp = __of_get_property(node, "compatible", &cplen);
-	while (cp && (cplen > 0)) {
-		m = matches;
-		while (m->name[0] || m->type[0] || m->compatible[0]) {
-			/* Only match for the entries without type and name */
-			if (m->name[0] || m->type[0] ||
-				of_compat_cmp(m->compatible, cp,
-					 strlen(m->compatible)))
-				m++;
-			else
-				return m;
-		}
-
-		/* Get node's next compatible string */
-		l = strlen(cp) + 1;
-		cp += l;
-		cplen -= l;
-	}
-
-	return NULL;
-}
-
 static
 const struct of_device_id *__of_match_node(const struct of_device_id *matches,
 					   const struct device_node *node)
 {
-	const struct of_device_id *m;
-
 	if (!matches)
 		return NULL;
 
-	m = of_match_compatible(matches, node);
-	if (m)
-		return m;
-
 	while (matches->name[0] || matches->type[0] || matches->compatible[0]) {
 		int match = 1;
 		if (matches->name[0])
@@ -796,12 +760,7 @@ const struct of_device_id *__of_match_node(const struct of_device_id *matches,
  *	@matches:	array of of device match structures to search in
  *	@node:		the of device structure to match against
  *
- *	Low level utility function used by device matching. We have two ways
- *	of matching:
- *	- Try to find the best compatible match by comparing each compatible
- *	  string of device node with all the given matches respectively.
- *	- If the above method failed, then try to match the compatible by using
- *	  __of_device_is_compatible() besides the match in type and name.
+ *	Low level utility function used by device matching.
  */
 const struct of_device_id *of_match_node(const struct of_device_id *matches,
 					 const struct device_node *node)
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
