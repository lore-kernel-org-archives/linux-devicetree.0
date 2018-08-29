From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 12/18] dmaengine: dma-jz4780: Simplify jz4780_dma_desc_residue()
Date: Wed, 29 Aug 2018 23:32:54 +0200
Message-ID: <20180829213300.22829-13-paul@crapouillou.net>
References: <20180829213300.22829-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829213300.22829-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>
Cc: od@zcrc.me, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Daniel Silsby <dansilsby@gmail.com>, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

From: Daniel Silsby <dansilsby@gmail.com>

Simple cleanup, no changes to actual logic here.

Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
---

Notes:
     v2: No change
    
     v3: No change
    
     v4: Add my Signed-off-by
    
     v5: Use GENMASK macro

 drivers/dma/dma-jz4780.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index bd3cecb800c5..d055602a92ca 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -610,22 +610,17 @@ static size_t jz4780_dma_desc_residue(struct jz4780_dma_chan *jzchan,
 	struct jz4780_dma_desc *desc, unsigned int next_sg)
 {
 	struct jz4780_dma_dev *jzdma = jz4780_dma_chan_parent(jzchan);
-	unsigned int residue, count;
+	unsigned int count = 0;
 	unsigned int i;
 
-	residue = 0;
-
 	for (i = next_sg; i < desc->count; i++)
-		residue += (desc->desc[i].dtc & GENMASK(23, 0)) <<
-			jzchan->transfer_shift;
+		count += desc->desc[i].dtc & GENMASK(23, 0);
 
-	if (next_sg != 0) {
-		count = jz4780_dma_chn_readl(jzdma, jzchan->id,
+	if (next_sg != 0)
+		count += jz4780_dma_chn_readl(jzdma, jzchan->id,
 					 JZ_DMA_REG_DTC);
-		residue += count << jzchan->transfer_shift;
-	}
 
-	return residue;
+	return count << jzchan->transfer_shift;
 }
 
 static enum dma_status jz4780_dma_tx_status(struct dma_chan *chan,
-- 
2.11.0
