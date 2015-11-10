From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC PATCH v3 1/2] base: dma-coherent: Add DT property for non
 exclusive shared-dma-pool
Date: Tue, 10 Nov 2015 17:18:30 +0100
Message-ID: <564218D6.8050206@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

In order to have the ability to declare a non exclusive shared-dma-pool,
i.e. without the DMA_MEMORY_EXCLUSIVE flag, add the 'no-exclusive' DT
optional parameter to initialize the coherent memory without the flag.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/base/dma-coherent.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/base/dma-coherent.c b/drivers/base/dma-coherent.c
index 55b8398..b57478f 100644
--- a/drivers/base/dma-coherent.c
+++ b/drivers/base/dma-coherent.c
@@ -279,10 +279,14 @@ EXPORT_SYMBOL(dma_mmap_from_coherent);
 static int rmem_dma_device_init(struct reserved_mem *rmem, struct device *dev)
 {
 	struct dma_coherent_mem *mem = rmem->priv;
+	unsigned flags = 0;
+
+	if (!of_get_flat_dt_prop(rmem->fdt_node, "no-exclusive", NULL))
+		flags |= DMA_MEMORY_EXCLUSIVE;

 	if (!mem &&
 	    dma_init_coherent_memory(rmem->base, rmem->base, rmem->size,
-				     DMA_MEMORY_MAP | DMA_MEMORY_EXCLUSIVE,
+				     DMA_MEMORY_MAP | flags,
 				     &mem) != DMA_MEMORY_MAP) {
 		pr_err("Reserved memory: failed to init DMA memory pool at %pa, size %ld MiB\n",
 			&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
1.9.1
