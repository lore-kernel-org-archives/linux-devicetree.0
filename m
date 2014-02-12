From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of: give priority to the compatible match in __of_match_node()
Date: Wed, 12 Feb 2014 19:38:04 +0800
Message-ID: <1392205084-2351-1-git-send-email-haokexin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Chris Proctor <cproctor-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When the device node do have a compatible property, we definitely
prefer the compatible match besides the type and name. Only if
there is no such a match, we then consider the candidate which
doesn't have compatible entry but do match the type or name with
the device node.

This is based on a patch from Sebastian Hesselbarth.
  http://patchwork.ozlabs.org/patch/319434/

I did some code refactoring and also fixed a bug in the original patch.

Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/base.c | 55 +++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index ff85450d5683..9d655df458bd 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -730,32 +730,45 @@ out:
 }
 EXPORT_SYMBOL(of_find_node_with_property);
 
+static int of_match_type_or_name(const struct device_node *node,
+				const struct of_device_id *m)
+{
+	int match = 1;
+
+	if (m->name[0])
+		match &= node->name && !strcmp(m->name, node->name);
+
+	if (m->type[0])
+		match &= node->type && !strcmp(m->type, node->type);
+
+	return match;
+}
+
 static
 const struct of_device_id *__of_match_node(const struct of_device_id *matches,
 					   const struct device_node *node)
 {
 	const char *cp;
 	int cplen, l;
+	const struct of_device_id *m;
+	int match;
 
 	if (!matches)
 		return NULL;
 
 	cp = __of_get_property(node, "compatible", &cplen);
-	do {
-		const struct of_device_id *m = matches;
+	while (cp && (cplen > 0)) {
+		m = matches;
 
 		/* Check against matches with current compatible string */
 		while (m->name[0] || m->type[0] || m->compatible[0]) {
-			int match = 1;
-			if (m->name[0])
-				match &= node->name
-					&& !strcmp(m->name, node->name);
-			if (m->type[0])
-				match &= node->type
-					&& !strcmp(m->type, node->type);
-			if (m->compatible[0])
-				match &= cp
-					&& !of_compat_cmp(m->compatible, cp,
+			if (!m->compatible[0]) {
+				m++;
+				continue;
+			}
+
+			match = of_match_type_or_name(node, m);
+			match &= cp && !of_compat_cmp(m->compatible, cp,
 							strlen(m->compatible));
 			if (match)
 				return m;
@@ -763,12 +776,18 @@ const struct of_device_id *__of_match_node(const struct of_device_id *matches,
 		}
 
 		/* Get node's next compatible string */ 
-		if (cp) {
-			l = strlen(cp) + 1;
-			cp += l;
-			cplen -= l;
-		}
-	} while (cp && (cplen > 0));
+		l = strlen(cp) + 1;
+		cp += l;
+		cplen -= l;
+	}
+
+	m = matches;
+	/* Check against matches without compatible string */
+	while (m->name[0] || m->type[0] || m->compatible[0]) {
+		if (!m->compatible[0] && of_match_type_or_name(node, m))
+			return m;
+		m++;
+	}
 
 	return NULL;
 }
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
