From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH v2 2/4] of: make __of_attach_node() static
Date: Mon, 24 Apr 2017 23:20:08 -0700
Message-ID: <1493101210-11745-3-git-send-email-frowand.list@gmail.com>
References: <1493101210-11745-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493101210-11745-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

__of_attach_node() is not used outside of drivers/of/dynamic.c.  Make
it static and remove it from drivers/of/of_private.h.

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 drivers/of/dynamic.c    | 2 +-
 drivers/of/of_private.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 59545b8fbf46..0b9cf6d5914c 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -216,7 +216,7 @@ int of_property_notify(int action, struct device_node *np,
 	return of_reconfig_notify(action, &pr);
 }
 
-void __of_attach_node(struct device_node *np)
+static void __of_attach_node(struct device_node *np)
 {
 	np->child = NULL;
 	np->sibling = np->parent->child;
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 33f11a5384f3..b1ff70e1fdda 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -79,7 +79,6 @@ extern int __of_update_property(struct device_node *np,
 extern void __of_update_property_sysfs(struct device_node *np,
 		struct property *newprop, struct property *oldprop);
 
-extern void __of_attach_node(struct device_node *np);
 extern int __of_attach_node_sysfs(struct device_node *np);
 extern void __of_detach_node(struct device_node *np);
 extern void __of_detach_node_sysfs(struct device_node *np);
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
