From: <vitaly_kuzmichev@mentor.com>
Subject: [PATCH 2/2] drivers: dma-coherent: show per-device DMA region utilization via procfs
Date: Mon, 3 Jul 2017 17:51:15 +0300
Message-ID: <1499093475-29859-3-git-send-email-vitaly_kuzmichev@mentor.com>
References: <1499093475-29859-1-git-send-email-vitaly_kuzmichev@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499093475-29859-1-git-send-email-vitaly_kuzmichev@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, george_davis@mentor.com, vitaly_kuzmichev@mentor.com
List-Id: devicetree@vger.kernel.org

From: "George G. Davis" <george_davis@mentor.com>

Add hooks to allow displaying per-device DMA region utilization via
/proc/dmainfo similar to how free blocks are displayed in
/proc/pagetypeinfo.

This also adds /proc/dmainfo reporting for regions defined via
dma_declare_coherent_memory().

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Mark Craske <Mark_Craske@mentor.com>
Signed-off-by: Vitaly Kuzmichev <Vitaly_Kuzmichev@mentor.com>
---
 drivers/base/dma-coherent.c | 221 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 213 insertions(+), 8 deletions(-)

diff --git a/drivers/base/dma-coherent.c b/drivers/base/dma-coherent.c
index a0b0f2b..5671422 100644
--- a/drivers/base/dma-coherent.c
+++ b/drivers/base/dma-coherent.c
@@ -8,6 +8,12 @@
 #include <linux/module.h>
 #include <linux/dma-mapping.h>
 
+#ifdef CONFIG_PROC_FS
+#include <linux/fs.h>
+#include <linux/proc_fs.h>
+#include <linux/seq_file.h>
+#endif
+
 struct dma_coherent_mem {
 	void		*virt_base;
 	dma_addr_t	device_base;
@@ -16,8 +22,57 @@ struct dma_coherent_mem {
 	int		flags;
 	unsigned long	*bitmap;
 	spinlock_t	spinlock;
+	int		used;
+	int		highwatermark;
+	int		errs;
 };
 
+#ifdef CONFIG_PROC_FS
+struct dmacoherent_region {
+	struct list_head list;
+	struct device *dev;
+};
+
+static LIST_HEAD(dmacoherent_region_list);
+static DEFINE_MUTEX(dmacoherent_region_list_lock);
+
+static int dmacoherent_region_add(struct device *dev)
+{
+	struct dmacoherent_region *rp;
+
+	rp = kzalloc(sizeof(*rp), GFP_KERNEL);
+	if (!rp)
+		return -ENOMEM;
+
+	rp->dev = dev;
+
+	mutex_lock(&dmacoherent_region_list_lock);
+	list_add(&rp->list, &dmacoherent_region_list);
+	mutex_unlock(&dmacoherent_region_list_lock);
+	dev_info(dev, "Registered DMA-coherent pool with /proc/dmainfo accounting\n");
+
+	return 0;
+}
+
+static void dmacoherent_region_del(struct device *dev)
+{
+	struct dmacoherent_region *rp;
+
+	mutex_lock(&dmacoherent_region_list_lock);
+	list_for_each_entry(rp, &dmacoherent_region_list, list) {
+		if (rp->dev == dev) {
+			list_del(&rp->list);
+			kfree(rp);
+			break;
+		}
+	}
+	mutex_unlock(&dmacoherent_region_list_lock);
+}
+#else
+static int dmacoherent_region_add(struct device *dev) { return 0; }
+static void dmacoherent_region_del(struct device *dev) { return; }
+#endif
+
 static struct dma_coherent_mem **dma_coherent_default_area;
 
 static inline struct dma_coherent_mem *dev_get_dma_area(struct device *dev)
@@ -109,14 +164,22 @@ int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
 				dma_addr_t device_addr, size_t size, int flags)
 {
 	struct dma_coherent_mem *mem;
+	int ret;
 
 	if (!dma_init_coherent_memory(phys_addr, device_addr, size, flags,
 				      &mem))
 		return 0;
 
-	if (dma_assign_coherent_memory(dev, mem) == 0)
-		return flags & DMA_MEMORY_MAP ? DMA_MEMORY_MAP : DMA_MEMORY_IO;
+	if (dma_assign_coherent_memory(dev, mem) != 0)
+		goto errout;
+
+	ret = (flags & DMA_MEMORY_MAP ? DMA_MEMORY_MAP : DMA_MEMORY_IO);
+
+	if (dmacoherent_region_add(dev) == 0)
+		return ret;
 
+	dev->dma_mem = NULL;
+errout:
 	dma_release_coherent_memory(mem);
 	return 0;
 }
@@ -128,6 +191,8 @@ void dma_release_declared_memory(struct device *dev)
 
 	if (!mem)
 		return;
+
+	dmacoherent_region_del(dev);
 	dma_release_coherent_memory(mem);
 	dev->dma_mem = NULL;
 }
@@ -139,19 +204,25 @@ void *dma_mark_declared_memory_occupied(struct device *dev,
 	struct dma_coherent_mem *mem = dev_get_dma_area(dev);
 	unsigned long flags;
 	int pos, err;
-
-	size += device_addr & ~PAGE_MASK;
+	int order;
 
 	if (!mem)
 		return ERR_PTR(-EINVAL);
 
-	spin_lock_irqsave(&mem->spinlock, flags);
+	size += device_addr & ~PAGE_MASK;
+	order = get_order(size);
 	pos = (device_addr - mem->device_base) >> PAGE_SHIFT;
-	err = bitmap_allocate_region(mem->bitmap, pos, get_order(size));
-	spin_unlock_irqrestore(&mem->spinlock, flags);
 
-	if (err != 0)
+	spin_lock_irqsave(&mem->spinlock, flags);
+	err = bitmap_allocate_region(mem->bitmap, pos, order);
+	if (err != 0) {
+		spin_unlock_irqrestore(&mem->spinlock, flags);
 		return ERR_PTR(err);
+	}
+	mem->used += 1 << order;
+	if (mem->highwatermark < mem->used)
+		mem->highwatermark = mem->used;
+	spin_unlock_irqrestore(&mem->spinlock, flags);
 	return mem->virt_base + (pos << PAGE_SHIFT);
 }
 EXPORT_SYMBOL(dma_mark_declared_memory_occupied);
@@ -194,6 +265,10 @@ int dma_alloc_from_coherent(struct device *dev, ssize_t size,
 	if (unlikely(pageno < 0))
 		goto err;
 
+	mem->used += 1 << order;
+	if (mem->highwatermark < mem->used)
+		mem->highwatermark = mem->used;
+
 	/*
 	 * Memory was found in the per-device area.
 	 */
@@ -209,6 +284,7 @@ int dma_alloc_from_coherent(struct device *dev, ssize_t size,
 	return 1;
 
 err:
+	mem->errs++;
 	spin_unlock_irqrestore(&mem->spinlock, flags);
 	/*
 	 * In the case where the allocation can not be satisfied from the
@@ -243,6 +319,7 @@ int dma_release_from_coherent(struct device *dev, int order, void *vaddr)
 
 		spin_lock_irqsave(&mem->spinlock, flags);
 		bitmap_release_region(mem->bitmap, page, order);
+		mem->used -= 1 << order;
 		spin_unlock_irqrestore(&mem->spinlock, flags);
 		return 1;
 	}
@@ -311,6 +388,10 @@ static int rmem_dma_device_init(struct reserved_mem *rmem, struct device *dev)
 		return -ENODEV;
 	}
 	rmem->priv = mem;
+
+	if (dmacoherent_region_add(dev))
+		return -ENOMEM;
+
 	dma_assign_coherent_memory(dev, mem);
 	return 0;
 }
@@ -318,6 +399,7 @@ static int rmem_dma_device_init(struct reserved_mem *rmem, struct device *dev)
 static void rmem_dma_device_release(struct reserved_mem *rmem,
 				    struct device *dev)
 {
+	dmacoherent_region_del(dev);
 	dev->dma_mem = NULL;
 }
 
@@ -351,3 +433,126 @@ static int __init rmem_dma_setup(struct reserved_mem *rmem)
 }
 RESERVEDMEM_OF_DECLARE(dma, "shared-dma-pool", rmem_dma_setup);
 #endif
+
+#ifdef CONFIG_PROC_FS
+
+static int dmainfo_proc_show_dma_mem(struct seq_file *m, void *v,
+				     struct device *dev)
+{
+	struct dma_coherent_mem *mem = dev_get_dma_area(dev);
+	int offset;
+	int start;
+	int end;
+	int pages;
+	int order;
+	int free = 0;
+	int blocks[MAX_ORDER];
+
+	memset(blocks, 0, sizeof(blocks));
+
+	spin_lock(&mem->spinlock);
+
+	for (offset = 0; offset < mem->size; offset = end) {
+		start = find_next_zero_bit(mem->bitmap, mem->size, offset);
+		if (start >= mem->size)
+			break;
+		end = find_next_bit(mem->bitmap, mem->size, start + 1);
+		pages = end - start;
+
+		/* Align start: */
+		for (order = 0; order < MAX_ORDER; order += 1) {
+			if (start >= end)
+				break;
+			if (pages < (1 << order))
+				break;
+			if (start & (1 << order)) {
+				blocks[order] += 1;
+				start += 1 << order;
+				pages -= 1 << order;
+				free += 1 << order;
+			}
+		}
+
+		if (start >= end)
+			continue;
+
+		/* Align middle and end: */
+		order = MAX_ORDER - 1;
+		while (order >= 0) {
+			if (start >= end)
+				break;
+			if (pages >= (1 << order)) {
+				blocks[order] += 1;
+				start += 1 << order;
+				pages -= 1 << order;
+				free += 1 << order;
+			} else {
+				order -= 1;
+			}
+		}
+	}
+
+	seq_printf(m, "%-30s", dev_name(dev));
+
+	for (order = 0; order < MAX_ORDER; order += 1)
+		seq_printf(m, " %6d", blocks[order]);
+
+	seq_printf(m, " %6d %6d %6d %6d %6d\n",
+		   mem->size,
+		   mem->used,
+		   free,
+		   mem->highwatermark,
+		   mem->errs);
+
+	spin_unlock(&mem->spinlock);
+
+	return 0;
+}
+
+static int dmainfo_proc_show(struct seq_file *m, void *v)
+{
+	struct dmacoherent_region *rp;
+	int order;
+
+	seq_puts(m, "DMA-coherent region information:\n");
+	seq_printf(m, "%-30s", "Free block count at order");
+
+	for (order = 0; order < MAX_ORDER; ++order)
+		seq_printf(m, " %6d", order);
+
+	seq_printf(m, " %6s %6s %6s %6s %6s\n",
+		   "Size",
+		   "Used",
+		   "Free",
+		   "High",
+		   "Errs");
+
+	mutex_lock(&dmacoherent_region_list_lock);
+	list_for_each_entry(rp, &dmacoherent_region_list, list) {
+		dmainfo_proc_show_dma_mem(m, v, rp->dev);
+	}
+	mutex_unlock(&dmacoherent_region_list_lock);
+
+	return 0;
+}
+
+static int dmainfo_proc_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, dmainfo_proc_show, NULL);
+}
+
+static const struct file_operations dmainfo_proc_fops = {
+	.open		= dmainfo_proc_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static int __init proc_dmainfo_init(void)
+{
+	proc_create("dmainfo", 0, NULL, &dmainfo_proc_fops);
+	return 0;
+}
+module_init(proc_dmainfo_init);
+
+#endif
-- 
1.9.1
