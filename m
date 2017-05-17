From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of: fdt: add missing allocation-failure check
Date: Wed, 17 May 2017 17:29:09 +0200
Message-ID: <20170517152909.13553-1-johan@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The memory allocator passed to __unflatten_device_tree() (e.g. a wrapped
kzalloc) can fail so add the missing sanity check to avoid dereferencing
a NULL pointer.

Fixes: fe14042358fa ("of/flattree: Refactor unflatten_device_tree and add fdt_unflatten_tree")
Cc: stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>     # 2.6.38
Signed-off-by: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/fdt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 3080d9dd031d..43bd69dceabf 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -507,6 +507,9 @@ void *__unflatten_device_tree(const void *blob,
 
 	/* Allocate memory for the expanded device tree */
 	mem = dt_alloc(size + 4, __alignof__(struct device_node));
+	if (!mem)
+		return NULL;
+
 	memset(mem, 0, size);
 
 	*(__be32 *)(mem + size) = cpu_to_be32(0xdeadbeef);
-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
