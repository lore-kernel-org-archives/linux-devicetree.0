From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 02/10] of: rename of_aliases_mutex to just of_mutex
Date: Wed, 23 Jul 2014 17:44:16 -0600
Message-ID: <1406159064-21366-3-git-send-email-grant.likely@linaro.org>
References: <1406159064-21366-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406159064-21366-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>, Tyrel Datwyler <turtle.in.the.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

We're overloading usage of of_aliases_mutex for sysfs changes,
so rename to something that is more generic.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/base.c       | 19 +++++++++----------
 drivers/of/device.c     |  4 ++--
 drivers/of/of_private.h |  2 +-
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index b9864806e9b8..e48a1b90a392 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -40,10 +40,9 @@ static struct device_node *of_stdout;
 static struct kset *of_kset;
 
 /*
- * Used to protect the of_aliases; but also overloaded to hold off addition of
- * nodes to sysfs
+ * Used to protect the of_aliases, to hold off addition of nodes to sysfs
  */
-DEFINE_MUTEX(of_aliases_mutex);
+DEFINE_MUTEX(of_mutex);
 
 /* use when traversing tree through the allnext, child, sibling,
  * or parent members of struct device_node.
@@ -255,13 +254,13 @@ int of_node_add(struct device_node *np)
 	 * Grab the mutex here so that in a race condition between of_init() and
 	 * of_node_add(), node addition will still be consistent.
 	 */
-	mutex_lock(&of_aliases_mutex);
+	mutex_lock(&of_mutex);
 	if (of_kset)
 		rc = __of_node_add(np);
 	else
 		/* This scenario may be perfectly valid, but report it anyway */
 		pr_info("of_node_add(%s) before of_init()\n", np->full_name);
-	mutex_unlock(&of_aliases_mutex);
+	mutex_unlock(&of_mutex);
 	return rc;
 }
 
@@ -289,15 +288,15 @@ static int __init of_init(void)
 	struct device_node *np;
 
 	/* Create the kset, and register existing nodes */
-	mutex_lock(&of_aliases_mutex);
+	mutex_lock(&of_mutex);
 	of_kset = kset_create_and_add("devicetree", NULL, firmware_kobj);
 	if (!of_kset) {
-		mutex_unlock(&of_aliases_mutex);
+		mutex_unlock(&of_mutex);
 		return -ENOMEM;
 	}
 	for_each_of_allnodes(np)
 		__of_node_add(np);
-	mutex_unlock(&of_aliases_mutex);
+	mutex_unlock(&of_mutex);
 
 	/* Symlink in /proc as required by userspace ABI */
 	if (of_allnodes)
@@ -2122,7 +2121,7 @@ int of_alias_get_id(struct device_node *np, const char *stem)
 	struct alias_prop *app;
 	int id = -ENODEV;
 
-	mutex_lock(&of_aliases_mutex);
+	mutex_lock(&of_mutex);
 	list_for_each_entry(app, &aliases_lookup, link) {
 		if (strcmp(app->stem, stem) != 0)
 			continue;
@@ -2132,7 +2131,7 @@ int of_alias_get_id(struct device_node *np, const char *stem)
 			break;
 		}
 	}
-	mutex_unlock(&of_aliases_mutex);
+	mutex_unlock(&of_mutex);
 
 	return id;
 }
diff --git a/drivers/of/device.c b/drivers/of/device.c
index dafb9736ab9b..46d6c75c1404 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -160,7 +160,7 @@ void of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
 	add_uevent_var(env, "OF_COMPATIBLE_N=%d", seen);
 
 	seen = 0;
-	mutex_lock(&of_aliases_mutex);
+	mutex_lock(&of_mutex);
 	list_for_each_entry(app, &aliases_lookup, link) {
 		if (dev->of_node == app->np) {
 			add_uevent_var(env, "OF_ALIAS_%d=%s", seen,
@@ -168,7 +168,7 @@ void of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
 			seen++;
 		}
 	}
-	mutex_unlock(&of_aliases_mutex);
+	mutex_unlock(&of_mutex);
 }
 
 int of_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env)
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index ff350c8fa7ac..fcc70e74dfe0 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -31,6 +31,6 @@ struct alias_prop {
 	char stem[0];
 };
 
-extern struct mutex of_aliases_mutex;
+extern struct mutex of_mutex;
 extern struct list_head aliases_lookup;
 #endif /* _LINUX_OF_PRIVATE_H */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
