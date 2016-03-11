From: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Subject: [RFC 2/8] drivers/of: attach top level tree nodes to sysfs with their name
Date: Fri, 11 Mar 2016 16:56:09 +0100
Message-ID: <1457711775-6326-3-git-send-email-franck.jullien@odyssee-systemes.fr>
References: <1457711775-6326-1-git-send-email-franck.jullien@odyssee-systemes.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457711775-6326-1-git-send-email-franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Nodes without parents are new top level trees. If we want to attach
more than one tree, we need a different name for each top node.

Signed-off-by: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
---
 drivers/of/base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 017dd94..a7ff11f 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -172,7 +172,7 @@ int __of_attach_node_sysfs(struct device_node *np)
 	if (!np->parent) {
 		/* Nodes without parents are new top level trees */
 		rc = kobject_add(&np->kobj, NULL, "%s",
-				 safe_name(&of_kset->kobj, "base"));
+				 safe_name(&of_kset->kobj, np == of_root ? "base" : np->name));
 	} else {
 		name = safe_name(&np->parent->kobj, kbasename(np->full_name));
 		if (!name || !name[0])
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
