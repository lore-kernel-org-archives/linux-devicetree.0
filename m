From: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] drivers/of/fdt.c: replace pr_warning by pr_warn
Date: Mon, 27 Jul 2015 01:49:04 +0000
Message-ID: <1437961744-197158-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, wanglong-m92B/FuLcaEcWVvVuXF20w@public.gmane.org, long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Update the last pr_warning callsite in drivers/of.
When we use script "./scripts/checkpatch.pl" to check
a patch, using pr_warning will produce WARNING:

        WARNING: Prefer pr_warn(... to pr_warning(...
        #22: FILE: drivers/of/fdt.c:428:
        +               pr_warning("End of tree marker overwritten: %08x\n",

So,we should convert pr_warning to pr_warn.

Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 drivers/of/fdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 0749656..e1f61b8 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -425,7 +425,7 @@ static void __unflatten_device_tree(const void *blob,
 	start = 0;
 	unflatten_dt_node(blob, mem, &start, NULL, mynodes, 0, false);
 	if (be32_to_cpup(mem + size) != 0xdeadbeef)
-		pr_warning("End of tree marker overwritten: %08x\n",
+		pr_warn("End of tree marker overwritten: %08x\n",
 			   be32_to_cpup(mem + size));
 
 	pr_debug(" <- unflatten_device_tree()\n");
@@ -985,24 +985,24 @@ void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
 	size &= PAGE_MASK;
 
 	if (base > MAX_PHYS_ADDR) {
-		pr_warning("Ignoring memory block 0x%llx - 0x%llx\n",
+		pr_warn("Ignoring memory block 0x%llx - 0x%llx\n",
 				base, base + size);
 		return;
 	}
 
 	if (base + size - 1 > MAX_PHYS_ADDR) {
-		pr_warning("Ignoring memory range 0x%llx - 0x%llx\n",
+		pr_warn("Ignoring memory range 0x%llx - 0x%llx\n",
 				((u64)MAX_PHYS_ADDR) + 1, base + size);
 		size = MAX_PHYS_ADDR - base + 1;
 	}
 
 	if (base + size < phys_offset) {
-		pr_warning("Ignoring memory block 0x%llx - 0x%llx\n",
+		pr_warn("Ignoring memory block 0x%llx - 0x%llx\n",
 			   base, base + size);
 		return;
 	}
 	if (base < phys_offset) {
-		pr_warning("Ignoring memory range 0x%llx - 0x%llx\n",
+		pr_warn("Ignoring memory range 0x%llx - 0x%llx\n",
 			   base, phys_offset);
 		size -= phys_offset - base;
 		base = phys_offset;
-- 
1.8.3.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
