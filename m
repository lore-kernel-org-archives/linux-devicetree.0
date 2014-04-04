From: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCHv2] of: fix of_update_property again
Date: Fri, 4 Apr 2014 16:52:31 +0800
Message-ID: <1396601551-26857-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The of_update_property() is intented to update a property in a node
and if the property does not exist, will add it.

The second search of the property is possibly won't be found, that
maybe removed by other thread just before the second search begain.

Using the __of_find_property() and __of_add_property() instead and
move them into lock operations.

Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/of/base.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 418a4ff9..a2ecf71 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1767,7 +1767,7 @@ int of_update_property(struct device_node *np, struct property *newprop)
 {
 	struct property **next, *oldprop;
 	unsigned long flags;
-	int rc, found = 0;
+	int rc;
 
 	rc = of_property_notify(OF_RECONFIG_UPDATE_PROPERTY, np, newprop);
 	if (rc)
@@ -1776,23 +1776,24 @@ int of_update_property(struct device_node *np, struct property *newprop)
 	if (!newprop->name)
 		return -EINVAL;
 
-	oldprop = of_find_property(np, newprop->name, NULL);
-	if (!oldprop)
-		return of_add_property(np, newprop);
-
 	raw_spin_lock_irqsave(&devtree_lock, flags);
-	next = &np->properties;
-	while (*next) {
-		if (*next == oldprop) {
-			/* found the node */
-			newprop->next = oldprop->next;
-			*next = newprop;
-			oldprop->next = np->deadprops;
-			np->deadprops = oldprop;
-			found = 1;
-			break;
+	oldprop = __of_find_property(np, newprop->name, NULL);
+	if (!oldprop) {
+		/* add the new node */
+		rc = __of_add_property(np, newprop);
+	} else {
+		/* found the node and then replace it */
+		next = &np->properties;
+		while (*next) {
+			if (*next == oldprop) {
+				newprop->next = oldprop->next;
+				*next = newprop;
+				oldprop->next = np->deadprops;
+				np->deadprops = oldprop;
+				break;
+			}
+			next = &(*next)->next;
 		}
-		next = &(*next)->next;
 	}
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	if (rc)
@@ -1803,9 +1804,6 @@ int of_update_property(struct device_node *np, struct property *newprop)
 		sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
 	__of_add_property_sysfs(np, newprop);
 
-	if (!found)
-		return -ENODEV;
-
 	return 0;
 }
 
-- 
1.8.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
