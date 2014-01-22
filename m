From: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCHv2 1/2] of: add __of_add_property() without lock operations
Date: Wed, 22 Jan 2014 13:57:39 +0800
Message-ID: <1390370260-11273-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There two places will use the same code for adding one new property to
the DT node. Adding __of_add_property() and prepare for fixing
of_update_property()'s bug.

Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/of/base.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index f807d0e..b86b77a 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1469,11 +1469,31 @@ static int of_property_notify(int action, struct device_node *np,
 #endif
 
 /**
+ * __of_add_property - Add a property to a node without lock operations
+ */
+static int __of_add_property(struct device_node *np, struct property *prop)
+{
+	struct property **next;
+
+	prop->next = NULL;
+	next = &np->properties;
+	while (*next) {
+		if (strcmp(prop->name, (*next)->name) == 0)
+			/* duplicate ! don't insert it */
+			return -EEXIST;
+
+		next = &(*next)->next;
+	}
+	*next = prop;
+
+	return 0;
+}
+
+/**
  * of_add_property - Add a property to a node
  */
 int of_add_property(struct device_node *np, struct property *prop)
 {
-	struct property **next;
 	unsigned long flags;
 	int rc;
 
@@ -1481,27 +1501,17 @@ int of_add_property(struct device_node *np, struct property *prop)
 	if (rc)
 		return rc;
 
-	prop->next = NULL;
 	raw_spin_lock_irqsave(&devtree_lock, flags);
-	next = &np->properties;
-	while (*next) {
-		if (strcmp(prop->name, (*next)->name) == 0) {
-			/* duplicate ! don't insert it */
-			raw_spin_unlock_irqrestore(&devtree_lock, flags);
-			return -1;
-		}
-		next = &(*next)->next;
-	}
-	*next = prop;
+	rc = __of_add_property(np, prop);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
 #ifdef CONFIG_PROC_DEVICETREE
 	/* try to add to proc as well if it was initialized */
-	if (np->pde)
+	if (!rc && np->pde)
 		proc_device_tree_add_prop(np->pde, prop);
 #endif /* CONFIG_PROC_DEVICETREE */
 
-	return 0;
+	return rc;
 }
 
 /**
-- 
1.8.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
