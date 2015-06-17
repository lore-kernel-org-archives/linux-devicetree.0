From: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] of: define of_find_node_by_phandle for !CONFIG_OF
Date: Wed, 17 Jun 2015 11:53:53 -0500
Message-ID: <1434560033-26681-1-git-send-email-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Define stub implementation for of_find_node_by_phandle() API
so that users of this API can build properly even when CONFIG_OF
is not defined.

Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
---
 include/linux/of.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index ddeaae6d2083..90dfdc47ae26 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -422,6 +422,11 @@ static inline struct device_node *of_find_node_opts_by_path(const char *path,
 	return NULL;
 }
 
+static inline struct device_node *of_find_node_by_phandle(phandle handle)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_get_parent(const struct device_node *node)
 {
 	return NULL;
-- 
2.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
