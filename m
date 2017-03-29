From: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
Subject: [RFC PATCH 1/5] soc/fsl/qbman: Use shared-dma-pool for BMan private memory allocations
Date: Wed, 29 Mar 2017 17:13:53 -0400
Message-ID: <1490822037-6752-2-git-send-email-roy.pledge@nxp.com>
References: <1490822037-6752-1-git-send-email-roy.pledge@nxp.com>
Reply-To: <roy.pledge-3arQi8VN3Tc@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490822037-6752-1-git-send-email-roy.pledge-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robin.murphy-5wv7dgnIgG8@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: madalin.bucur-3arQi8VN3Tc@public.gmane.org, Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use the shared-memory-pool mechanism for free buffer proxy record
area allocation.

Signed-off-by: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
---
 drivers/soc/fsl/qbman/bman_ccsr.c | 27 ++++++++++++++++++++++++++-
 drivers/soc/fsl/qbman/bman_priv.h |  3 +++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/bman_ccsr.c b/drivers/soc/fsl/qbman/bman_ccsr.c
index a8e8389..5485c3c 100644
--- a/drivers/soc/fsl/qbman/bman_ccsr.c
+++ b/drivers/soc/fsl/qbman/bman_ccsr.c
@@ -170,10 +170,11 @@ static int fsl_bman_probe(struct platform_device *pdev)
 {
 	int ret, err_irq;
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
+	struct device_node *mem_node, *node = dev->of_node;
 	struct resource *res;
 	u16 id, bm_pool_cnt;
 	u8 major, minor;
+	u64 size;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -201,6 +202,30 @@ static int fsl_bman_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	ret = of_reserved_mem_device_init(dev);
+	if (ret) {
+		dev_err(dev, "of_reserved_mem_device_init() failed 0x%x\n", ret);
+		return -ENODEV;
+	}
+	mem_node = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (mem_node) {
+		ret = of_property_read_u64(mem_node, "size", &size);
+		if (ret) {
+			dev_err(dev, "FBPR: of_address_to_resource fails 0x%x\n", ret);
+			return -ENODEV;
+		}
+		fbpr_sz = size;
+	} else {
+		dev_err(dev, "No memory-region found for FBPR\n");
+		return -ENODEV;
+	}
+	if (!dma_zalloc_coherent(dev, fbpr_sz, &fbpr_a, 0)) {
+		dev_err(dev, "Alloc FBPR memory failed\n");
+		return -ENODEV;
+	}
+
+	dev_info(dev, "Allocated FBPR 0x%llx 0x%zx\n", fbpr_a, fbpr_sz);
+
 	bm_set_memory(fbpr_a, fbpr_sz);
 
 	err_irq = platform_get_irq(pdev, 0);
diff --git a/drivers/soc/fsl/qbman/bman_priv.h b/drivers/soc/fsl/qbman/bman_priv.h
index f6896a2..765a4bf 100644
--- a/drivers/soc/fsl/qbman/bman_priv.h
+++ b/drivers/soc/fsl/qbman/bman_priv.h
@@ -33,6 +33,9 @@
 #include "dpaa_sys.h"
 
 #include <soc/fsl/bman.h>
+#include <linux/dma-contiguous.h>
+#include <linux/of_address.h>
+#include <linux/dma-mapping.h>
 
 /* Portal processing (interrupt) sources */
 #define BM_PIRQ_RCRI	0x00000002	/* RCR Ring (below threshold) */
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
