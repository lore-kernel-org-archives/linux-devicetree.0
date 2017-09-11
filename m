From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH 2/2] of: provide inline helper for of_find_device_by_node
Date: Mon, 11 Sep 2017 22:07:50 +0200
Message-ID: <20170911200805.3363318-2-arnd@arndb.de>
References: <20170911200805.3363318-1-arnd@arndb.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170911200805.3363318-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The ipmmu-vmsa driver fails in compile-testing on non-OF platforms:

drivers/iommu/ipmmu-vmsa.o: In function `ipmmu_of_xlate':
ipmmu-vmsa.c:(.text+0x740): undefined reference to `of_find_device_by_node'

It would be reasonable to assume that this interface works but
returns failure on non-OF builds, like it does on machines that
have been booted in another way, so this adds another inline
function helper.

Fixes: 7b2d59611fef ("iommu/ipmmu-vmsa: Replace local utlb code with fwspec ids")
Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 include/linux/of_platform.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index e0d1946270f3..fb908e598348 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -57,7 +57,14 @@ extern const struct of_device_id of_default_bus_match_table[];
 extern struct platform_device *of_device_alloc(struct device_node *np,
 					 const char *bus_id,
 					 struct device *parent);
+#ifdef CONFIG_OF
 extern struct platform_device *of_find_device_by_node(struct device_node *np);
+#else
+static inline struct platform_device *of_find_device_by_node(struct device_node *np)
+{
+	return NULL;
+}
+#endif
 
 /* Platform devices and busses creation */
 extern struct platform_device *of_platform_device_create(struct device_node *np,
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
