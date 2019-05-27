From: yibin.gong@nxp.com
Subject: [PATCH v2 1/7] dmaengine: fsl-edma: add dmamux_nr for next version
Date: Mon, 27 May 2019 16:51:12 +0800
Message-ID: <20190527085118.40423-2-yibin.gong@nxp.com>
References: <20190527085118.40423-1-yibin.gong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190527085118.40423-1-yibin.gong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, mark.rutland@arm.com, vkoul@kernel.org, dan.j.williams@intel.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Robin Gong <yibin.gong@nxp.com>

Next version of edma such as edmav2 on i.mx7ulp has only one dmamux.
Add dmamux_nr instead of static macro define 'DMAMUX_NR'. No any
function change here.

Signed-off-by: Robin Gong <yibin.gong@nxp.com>
---
 drivers/dma/fsl-edma-common.h |  1 +
 drivers/dma/fsl-edma.c        | 11 ++++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index c53f76e..21a9cfd 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -145,6 +145,7 @@ struct fsl_edma_engine {
 	void __iomem		*membase;
 	void __iomem		*muxbase[DMAMUX_NR];
 	struct clk		*muxclk[DMAMUX_NR];
+	u32			dmamux_nr;
 	struct mutex		fsl_edma_mutex;
 	u32			n_chans;
 	int			txirq;
diff --git a/drivers/dma/fsl-edma.c b/drivers/dma/fsl-edma.c
index d641ef8..7b65ef4 100644
--- a/drivers/dma/fsl-edma.c
+++ b/drivers/dma/fsl-edma.c
@@ -96,7 +96,7 @@ static struct dma_chan *fsl_edma_xlate(struct of_phandle_args *dma_spec,
 	struct fsl_edma_engine *fsl_edma = ofdma->of_dma_data;
 	struct dma_chan *chan, *_chan;
 	struct fsl_edma_chan *fsl_chan;
-	unsigned long chans_per_mux = fsl_edma->n_chans / DMAMUX_NR;
+	unsigned long chans_per_mux = fsl_edma->n_chans / fsl_edma->dmamux_nr;
 
 	if (dma_spec->args_count != 2)
 		return NULL;
@@ -206,6 +206,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	fsl_edma->version = v1;
+	fsl_edma->dmamux_nr = DMAMUX_NR;
 	fsl_edma->n_chans = chans;
 	mutex_init(&fsl_edma->fsl_edma_mutex);
 
@@ -217,7 +218,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
 	fsl_edma_setup_regs(fsl_edma);
 	regs = &fsl_edma->regs;
 
-	for (i = 0; i < DMAMUX_NR; i++) {
+	for (i = 0; i < fsl_edma->dmamux_nr; i++) {
 		char clkname[32];
 
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 1 + i);
@@ -295,7 +296,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev,
 			"Can't register Freescale eDMA engine. (%d)\n", ret);
-		fsl_disable_clocks(fsl_edma, DMAMUX_NR);
+		fsl_disable_clocks(fsl_edma, fsl_edma->dmamux_nr);
 		return ret;
 	}
 
@@ -304,7 +305,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev,
 			"Can't register Freescale eDMA of_dma. (%d)\n", ret);
 		dma_async_device_unregister(&fsl_edma->dma_dev);
-		fsl_disable_clocks(fsl_edma, DMAMUX_NR);
+		fsl_disable_clocks(fsl_edma, fsl_edma->dmamux_nr);
 		return ret;
 	}
 
@@ -323,7 +324,7 @@ static int fsl_edma_remove(struct platform_device *pdev)
 	fsl_edma_cleanup_vchan(&fsl_edma->dma_dev);
 	of_dma_controller_free(np);
 	dma_async_device_unregister(&fsl_edma->dma_dev);
-	fsl_disable_clocks(fsl_edma, DMAMUX_NR);
+	fsl_disable_clocks(fsl_edma, fsl_edma->dmamux_nr);
 
 	return 0;
 }
-- 
2.7.4
