From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] of: fix handling of '/' in paths with options
Date: Tue, 17 Mar 2015 16:14:53 +0000
Message-ID: <1426608893-3739-3-git-send-email-leif.lindholm@linaro.org>
References: <1426608893-3739-1-git-send-email-leif.lindholm@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426608893-3739-1-git-send-email-leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Ensure proper handling of paths with appended options (after ':'),
where those options may contain a '/'.

Fixes: 7914a7c5651a ("of: support passing console options with stdout-path")
Reported-by: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Tested-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/base.c     | 21 +++++++++++++--------
 drivers/of/unittest.c |  5 +++++
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 3b1aa08..2ee7265 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -714,16 +714,15 @@ static struct device_node *__of_find_node_by_path(struct device_node *parent,
 						const char *path)
 {
 	struct device_node *child;
-	int len = strchrnul(path, '/') - path;
-	int term;
+	int len;
+	const char *p1, *p2;
 
+	p1 = strchrnul(path, ':');
+	p2 = strchrnul(path, '/');
+	len = (p1 < p2 ? p1 : p2) - path;
 	if (!len)
 		return NULL;
 
-	term = strchrnul(path, ':') - path;
-	if (term < len)
-		len = term;
-
 	__for_each_child_of_node(parent, child) {
 		const char *name = strrchr(child->full_name, '/');
 		if (WARN(!name, "malformed device_node %s\n", child->full_name))
@@ -768,8 +767,12 @@ struct device_node *of_find_node_opts_by_path(const char *path, const char **opt
 
 	/* The path could begin with an alias */
 	if (*path != '/') {
-		char *p = strchrnul(path, '/');
-		int len = separator ? separator - path : p - path;
+		int len;
+		const char *p = separator;
+
+		if (!p)
+			p = strchrnul(path, '/');
+		len = p - path;
 
 		/* of_aliases must not be NULL */
 		if (!of_aliases)
@@ -794,6 +797,8 @@ struct device_node *of_find_node_opts_by_path(const char *path, const char **opt
 		path++; /* Increment past '/' delimiter */
 		np = __of_find_node_by_path(np, path);
 		path = strchrnul(path, '/');
+		if (separator && separator < path)
+			break;
 	}
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	return np;
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index aba8946..8d94349 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -97,6 +97,11 @@ static void __init of_selftest_find_node_by_name(void)
 		 "option path test, subcase #1 failed\n");
 	of_node_put(np);
 
+	np = of_find_node_opts_by_path("/testcase-data/phandle-tests:test/option", &options);
+	selftest(np && !strcmp("test/option", options),
+		 "option path test, subcase #2 failed\n");
+	of_node_put(np);
+
 	np = of_find_node_opts_by_path("/testcase-data:testoption", NULL);
 	selftest(np, "NULL option path test failed\n");
 	of_node_put(np);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
