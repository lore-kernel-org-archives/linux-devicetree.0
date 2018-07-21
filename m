From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 13/18] dmaengine: dma-jz4780: Set DTCn register explicitly
Date: Sat, 21 Jul 2018 13:06:38 +0200
Message-ID: <20180721110643.19624-14-paul@crapouillou.net>
References: <20180721110643.19624-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180721110643.19624-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, Paul Cercueil <paul@crapouillou.net>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

From: Daniel Silsby <dansilsby@gmail.com>

Normally, we wouldn't set the channel transfer count register directly
when using descriptor-driven transfers. However, there is no harm in
doing so, and it allows jz4780_dma_desc_residue() to report the correct
residue of an ongoing transfer, no matter when it is called.

Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
Tested-by: Mathieu Malaterre <malat@debian.org>
---
 drivers/dma/dma-jz4780.c | 9 +++++++++
 1 file changed, 9 insertions(+)

 v2: No change

 v3: No change

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index cc2a86844db4..78849131c81d 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -530,6 +530,15 @@ static void jz4780_dma_begin(struct jz4780_dma_chan *jzchan)
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
