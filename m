From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [RFC 3/3] dmaengine: Support for requesting channels preferring DMA domain controller
Date: Fri, 6 Sep 2019 17:17:17 +0300
Message-ID: <20190906141717.23859-4-peter.ujfalusi@ti.com>
References: <20190906141717.23859-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906141717.23859-1-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, robh+dt@kernel.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In case the channel is not requested via the slave API, use the
of_find_dma_domain() to see if a system default DMA controller is
specified.

Add new function which can be used by clients to request channels by mask
from their DMA domain controller if specified.

Client drivers can take advantage of the domain support by moving from
dma_request_chan_by_mask() to dma_domain_request_chan_by_mask()

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/dma/dmaengine.c   | 17 ++++++++++++-----
 include/linux/dmaengine.h |  9 ++++++---
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 6baddf7dcbfd..087450eed68c 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -640,6 +640,10 @@ struct dma_chan *__dma_request_channel(const dma_cap_mask_t *mask,
 	struct dma_device *device, *_d;
 	struct dma_chan *chan = NULL;
 
+	/* If np is not specified, get the default DMA domain controller */
+	if (!np)
+		np = of_find_dma_domain(NULL);
+
 	/* Find a channel */
 	mutex_lock(&dma_list_mutex);
 	list_for_each_entry_safe(device, _d, &dma_device_list, global_node) {
@@ -751,19 +755,22 @@ struct dma_chan *dma_request_slave_channel(struct device *dev,
 EXPORT_SYMBOL_GPL(dma_request_slave_channel);
 
 /**
- * dma_request_chan_by_mask - allocate a channel satisfying certain capabilities
- * @mask: capabilities that the channel must satisfy
+ * dma_domain_request_chan_by_mask - allocate a channel by mask from DMA domain
+ * @dev:	pointer to client device structure
+ * @mask:	capabilities that the channel must satisfy
  *
  * Returns pointer to appropriate DMA channel on success or an error pointer.
  */
-struct dma_chan *dma_request_chan_by_mask(const dma_cap_mask_t *mask)
+struct dma_chan *dma_domain_request_chan_by_mask(struct device *dev,
+						 const dma_cap_mask_t *mask)
 {
 	struct dma_chan *chan;
 
 	if (!mask)
 		return ERR_PTR(-ENODEV);
 
-	chan = __dma_request_channel(mask, NULL, NULL, NULL);
+	chan = __dma_request_channel(mask, NULL, NULL,
+				     of_find_dma_domain(dev->of_node));
 	if (!chan) {
 		mutex_lock(&dma_list_mutex);
 		if (list_empty(&dma_device_list))
@@ -775,7 +782,7 @@ struct dma_chan *dma_request_chan_by_mask(const dma_cap_mask_t *mask)
 
 	return chan;
 }
-EXPORT_SYMBOL_GPL(dma_request_chan_by_mask);
+EXPORT_SYMBOL_GPL(dma_domain_request_chan_by_mask);
 
 void dma_release_channel(struct dma_chan *chan)
 {
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 3b2e8e302f6c..9f94df81e83f 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1438,7 +1438,8 @@ struct dma_chan *__dma_request_channel(const dma_cap_mask_t *mask,
 struct dma_chan *dma_request_slave_channel(struct device *dev, const char *name);
 
 struct dma_chan *dma_request_chan(struct device *dev, const char *name);
-struct dma_chan *dma_request_chan_by_mask(const dma_cap_mask_t *mask);
+struct dma_chan *dma_domain_request_chan_by_mask(struct device *dev,
+						 const dma_cap_mask_t *mask);
 
 void dma_release_channel(struct dma_chan *chan);
 int dma_get_slave_caps(struct dma_chan *chan, struct dma_slave_caps *caps);
@@ -1475,8 +1476,8 @@ static inline struct dma_chan *dma_request_chan(struct device *dev,
 {
 	return ERR_PTR(-ENODEV);
 }
-static inline struct dma_chan *dma_request_chan_by_mask(
-						const dma_cap_mask_t *mask)
+static inline struct dma_chan *dma_domain_request_chan_by_mask(struct device *dev,
+			const dma_cap_mask_t *mask)
 {
 	return ERR_PTR(-ENODEV);
 }
@@ -1537,6 +1538,8 @@ struct dma_chan *dma_get_any_slave_channel(struct dma_device *device);
 	__dma_request_channel(&(mask), x, y, NULL)
 #define dma_request_slave_channel_compat(mask, x, y, dev, name) \
 	__dma_request_slave_channel_compat(&(mask), x, y, dev, name)
+#define dma_request_chan_by_mask(mask) \
+	dma_domain_request_chan_by_mask(NULL, mask)
 
 static inline struct dma_chan
 *__dma_request_slave_channel_compat(const dma_cap_mask_t *mask,
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
