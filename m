From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 1/1] of: add coherent dma-mask binding
Date: Wed,  7 Mar 2012 17:45:58 +0100
Message-ID: <1331138758-19480-1-git-send-email-plagnioj@jcrosoft.com>
References: <1331119575-6638-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1331119575-6638-1-git-send-email-plagnioj@jcrosoft.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

This will allow each device to specify its coherent-dma-mask
The default behavior the set it to DMA_BIT_MASK(32) if none specified
is keeped.

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 drivers/of/platform.c |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index bb22194..d2a2ea02 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -141,6 +141,19 @@ static u64* of_get_dma_mask(struct device_node *np)
 	return dma_mask;
 }
 
+static u64 of_get_coherent_dma_mask(struct device_node *np)
+{
+	const __be32 *prop;
+	int len;
+
+	prop = of_get_property(np, "coherent-dma-mask", &len);
+
+	if (!prop)
+		return DMA_BIT_MASK(32);
+
+	return of_read_number(prop, len / 4);
+}
+
 /**
  * of_device_alloc - Allocate and initialize an of_device
  * @np: device node to assign to device
@@ -228,7 +241,7 @@ struct platform_device *of_platform_device_create_pdata(
 #if defined(CONFIG_MICROBLAZE)
 	dev->archdata.dma_mask = 0xffffffffUL;
 #endif
-	dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
+	dev->dev.coherent_dma_mask = of_get_coherent_dma_mask(np);
 	dev->dev.bus = &platform_bus_type;
 	dev->dev.platform_data = platform_data;
 
-- 
1.7.7
