From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] Revert "of: fix handling of '/' in options for of_find_node_by_path()"
Date: Tue, 17 Mar 2015 16:14:52 +0000
Message-ID: <1426608893-3739-2-git-send-email-leif.lindholm@linaro.org>
References: <1426608893-3739-1-git-send-email-leif.lindholm@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426608893-3739-1-git-send-email-leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This reverts commit 106937e8ccdc
("of: fix handling of '/' in options for of_find_node_by_path()")

This fix breaks handling of strings containing both ':' and '/'.

Signed-off-by: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Fixes: 106937e8ccdc
---
 drivers/of/base.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index adb8764..3b1aa08 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -714,17 +714,16 @@ static struct device_node *__of_find_node_by_path(struct device_node *parent,
 						const char *path)
 {
 	struct device_node *child;
-	int len;
-	const char *end;
+	int len = strchrnul(path, '/') - path;
+	int term;
 
-	end = strchr(path, ':');
-	if (!end)
-		end = strchrnul(path, '/');
-
-	len = end - path;
 	if (!len)
 		return NULL;
 
+	term = strchrnul(path, ':') - path;
+	if (term < len)
+		len = term;
+
 	__for_each_child_of_node(parent, child) {
 		const char *name = strrchr(child->full_name, '/');
 		if (WARN(!name, "malformed device_node %s\n", child->full_name))
@@ -769,12 +768,8 @@ struct device_node *of_find_node_opts_by_path(const char *path, const char **opt
 
 	/* The path could begin with an alias */
 	if (*path != '/') {
-		int len;
-		const char *p = separator;
-
-		if (!p)
-			p = strchrnul(path, '/');
-		len = p - path;
+		char *p = strchrnul(path, '/');
+		int len = separator ? separator - path : p - path;
 
 		/* of_aliases must not be NULL */
 		if (!of_aliases)
@@ -799,8 +794,6 @@ struct device_node *of_find_node_opts_by_path(const char *path, const char **opt
 		path++; /* Increment past '/' delimiter */
 		np = __of_find_node_by_path(np, path);
 		path = strchrnul(path, '/');
-		if (separator && separator < path)
-			break;
 	}
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	return np;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
