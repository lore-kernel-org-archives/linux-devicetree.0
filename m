From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 13/18] dmaengine: dma-jz4780: Set DTCn register explicitly
Date: Wed, 29 Aug 2018 23:32:55 +0200
Message-ID: <20180829213300.22829-14-paul@crapouillou.net>
References: <20180829213300.22829-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829213300.22829-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>
Cc: od@zcrc.me, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Daniel Silsby <dansilsby@gmail.com>, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

From: Daniel Silsby <dansilsby@gmail.com>

Normally, we wouldn't set the channel transfer count register directly
when using descriptor-driven transfers. However, there is no harm in
doing so, and it allows jz4780_dma_desc_residue() to report the correct
residue of an ongoing transfer, no matter when it is called.

Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
---

Notes:
     v2: No change
    
     v3: No change
    
     v4: Add my Signed-off-by
    
     v5: No change

 drivers/dma/dma-jz4780.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index d055602a92ca..d3b915ec8a09 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -532,6 +532,15 @@ static void jz4780_dma_begin(struct jz4780_dma_chan *jzchan)
 	jz4780_dma_chn_writel(jzdma, jzchan->id, JZ_DMA_REG_DRT,
 			      jzchan->transfer_type);
 
+	/*
+	 * Set the transfer count. This is redundant for a descriptor-driven
+	 * transfer. However, there can be a delay between the transfer start
+	 * time and when DTCn reg contains the new transfer count. Setting
+	 * it explicitly ensures residue is computed correctly at all times.
+	 */
+	jz4780_dma_chn_writel(jzdma, jzchan->id, JZ_DMA_REG_DTC,
+				jzchan->desc->desc[jzchan->curr_hwdesc].dtc);
+
 	/* Write descriptor address and initiate descriptor fetch. */
 	desc_phys = jzchan->desc->desc_phys +
 		    (jzchan->curr_hwdesc * sizeof(*jzchan->desc->desc));
-- 
2.11.0
