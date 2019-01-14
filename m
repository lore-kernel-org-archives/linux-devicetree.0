From: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH RESEND] media: s5p-mfc: Fix memdev DMA configuration
Date: Mon, 14 Jan 2019 15:14:14 +0000
Message-ID: <4235afdd39766f11a3bf4c8daa0d1f4e6a1cd6dc.1547476835.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, frowand.list@gmail.com
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Having of_reserved_mem_device_init() forcibly reconfigure DMA for all
callers, potentially overriding the work done by a bus-specific
.dma_configure method earlier, is at best a bad idea and at worst
actively harmful. If drivers really need virtual devices to own
dma-coherent memory, they should explicitly configure those devices
based on the appropriate firmware node as they create them.

It looks like the only driver not passing in a proper OF platform device
is s5p-mfc, so move the rogue of_dma_configure() call into that driver
where it logically belongs.

Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

Hi Rob, Frank,

Bit of an old one bit it's rebased cleanly - Mauro reckoned[1] this
would suit the OF tree better than media, are you happy to pick it up?

Thanks,
Robin.

[1] https://patchwork.kernel.org/patch/10598085/


 drivers/media/platform/s5p-mfc/s5p_mfc.c | 7 +++++++
 drivers/of/of_reserved_mem.c             | 4 ----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
index 8a5ba3bec3af..6db33704b1a8 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -1094,6 +1094,13 @@ static struct device *s5p_mfc_alloc_memdev(struct device *dev,
 	child->dma_mask = dev->dma_mask;
 	child->release = s5p_mfc_memdev_release;
 
+	/*
+	 * The memdevs are not proper OF platform devices, so in order for them
+	 * to be treated as valid DMA masters we need a bit of a hack to force
+	 * them to inherit the MFC node's DMA configuration.
+	 */
+	of_dma_configure(child, dev->of_node, true);
+
 	if (device_add(child) == 0) {
 		ret = of_reserved_mem_device_init_by_idx(child, dev->of_node,
 							 idx);
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 1977ee0adcb1..9e02a5d80225 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -340,10 +340,6 @@ int of_reserved_mem_device_init_by_idx(struct device *dev,
 		mutex_lock(&of_rmem_assigned_device_mutex);
 		list_add(&rd->list, &of_rmem_assigned_device_list);
 		mutex_unlock(&of_rmem_assigned_device_mutex);
-		/* ensure that dma_ops is set for virtual devices
-		 * using reserved memory
-		 */
-		of_dma_configure(dev, np, true);
 
 		dev_info(dev, "assigned reserved memory node %s\n", rmem->name);
 	} else {
-- 
2.20.1.dirty
