From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 11/18] dmaengine: dma-jz4780: Add missing residue DTC mask
Date: Sat, 21 Jul 2018 13:06:36 +0200
Message-ID: <20180721110643.19624-12-paul@crapouillou.net>
References: <20180721110643.19624-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180721110643.19624-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, Paul Cercueil <paul@crapouillou.net>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

From: Daniel Silsby <dansilsby@gmail.com>

The 'dtc' word in jz DMA descriptors contains two fields: The
lowest 24 bits are the transfer count, and upper 8 bits are the DOA
offset to next descriptor. The upper 8 bits are now correctly masked
off when computing residue in jz4780_dma_desc_residue(). Note that
reads of the DTCn hardware reg are automatically masked this way.

Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
Tested-by: Mathieu Malaterre <malat@debian.org>
---
 drivers/dma/dma-jz4780.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

 v2: No change

 v3: No change

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 3c9d3952e23a..fa926de082ba 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -614,7 +614,8 @@ static size_t jz4780_dma_desc_residue(struct jz4780_dma_chan *jzchan,
 	residue = 0;
 
 	for (i = next_sg; i < desc->count; i++)
-		residue += desc->desc[i].dtc << jzchan->transfer_shift;
+		residue += (desc->desc[i].dtc & 0xffffff) <<
+			jzchan->transfer_shift;
 
 	if (next_sg != 0) {
 		count = jz4780_dma_chn_readl(jzdma, jzchan->id,
-- 
2.11.0
