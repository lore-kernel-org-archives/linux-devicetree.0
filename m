From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2 v2] kernel/resource: Invalid memory access in __release_resource
Date: Tue, 21 Apr 2015 10:25:01 +0200
Message-ID: <1429604702-14157-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When a resource is initialized via of_platform_populate.
resource->parent is initialized to NULL via kzalloc.
(of_platform_populate->of_device_alloc->of_address_to_resource)

If of_platform_depopulate is called later, resource->parent is
accessed (Offset 0x30 of address 0), causing a kernel error.

This patch evaluates resouce->parent before accessing it. If it
is not initialized, -EACCESS is returned.

Also a WARN is thrown, so the developer can have a hint about what
needs to be fixed.

Fixes:
BUG: unable to handle kernel NULL pointer deference at 0000000000000030
IP: release_resource+0x26/0x90
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 kernel/resource.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/resource.c b/kernel/resource.c
index 90552aa..b7b270f 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -237,6 +237,9 @@ static int __release_resource(struct resource *old)
 {
 	struct resource *tmp, **p;
 
+	if (WARN_ON(!old->parent))
+		return -EINVAL;
+
 	p = &old->parent->child;
 	for (;;) {
 		tmp = *p;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
