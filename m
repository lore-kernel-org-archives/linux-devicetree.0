From: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
Subject: [PATCH 9/9] dmaengine: stm32-dma: Add max_burst support
Date: Tue, 13 Dec 2016 14:40:51 +0100
Message-ID: <1481636451-27863-10-git-send-email-cedric.madianga@gmail.com>
References: <1481636451-27863-1-git-send-email-cedric.madianga@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481636451-27863-1-git-send-email-cedric.madianga@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, robh+dt@kernel.org, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch sets the max_burst value supported by the STM32 DMA

Signed-off-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
---
 drivers/dma/stm32-dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index b7be43a..49f86ca 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -114,6 +114,7 @@
 #define STM32_DMA_MAX_CHANNELS		0x08
 #define STM32_DMA_MAX_REQUEST_ID	0x08
 #define STM32_DMA_MAX_DATA_PARAM	0x03
+#define STM32_DMA_MAX_BURST		16
 
 enum stm32_dma_width {
 	STM32_DMA_BYTE,
@@ -1084,6 +1085,7 @@ static int stm32_dma_probe(struct platform_device *pdev)
 		BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
 	dd->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
 	dd->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
+	dd->max_burst = STM32_DMA_MAX_BURST;
 	dd->dev = &pdev->dev;
 	INIT_LIST_HEAD(&dd->channels);
 
-- 
1.9.1
