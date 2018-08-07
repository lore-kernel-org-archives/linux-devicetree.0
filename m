From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v4 15/18] dmaengine: dma-jz4780: Use dma_set_residue()
Date: Tue,  7 Aug 2018 13:42:15 +0200
Message-ID: <20180807114218.20091-16-paul@crapouillou.net>
References: <20180807114218.20091-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807114218.20091-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Paul Cercueil <paul@crapouillou.net>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Daniel Silsby <dansilsby@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Daniel Silsby <dansilsby@gmail.com>

This is the standard method provided by dmaengine header.

Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
---
 drivers/dma/dma-jz4780.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

 v2: No change

 v3: No change

 v4: Add my Signed-off-by

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 351dc8268515..32e10edc55e0 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -639,6 +639,7 @@ static enum dma_status jz4780_dma_tx_status(struct dma_chan *chan,
 	struct virt_dma_desc *vdesc;
 	enum dma_status status;
 	unsigned long flags;
+	unsigned long residue = 0;
 
 	status = dma_cookie_status(chan, cookie, txstate);
 	if ((status == DMA_COMPLETE) || (txstate == NULL))
@@ -649,13 +650,13 @@ static enum dma_status jz4780_dma_tx_status(struct dma_chan *chan,
 	vdesc = vchan_find_desc(&jzchan->vchan, cookie);
 	if (vdesc) {
 		/* On the issued list, so hasn't been processed yet */
-		txstate->residue = jz4780_dma_desc_residue(jzchan,
+		residue = jz4780_dma_desc_residue(jzchan,
 					to_jz4780_dma_desc(vdesc), 0);
 	} else if (cookie == jzchan->desc->vdesc.tx.cookie) {
-		txstate->residue = jz4780_dma_desc_residue(jzchan, jzchan->desc,
+		residue = jz4780_dma_desc_residue(jzchan, jzchan->desc,
 					jzchan->curr_hwdesc + 1);
-	} else
-		txstate->residue = 0;
+	}
+	dma_set_residue(txstate, residue);
 
 	if (vdesc && jzchan->desc && vdesc == &jzchan->desc->vdesc
 	    && jzchan->desc->status & (JZ_DMA_DCS_AR | JZ_DMA_DCS_HLT))
-- 
2.11.0
