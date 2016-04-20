From: Kedareswara rao Appana <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] dmaengine: vdma: Add clock support
Date: Wed, 20 Apr 2016 12:50:00 +0530
Message-ID: <1461136800-20334-2-git-send-email-appanad@xilinx.com>
References: <1461136800-20334-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461136800-20334-1-git-send-email-appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Added basic clock support. The clocks are requested at probe
and released at remove.

Signed-off-by: Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/xilinx/xilinx_vdma.c | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_vdma.c b/drivers/dma/xilinx/xilinx_vdma.c
index 70caea6..d526029 100644
--- a/drivers/dma/xilinx/xilinx_vdma.c
+++ b/drivers/dma/xilinx/xilinx_vdma.c
@@ -44,6 +44,7 @@
 #include <linux/of_platform.h>
 #include <linux/of_irq.h>
 #include <linux/slab.h>
+#include <linux/clk.h>
 
 #include "../dmaengine.h"
 
@@ -352,6 +353,8 @@ struct xilinx_dma_chan {
  * @flush_on_fsync: Flush on frame sync
  * @ext_addr: Indicates 64 bit addressing is supported by dma device
  * @dmatype: DMA ip type
+ * @clks:	pointer to array of clocks
+ * @numclks:	number of clocks available
  */
 struct xilinx_dma_device {
 	void __iomem *regs;
@@ -362,6 +365,8 @@ struct xilinx_dma_device {
 	u32 flush_on_fsync;
 	bool ext_addr;
 	enum xdma_ip_type dmatype;
+	struct clk **clks;
+	int numclks;
 };
 
 /* Macros */
@@ -1731,6 +1736,26 @@ int xilinx_vdma_channel_set_config(struct dma_chan *dchan,
 }
 EXPORT_SYMBOL(xilinx_vdma_channel_set_config);
 
+static int xdma_clk_init(struct xilinx_dma_device *xdev, bool enable)
+{
+	int i = 0, ret;
+
+	for (i = 0; i < xdev->numclks; i++) {
+		if (enable) {
+			ret = clk_prepare_enable(xdev->clks[i]);
+			if (ret) {
+				dev_err(xdev->dev,
+					"failed to enable the axidma clock\n");
+				return ret;
+			}
+		} else {
+			clk_disable_unprepare(xdev->clks[i]);
+		}
+	}
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * Probe and remove
  */
@@ -1919,6 +1944,7 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 	struct resource *io;
 	u32 num_frames, addr_width;
 	int i, err;
+	const char *str;
 
 	/* Allocate and initialize the DMA engine structure */
 	xdev = devm_kzalloc(&pdev->dev, sizeof(*xdev), GFP_KERNEL);
@@ -1965,6 +1991,32 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 	/* Set the dma mask bits */
 	dma_set_mask(xdev->dev, DMA_BIT_MASK(addr_width));
 
+	xdev->numclks = of_property_count_strings(pdev->dev.of_node,
+						  "clock-names");
+	if (xdev->numclks > 0) {
+		xdev->clks = devm_kmalloc_array(&pdev->dev, xdev->numclks,
+						sizeof(struct clk *),
+						GFP_KERNEL);
+		if (!xdev->clks)
+			return -ENOMEM;
+
+		for (i = 0; i < xdev->numclks; i++) {
+			of_property_read_string_index(pdev->dev.of_node,
+						      "clock-names", i, &str);
+			xdev->clks[i] = devm_clk_get(xdev->dev, str);
+			if (IS_ERR(xdev->clks[i])) {
+				if (PTR_ERR(xdev->clks[i]) == -ENOENT)
+					xdev->clks[i] = NULL;
+				else
+					return PTR_ERR(xdev->clks[i]);
+			}
+		}
+
+		err = xdma_clk_init(xdev, true);
+		if (err)
+			return err;
+	}
+
 	/* Initialize the DMA engine */
 	xdev->common.dev = &pdev->dev;
 
@@ -2025,6 +2077,8 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 	return 0;
 
 error:
+	if (xdev->numclks > 0)
+		xdma_clk_init(xdev, false);
 	for (i = 0; i < XILINX_DMA_MAX_CHANS_PER_DEVICE; i++)
 		if (xdev->chan[i])
 			xilinx_dma_chan_remove(xdev->chan[i]);
@@ -2050,6 +2104,8 @@ static int xilinx_dma_remove(struct platform_device *pdev)
 	for (i = 0; i < XILINX_DMA_MAX_CHANS_PER_DEVICE; i++)
 		if (xdev->chan[i])
 			xilinx_dma_chan_remove(xdev->chan[i]);
+	if (xdev->numclks > 0)
+		xdma_clk_init(xdev, false);
 
 	return 0;
 }
-- 
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
