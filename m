From: <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH resend 3/3] DMA: Freescale: update driver to support 8-channel DMA engine
Date: Mon, 11 Nov 2013 18:26:07 +0800
Message-ID: <1384165567-4883-4-git-send-email-hongbo.zhang@freescale.com>
References: <1384165567-4883-1-git-send-email-hongbo.zhang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384165567-4883-1-git-send-email-hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hongbo Zhang <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hongbo Zhang <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

This patch adds support to 8-channel DMA engine, thus the driver works for both
the new 8-channel and the legacy 4-channel DMA engines.

Signed-off-by: Hongbo Zhang <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/dma/Kconfig  |    9 +++++----
 drivers/dma/fsldma.c |    9 ++++++---
 drivers/dma/fsldma.h |    2 +-
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index f238cfd..cd32586 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -89,14 +89,15 @@ config AT_HDMAC
 	  Support the Atmel AHB DMA controller.
 
 config FSL_DMA
-	tristate "Freescale Elo and Elo Plus DMA support"
+	tristate "Freescale Elo series DMA support"
 	depends on FSL_SOC
 	select DMA_ENGINE
 	select ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	---help---
-	  Enable support for the Freescale Elo and Elo Plus DMA controllers.
-	  The Elo is the DMA controller on some 82xx and 83xx parts, and the
-	  Elo Plus is the DMA controller on 85xx and 86xx parts.
+	  Enable support for the Freescale Elo series DMA controllers.
+	  The Elo is the DMA controller on some mpc82xx and mpc83xx parts, the
+	  EloPlus is on mpc85xx and mpc86xx and Pxxx parts, and the Elo3 is on
+	  some Txxx and Bxxx parts.
 
 config MPC512X_DMA
 	tristate "Freescale MPC512x built-in DMA engine support"
diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index b3f3e90..4e89812 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1253,7 +1253,9 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 	WARN_ON(fdev->feature != chan->feature);
 
 	chan->dev = fdev->dev;
-	chan->id = ((res.start - 0x100) & 0xfff) >> 7;
+	chan->id = (res.start & 0xfff) < 0x300 ?
+		   ((res.start - 0x100) & 0xfff) >> 7 :
+		   ((res.start - 0x200) & 0xfff) >> 7;
 	if (chan->id >= FSL_DMA_MAX_CHANS_PER_DEVICE) {
 		dev_err(fdev->dev, "too many channels for device\n");
 		err = -EINVAL;
@@ -1426,6 +1428,7 @@ static int fsldma_of_remove(struct platform_device *op)
 }
 
 static const struct of_device_id fsldma_of_ids[] = {
+	{ .compatible = "fsl,elo3-dma", },
 	{ .compatible = "fsl,eloplus-dma", },
 	{ .compatible = "fsl,elo-dma", },
 	{}
@@ -1447,7 +1450,7 @@ static struct platform_driver fsldma_of_driver = {
 
 static __init int fsldma_init(void)
 {
-	pr_info("Freescale Elo / Elo Plus DMA driver\n");
+	pr_info("Freescale Elo series DMA driver\n");
 	return platform_driver_register(&fsldma_of_driver);
 }
 
@@ -1459,5 +1462,5 @@ static void __exit fsldma_exit(void)
 subsys_initcall(fsldma_init);
 module_exit(fsldma_exit);
 
-MODULE_DESCRIPTION("Freescale Elo / Elo Plus DMA driver");
+MODULE_DESCRIPTION("Freescale Elo series DMA driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/dma/fsldma.h b/drivers/dma/fsldma.h
index f5c3879..1ffc244 100644
--- a/drivers/dma/fsldma.h
+++ b/drivers/dma/fsldma.h
@@ -112,7 +112,7 @@ struct fsldma_chan_regs {
 };
 
 struct fsldma_chan;
-#define FSL_DMA_MAX_CHANS_PER_DEVICE 4
+#define FSL_DMA_MAX_CHANS_PER_DEVICE 8
 
 struct fsldma_device {
 	void __iomem *regs;	/* DGSR register base */
-- 
1.7.9.5



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
