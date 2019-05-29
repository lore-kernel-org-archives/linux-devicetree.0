From: yibin.gong@nxp.com
Subject: [PATCH v3 2/8] dmaengine: mcf-edma: update to 'dmamux_nr'
Date: Wed, 29 May 2019 17:08:42 +0800
Message-ID: <20190529090848.34350-3-yibin.gong@nxp.com>
References: <20190529090848.34350-1-yibin.gong@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529090848.34350-1-yibin.gong@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, mark.rutland@arm.com, vkoul@kernel.org, dan.j.williams@intel.com
Cc: linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

From: Robin Gong <yibin.gong@nxp.com>

Update to 'dmamux_nr' instead of static macro DMAMUX_NR since
new version edma only has one dmamux.

Signed-off-by: Robin Gong <yibin.gong@nxp.com>
---
 drivers/dma/fsl-edma-common.c | 2 +-
 drivers/dma/mcf-edma.c        | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 680b2a0..c9a17fc 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -84,7 +84,7 @@ void fsl_edma_chan_mux(struct fsl_edma_chan *fsl_chan,
 	void __iomem *muxaddr;
 	unsigned int chans_per_mux, ch_off;
 
-	chans_per_mux = fsl_chan->edma->n_chans / DMAMUX_NR;
+	chans_per_mux = fsl_chan->edma->n_chans / fsl_chan->edma->dmamux_nr;
 	ch_off = fsl_chan->vchan.chan.chan_id % chans_per_mux;
 	muxaddr = fsl_chan->edma->muxbase[ch / chans_per_mux];
 	slot = EDMAMUX_CHCFG_SOURCE(slot);
diff --git a/drivers/dma/mcf-edma.c b/drivers/dma/mcf-edma.c
index 7de54b2f..4484190 100644
--- a/drivers/dma/mcf-edma.c
+++ b/drivers/dma/mcf-edma.c
@@ -189,6 +189,7 @@ static int mcf_edma_probe(struct platform_device *pdev)
 
 	/* Set up version for ColdFire edma */
 	mcf_edma->version = v2;
+	mcf_edma->dmamux_nr = DMAMUX_NR;
 	mcf_edma->big_endian = 1;
 
 	if (!mcf_edma->n_chans) {
-- 
2.7.4
