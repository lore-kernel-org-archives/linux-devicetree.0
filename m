From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/2] base: dma-coherent: Add DT property for non exclusive
 shared-dma-pool
Date: Mon, 12 Oct 2015 09:33:07 +0200
Message-ID: <561B6233.9090008@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Josh Cartwright <joshc@codeaurora.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

In order to have the ability to declare a non exclusive shared-dma-pool,
i.e. without the DMA_MEMORY_EXCLUSIVE flag, add the 'no-exclusive' DT
optional parameter to initialize the coherent memory without the flag.

Leave exclusive memory as default.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/base/dma-coherent.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/base/dma-coherent.c b/drivers/base/dma-coherent.c
index 55b8398..e32d3cc 100644
--- a/drivers/base/dma-coherent.c
+++ b/drivers/base/dma-coherent.c
@@ -276,13 +276,14 @@ EXPORT_SYMBOL(dma_mmap_from_coherent);
 #include <linux/of_fdt.h>
 #include <linux/of_reserved_mem.h>

-static int rmem_dma_device_init(struct reserved_mem *rmem, struct device *dev)
+static int rmem_dma_device_flags_init(struct reserved_mem *rmem,
+				      struct device *dev, int flags)
 {
 	struct dma_coherent_mem *mem = rmem->priv;

 	if (!mem &&
 	    dma_init_coherent_memory(rmem->base, rmem->base, rmem->size,
-				     DMA_MEMORY_MAP | DMA_MEMORY_EXCLUSIVE,
+				     DMA_MEMORY_MAP | flags,
 				     &mem) != DMA_MEMORY_MAP) {
 		pr_err("Reserved memory: failed to init DMA memory pool at %pa, size %ld MiB\n",
 			&rmem->base, (unsigned long)rmem->size / SZ_1M);
@@ -293,6 +294,17 @@ static int rmem_dma_device_init(struct reserved_mem *rmem, struct device *dev)
 	return 0;
 }

+static int rmem_dma_device_init(struct reserved_mem *rmem, struct device *dev)
+{
+	return rmem_dma_device_flags_init(rmem, dev, 0);
+}
+
+static int rmem_dma_device_exclusive_init(struct reserved_mem *rmem,
+					  struct device *dev)
+{
+	return rmem_dma_device_flags_init(rmem, dev, DMA_MEMORY_EXCLUSIVE);
+}
+
 static void rmem_dma_device_release(struct reserved_mem *rmem,
 				    struct device *dev)
 {
@@ -304,6 +316,11 @@ static const struct reserved_mem_ops rmem_dma_ops = {
 	.device_release	= rmem_dma_device_release,
 };

+static const struct reserved_mem_ops rmem_dma_exclusive_ops = {
+	.device_init	= rmem_dma_device_exclusive_init,
+	.device_release	= rmem_dma_device_release,
+};
+
 static int __init rmem_dma_setup(struct reserved_mem *rmem)
 {
 	unsigned long node = rmem->fdt_node;
@@ -318,7 +335,10 @@ static int __init rmem_dma_setup(struct reserved_mem *rmem)
 	}
 #endif

-	rmem->ops = &rmem_dma_ops;
+	if (of_get_flat_dt_prop(node, "no-exclusive", NULL))
+		rmem->ops = &rmem_dma_ops;
+	else
+		rmem->ops = &rmem_dma_exclusive_ops;
 	pr_info("Reserved memory: created DMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
 	return 0;
-- 
1.9.1
