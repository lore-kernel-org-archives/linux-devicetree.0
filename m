From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 01/21] MIPS memblock: Unpin dts memblock sanity check method
Date: Mon, 19 Dec 2016 05:07:26 +0300
Message-ID: <1482113266-13207-2-git-send-email-fancer.lancer@gmail.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

It's necessary to check whether retrieved from dts memory regions
fits to page alignment and limits restrictions. Sometimes it is
necessary to perform the same checks, but ito add the memory regions
into a different subsystem. MIPS is going to be that case.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/of/fdt.c       | 47 +++++++++++++++++++++++---------
 include/linux/of_fdt.h |  1 +
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 1f98156..1ee958f 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -983,44 +983,65 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 #define MAX_MEMBLOCK_ADDR	((phys_addr_t)~0)
 #endif
 
-void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
+int __init sanity_check_dt_memory(phys_addr_t *out_base,
+				  phys_addr_t *out_size)
 {
+	phys_addr_t base = *out_base, size = *out_size;
 	const u64 phys_offset = MIN_MEMBLOCK_ADDR;
 
 	if (!PAGE_ALIGNED(base)) {
 		if (size < PAGE_SIZE - (base & ~PAGE_MASK)) {
-			pr_warn("Ignoring memory block 0x%llx - 0x%llx\n",
+			pr_err("Memblock 0x%llx - 0x%llx isn't page aligned\n",
 				base, base + size);
-			return;
+			return -EINVAL;
 		}
+		pr_warn("Memblock 0x%llx - 0x%llx shifted to ",
+			base, base + size);
 		size -= PAGE_SIZE - (base & ~PAGE_MASK);
 		base = PAGE_ALIGN(base);
+		pr_cont("0x%llx - 0x%llx\n", base, base + size);
 	}
 	size &= PAGE_MASK;
 
 	if (base > MAX_MEMBLOCK_ADDR) {
-		pr_warning("Ignoring memory block 0x%llx - 0x%llx\n",
-				base, base + size);
-		return;
+		pr_err("Memblock 0x%llx - 0x%llx exceeds max address\n",
+			base, base + size);
+		return -EINVAL;
 	}
 
 	if (base + size - 1 > MAX_MEMBLOCK_ADDR) {
-		pr_warning("Ignoring memory range 0x%llx - 0x%llx\n",
-				((u64)MAX_MEMBLOCK_ADDR) + 1, base + size);
+		pr_warn("Memblock 0x%llx - 0x%llx truncated to ",
+			base, base + size);
 		size = MAX_MEMBLOCK_ADDR - base + 1;
+		pr_cont("0x%llx - 0x%llx\n", base, base + size);
 	}
 
 	if (base + size < phys_offset) {
-		pr_warning("Ignoring memory block 0x%llx - 0x%llx\n",
-			   base, base + size);
-		return;
+		pr_err("Memblock 0x%llx - 0x%llx is below phys offset\n",
+			base, base + size);
+		return -EINVAL;
 	}
+
 	if (base < phys_offset) {
-		pr_warning("Ignoring memory range 0x%llx - 0x%llx\n",
-			   base, phys_offset);
+		pr_warn("Memblock 0x%llx - 0x%llx truncated to ",
+			base, base + size);
 		size -= phys_offset - base;
 		base = phys_offset;
+		pr_cont("0x%llx - 0x%llx\n", base, base + size);
 	}
+
+	/* Set the output base address and size */
+	*out_base = base;
+	*out_size = size;
+
+	return 0;
+}
+
+void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
+{
+	if (sanity_check_dt_memory(&base, &size))
+		return;
+
 	memblock_add(base, size);
 }
 
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index df9ef38..ddf93c5 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -84,6 +84,7 @@ extern const void *of_flat_dt_match_machine(const void *default_match,
 		const void * (*get_next_compat)(const char * const**));
 
 /* Other Prototypes */
+extern int sanity_check_dt_memory(phys_addr_t *base, phys_addr_t *size);
 extern void unflatten_device_tree(void);
 extern void unflatten_and_copy_device_tree(void);
 extern void early_init_devtree(void *);
-- 
2.6.6
