From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/4] of: find_node_by_full_name rewrite to compare each level
Date: Wed, 14 Jun 2017 15:30:23 -0500
Message-ID: <20170614203025.7581-3-robh@kernel.org>
References: <20170614203025.7581-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170614203025.7581-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Joe Perches <joe@perches.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

find_node_by_full_name() does the same thing as of_find_node_by_path(),
but takes no locks and doesn't work on aliases. Refactor
of_find_node_opts_by_path() into __of_find_node_by_full_path() and
replace find_node_by_full_name() with it.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/base.c       | 29 +++++++++++++++++++----------
 drivers/of/of_private.h |  3 +++
 drivers/of/resolver.c   | 30 +++---------------------------
 3 files changed, 25 insertions(+), 37 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 054159ccd5f8..02be991a29c5 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -780,6 +780,24 @@ static struct device_node *__of_find_node_by_path(struct device_node *parent,
 	return NULL;
 }
 
+struct device_node *__of_find_node_by_full_path(struct device_node *node,
+						const char *path)
+{
+	const char *separator = strchr(path, ':');
+
+	while (node && *path == '/') {
+		struct device_node *tmp = node;
+
+		path++; /* Increment past '/' delimiter */
+		node = __of_find_node_by_path(node, path);
+		of_node_put(tmp);
+		path = strchrnul(path, '/');
+		if (separator && separator < path)
+			break;
+	}
+	return node;
+}
+
 /**
  *	of_find_node_opts_by_path - Find a node matching a full OF path
  *	@path: Either the full path to match, or if the path does not
@@ -839,16 +857,7 @@ struct device_node *of_find_node_opts_by_path(const char *path, const char **opt
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	if (!np)
 		np = of_node_get(of_root);
-	while (np && *path == '/') {
-		struct device_node *tmp = np;
-
-		path++; /* Increment past '/' delimiter */
-		np = __of_find_node_by_path(np, path);
-		of_node_put(tmp);
-		path = strchrnul(path, '/');
-		if (separator && separator < path)
-			break;
-	}
+	np =__of_find_node_by_full_path(np, path);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	return np;
 }
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 4ebb0149d118..e7bbfa3e9632 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -77,6 +77,9 @@ extern void *__unflatten_device_tree(const void *blob,
 struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags);
 __printf(2, 3) struct device_node *__of_node_dup(const struct device_node *np, const char *fmt, ...);
 
+struct device_node *__of_find_node_by_full_path(struct device_node *node,
+						const char *path);
+
 extern const void *__of_get_property(const struct device_node *np,
 				     const char *name, int *lenp);
 extern int __of_add_property(struct device_node *np, struct property *prop);
diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 63626d7d9adb..b3f987c1301b 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -20,35 +20,11 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 
+#include "of_private.h"
+
 /* illegal phandle value (set when unresolved) */
 #define OF_PHANDLE_ILLEGAL	0xdeadbeef
 
-/**
- * Find a node with the give full name by recursively following any of
- * the child node links.
- */
-static struct device_node *find_node_by_full_name(struct device_node *node,
-		const char *full_name)
-{
-	struct device_node *child, *found;
-
-	if (!node)
-		return NULL;
-
-	if (!of_node_cmp(node->full_name, full_name))
-		return of_node_get(node);
-
-	for_each_child_of_node(node, child) {
-		found = find_node_by_full_name(child, full_name);
-		if (found != NULL) {
-			of_node_put(child);
-			return found;
-		}
-	}
-
-	return NULL;
-}
-
 static phandle live_tree_max_phandle(void)
 {
 	struct device_node *node;
@@ -138,7 +114,7 @@ static int update_usages_of_a_phandle_reference(struct device_node *overlay,
 		if (err)
 			goto err_fail;
 
-		refnode = find_node_by_full_name(overlay, node_path);
+		refnode = __of_find_node_by_full_path(overlay, node_path);
 		if (!refnode)
 			continue;
 
-- 
2.11.0
