From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] of: handle NULL node in next_child iterators
Date: Wed, 28 May 2014 10:39:02 -0700
Message-ID: <1401298742-23235-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add an early check for the node argument in __of_get_next_child and
of_get_next_available_child() to avoid dereferencing a NULL node pointer
a few lines after.

CC: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Changes in v2:
- also fix __of_get_next_child against NULL node argument

 drivers/of/base.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index e67b308819c9..567e6e1b7921 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -700,6 +700,9 @@ static struct device_node *__of_get_next_child(const struct device_node *node,
 {
 	struct device_node *next;
 
+	if (!node)
+		return NULL;
+
 	next = prev ? prev->sibling : node->child;
 	for (; next; next = next->sibling)
 		if (of_node_get(next))
@@ -746,6 +749,9 @@ struct device_node *of_get_next_available_child(const struct device_node *node,
 	struct device_node *next;
 	unsigned long flags;
 
+	if (!node)
+		return NULL;
+
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	next = prev ? prev->sibling : node->child;
 	for (; next; next = next->sibling) {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
