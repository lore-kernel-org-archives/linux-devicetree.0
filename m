From: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 1/5] dma: mxs-dma: use global stmp_device functionality
Date: Fri, 4 May 2012 20:12:15 +0800
Message-ID: <1336133539-13465-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This can get rid of the mach-dependency.

Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reviewed-by: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
This patch depends on Wolfram's
[PATCH V2 1/3] lib: add support for stmp-style devices
http://www.spinics.net/lists/arm-kernel/msg166232.html
which is still not in mainline.
---
 drivers/dma/Kconfig   |    1 +
 drivers/dma/mxs-dma.c |   27 +++++++++++++--------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index ef378b5..aadeb5b 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -238,6 +238,7 @@ config IMX_DMA
 config MXS_DMA
 	bool "MXS DMA support"
 	depends on SOC_IMX23 || SOC_IMX28
+	select STMP_DEVICE
 	select DMA_ENGINE
 	help
 	  Support the MXS DMA engine. This engine including APBH-DMA
diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 655d4ce..0fefdd3 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -23,10 +23,9 @@
 #include <linux/dmaengine.h>
 #include <linux/delay.h>
 #include <linux/fsl/mxs-dma.h>
+#include <linux/stmp_device.h>
 
 #include <asm/irq.h>
-#include <mach/mxs.h>
-#include <mach/common.h>
 
 #include "dmaengine.h"
 
@@ -138,10 +137,10 @@ static void mxs_dma_reset_chan(struct mxs_dma_chan *mxs_chan)
 
 	if (dma_is_apbh() && apbh_is_old())
 		writel(1 << (chan_id + BP_APBH_CTRL0_RESET_CHANNEL),
-			mxs_dma->base + HW_APBHX_CTRL0 + MXS_SET_ADDR);
+			mxs_dma->base + HW_APBHX_CTRL0 + STMP_OFFSET_REG_SET);
 	else
 		writel(1 << (chan_id + BP_APBHX_CHANNEL_CTRL_RESET_CHANNEL),
-			mxs_dma->base + HW_APBHX_CHANNEL_CTRL + MXS_SET_ADDR);
+			mxs_dma->base + HW_APBHX_CHANNEL_CTRL + STMP_OFFSET_REG_SET);
 }
 
 static void mxs_dma_enable_chan(struct mxs_dma_chan *mxs_chan)
@@ -170,10 +169,10 @@ static void mxs_dma_pause_chan(struct mxs_dma_chan *mxs_chan)
 	/* freeze the channel */
 	if (dma_is_apbh() && apbh_is_old())
 		writel(1 << chan_id,
-			mxs_dma->base + HW_APBHX_CTRL0 + MXS_SET_ADDR);
+			mxs_dma->base + HW_APBHX_CTRL0 + STMP_OFFSET_REG_SET);
 	else
 		writel(1 << chan_id,
-			mxs_dma->base + HW_APBHX_CHANNEL_CTRL + MXS_SET_ADDR);
+			mxs_dma->base + HW_APBHX_CHANNEL_CTRL + STMP_OFFSET_REG_SET);
 
 	mxs_chan->status = DMA_PAUSED;
 }
@@ -186,10 +185,10 @@ static void mxs_dma_resume_chan(struct mxs_dma_chan *mxs_chan)
 	/* unfreeze the channel */
 	if (dma_is_apbh() && apbh_is_old())
 		writel(1 << chan_id,
-			mxs_dma->base + HW_APBHX_CTRL0 + MXS_CLR_ADDR);
+			mxs_dma->base + HW_APBHX_CTRL0 + STMP_OFFSET_REG_CLR);
 	else
 		writel(1 << chan_id,
-			mxs_dma->base + HW_APBHX_CHANNEL_CTRL + MXS_CLR_ADDR);
+			mxs_dma->base + HW_APBHX_CHANNEL_CTRL + STMP_OFFSET_REG_CLR);
 
 	mxs_chan->status = DMA_IN_PROGRESS;
 }
@@ -220,11 +219,11 @@ static irqreturn_t mxs_dma_int_handler(int irq, void *dev_id)
 	/* completion status */
 	stat1 = readl(mxs_dma->base + HW_APBHX_CTRL1);
 	stat1 &= MXS_DMA_CHANNELS_MASK;
-	writel(stat1, mxs_dma->base + HW_APBHX_CTRL1 + MXS_CLR_ADDR);
+	writel(stat1, mxs_dma->base + HW_APBHX_CTRL1 + STMP_OFFSET_REG_CLR);
 
 	/* error status */
 	stat2 = readl(mxs_dma->base + HW_APBHX_CTRL2);
-	writel(stat2, mxs_dma->base + HW_APBHX_CTRL2 + MXS_CLR_ADDR);
+	writel(stat2, mxs_dma->base + HW_APBHX_CTRL2 + STMP_OFFSET_REG_CLR);
 
 	/*
 	 * When both completion and error of termination bits set at the
@@ -567,7 +566,7 @@ static int __init mxs_dma_init(struct mxs_dma_engine *mxs_dma)
 	if (ret)
 		return ret;
 
-	ret = mxs_reset_block(mxs_dma->base);
+	ret = stmp_reset_block(mxs_dma->base);
 	if (ret)
 		goto err_out;
 
@@ -580,14 +579,14 @@ static int __init mxs_dma_init(struct mxs_dma_engine *mxs_dma)
 	/* enable apbh burst */
 	if (dma_is_apbh()) {
 		writel(BM_APBH_CTRL0_APB_BURST_EN,
-			mxs_dma->base + HW_APBHX_CTRL0 + MXS_SET_ADDR);
+			mxs_dma->base + HW_APBHX_CTRL0 + STMP_OFFSET_REG_SET);
 		writel(BM_APBH_CTRL0_APB_BURST8_EN,
-			mxs_dma->base + HW_APBHX_CTRL0 + MXS_SET_ADDR);
+			mxs_dma->base + HW_APBHX_CTRL0 + STMP_OFFSET_REG_SET);
 	}
 
 	/* enable irq for all the channels */
 	writel(MXS_DMA_CHANNELS_MASK << MXS_DMA_CHANNELS,
-		mxs_dma->base + HW_APBHX_CTRL1 + MXS_SET_ADDR);
+		mxs_dma->base + HW_APBHX_CTRL1 + STMP_OFFSET_REG_SET);
 
 err_out:
 	clk_disable_unprepare(mxs_dma->clk);
-- 
1.7.0.4
