From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 09/17] dmaengine: dma-jz4780: Enable Fast DMA to the AIC
Date: Wed, 18 Jul 2018 20:20:15 +0200
Message-ID: <20180718182023.8182-10-paul@crapouillou.net>
References: <20180718182023.8182-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718182023.8182-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

With the fast DMA bit set, the DMA will transfer twice as much data
per clock period to the AIC, so there is little point not to set it.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Reviewed-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
---
 drivers/dma/dma-jz4780.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

 v2: No change

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 88ce3f0157f6..3c9d3952e23a 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -52,6 +52,7 @@
 #define JZ_DMA_DMAC_DMAE	BIT(0)
 #define JZ_DMA_DMAC_AR		BIT(2)
 #define JZ_DMA_DMAC_HLT		BIT(3)
+#define JZ_DMA_DMAC_FAIC	BIT(27)
 #define JZ_DMA_DMAC_FMSC	BIT(31)
 
 #define JZ_DMA_DRT_AUTO		0x8
@@ -941,8 +942,8 @@ static int jz4780_dma_probe(struct platform_device *pdev)
 	 * Also set the FMSC bit - it increases MSC performance, so it makes
 	 * little sense not to enable it.
 	 */
-	jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DMAC,
-			  JZ_DMA_DMAC_DMAE | JZ_DMA_DMAC_FMSC);
+	jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DMAC, JZ_DMA_DMAC_DMAE |
+			       JZ_DMA_DMAC_FAIC | JZ_DMA_DMAC_FMSC);
 
 	if (jzdma->version == ID_JZ4780)
 		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DMACP, 0);
-- 
2.11.0
