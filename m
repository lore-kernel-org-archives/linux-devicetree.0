From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 09/18] dmaengine: dma-jz4780: Add support for the JZ4725B SoC
Date: Wed, 29 Aug 2018 23:32:51 +0200
Message-ID: <20180829213300.22829-10-paul@crapouillou.net>
References: <20180829213300.22829-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829213300.22829-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>
Cc: od@zcrc.me, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The JZ4725B has one DMA core starring six DMA channels.
As for the JZ4770, each DMA channel's clock can be enabled with
a register write, the difference here being that once started, it
is not possible to turn it off.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Reviewed-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
---

Notes:
     v2: - Add comments about channel enabling/disabling
         - The documentation update is now in patch 01/17
    
     v3: No change
    
     v4: Drop the SoC version ID and use the 'flags' field of the
         jz4780_dma_soc_data structure
    
     v5: No change

 drivers/dma/dma-jz4780.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 2d194dfa697e..565971c2a33c 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -94,6 +94,7 @@
 #define JZ_SOC_DATA_ALLOW_LEGACY_DT	BIT(0)
 #define JZ_SOC_DATA_PROGRAMMABLE_DMA	BIT(1)
 #define JZ_SOC_DATA_PER_CHAN_PM		BIT(2)
+#define JZ_SOC_DATA_NO_DCKES_DCKEC	BIT(3)
 
 /**
  * struct jz4780_dma_hwdesc - descriptor structure read by the DMA controller.
@@ -208,14 +209,23 @@ static inline void jz4780_dma_ctrl_writel(struct jz4780_dma_dev *jzdma,
 static inline void jz4780_dma_chan_enable(struct jz4780_dma_dev *jzdma,
 	unsigned int chn)
 {
-	if (jzdma->soc_data->flags & JZ_SOC_DATA_PER_CHAN_PM)
-		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKES, BIT(chn));
+	if (jzdma->soc_data->flags & JZ_SOC_DATA_PER_CHAN_PM) {
+		unsigned int reg;
+
+		if (jzdma->soc_data->flags & JZ_SOC_DATA_NO_DCKES_DCKEC)
+			reg = JZ_DMA_REG_DCKE;
+		else
+			reg = JZ_DMA_REG_DCKES;
+
+		jz4780_dma_ctrl_writel(jzdma, reg, BIT(chn));
+	}
 }
 
 static inline void jz4780_dma_chan_disable(struct jz4780_dma_dev *jzdma,
 	unsigned int chn)
 {
-	if (jzdma->soc_data->flags & JZ_SOC_DATA_PER_CHAN_PM)
+	if ((jzdma->soc_data->flags & JZ_SOC_DATA_PER_CHAN_PM) &&
+			!(jzdma->soc_data->flags & JZ_SOC_DATA_NO_DCKES_DCKEC))
 		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKEC, BIT(chn));
 }
 
@@ -978,6 +988,12 @@ static const struct jz4780_dma_soc_data jz4740_dma_soc_data = {
 	.transfer_ord_max = 5,
 };
 
+static const struct jz4780_dma_soc_data jz4725b_dma_soc_data = {
+	.nb_channels = 6,
+	.transfer_ord_max = 5,
+	.flags = JZ_SOC_DATA_PER_CHAN_PM | JZ_SOC_DATA_NO_DCKES_DCKEC,
+};
+
 static const struct jz4780_dma_soc_data jz4770_dma_soc_data = {
 	.nb_channels = 6,
 	.transfer_ord_max = 6,
@@ -992,6 +1008,7 @@ static const struct jz4780_dma_soc_data jz4780_dma_soc_data = {
 
 static const struct of_device_id jz4780_dma_dt_match[] = {
 	{ .compatible = "ingenic,jz4740-dma", .data = &jz4740_dma_soc_data },
+	{ .compatible = "ingenic,jz4725b-dma", .data = &jz4725b_dma_soc_data },
 	{ .compatible = "ingenic,jz4770-dma", .data = &jz4770_dma_soc_data },
 	{ .compatible = "ingenic,jz4780-dma", .data = &jz4780_dma_soc_data },
 	{},
-- 
2.11.0
