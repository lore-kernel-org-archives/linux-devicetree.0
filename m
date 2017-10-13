From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of/fdt: Document detached argument to __unflatten_device_tree()
Date: Fri, 13 Oct 2017 00:41:29 -0700
Message-ID: <20171013074129.13109-1-stephen.boyd@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This wasn't documented.

Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/fdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index ce30c9a588a4..4ea4dad13707 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -467,6 +467,7 @@ static int unflatten_dt_nodes(const void *blob,
  * @mynodes: The device_node tree created by the call
  * @dt_alloc: An allocator that provides a virtual address to memory
  * for the resulting tree
+ * @detached: if true set OF_DETACHED on @mynodes
  *
  * Returns NULL on failure or the memory chunk containing the unflattened
  * device tree on success.
-- 
2.14.GIT

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
