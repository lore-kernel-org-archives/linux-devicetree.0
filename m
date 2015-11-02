From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC PATCH v2 1/2] base: dma-coherent: Add DT property for non
 exclusive shared-dma-pool
Date: Mon, 2 Nov 2015 12:04:41 +0100
Message-ID: <56374349.1000306@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Josh Cartwright <joshc@codeaurora.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

In order to have the ability to declare a non exclusive shared-dma-pool,
i.e. without the DMA_MEMORY_EXCLUSIVE flag, add the 'no-exclusive' DT
optional parameter to initialize the coherent memory without the flag.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/base/dma-coherent.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/base/dma-coherent.c b/drivers/base/dma-coherent.c
index 55b8398..cda6364 100644
--- a/drivers/base/dma-coherent.c
+++ b/drivers/base/dma-coherent.c
@@ -279,10 +279,14 @@ EXPORT_SYMBOL(dma_mmap_from_coherent);
 static int rmem_dma_device_init(struct reserved_mem *rmem, struct device *dev)
 {
 	struct dma_coherent_mem *mem = rmem->priv;
+	unsigned flags = 0;
+
+	if (!of_property_read_bool(rmem->fdt_node, "no-exclusive"))
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
