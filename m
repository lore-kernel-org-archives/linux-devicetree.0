From: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v3 PATCH 1/5] of: Add standard property for poweroff capability
Date: Tue, 14 Oct 2014 06:31:09 +0000
Message-ID: <1413268273-15151-1-git-send-email-romain.perier@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Several drivers create their own devicetree property when they register
poweroff capabilities. This is for example the case for mfd, regulator
or power drivers which define "vendor,system-power-controller" property.
This patch adds support for a standard property "poweroff-source"
which marks the device as able to shutdown the system.

Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 include/linux/of.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 6545e7a..27b3ba1 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -866,4 +866,15 @@ static inline int of_changeset_update_property(struct of_changeset *ocs,
 /* CONFIG_OF_RESOLVE api */
 extern int of_resolve_phandles(struct device_node *tree);
 
+/**
+ * of_system_has_poweroff_source - Tells if poweroff-source is found for device_node
+ * @np: Pointer to the given device_node
+ *
+ * return true if present false otherwise
+ */
+static inline bool of_system_has_poweroff_source(const struct device_node *np)
+{
+	return of_property_read_bool(np, "poweroff-source");
+}
+
 #endif /* _LINUX_OF_H */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
