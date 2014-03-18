From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] of: Make of_find_node_by_path() handle /aliases
Date: Tue, 18 Mar 2014 23:52:29 +0200
Message-ID: <1395179549-31345-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pete Popov <pete.popov-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Dan Malek <dan.malek-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Georgi Vlaev <georgi.vlaev-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Make of_find_node_by_path() handle aliases as prefixes.

Originally by David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, but
reworked according to remark by Grant Likely.

Handles all cases without allocating memory as requested by
Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 drivers/of/base.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 7083fad..19bcdb4 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -773,22 +773,83 @@ EXPORT_SYMBOL(of_get_child_by_name);
 /**
  *	of_find_node_by_path - Find a node matching a full OF path
  *	@path:	The full path to match
+ *	@path: Either the full path to match, or if the path does not
+ *	       start with '/', the name of a property of the /aliases
+ *	       node (an alias).  In the case of an alias, the node
+ *	       matching the alias' value will be returned.
+ *
+ *	Valid paths:
+ *		/foo/bar	Full path
+ *		foo		Valid alias
+ *		foo/bar		Valid alias + relative path
  *
  *	Returns a node pointer with refcount incremented, use
  *	of_node_put() on it when done.
  */
 struct device_node *of_find_node_by_path(const char *path)
 {
-	struct device_node *np = of_allnodes;
+	struct device_node *np = NULL;
+	int len;
+	const char *p = NULL;
+	struct property *prop;
 	unsigned long flags;
 
+	/* under lock (not very nice) */
 	raw_spin_lock_irqsave(&devtree_lock, flags);
-	for (; np; np = np->allnext) {
-		if (np->full_name && (of_node_cmp(np->full_name, path) == 0)
-		    && of_node_get(np))
+
+	len = strlen(path);
+
+	/* path begins with an alias */
+	if (path[0] != '/') {
+
+		/* now find the relative path (if any)*/
+		p = strchr(path, '/');
+		if (p != NULL)
+			len = p - path;
+
+		/* of_aliases must not be NULL */
+		if (!of_aliases)
+			goto out;
+
+		/* find matching alias */
+		for_each_property_of_node(of_aliases, prop)
+			if (strlen(prop->name) == len &&
+					strncmp(prop->name, path, len) == 0)
+				break;
+
+		/* not found; bail */
+		if (prop == NULL)
+			goto out;
+
+		path = prop->value;
+	}
+
+	/* path lookup */
+	for_each_of_allnodes(np) {
+
+		if (!np->full_name)
+			continue;
+
+		if (p == NULL) {
+			/* full component */
+			if (strcasecmp(np->full_name, path) != 0)
+				continue;
+		} else {
+			/* last component (including '/') */
+			if (strncasecmp(np->full_name, path, len) != 0)
+				continue;
+
+			if (strcasecmp(np->full_name + len, p) != 0)
+				continue;
+		}
+
+		if (of_node_get(np))
 			break;
 	}
+
+out:
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+
 	return np;
 }
 EXPORT_SYMBOL(of_find_node_by_path);
-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
