From: zijun_hu <zijun_hu-ytc+IHgoah0@public.gmane.org>
Subject: [PATCH 2/2] arm64: regard FDT_SW_MAGIC as good fdt magic
Date: Thu, 1 Sep 2016 18:58:29 +0800
Message-ID: <a6a8826c-3006-ae43-ef4c-8049ef93cd9f@zoho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, zijun_hu-TYsT/PRPW1c@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: zijun_hu <zijun_hu-TYsT/PRPW1c@public.gmane.org>

regard FDT_SW_MAGIC as good fdt magic during mapping fdt area
see fdt_check_header() for details

Signed-off-by: zijun_hu <zijun_hu-TYsT/PRPW1c@public.gmane.org>
---
 arch/arm64/mm/mmu.c                  | 3 ++-
 scripts/dtc/libfdt/fdt.h             | 3 ++-
 scripts/dtc/libfdt/libfdt.h          | 2 ++
 scripts/dtc/libfdt/libfdt_internal.h | 2 --
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 4989948d1feb..83df20509eae 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -716,7 +716,8 @@ void *__init __fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot)
 	create_mapping_noalloc(round_down(dt_phys, SWAPPER_BLOCK_SIZE),
 			dt_virt_base, SWAPPER_BLOCK_SIZE, prot);
 
-	if (fdt_magic(dt_virt) != FDT_MAGIC)
+	if (fdt_magic(dt_virt) != FDT_MAGIC &&
+			fdt_magic(dt_virt) != FDT_SW_MAGIC)
 		return NULL;
 
 	*size = fdt_totalsize(dt_virt);
diff --git a/scripts/dtc/libfdt/fdt.h b/scripts/dtc/libfdt/fdt.h
index 526aedb51556..0e8806327b53 100644
--- a/scripts/dtc/libfdt/fdt.h
+++ b/scripts/dtc/libfdt/fdt.h
@@ -92,7 +92,8 @@ struct fdt_property {
 
 #endif /* !__ASSEMBLY */
 
-#define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
+/* 4: version, 4: total size */
+#define FDT_MAGIC	((fdt32_t)0xd00dfeed)
 #define FDT_TAGSIZE	sizeof(fdt32_t)
 
 #define FDT_BEGIN_NODE	0x1		/* Start node: full name */
diff --git a/scripts/dtc/libfdt/libfdt.h b/scripts/dtc/libfdt/libfdt.h
index 59ca33976e56..6998f9249183 100644
--- a/scripts/dtc/libfdt/libfdt.h
+++ b/scripts/dtc/libfdt/libfdt.h
@@ -54,6 +54,8 @@
 #include "libfdt_env.h"
 #include "fdt.h"
 
+#define FDT_SW_MAGIC           (~FDT_MAGIC)
+
 #define FDT_FIRST_SUPPORTED_VERSION	0x10
 #define FDT_LAST_SUPPORTED_VERSION	0x11
 
diff --git a/scripts/dtc/libfdt/libfdt_internal.h b/scripts/dtc/libfdt/libfdt_internal.h
index 02cfa6fb612d..f4efde0119f2 100644
--- a/scripts/dtc/libfdt/libfdt_internal.h
+++ b/scripts/dtc/libfdt/libfdt_internal.h
@@ -90,6 +90,4 @@ static inline struct fdt_reserve_entry *_fdt_mem_rsv_w(void *fdt, int n)
 	return (void *)(uintptr_t)_fdt_mem_rsv(fdt, n);
 }
 
-#define FDT_SW_MAGIC		(~FDT_MAGIC)
-
 #endif /* _LIBFDT_INTERNAL_H */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
