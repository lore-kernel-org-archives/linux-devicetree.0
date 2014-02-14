From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] Revert "OF: base: match each node compatible against all given matches first"
Date: Fri, 14 Feb 2014 13:22:45 +0800
Message-ID: <1392355366-1445-2-git-send-email-haokexin@gmail.com>
References: <1392355366-1445-1-git-send-email-haokexin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392355366-1445-1-git-send-email-haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This reverts commit 105353145eafb3ea919f5cdeb652a9d8f270228e.
Stephen Chivers reported this is broken as we will get a match
entry '.type = "serial"' instead of the '.compatible = "ns16550"'
in the following scenario:
	serial0: serial@4500 {
		compatible = "fsl,ns16550", "ns16550";
	}

	struct of_device_id of_platform_serial_table[] = {
		{ .compatible = "ns8250",   .data = (void *)PORT_8250, },
		{ .compatible = "ns16450",  .data = (void *)PORT_16450, },
		{ .compatible = "ns16550a", .data = (void *)PORT_16550A, },
		{ .compatible = "ns16550",  .data = (void *)PORT_16550, },
		{ .compatible = "ns16750",  .data = (void *)PORT_16750, },
		{ .compatible = "ns16850",  .data = (void *)PORT_16850, },
		...
		{ .type = "serial",         .data = (void *)PORT_UNKNOWN, },
		{ /* end of list */ },
	};

So just revert this patch, we will use another implementation to find
the best compatible match in a follow-on patch.

Reported-by: Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/base.c | 53 ++++++++++++++++-------------------------------------
 1 file changed, 16 insertions(+), 37 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index ff85450d5683..ba195fbce4c6 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -734,42 +734,24 @@ static
 const struct of_device_id *__of_match_node(const struct of_device_id *matches,
 					   const struct device_node *node)
 {
-	const char *cp;
-	int cplen, l;
-
 	if (!matches)
 		return NULL;
 
-	cp = __of_get_property(node, "compatible", &cplen);
-	do {
-		const struct of_device_id *m = matches;
-
-		/* Check against matches with current compatible string */
-		while (m->name[0] || m->type[0] || m->compatible[0]) {
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
-							strlen(m->compatible));
-			if (match)
-				return m;
-			m++;
-		}
-
-		/* Get node's next compatible string */ 
-		if (cp) {
-			l = strlen(cp) + 1;
-			cp += l;
-			cplen -= l;
-		}
-	} while (cp && (cplen > 0));
-
+	while (matches->name[0] || matches->type[0] || matches->compatible[0]) {
+		int match = 1;
+		if (matches->name[0])
+			match &= node->name
+				&& !strcmp(matches->name, node->name);
+		if (matches->type[0])
+			match &= node->type
+				&& !strcmp(matches->type, node->type);
+		if (matches->compatible[0])
+			match &= __of_device_is_compatible(node,
+							   matches->compatible);
+		if (match)
+			return matches;
+		matches++;
+	}
 	return NULL;
 }
 
@@ -778,10 +760,7 @@ const struct of_device_id *__of_match_node(const struct of_device_id *matches,
  *	@matches:	array of of device match structures to search in
  *	@node:		the of device structure to match against
  *
- *	Low level utility function used by device matching. Matching order
- *	is to compare each of the node's compatibles with all given matches
- *	first. This implies node's compatible is sorted from specific to
- *	generic while matches can be in any order.
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
