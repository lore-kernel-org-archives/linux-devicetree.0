From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/4] of: use kbasename instead of open coding
Date: Wed, 14 Jun 2017 15:30:22 -0500
Message-ID: <20170614203025.7581-2-robh@kernel.org>
References: <20170614203025.7581-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170614203025.7581-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Several places in DT code open code the equivalent of kbasename.
Replace them.

The behavior for root nodes in node_name_cmp will be slightly different.
Instead of comparing "/", "" will be compared. The comparison will be
the same.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/base.c     | 5 +----
 drivers/of/platform.c | 2 +-
 drivers/of/resolver.c | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 28d5f53bc631..054159ccd5f8 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -773,10 +773,7 @@ static struct device_node *__of_find_node_by_path(struct device_node *parent,
 		return NULL;
 
 	__for_each_child_of_node(parent, child) {
-		const char *name = strrchr(child->full_name, '/');
-		if (WARN(!name, "malformed device_node %s\n", child->full_name))
-			continue;
-		name++;
+		const char *name = kbasename(child->full_name);
 		if (strncmp(path, name, len) == 0 && (strlen(name) == len))
 			return child;
 	}
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 71fecc2debfc..8f73413fa243 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -99,7 +99,7 @@ static void of_device_make_bus_id(struct device *dev)
 
 		/* format arguments only used if dev_name() resolves to NULL */
 		dev_set_name(dev, dev_name(dev) ? "%s:%s" : "%s",
-			     strrchr(node->full_name, '/') + 1, dev_name(dev));
+			     kbasename(node->full_name), dev_name(dev));
 		node = node->parent;
 	}
 }
diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 771f4844c781..63626d7d9adb 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -165,8 +165,8 @@ static int update_usages_of_a_phandle_reference(struct device_node *overlay,
 static int node_name_cmp(const struct device_node *dn1,
 		const struct device_node *dn2)
 {
-	const char *n1 = strrchr(dn1->full_name, '/') ? : "/";
-	const char *n2 = strrchr(dn2->full_name, '/') ? : "/";
+	const char *n1 = kbasename(dn1->full_name);
+	const char *n2 = kbasename(dn2->full_name);
 
 	return of_node_cmp(n1, n2);
 }
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
