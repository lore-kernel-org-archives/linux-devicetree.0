From: Ilkka Koskinen <ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH] of: Add empty of_get_next_parent() for !OF
Date: Wed, 29 Apr 2015 15:44:39 -0700
Message-ID: <1430347479-1715-1-git-send-email-ilkka.koskinen@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ilkka Koskinen <ilkka.koskinen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

Add an empty version of of_get_next_parent() in order to avoid
build error.

Signed-off-by: Ilkka Koskinen <ilkka.koskinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 include/linux/of.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index dfde07e..416158f 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -425,6 +425,11 @@ static inline struct device_node *of_get_parent(const struct device_node *node)
 	return NULL;
 }
 
+static inline struct device_node *of_get_next_parent(struct device_node *node)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_get_next_child(
 	const struct device_node *node, struct device_node *prev)
 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
