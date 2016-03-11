From: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Subject: [RFC 5/8] drivers/of: rename __of_find_all_nodes and export it
Date: Fri, 11 Mar 2016 16:56:12 +0100
Message-ID: <1457711775-6326-6-git-send-email-franck.jullien@odyssee-systemes.fr>
References: <1457711775-6326-1-git-send-email-franck.jullien@odyssee-systemes.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457711775-6326-1-git-send-email-franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In order to export __of_find_all_nodes, we need to rename it.
It is now of_walk_to_all_nodes.

Signed-off-by: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
---
 drivers/of/base.c  |    5 +++--
 include/linux/of.h |    4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index fd75a45..331141b 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -245,7 +245,7 @@ struct property *of_find_property(const struct device_node *np,
 }
 EXPORT_SYMBOL(of_find_property);
 
-struct device_node *__of_find_all_nodes(struct device_node *prev)
+struct device_node *of_walk_to_all_nodes(struct device_node *prev)
 {
 	struct device_node *np;
 	if (!prev) {
@@ -261,6 +261,7 @@ struct device_node *__of_find_all_nodes(struct device_node *prev)
 	}
 	return np;
 }
+EXPORT_SYMBOL(of_walk_to_all_nodes);
 
 /**
  * of_find_all_nodes - Get next node in global list
@@ -276,7 +277,7 @@ struct device_node *of_find_all_nodes(struct device_node *prev)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
-	np = __of_find_all_nodes(prev);
+	np = of_walk_to_all_nodes(prev);
 	of_node_get(np);
 	of_node_put(prev);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
diff --git a/include/linux/of.h b/include/linux/of.h
index d6c31fd..883df55 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -188,7 +188,7 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 	clear_bit(flag, &p->_flags);
 }
 
-extern struct device_node *__of_find_all_nodes(struct device_node *prev);
+extern struct device_node *of_walk_to_all_nodes(struct device_node *prev);
 extern struct device_node *of_find_all_nodes(struct device_node *prev);
 
 /*
@@ -237,7 +237,7 @@ static inline const char *of_node_full_name(const struct device_node *np)
 }
 
 #define for_each_of_allnodes_from(from, dn) \
-	for (dn = __of_find_all_nodes(from); dn; dn = __of_find_all_nodes(dn))
+	for (dn = of_walk_to_all_nodes(from); dn; dn = of_walk_to_all_nodes(dn))
 #define for_each_of_allnodes(dn) for_each_of_allnodes_from(NULL, dn)
 extern struct device_node *of_find_node_by_name(struct device_node *from,
 	const char *name);
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
