From: <vitaly_kuzmichev-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] drivers: dma-coherent: Add support for default DMA coherent pool
Date: Mon, 3 Jul 2017 17:51:14 +0300
Message-ID: <1499093475-29859-2-git-send-email-vitaly_kuzmichev@mentor.com>
References: <1499093475-29859-1-git-send-email-vitaly_kuzmichev@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499093475-29859-1-git-send-email-vitaly_kuzmichev-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, george_davis-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, vitaly_kuzmichev-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: "George G. Davis" <george_davis-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

Use concept similar to the default CMA region for DMA coherent pools.

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Signed-off-by: George G. Davis <george_davis-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Jiada Wang <jiada_wang-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Mark Craske <Mark_Craske-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Vitaly Kuzmichev <Vitaly_Kuzmichev-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
 .../bindings/reserved-memory/reserved-memory.txt   |  2 ++
 drivers/base/dma-coherent.c                        | 29 ++++++++++++++++------
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
index 3da0ebd..ed9a051 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
@@ -67,6 +67,8 @@ reusable (optional) - empty property
 Linux implementation note:
 - If a "linux,cma-default" property is present, then Linux will use the
   region for the default pool of the contiguous memory allocator.
+- If a "linux,dma-default" property is present, then Linux will use the
+  region for the default pool of the DMA coherent memory allocator.
 
 Device node references to reserved memory
 -----------------------------------------
diff --git a/drivers/base/dma-coherent.c b/drivers/base/dma-coherent.c
index 640a7e6..a0b0f2b 100644
--- a/drivers/base/dma-coherent.c
+++ b/drivers/base/dma-coherent.c
@@ -18,6 +18,19 @@ struct dma_coherent_mem {
 	spinlock_t	spinlock;
 };
 
+static struct dma_coherent_mem **dma_coherent_default_area;
+
+static inline struct dma_coherent_mem *dev_get_dma_area(struct device *dev)
+{
+	if (dev && dev->dma_mem)
+		return dev->dma_mem;
+#ifdef CONFIG_CMA
+	if (dev && dev->cma_area)
+		return NULL;
+#endif
+	return dma_coherent_default_area ? *dma_coherent_default_area : NULL;
+}
+
 static bool dma_init_coherent_memory(
 	phys_addr_t phys_addr, dma_addr_t device_addr, size_t size, int flags,
 	struct dma_coherent_mem **mem)
@@ -111,7 +124,7 @@ int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
 
 void dma_release_declared_memory(struct device *dev)
 {
-	struct dma_coherent_mem *mem = dev->dma_mem;
+	struct dma_coherent_mem *mem = dev_get_dma_area(dev);
 
 	if (!mem)
 		return;
@@ -123,7 +136,7 @@ void dma_release_declared_memory(struct device *dev)
 void *dma_mark_declared_memory_occupied(struct device *dev,
 					dma_addr_t device_addr, size_t size)
 {
-	struct dma_coherent_mem *mem = dev->dma_mem;
+	struct dma_coherent_mem *mem = dev_get_dma_area(dev);
 	unsigned long flags;
 	int pos, err;
 
@@ -167,9 +180,7 @@ int dma_alloc_from_coherent(struct device *dev, ssize_t size,
 	int pageno;
 	int dma_memory_map;
 
-	if (!dev)
-		return 0;
-	mem = dev->dma_mem;
+	mem = dev_get_dma_area(dev);
 	if (!mem)
 		return 0;
 
@@ -223,7 +234,7 @@ int dma_alloc_from_coherent(struct device *dev, ssize_t size,
  */
 int dma_release_from_coherent(struct device *dev, int order, void *vaddr)
 {
-	struct dma_coherent_mem *mem = dev ? dev->dma_mem : NULL;
+	struct dma_coherent_mem *mem = dev_get_dma_area(dev);
 
 	if (mem && vaddr >= mem->virt_base && vaddr <
 		   (mem->virt_base + (mem->size << PAGE_SHIFT))) {
@@ -257,7 +268,7 @@ int dma_release_from_coherent(struct device *dev, int order, void *vaddr)
 int dma_mmap_from_coherent(struct device *dev, struct vm_area_struct *vma,
 			   void *vaddr, size_t size, int *ret)
 {
-	struct dma_coherent_mem *mem = dev ? dev->dma_mem : NULL;
+	struct dma_coherent_mem *mem = dev_get_dma_area(dev);
 
 	if (mem && vaddr >= mem->virt_base && vaddr + size <=
 		   (mem->virt_base + (mem->size << PAGE_SHIFT))) {
@@ -329,6 +340,10 @@ static int __init rmem_dma_setup(struct reserved_mem *rmem)
 	}
 #endif
 
+	if (of_get_flat_dt_prop(node, "linux,dma-default", NULL))
+		dma_coherent_default_area =
+			(struct dma_coherent_mem **)&rmem->priv;
+
 	rmem->ops = &rmem_dma_ops;
 	pr_info("Reserved memory: created DMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
