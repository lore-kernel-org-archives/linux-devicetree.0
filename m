From: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCHv3] of: fix of_update_property again
Date: Thu, 17 Apr 2014 15:48:29 +0800
Message-ID: <1397720909-24774-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The of_update_property() is intented to update a property in a node
and if the property does not exist, will add it.

The second search of the property is possibly won't be found, that
maybe removed by other thread just before the second search begain.

Using the __of_find_property() and __of_add_property() instead and
move them into lock operations.

Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/of/base.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index be2861d..06623d0c 100644
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
@@ -1776,20 +1776,19 @@ int of_update_property(struct device_node *np, struct property *newprop)
 	if (!newprop->name)
 		return -EINVAL;
 
-	oldprop = of_find_property(np, newprop->name, NULL);
-	if (!oldprop)
-		return of_add_property(np, newprop);
-
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	next = &np->properties;
-	while (*next) {
+	oldprop = __of_find_property(np, newprop->name, NULL);
+	if (!oldprop) {
+		/* add the new node */
+		rc = __of_add_property(np, newprop);
+	} else while (*next) {
+		/* found the node and then replace it */
 		if (*next == oldprop) {
-			/* found the node */
 			newprop->next = oldprop->next;
 			*next = newprop;
 			oldprop->next = np->deadprops;
 			np->deadprops = oldprop;
-			found = 1;
 			break;
 		}
 		next = &(*next)->next;
@@ -1803,9 +1802,6 @@ int of_update_property(struct device_node *np, struct property *newprop)
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
