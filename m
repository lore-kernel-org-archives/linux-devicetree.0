From: <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH V2 5/6] remoteproc/mediatek: add SCP's shared dma pool
 support for mt8183
Date: Mon, 8 Jul 2019 19:04:59 +0800
Message-ID: <20190708110500.7242-6-frederic.chen@mediatek.com>
References: <20190708110500.7242-1-frederic.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190708110500.7242-1-frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: shik-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Rynn.Wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Allan.Yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, holmes.chiou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, suleiman-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Jerry-ch.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yuzhao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, zwisler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, christie.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frederic Chen <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

This patch uses of_reserved_mem_device_init_by_idx() to hook the
scp device to DMA mapping API to provide a shared dma pool of
SCP DMA buffers for SCP's client such as DIP and ISP Pass 1
drivers.

Signed-off-by: Frederic Chen <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/remoteproc/mtk_scp.c | 54 ++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 4c093dec52b9..0cffe4b63dba 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -4,12 +4,14 @@
 
 #include <asm/barrier.h>
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_data/mtk_scp.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
@@ -487,29 +489,29 @@ EXPORT_SYMBOL_GPL(scp_get_reserve_mem_size);
 
 static int scp_map_memory_region(struct mtk_scp *scp)
 {
-	struct device_node *node;
-	struct resource r;
-	int ret;
+	int ret, id;
 
-	node = of_parse_phandle(scp->dev->of_node, "memory-region", 0);
-	if (!node) {
-		dev_err(scp->dev, "no memory-region specified\n");
-		return -EINVAL;
+	ret = of_reserved_mem_device_init_by_idx(scp->dev, scp->dev->of_node,
+						 0);
+	if (ret) {
+		dev_err(scp->dev,
+			"%s:of_reserved_mem_device_init_by_idx(0) failed:(%d)",
+			__func__, ret);
+		return -ENOMEM;
 	}
 
-	ret = of_address_to_resource(node, 0, &r);
-	if (ret)
-		return ret;
+	/* Pre-allocate the working buffers */
+	scp->dram_size = MAX_CODE_SIZE;
+	for (id = 0; id < SCP_NUMS_MEM_ID; id++)
+		scp->dram_size += scp_reserve_mblock[id].size;
 
-	scp->phys_addr = r.start;
-	scp->dram_size = resource_size(&r);
-	scp->cpu_addr =
-		devm_ioremap_wc(scp->dev, scp->phys_addr, scp->dram_size);
+	scp->cpu_addr = dma_alloc_coherent(scp->dev, scp->dram_size,
+					   &scp->phys_addr, GFP_KERNEL);
 
 	if (!scp->cpu_addr) {
-		dev_err(scp->dev, "unable to map memory region: %pa+%zx\n",
-			&r.start, scp->dram_size);
-		return -EBUSY;
+		dev_err(scp->dev, "unable to pre-allocate memory for SCP: %zx\n",
+			scp->dram_size);
+		return -ENOMEM;
 	}
 
 #if SCP_RESERVED_MEM
@@ -519,6 +521,13 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 	return 0;
 }
 
+static void scp_unmap_memory_region(struct mtk_scp *scp)
+{
+	dma_free_coherent(scp->dev, scp->dram_size, scp->cpu_addr,
+			  scp->phys_addr);
+	of_reserved_mem_device_release(scp->dev);
+}
+
 static struct mtk_rpmsg_info mtk_scp_rpmsg_info = {
 	.send_ipi = scp_ipi_send,
 	.register_ipi = scp_ipi_register,
@@ -594,20 +603,20 @@ static int scp_probe(struct platform_device *pdev)
 	if (IS_ERR(scp->clk)) {
 		dev_err(dev, "Failed to get clock\n");
 		ret = PTR_ERR(scp->clk);
-		goto free_rproc;
+		goto release_dev_mem;
 	}
 
 	ret = clk_prepare_enable(scp->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable clocks\n");
-		goto free_rproc;
+		goto release_dev_mem;
 	}
 
 	ret = scp_ipi_init(scp);
 	clk_disable_unprepare(scp->clk);
 	if (ret) {
 		dev_err(dev, "Failed to init ipi\n");
-		goto free_rproc;
+		goto release_dev_mem;
 	}
 
 	/* register SCP initialization IPI */
@@ -617,7 +626,7 @@ static int scp_probe(struct platform_device *pdev)
 			       scp);
 	if (ret) {
 		dev_err(dev, "Failed to register IPI_SCP_INIT\n");
-		goto free_rproc;
+		goto release_dev_mem;
 	}
 
 	mutex_init(&scp->lock);
@@ -645,6 +654,8 @@ static int scp_probe(struct platform_device *pdev)
 remove_subdev:
 	scp_remove_rpmsg_subdev(scp);
 	mutex_destroy(&scp->lock);
+release_dev_mem:
+	scp_unmap_memory_region(scp);
 free_rproc:
 	rproc_free(rproc);
 
@@ -658,6 +669,7 @@ static int scp_remove(struct platform_device *pdev)
 	scp_remove_rpmsg_subdev(scp);
 	rproc_del(scp->rproc);
 	rproc_free(scp->rproc);
+	scp_unmap_memory_region(scp);
 
 	return 0;
 }
-- 
2.18.0
