From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/4] drivers: dma-contiguous: add initialization from device
 tree
Date: Wed, 02 Jul 2014 12:48:52 +0200
Message-ID: <1404298132-6050-5-git-send-email-m.szyprowski@samsung.com>
References: <1404298132-6050-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1404298132-6050-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Jon Medhurst <tixy@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Tomasz Figa <t.figa@samsung.com>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Paul Mackerras <paulus@samba.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Josh Cartwright <joshc@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Grant Likely <grant.likely@linaro.org>, Laura Abbott <lauraa@codeaurora.org>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>, Michal Nazarewicz <mina86@mina86.com>, Marc <marc.ceeeee@gmail.com>, Nishanth Peethambaran <nishanth.p@gmail.com>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K.V." <aneesh.kumar@linux.v>
List-Id: devicetree@vger.kernel.org

Add a code to create CMA region from reserved memory and add support for
handling 'shared-dma-pool' reserved-memory device tree nodes.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/base/dma-contiguous.c | 67 +++++++++++++++++++++++++++++++++++++++++
 include/linux/cma.h           |  3 ++
 mm/cma.c                      | 69 ++++++++++++++++++++++++++++++++-----------
 3 files changed, 122 insertions(+), 17 deletions(-)

diff --git a/drivers/base/dma-contiguous.c b/drivers/base/dma-contiguous.c
index 6606abdf880c..b77ea8bac176 100644
--- a/drivers/base/dma-contiguous.c
+++ b/drivers/base/dma-contiguous.c
@@ -211,3 +211,70 @@ bool dma_release_from_contiguous(struct device *dev, struct page *pages,
 {
 	return cma_release(dev_get_cma_area(dev), pages, count);
 }
+
+/*
+ * Support for reserved memory regions defined in device tree
+ */
+#ifdef CONFIG_OF_RESERVED_MEM
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
+
+#undef pr_fmt
+#define pr_fmt(fmt) fmt
+
+static void rmem_cma_device_init(struct reserved_mem *rmem, struct device *dev)
+{
+	struct cma *cma = rmem->priv;
+	dev_set_cma_area(dev, cma);
+}
+
+static void rmem_cma_device_release(struct reserved_mem *rmem,
+				    struct device *dev)
+{
+	dev_set_cma_area(dev, NULL);
+}
+
+static const struct reserved_mem_ops rmem_cma_ops = {
+	.device_init	= rmem_cma_device_init,
+	.device_release = rmem_cma_device_release,
+};
+
+static int __init rmem_cma_setup(struct reserved_mem *rmem)
+{
+	phys_addr_t align = PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order);
+	phys_addr_t mask = align - 1;
+	unsigned long node = rmem->fdt_node;
+	struct cma *cma;
+	int err;
+
+	if (!of_get_flat_dt_prop(node, "reusable", NULL) ||
+	    of_get_flat_dt_prop(node, "no-map", NULL))
+		return -EINVAL;
+
+	if ((rmem->base & mask) || (rmem->size & mask)) {
+		pr_err("Reserved memory: incorrect alignment of CMA region\n");
+		return -EINVAL;
+	}
+
+	err = cma_init_reserved_mem(rmem->base, rmem->size, 0, &cma);
+	if (err) {
+		pr_err("Reserved memory: unable to setup CMA region\n");
+		return err;
+	}
+	/* Architecture specific contiguous memory fixup. */
+	dma_contiguous_early_fixup(rmem->base, rmem->size);
+
+	if (of_get_flat_dt_prop(node, "linux,cma-default", NULL))
+		dma_contiguous_set_default(cma);
+
+	rmem->ops = &rmem_cma_ops;
+	rmem->priv = cma;
+
+	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
+		&rmem->base, (unsigned long)rmem->size / SZ_1M);
+
+	return 0;
+}
+RESERVEDMEM_OF_DECLARE(cma, "shared-dma-pool", rmem_cma_setup);
+#endif
diff --git a/include/linux/cma.h b/include/linux/cma.h
index 32cab7a425f9..9a18a2b1934c 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -16,6 +16,9 @@ extern int __init cma_declare_contiguous(phys_addr_t size,
 			phys_addr_t base, phys_addr_t limit,
 			phys_addr_t alignment, unsigned int order_per_bit,
 			bool fixed, struct cma **res_cma);
+extern int cma_init_reserved_mem(phys_addr_t size,
+					phys_addr_t base, int order_per_bit,
+					struct cma **res_cma);
 extern struct page *cma_alloc(struct cma *cma, int count, unsigned int align);
 extern bool cma_release(struct cma *cma, struct page *pages, int count);
 #endif
diff --git a/mm/cma.c b/mm/cma.c
index 4b251b037e1b..c3d84016d432 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -140,6 +140,54 @@ static int __init cma_init_reserved_areas(void)
 core_initcall(cma_init_reserved_areas);
 
 /**
+ * cma_init_reserved_mem() - create custom contiguous area from reserved memory
+ * @base: Base address of the reserved area
+ * @size: Size of the reserved area (in bytes),
+ * @order_per_bit: Order of pages represented by one bit on bitmap.
+ * @res_cma: Pointer to store the created cma region.
+ *
+ * This function creates custom contiguous area from already reserved memory.
+ */
+int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
+				 int order_per_bit, struct cma **res_cma)
+{
+	struct cma *cma;
+	phys_addr_t alignment;
+
+	/* Sanity checks */
+	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
+		pr_err("Not enough slots for CMA reserved regions!\n");
+		return -ENOSPC;
+	}
+
+	if (!size || !memblock_is_region_reserved(base, size))
+		return -EINVAL;
+
+	/* ensure minimal alignment requied by mm core */
+	alignment = PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order);
+
+	/* alignment should be aligned with order_per_bit */
+	if (!IS_ALIGNED(alignment >> PAGE_SHIFT, 1 << order_per_bit))
+		return -EINVAL;
+
+	if (ALIGN(base, alignment) != base || ALIGN(size, alignment) != size)
+		return -EINVAL;
+
+	/*
+	 * Each reserved area must be initialised later, when more kernel
+	 * subsystems (like slab allocator) are available.
+	 */
+	cma = &cma_areas[cma_area_count];
+	cma->base_pfn = PFN_DOWN(base);
+	cma->count = size >> PAGE_SHIFT;
+	cma->order_per_bit = order_per_bit;
+	*res_cma = cma;
+	cma_area_count++;
+
+	return 0;
+}
+
+/**
  * cma_declare_contiguous() - reserve custom contiguous area
  * @base: Base address of the reserved area optional, use 0 for any
  * @size: Size of the reserved area (in bytes),
@@ -162,18 +210,12 @@ int __init cma_declare_contiguous(phys_addr_t base,
 			phys_addr_t alignment, unsigned int order_per_bit,
 			bool fixed, struct cma **res_cma)
 {
-	struct cma *cma;
-	int ret = 0;
+	int ret;
 
 	pr_debug("%s(size %lx, base %08lx, limit %08lx alignment %08lx)\n",
 		__func__, (unsigned long)size, (unsigned long)base,
 		(unsigned long)limit, (unsigned long)alignment);
 
-	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
-		pr_err("Not enough slots for CMA reserved regions!\n");
-		return -ENOSPC;
-	}
-
 	if (!size)
 		return -EINVAL;
 
@@ -214,16 +256,9 @@ int __init cma_declare_contiguous(phys_addr_t base,
 		}
 	}
 
-	/*
-	 * Each reserved area must be initialised later, when more kernel
-	 * subsystems (like slab allocator) are available.
-	 */
-	cma = &cma_areas[cma_area_count];
-	cma->base_pfn = PFN_DOWN(base);
-	cma->count = size >> PAGE_SHIFT;
-	cma->order_per_bit = order_per_bit;
-	*res_cma = cma;
-	cma_area_count++;
+	ret = cma_init_reserved_mem(base, size, order_per_bit, res_cma);
+	if (ret)
+		goto err;
 
 	pr_info("Reserved %ld MiB at %08lx\n", (unsigned long)size / SZ_1M,
 		(unsigned long)base);
-- 
1.9.2
