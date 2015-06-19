From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dt/fdt: add empty versions of early_init_dt_*_memory_arch
Date: Thu, 18 Jun 2015 21:33:07 -0500
Message-ID: <1434681187-14752-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

With the addition of commit 0166dc1 (of: make CONFIG_OF user
selectable), architectures which don't enable memblock and don't
have their own early_init_dt_*_memory_arch implementations will break
when CONFIG_OF is enabled.

Really, we should have better separation of CONFIG_OF and
CONFIG_OF_EARLY_FLATTREE, but doing that will require quite a bit of
shuffling of architecture code. That will have to wait for another day.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/fdt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 9628c4a..0e314ba 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1015,6 +1015,11 @@ void * __init __weak early_init_dt_alloc_memory_arch(u64 size, u64 align)
 	return __va(memblock_alloc(size, align));
 }
 #else
+void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
+{
+	WARN_ON(1);
+}
+
 int __init __weak early_init_dt_reserve_memory_arch(phys_addr_t base,
 					phys_addr_t size, bool nomap)
 {
@@ -1022,6 +1027,12 @@ int __init __weak early_init_dt_reserve_memory_arch(phys_addr_t base,
 		  &base, &size, nomap ? " (nomap)" : "");
 	return -ENOSYS;
 }
+
+void * __init __weak early_init_dt_alloc_memory_arch(u64 size, u64 align)
+{
+	WARN_ON(1);
+	return NULL;
+}
 #endif
 
 bool __init early_init_dt_verify(void *params)
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
