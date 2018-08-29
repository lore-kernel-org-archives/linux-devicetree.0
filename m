From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 08/18] dmaengine: dma-jz4780: Add support for the JZ4740 SoC
Date: Wed, 29 Aug 2018 23:32:50 +0200
Message-ID: <20180829213300.22829-9-paul@crapouillou.net>
References: <20180829213300.22829-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829213300.22829-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>
Cc: od@zcrc.me, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The JZ4740 SoC has a single DMA core starring six DMA channels.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Reviewed-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
---

Notes:
     v2: The documentation update is now in patch 01/17
    
     v3: The Kconfig update was dropped thanks to patch 06/18
    
     v4: No change
    
     v5: No change

 drivers/dma/dma-jz4780.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 184d1a2bf9ba..2d194dfa697e 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -973,6 +973,11 @@ static int jz4780_dma_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct jz4780_dma_soc_data jz4740_dma_soc_data = {
+	.nb_channels = 6,
+	.transfer_ord_max = 5,
+};
+
 static const struct jz4780_dma_soc_data jz4770_dma_soc_data = {
 	.nb_channels = 6,
 	.transfer_ord_max = 6,
@@ -986,6 +991,7 @@ static const struct jz4780_dma_soc_data jz4780_dma_soc_data = {
 };
 
 static const struct of_device_id jz4780_dma_dt_match[] = {
+	{ .compatible = "ingenic,jz4740-dma", .data = &jz4740_dma_soc_data },
 	{ .compatible = "ingenic,jz4770-dma", .data = &jz4770_dma_soc_data },
 	{ .compatible = "ingenic,jz4780-dma", .data = &jz4780_dma_soc_data },
 	{},
-- 
2.11.0
