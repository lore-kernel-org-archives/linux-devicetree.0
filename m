From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 01/14] of: Use vargs in __of_node_alloc
Date: Mon, 24 Nov 2014 22:33:29 +0000
Message-ID: <1416868422-22103-2-git-send-email-grant.likely@linaro.org>
References: <1416868422-22103-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416868422-22103-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The overlay code needs to construct a new full_name from the parent name
and the node name, but the current method has to allocate and then free
an temporary string which is wasteful. Fix this problem by using vargs
to pass in a format and arguments into __of_node_alloc().

At the same time remove the allocflags argument to __of_node_alloc().
The only users all use GFP_KERNEL, so there is no need to provide it as
an option. If there is ever a need later it can be added back.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/dynamic.c    | 16 ++++++++--------
 drivers/of/of_private.h |  2 +-
 drivers/of/unittest.c   |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index d43f3059963b..af1b1ecd6a3d 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -274,33 +274,33 @@ struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
 /**
  * __of_node_alloc() - Create an empty device node dynamically.
  * @full_name:	Full name of the new device node
- * @allocflags:	Allocation flags (typically pass GFP_KERNEL)
  *
  * Create an empty device tree node, suitable for further modification.
  * The node data are dynamically allocated and all the node flags
  * have the OF_DYNAMIC & OF_DETACHED bits set.
  * Returns the newly allocated node or NULL on out of memory error.
  */
-struct device_node *__of_node_alloc(const char *full_name, gfp_t allocflags)
+struct device_node *__of_node_alloc(const char *fmt, ...)
 {
+	va_list vargs;
 	struct device_node *node;
 
-	node = kzalloc(sizeof(*node), allocflags);
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
 	if (!node)
 		return NULL;
-
-	node->full_name = kstrdup(full_name, allocflags);
-	of_node_set_flag(node, OF_DYNAMIC);
-	of_node_set_flag(node, OF_DETACHED);
+	va_start(vargs, fmt);
+	node->full_name = kvasprintf(GFP_KERNEL, fmt, vargs);
+	va_end(vargs);
 	if (!node->full_name)
 		goto err_free;
 
+	of_node_set_flag(node, OF_DYNAMIC);
+	of_node_set_flag(node, OF_DETACHED);
 	of_node_init(node);
 
 	return node;
 
  err_free:
-	kfree(node->full_name);
 	kfree(node);
 	return NULL;
 }
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 858e0a5d9a11..618abcad307e 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -61,7 +61,7 @@ static inline int of_property_notify(int action, struct device_node *np,
  * own the devtree lock or work on detached trees only.
  */
 struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags);
-struct device_node *__of_node_alloc(const char *full_name, gfp_t allocflags);
+__printf(1, 2) struct device_node *__of_node_alloc(const char *fmt, ...);
 
 extern const void *__of_get_property(const struct device_node *np,
 				     const char *name, int *lenp);
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 46af7019d291..7634a17af1d5 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -449,11 +449,11 @@ static void __init of_selftest_changeset(void)
 	struct of_changeset chgset;
 
 	of_changeset_init(&chgset);
-	n1 = __of_node_alloc("/testcase-data/changeset/n1", GFP_KERNEL);
+	n1 = __of_node_alloc("/testcase-data/changeset/n1");
 	selftest(n1, "testcase setup failure\n");
-	n2 = __of_node_alloc("/testcase-data/changeset/n2", GFP_KERNEL);
+	n2 = __of_node_alloc("/testcase-data/changeset/n2");
 	selftest(n2, "testcase setup failure\n");
-	n21 = __of_node_alloc("/testcase-data/changeset/n2/n21", GFP_KERNEL);
+	n21 = __of_node_alloc("/testcase-data/changeset/n2/n21");
 	selftest(n21, "testcase setup failure %p\n", n21);
 	nremove = of_find_node_by_path("/testcase-data/changeset/node-remove");
 	selftest(nremove, "testcase setup failure\n");
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
