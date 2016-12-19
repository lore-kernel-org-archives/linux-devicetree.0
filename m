From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/21] MIPS memblock: Add dts mem and reserved-mem callbacks
Date: Mon, 19 Dec 2016 05:07:27 +0300
Message-ID: <1482113266-13207-3-git-send-email-fancer.lancer@gmail.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482113266-13207-1-git-send-email-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, rabinv-VrBV9hrLPhE@public.gmane.org, matt.redfearn-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In order to get a structured table of platform devices, it is
widespread amongst modern systems to use fdt'es.
MIPS should support one as well. Particularly /memory/ and
/reserved-memory/ should be analyzed and corresponding regions
registered with memblock subsystem.

Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/kernel/prom.c | 32 ++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
index 5fcec30..f21eb8c 100644
--- a/arch/mips/kernel/prom.c
+++ b/arch/mips/kernel/prom.c
@@ -17,6 +17,7 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
+#include <linux/memblock.h>
 
 #include <asm/bootinfo.h>
 #include <asm/page.h>
@@ -41,7 +42,36 @@ char *mips_get_machine_name(void)
 #ifdef CONFIG_USE_OF
 void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 {
-	return add_memory_region(base, size, BOOT_MEM_RAM);
+	/* Check whether specified region is well formed */
+	if (sanity_check_dt_memory(&base, &size))
+		return;
+
+	/* Memory region should be in boot_mem_map, so use the old method */
+	add_memory_region(base, size, BOOT_MEM_RAM);
+}
+
+int __init early_init_dt_reserve_memory_arch(phys_addr_t base,
+					     phys_addr_t size, bool nomap)
+{
+	/*
+	 * NOTE We don't use add_memory_region() method here, since fdt
+	 * reserved-memory regions are declared within already added memory,
+	 * while boot_mem_map consists of unique regions
+	 */
+
+	/* Check whether region is free. If so just ignore it */
+	if (memblock_is_region_reserved(base, size)) {
+		pr_err("FDT reserve-node %08zx @ %pa overlaps in-use memory\n",
+			(size_t)size, &base);
+		return -EBUSY;
+	}
+
+	/* If it can be mapped, then just reserve the region */
+	if (!nomap)
+		return memblock_reserve(base, size);
+
+	/* Completely remove region if it shouldn't be mapped */
+	return memblock_remove(base, size);
 }
 
 void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
-- 
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
