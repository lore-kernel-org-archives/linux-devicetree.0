From: Rob Herring <robh@kernel.org>
Subject: [PATCH 05/11] of: Ratify of_dma_configure() interface
Date: Thu, 26 Sep 2019 19:24:49 -0500
Message-ID: <20190927002455.13169-6-robh@kernel.org>
References: <20190927002455.13169-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927002455.13169-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Robin Murphy <robin.murphy@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Robin Murphy <robin.murphy@arm.com>

For various DMA masters not directly represented in DT, we pass the OF
node of their parent or bridge device as the master_np argument to
of_dma_configure(), such that they can inherit the appropriate DMA
configuration from whatever is described there. This creates an
ambiguity for properties which are not valid for a device itself but
only for its parent bus, since we don't know whether to start looking
for those at master_np or master_np->parent.

Fortunately, the de-facto interface since the prototype change in
1f5c69aa51f9 ("of: Move of_dma_configure() to device.c to help re-use")
is pretty clear-cut: either master_np is redundant with dev->of_node, or
dev->of_node is NULL and master_np is already the relevant parent. Let's
formally ratify that so we can start relying on it.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/device.c       | 12 ++++++++++--
 include/linux/of_device.h |  4 ++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index da8158392010..a45261e21144 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -75,7 +75,8 @@ int of_device_add(struct platform_device *ofdev)
 /**
  * of_dma_configure - Setup DMA configuration
  * @dev:	Device to apply DMA configuration
- * @np:		Pointer to OF node having DMA configuration
+ * @parent:	OF node of parent device having DMA configuration, if
+ * 		@dev->of_node is NULL (ignored otherwise)
  * @force_dma:  Whether device is to be set up by of_dma_configure() even if
  *		DMA capability is not explicitly described by firmware.
  *
@@ -86,15 +87,22 @@ int of_device_add(struct platform_device *ofdev)
  * can use a platform bus notifier and handle BUS_NOTIFY_ADD_DEVICE events
  * to fix up DMA configuration.
  */
-int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
+int of_dma_configure(struct device *dev, struct device_node *parent, bool force_dma)
 {
 	u64 dma_addr, paddr, size = 0;
 	int ret;
 	bool coherent;
 	unsigned long offset;
 	const struct iommu_ops *iommu;
+	struct device_node *np;
 	u64 mask;
 
+	np = dev->of_node;
+	if (!np)
+		np = parent;
+	if (!np)
+		return -ENODEV;
+
 	ret = of_dma_get_range(np, &dma_addr, &paddr, &size);
 	if (ret < 0) {
 		/*
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 8d31e39dd564..a4fe418e57f6 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -56,7 +56,7 @@ static inline struct device_node *of_cpu_device_node_get(int cpu)
 }
 
 int of_dma_configure(struct device *dev,
-		     struct device_node *np,
+		     struct device_node *parent,
 		     bool force_dma);
 #else /* CONFIG_OF */
 
@@ -107,7 +107,7 @@ static inline struct device_node *of_cpu_device_node_get(int cpu)
 }
 
 static inline int of_dma_configure(struct device *dev,
-				   struct device_node *np,
+				   struct device_node *parent,
 				   bool force_dma)
 {
 	return 0;
-- 
2.20.1
